package br.ufsm.csi.seguranca.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * Created by cpol on 22/05/2017.
 */
@Controller
@SessionAttributes("usuario")
public class HelloController {

    @RequestMapping("hello.html")
    public String hello() {
        return "hello";
    }

    @RequestMapping("paginalogin.html")
    public String paginalogin() {

        return "login/login";
    }

}
