package br.ufsm.csi.seguranca.interceptor;

import br.ufsm.csi.seguranca.model.Usuario;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Interceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller) throws Exception {
		
		String uri = request.getRequestURI();
		//permite fazer sem sessao
		if(uri.endsWith("paginalogin.html") || uri.endsWith("login.html") || uri.contains("cria-usuario.html") || uri.contains("resources")){
	        return true;
	    }

	    //quando há sessão
	    if(request.getSession().getAttribute("usuarioLogado") != null) {

			System.out.println("FOI NO INTERCEPTOR COM SESSÃO");
			Usuario usuario = (Usuario)request.getSession().getAttribute("usuarioLogado");

			//URLs que qualquer permissao pode acessar
			if(uri.contains("logout.priv") || uri.endsWith("login.html") || uri.endsWith("paginaInicial.priv")){
				if(usuario.getRole().getId_role()==1 || usuario.getRole().getId_role()==2 || usuario.getRole().getId_role()==3){
					return true;
				}else{
					//não tem permissao
					response.sendRedirect("paginalogin.html");
					return false;
				}
			}

			//URLs de acesso do admin
			if(uri.endsWith("logout.priv") || uri.endsWith("editarUsuario.priv") || uri.endsWith("deletaUsuario.priv") ||
					uri.endsWith("deletaEmpresa.priv") ||
						uri.endsWith("editarEmpresa.priv") || uri.endsWith("deletaLab.priv") || uri.endsWith("editarLab.priv") ||
							uri.endsWith("criaLab.priv") || uri.endsWith("listarLabs.priv") || uri.endsWith("criaEmpresa.priv") ||
								uri.endsWith("listarEmpresas.priv") || uri.endsWith("gerenciarLaboratorios.priv") || uri.endsWith("gerenciarEmpresas.priv")
									|| uri.endsWith("criaUsuarioAdmin.priv") || uri.endsWith("buscaRoles.priv") ||
										uri.endsWith("dashboardAdmin.priv") || uri.endsWith("gerenciarUsuarios.priv") || uri.endsWith("lista-usuarios.priv") ||
											uri.endsWith("listarUsuarios.priv")){ //colocar todas as rotas do admin

				if(usuario.getRole().getId_role()==1){
					return true;
				}else{
					//não tem permissao
					response.sendRedirect("paginaInicial.priv");
					return false;
				}
			}
			//URLs de acesso da empresa
			if(uri.endsWith("listarCidades.priv") || uri.endsWith("addCidade.priv") || uri.endsWith("minhaEmpresa.priv") || uri.endsWith("listarEmpresaUsuario.priv") || uri.endsWith("logout.priv") || uri.endsWith("dashboardEmpresa.priv")){ //colocar todas as rotas da empresa

				if(usuario.getRole().getId_role()==2){
					return true;
				}else{
					//não tem permissao
					response.sendRedirect("paginaInicial.priv");
					return false;
				}
			}
			//URLs de acesso do lab
			if(uri.endsWith("logout.priv") || uri.endsWith("dashboardLaboratorio.priv")){ //colocar todas as rotas do lab

				if(usuario.getRole().getId_role()==3){
					return true;
				}else{
					//não tem permissao
					response.sendRedirect("paginaInicial.priv");
					return false;
				}
			}
	    }
	    response.sendRedirect("paginalogin.html");
	    return false;
	}

}
