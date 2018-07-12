package br.ufsm.csi.seguranca.controller;

import br.ufsm.csi.seguranca.dao.HibernateDAO;
import br.ufsm.csi.seguranca.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpServletRequest;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


/**
 * Created by Glenio on 13/06/2018.
 */
@Controller
@SessionAttributes("usuario")
public class AdminController {

    @Autowired
    private HibernateDAO hibernateDAO;

    /*Expressão representando todas as expressões com tags html. "?"
       significa não-gulosa(non-greedy).*/
    private static final String expressaoComTags = "<.*!?>";

    public static String retirarTags(String html) {
            String retorno = html.replaceAll(expressaoComTags, "");
            return retorno;
        }

    @RequestMapping("gerenciarUsuarios.priv")
    String gerenciarUsuariosPage(){

        return "admin/usuario/gerenciarUsuarios";
    }

    @RequestMapping("gerenciarEmpresas.priv")
    String gerenciarEmpresasPage(){

        return "admin/empresa/gerenciarEmpresas";
    }

    @RequestMapping("gerenciarLaboratorios.priv")
    String gerenciarLabsPage(){

        return "admin/laboratorio/gerenciarLaboratorios";
    }

    @Transactional
    @RequestMapping("criaUsuarioAdmin.priv")
    public String cadastraSoli(Usuario usuario, RedirectAttributes redirectAttributes, HttpServletRequest request) throws Exception {
        Usuario teste= new Usuario();
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        usuario.setSenha(md.digest(usuario.getConfirmarSenha().getBytes("ISO-8859-1")));
        usuario.setConfirmarSenha("null");
        Role role= new Role();
        role.setId_role(1);
        usuario.setRole(role);

        usuario.setEmail(retirarTags(usuario.getEmail()));
        usuario.setLogin(retirarTags(usuario.getLogin()));
        usuario.setNome(retirarTags(usuario.getNome()));

        teste = (Usuario) hibernateDAO.criaObjeto(usuario);

        if (teste.getId() != null){
            Date d = new Date();

            hibernateDAO.criaLog((Usuario) request.getSession().getAttribute("usuarioLogado"), usuario.getId(), "br.ufsm.csi.seguranca.model.Usuario", d,"inserir usuario");

            redirectAttributes.addFlashAttribute("status","cadastroUsuario");
            redirectAttributes.addFlashAttribute("usuario", usuario);
        }
        else {
            redirectAttributes.addFlashAttribute("status","erro_cadastroUsuario");
        }
        return "redirect: gerenciarUsuarios.priv";
    }

    @RequestMapping("dashboardAdmin.priv")
    String homePage(){
        return "admin/dashboardAdmin";
    }

    @Transactional
    @RequestMapping("buscaRoles.priv")
    public ResponseEntity<ArrayList<Object>> buscaRoles(HttpServletRequest request) {
        Map<String, String> m = new HashMap<>();

        return new ResponseEntity<ArrayList<Object>>((ArrayList<Object>) hibernateDAO.listaObjetos(Role.class, m, null, null, false), HttpStatus.OK);
    }

    @Transactional
    @RequestMapping("listarLabs.priv")
    public ResponseEntity<ArrayList<Object>> buscaLabs(HttpServletRequest request) {
        Map<String, String> m = new HashMap<>();

        Usuario usu= new Usuario();
        usu= (Usuario) request.getSession().getAttribute("usuarioLogado");
        System.out.println("AQUIIIIIII: " +usu.getRole().getRole());
        if(usu.getRole().getId_role()==1){
            return new ResponseEntity<ArrayList<Object>>((ArrayList<Object>) hibernateDAO.listaObjetos(Laboratorio.class, m, null, null, false), HttpStatus.OK);
        }else{
            return new ResponseEntity<ArrayList<Object>>((ArrayList<Object>) null, HttpStatus.OK);
        }
    }

    @Transactional
    @RequestMapping("listarEmpresas.priv")
    public ResponseEntity<ArrayList<Object>> buscaEmpresas(HttpServletRequest request) {
        Map<String, String> m = new HashMap<>();
        return new ResponseEntity<ArrayList<Object>>((ArrayList<Object>) hibernateDAO.listaObjetos(Empresa.class, m, null, null, false), HttpStatus.OK);
    }

