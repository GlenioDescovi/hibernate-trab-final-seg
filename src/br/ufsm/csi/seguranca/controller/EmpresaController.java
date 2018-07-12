package br.ufsm.csi.seguranca.controller;

import br.ufsm.csi.seguranca.dao.HibernateDAO;
import br.ufsm.csi.seguranca.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import static br.ufsm.csi.seguranca.controller.AdminController.retirarTags;

/**
 * Created by Glenio on 12/07/2018.
 */
@Controller
@SessionAttributes("usuario")
public class EmpresaController {

    @Autowired
    private HibernateDAO hibernateDAO;

    @Transactional
    @RequestMapping("listarEmpresaUsuario.priv")
    public ResponseEntity <Empresa> mostra_Empresas(HttpServletRequest request) throws NoSuchMethodException {
        Usuario usuario = (Usuario)request.getSession().getAttribute("usuarioLogado");
        System.out.println("USUARIO: " + usuario.getId());
        Map<String, String> m = new HashMap<>();

        ArrayList<Object>test1= (ArrayList<Object>) hibernateDAO.listaObjetos(Empresa.class, m, null, null, false);
        Empresa empresa = new Empresa();
        ArrayList<Empresa> empre = new ArrayList<Empresa>();
        for(int i=0; i<test1.size(); i++){
            empre.add((Empresa) test1.get(i));
        }

        for(int i=0; i < empre.size(); i++){
            if (empre.get(i).getRepresentanteEmpresa().getId().equals(usuario.getId())){
                System.out.println("foi no if de igual");
                empresa.setEndereco(empre.get(i).getEndereco());
                empresa.setRepresentanteEmpresa(empre.get(i).getRepresentanteEmpresa());
                empresa.setCnpj(empre.get(i).getCnpj());
                empresa.setRazaoSocial(empre.get(i).getRazaoSocial());
                empresa.setIdEmpresa(empre.get(i).getIdEmpresa());
            }
            System.out.println(empre.get(i).getRepresentanteEmpresa().getId());
        }
        System.out.println("EMPRESA USUÁRIO: " + empresa.getRazaoSocial());
        return new ResponseEntity <Empresa> (empresa, HttpStatus.OK);
    }

    @RequestMapping("minhaEmpresa.priv")
    String minhaEmpresa(){

        return "representanteEmpresa/minhaEmpresa";
    }


    @Transactional
    @RequestMapping("addCidade.priv")
    public String cadastraEmpresa(@RequestBody Cidade cidade) throws Exception {

        System.out.println(cidade.getNome()+"DHASUDHUASHDUA");

        cidade.setNome(retirarTags(cidade.getNome()));
        cidade = (Cidade) hibernateDAO.criaObjeto(cidade);

        Date d = new Date();

        hibernateDAO.criaLog(cidade.getEmpresa().getRepresentanteEmpresa(), cidade.getIdCidade(), "br.ufsm.csi.seguranca.model.Cidade", d, "insert cidade");


        return "redirect: gerenciarEmpresas.priv";
    }


    @Transactional
    @RequestMapping("listarCidades.priv")
    public ResponseEntity<ArrayList<Cidade>> buscaCidades(HttpServletRequest request) {
        Map<String, String> m = new HashMap<>();
        Usuario usuario = (Usuario)request.getSession().getAttribute("usuarioLogado");
        System.out.println(usuario.getLogin()+ "usuaaarriooooo");
        ArrayList<Object>test1= (ArrayList<Object>) hibernateDAO.listaObjetos(Cidade.class, m, null, null, false);
        ArrayList<Cidade> cidades = new ArrayList<Cidade>();
        for(int i=0; i<test1.size(); i++){
            cidades.add((Cidade) test1.get(i));
            if (!cidades.get(i).getEmpresa().getRepresentanteEmpresa().getId().equals(usuario.getId())){
                cidades.remove(i);
                System.out.println("testeeee");
            }
        }
        return new ResponseEntity<ArrayList<Cidade>>(cidades, HttpStatus.OK);
    }


}
