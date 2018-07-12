package br.ufsm.csi.seguranca.controller;


import br.ufsm.csi.seguranca.dao.HibernateDAO;
import br.ufsm.csi.seguranca.model.CaptchaResponse;
import br.ufsm.csi.seguranca.model.Log;
import br.ufsm.csi.seguranca.model.Usuario;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;

/**
 * Created by cpol on 29/05/2017.
 */
@Controller
@SessionAttributes("usuario")
public class UsuarioController {

    @Autowired
    private HibernateDAO hibernateDAO;
    private long tempoMilisegundos = 1200000;
    private int numeroTentativas = 3;

    @Transactional
    @RequestMapping("cria-usuario.html")
    public String criaUsuario(Usuario usuario, RedirectAttributes redirectAttributes) throws NoSuchAlgorithmException, UnsupportedEncodingException {

        System.out.println(usuario);
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        usuario.setSenha(md.digest(usuario.getConfirmarSenha().getBytes("ISO-8859-1")));
        usuario.setConfirmarSenha("null");

        Usuario teste= new Usuario();
        teste = (Usuario) hibernateDAO.criaObjeto(usuario);

        if (teste.getId() != null){

            redirectAttributes.addFlashAttribute("status","cadastroUsuario");
            redirectAttributes.addFlashAttribute("usuario", usuario);
        }
        else {
            redirectAttributes.addFlashAttribute("status","erro_cadastroUsuario");
        }
        return "redirect:paginalogin.html";

    }

    @Transactional
    @RequestMapping("login.html")
    public String login(String login, String senha, HttpSession session, RedirectAttributes redirect, HttpServletRequest request) throws UnsupportedEncodingException, NoSuchAlgorithmException {

        session.invalidate();
        String recap = request.getParameter("g-recaptcha-response");
        System.out.println("<<<<>>>>>> captcha: " + recap);

        try{
            String urlGoogle = "https://www.google.com/recaptcha/api/siteverify?secret=%s&response=%s&remoteip=%s";
            String secret = "6LcJLWMUAAAAAJZkG6ZXlSIy0Kktt7Gbl5a1khlO";

            // Enviar solicitação para o servidor do Google reCaptcha com a chave secreta
            String urlFormatada = String.format(urlGoogle, secret, recap,
                    (request.getRemoteAddr() != null ? request.getRemoteAddr() : "0.0.0.0"));
            URL url = new URL(urlFormatada);
            System.out.println(url);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            String line, outputString = "";
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            while ((line = reader.readLine()) != null) {
                outputString += line;
            }

            // Converter response em objeto com a propria biblioteca jackson
            ObjectMapper mapper = new ObjectMapper();
            Map <String, Object> map = mapper.readValue(outputString, Map.class);

            // Verifico se a resposta foi humano(true) ou robo (false)
            if ((Boolean) map.get("success")) {
                // Input by Human

                System.out.println("FOI NO DIFERENTE DE NULL");

                Usuario usuario = hibernateDAO.findUsuarioHQL(login, senha);
                if (usuario != null) {

                    session = request.getSession();

                    session.setAttribute("usuarioLogado", usuario);

                    return "redirect:paginaInicial.priv";
                } else {

                    //control.registraFalha(request);
                    redirect.addFlashAttribute("status", "erro_login");
                    return "redirect:paginalogin.html";
                }
            } else {
                // Input by Robot
                //control.registraFalha(request);
                redirect.addFlashAttribute("status", "erro_login");
                return "redirect:paginalogin.html";
            }

        }catch(Exception e){
            e.printStackTrace();
            //control.registraFalha(request);
            redirect.addFlashAttribute("status", "erro_login");
            return "redirect:paginalogin.html";
        }

    }

    @RequestMapping("logout.priv")
    public String logout(HttpSession session) {
        session.invalidate();
        return "../../index";
    }

    @RequestMapping("paginaInicial.priv")
    String homePage(){
        return "home/home";
    }

    @Transactional
    @RequestMapping("cria-log.priv")
    public String criaLog(Long idUsuario,
                          Long idObjeto,
                          String classe,
                          @DateTimeFormat(pattern = "dd/MM/yyyy HH:mm") Date dataHora) throws ClassNotFoundException {
        Usuario usuario = (Usuario) hibernateDAO.carregaObjeto(Usuario.class, idUsuario);
        Log log = new Log();
        log.setClasse(Class.forName(classe));
        log.setIdObjeto(idObjeto);
        log.setDataHora(dataHora);
        log.setUsuario(usuario);
        hibernateDAO.criaObjeto(log);
        return "log";
    }

    @Transactional
    @RequestMapping("listarUsuarios.priv")
    public ResponseEntity<ArrayList<Usuario>> mostra_todosUsuario(HttpServletRequest request) throws NoSuchMethodException {
        Usuario usuario = (Usuario)request.getSession().getAttribute("usuarioLogado");

        System.out.println("FOI NO LISTAR" + usuario.getLogin());
        Map<String, String> m = new HashMap<>();

       ArrayList<Object>test1= (ArrayList<Object>) hibernateDAO.listaObjetos(Usuario.class, m, null, null, false);

        ArrayList<Usuario> usu = new ArrayList<>();
        for(int i=0; i<test1.size(); i++){

           usu.add((Usuario) test1.get(i));
           usu.get(i).setLogs(null);
        }

        return new ResponseEntity<ArrayList<Usuario>>(usu, HttpStatus.OK);
    }

    @Transactional
    @RequestMapping("lista-usuarios.priv")
    public String listaUsuarios(Model model) {
        Map<String, String> m = new HashMap<>();
        System.out.println("veio no listar usuarios");
        Collection<Object> mm = new ArrayList<>();
        mm= hibernateDAO.listaObjetos(Usuario.class, m, null, null, false);

        System.out.println("<<<<<<<< "+ mm.size() + " >>>>>>>>>>>");

        model.addAttribute("usuarios", hibernateDAO.listaObjetos(Usuario.class, m, null, null, false));
        return "admin/usuario/gerenciarUsuarios";
    }

}