    @Transactional
    @RequestMapping("criaEmpresa.priv")
    public String cadastraEmpresa(Empresa empresa, Usuario usuario, Endereco endereco, RedirectAttributes redirectAttributes, HttpServletRequest request) throws Exception {

        MessageDigest md = MessageDigest.getInstance("SHA-256");
        usuario.setSenha(md.digest(usuario.getConfirmarSenha().getBytes("ISO-8859-1")));
        usuario.setConfirmarSenha("null");
        Role role= new Role();
        role.setId_role(2);
        usuario.setRole(role);
        usuario.setEmail(retirarTags(usuario.getEmail()));
        usuario.setLogin(retirarTags(usuario.getLogin()));
        usuario.setNome(retirarTags(usuario.getNome()));

        endereco.setCidade(retirarTags(endereco.getCidade()));
        endereco.setBairro(retirarTags(endereco.getBairro()));
        endereco.setRua(retirarTags(endereco.getRua()));
        endereco.setUf(retirarTags(endereco.getUf()));

        empresa.setRazaoSocial(retirarTags(empresa.getRazaoSocial()));
        empresa.setCnpj(retirarTags(empresa.getCnpj()));

        usuario= (Usuario) hibernateDAO.criaObjeto(usuario);
        empresa.setRepresentanteEmpresa(usuario);

        endereco = (Endereco) hibernateDAO.criaObjeto(endereco);

        empresa.setEndereco(endereco);

        empresa = (Empresa) hibernateDAO.criaObjeto(empresa);

        Date d = new Date();

        hibernateDAO.criaLog((Usuario) request.getSession().getAttribute("usuarioLogado"), empresa.getIdEmpresa(), "br.ufsm.csi.seguranca.model.Empresa", d, "insert empresa");


        return "redirect: gerenciarEmpresas.priv";
    }

    @Transactional
    @RequestMapping("criaLab.priv")
    public String cadastraLab(Laboratorio laboratorio, Usuario usuario, Endereco endereco, RedirectAttributes redirectAttributes, HttpServletRequest request) throws Exception {

        MessageDigest md = MessageDigest.getInstance("SHA-256");
        usuario.setSenha(md.digest(usuario.getConfirmarSenha().getBytes("ISO-8859-1")));
        usuario.setConfirmarSenha("null");
        Role role= new Role();
        role.setId_role(3);
        usuario.setRole(role);
        usuario.setEmail(retirarTags(usuario.getEmail()));
        usuario.setLogin(retirarTags(usuario.getLogin()));
        usuario.setNome(retirarTags(usuario.getNome()));

        endereco.setCidade(retirarTags(endereco.getCidade()));
        endereco.setBairro(retirarTags(endereco.getBairro()));
        endereco.setRua(retirarTags(endereco.getRua()));
        endereco.setUf(retirarTags(endereco.getUf()));

        laboratorio.setRazaoSocial(retirarTags(laboratorio.getRazaoSocial()));
        laboratorio.setCnpj(retirarTags(laboratorio.getCnpj()));


        usuario= (Usuario) hibernateDAO.criaObjeto(usuario);
        laboratorio.setRepresentanteLab(usuario);

        endereco = (Endereco) hibernateDAO.criaObjeto(endereco);

        laboratorio.setEndereco(endereco);


        laboratorio = (Laboratorio) hibernateDAO.criaObjeto(laboratorio);

        Date d = new Date();

    hibernateDAO.criaLog((Usuario) request.getSession().getAttribute("usuarioLogado"), laboratorio.getIdLaboratorio(), "br.ufsm.csi.seguranca.model.Laboratorio", d, "insert lab");

        return "redirect: gerenciarLaboratorios.priv";
    }

    @Transactional
    @RequestMapping("editarLab.priv")
    public String editarLab(@RequestBody Laboratorio laboratorio, HttpServletRequest request) throws Exception {

        MessageDigest md = MessageDigest.getInstance("SHA-256");
        laboratorio.getRepresentanteLab().setSenha(md.digest(laboratorio.getRepresentanteLab().getConfirmarSenha().getBytes("ISO-8859-1")));
        laboratorio.getRepresentanteLab().setConfirmarSenha("null");

        laboratorio.getRepresentanteLab().setEmail(retirarTags(laboratorio.getRepresentanteLab().getEmail()));
        laboratorio.getRepresentanteLab().setLogin(retirarTags(laboratorio.getRepresentanteLab().getLogin()));
        laboratorio.getRepresentanteLab().setNome(retirarTags(laboratorio.getRepresentanteLab().getNome()));
        hibernateDAO.updateObjeto(laboratorio.getRepresentanteLab());

        laboratorio.getEndereco().setCidade(retirarTags(laboratorio.getEndereco().getCidade()));
        laboratorio.getEndereco().setBairro(retirarTags(laboratorio.getEndereco().getBairro()));
        laboratorio.getEndereco().setRua(retirarTags(laboratorio.getEndereco().getRua()));
        laboratorio.getEndereco().setUf(retirarTags(laboratorio.getEndereco().getUf()));
        hibernateDAO.updateObjeto(laboratorio.getEndereco());

        laboratorio.setRazaoSocial(retirarTags(laboratorio.getRazaoSocial()));
        laboratorio.setCnpj(retirarTags(laboratorio.getCnpj()));
        hibernateDAO.updateObjeto(laboratorio);

        Date d = new Date();

        hibernateDAO.criaLog((Usuario) request.getSession().getAttribute("usuarioLogado"), laboratorio.getIdLaboratorio(), "br.ufsm.csi.seguranca.model.Laboratorio", d, "update lab");

        return "redirect: gerenciarLaboratorios.priv";
    }

    @Transactional
    @RequestMapping("deletaLab.priv")
    public String deletaLab(@RequestBody Laboratorio laboratorio, HttpServletRequest request) throws Exception {
        System.out.println("foi no deletar >> " + laboratorio.getIdLaboratorio());
        hibernateDAO.removeObjeto(laboratorio.getRepresentanteLab());

        hibernateDAO.removeObjeto(laboratorio.getEndereco());

        hibernateDAO.removeObjeto(laboratorio);

        Date d = new Date();

        hibernateDAO.criaLog((Usuario) request.getSession().getAttribute("usuarioLogado"), laboratorio.getIdLaboratorio(), "br.ufsm.csi.seguranca.model.Laboratorio", d, "delete lab");

        return "redirect: gerenciarLaboratorios.priv";
    }

    @Transactional
    @RequestMapping("editarEmpresa.priv")
    public String editarEmpresa(@RequestBody Empresa empresa, HttpServletRequest request) throws Exception {

        MessageDigest md = MessageDigest.getInstance("SHA-256");
        empresa.getRepresentanteEmpresa().setSenha(md.digest(empresa.getRepresentanteEmpresa().getConfirmarSenha().getBytes("ISO-8859-1")));
        empresa.getRepresentanteEmpresa().setConfirmarSenha("null");

        empresa.getRepresentanteEmpresa().setEmail(retirarTags(empresa.getRepresentanteEmpresa().getEmail()));
        empresa.getRepresentanteEmpresa().setLogin(retirarTags(empresa.getRepresentanteEmpresa().getLogin()));
        empresa.getRepresentanteEmpresa().setNome(retirarTags(empresa.getRepresentanteEmpresa().getNome()));
        hibernateDAO.updateObjeto(empresa.getRepresentanteEmpresa());

        empresa.getEndereco().setCidade(retirarTags(empresa.getEndereco().getCidade()));
        empresa.getEndereco().setBairro(retirarTags(empresa.getEndereco().getBairro()));
        empresa.getEndereco().setRua(retirarTags(empresa.getEndereco().getRua()));
        empresa.getEndereco().setUf(retirarTags(empresa.getEndereco().getUf()));
        hibernateDAO.updateObjeto(empresa.getEndereco());

        empresa.setRazaoSocial(retirarTags(empresa.getRazaoSocial()));
        empresa.setCnpj(retirarTags(empresa.getCnpj()));
        hibernateDAO.updateObjeto(empresa);

        Date d = new Date();

        hibernateDAO.criaLog((Usuario) request.getSession().getAttribute("usuarioLogado"), empresa.getIdEmpresa(), "br.ufsm.csi.seguranca.model.Empresa", d, "update empresa");

        return "redirect: gerenciarEmpresas.priv";
    }

    @Transactional
    @RequestMapping("deletaEmpresa.priv")
    public String deletaEmpresa(@RequestBody Empresa empresa, HttpServletRequest request) throws Exception {

        hibernateDAO.removeObjeto(empresa.getRepresentanteEmpresa());

        hibernateDAO.removeObjeto(empresa.getEndereco());

        hibernateDAO.removeObjeto(empresa);

        Date d = new Date();

    hibernateDAO.criaLog((Usuario) request.getSession().getAttribute("usuarioLogado"), empresa.getIdEmpresa(), "br.ufsm.csi.seguranca.model.Empresa", d, "delete empresa");

        return "redirect: gerenciarEmpresas.priv";
    }

    @Transactional
    @RequestMapping("deletaUsuario.priv")
    public String deletaUsuario(@RequestBody Usuario usuario, HttpServletRequest request) throws Exception {

        hibernateDAO.removeObjeto(usuario);
        Date d = new Date();

        hibernateDAO.criaLog((Usuario) request.getSession().getAttribute("usuarioLogado"), usuario.getId(), "br.ufsm.csi.seguranca.model.Usuario", d, "delete usuario");

        return "redirect: gerenciarUsuarios.priv";
    }

    @Transactional
    @RequestMapping("editarUsuario.priv")
    public String editarUsuario(@RequestBody Usuario usuario, HttpServletRequest request) throws Exception {

        MessageDigest md = MessageDigest.getInstance("SHA-256");
        usuario.setSenha(md.digest(usuario.getConfirmarSenha().getBytes("ISO-8859-1")));
        usuario.setConfirmarSenha("null");

        usuario.setEmail(retirarTags(usuario.getEmail()));
        usuario.setLogin(retirarTags(usuario.getLogin()));
        usuario.setNome(retirarTags(usuario.getNome()));

        hibernateDAO.updateObjeto(usuario);
        Date d = new Date();

        hibernateDAO.criaLog((Usuario) request.getSession().getAttribute("usuarioLogado"), usuario.getId(), "br.ufsm.csi.seguranca.model.Usuario", d, "update usuario");


        return "redirect: gerenciarUsuarios.priv";
    }

}
