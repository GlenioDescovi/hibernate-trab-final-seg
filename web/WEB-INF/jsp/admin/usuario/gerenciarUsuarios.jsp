<%--
  Created by IntelliJ IDEA.
  User: Glenio
  Date: 19/06/2018
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app="form" ng-cloak>
<head>
    <title>Gerenciar Usuários</title>

    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <link rel="shortcut icon" type="image/png" href="<c:url value='/resources/img/favicon.png'/>"/>
    <link rel="stylesheet" href="<c:url value='/resources/fonts/fonts.css'/>">
    <link type="text/css" href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">
    <link type="text/css" href="<c:url value='/resources/css/style.css'/>" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/resources/font-awesome/css/font-awesome.min.css'/>">

    <!-- ANGULAR -->
    <script src="<c:url value='/resources/angular/angular.js'/>"></script>
    <script src="<c:url value='/resources/angular/checklist-model.js'/>"></script>
    <script src="<c:url value='/resources/js/app.js'/>"></script>
    <script src="<c:url value='/resources/js/controllers/formCtrl.js'/>"></script>
    <script src="<c:url value='/resources/js/directives/uiDirectives.js'/>"></script>
    <script src="<c:url value='/resources/js/directives/ng-currency.js'/>"></script>

</head>
<body ng-controller="formCtrl">
<main class="container" style="margin-bottom: 5%;">

    <!-- TITULO -->
    <div class="row">
        <div class="col-md-10">
        </div>
        <div class="col-md-2">
            <jsp:include page="../../menu/drop-menu.jsp"></jsp:include>
        </div>
    </div>
    <hr class="margin-titulo">

    <!-- CAMINHO -->
    <ol class="breadcrumb">
        <li></li>
        <li><a href="dashboardAdmin.priv">DASHBORD</a></li>
        <li >Admin</li>
        <li class="active">Gerenciar Usuários</li>
        <li></li>
    </ol>
    <br>
    <div class="row">
        <div class="col-md-12">
            <c:import url="../../../jsp/login/mensagens/mensagens-conta.jsp" />

            <c:import url="../../../jsp/login/mensagens/mensagens-status-conta.jsp" />
            <table class="table table-hover table-condensed table table-striped">
                <thead>
                <tr>
                    <td class="text-center"><button data-toggle="modal" data-target="#adicionar" type="button" class="btn btn-success" title="Adicionar usuário">
                        <i class="fa fa-plus-square-o"><strong> Adicionar Usuário</strong></i>
                    </button></td>
                    <td class="text-center"><strong></strong></td>
                    <td class="text-center"><strong></strong></td>
                    <td class="text-center"><strong></strong></td>
                </tr>
                <tr>
                    <th class="text-muted text-center">Nome</th>
                    <th class="text-muted text-center">Email</th>
                    <th class="text-muted text-center">Permissão</th>
                    <th class="text-center"><i class="fa fa-cogs fa-2x"></i></th>
                </tr>
                </thead>

                <tbody>
                <tr ng-repeat="usuario in usuarios | orderBy:'nome'">
                    <form>
                        <td class="text-muted text-center"width="8%">{{usuario.nome}}</td>
                        <td class="text-muted text-center"width="7%">{{usuario.email}}</td>
                        <td class="text-muted text-center"width="7%">{{usuario.role.role}}</td>
                        <td class="text-muted text-center"width="10%">
                            <div class="form-group">
                               <!-- <select ng-disabled="usuario.role.id_role >= 2"  class="text-muted text-center" width="8%" class="form-control" ng-model="usuario.role" ng-options="role.role for role in roles">
                                    <option value="">Selecione uma Permissão</option>
                                </select> -->

                                <%--<span class="input-group-addon" ><button class="btn btn-success" ng-click="functionAlteraNivel(usuario, nivel)">Alterar</button></span>--%>
                                <!--<button title="Alterar permissão do usuário" class="btn btn-success" ng-click="functionAlteraNivel(usuario, role)" ><i class="fa fa-refresh"></i></button> -->
                                <button class="btn btn-primary" data-toggle="modal" data-target="#editar" ng-click="openModal(usuario)"
                                        title="Editar Usuário"><i class="fa fa-edit"></i></button> -
                                <button class="btn btn-danger" ng-click="deleteUsuario(usuario)"
                                        title="Excluir"><i class="fa fa-close"></i></button>


                            </div></td>
                    </form>
                </tr>
                </tbody>
                <tfoot>
                <tr class="active">
                    <td class="text-center"><strong>...</strong></td>
                    <td class="text-center"><strong>...</strong></td>
                    <td class="text-center"><strong>...</strong></td>
                    <td class="text-center"><strong>...</strong></td>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>
</main>

<!-- Modal cadastro-->
<div id="adicionar" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Cadastrar Usuário</h4>
            </div>
            <div class="modal-body">

                <form action="criaUsuarioAdmin.priv" method="post" autocomplete="off" name="formCadastro">
                    <div class="form-group">
                        <label class="sr-only">Nome</label>
                        <input type="text" name="nome" minlength="5" maxlength="20" placeholder="Nome Completo" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label class="sr-only">Email</label>
                        <input type="email" name="email" minlength="5" maxlength="30" placeholder="Insira seu email" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label class="sr-only">Login</label>
                        <input type="text"	name="login" minlength="5" maxlength="20" placeholder="login" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label class="sr-only">Senha</label>
                        <input type="password" name="senha" minlength="6" maxlength="20" placeholder="Senha" ng-model="item.senha" class="form-control" required>
                        <div ng-if="formCadastro.senha.$dirty">
                            <div ng-if="formCadastro.senha.$invalid">
                                <p style="color: red; margin-left:5%;">  a senha deve ter no m&iacute;nimo seis caracteres</p>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="sr-only">Confirme sua senha</label>
                        <input type="password" minlength="6" maxlength="20" placeholder="Confirme sua senha" name="confirmarSenha" ng-model="item.confirmarSenha" class="form-control" required>

                    </div>

                    <div ng-if="formCadastro.confirmarSenha.$dirty && formCadastro.confirmarSenha.$valid">
                        <div ng-if="item.senha != item.confirmarSenha" class="alert alert-danger" role="alert">
                            <strong><span class="fa fa-close"></span> Opa! &nbsp</strong> Senhas n&atilde;o correspondem!
                        </div>
                        <div ng-if="item.senha && item.confirmarSenha && item.senha == item.confirmarSenha && item.confirmarSenha.length >5" class="alert alert-success" role="alert">
                            <strong><span class="glyphicon glyphicon-ok"></span> Ok! &nbsp</strong> As senhas correspondem!
                        </div>
                    </div>

                    <button type="submit" ng-disabled="item.senha != item.confirmarSenha" class="btn btn-success">Adicionar</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
            </div>
        </div>

    </div>
</div>

<!-- MODAL EDITAR -->

<div id="editar" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Editar Usuário</h4>
            </div>
            <div class="modal-body">

                <form autocomplete="off" name="formEditar">
                    <div class="form-group">
                        <label class="sr-only">Nome</label>
                        <input type="text" ng-model="usuarioEditar.nome" name="nome" minlength="5" maxlength="20" placeholder="Nome Completo" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label class="sr-only">Email</label>
                        <input type="email" ng-model="usuarioEditar.email" name="email" minlength="5" maxlength="30" placeholder="Insira seu email" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label class="sr-only">Login</label>
                        <input type="text"	ng-model="usuarioEditar.login" name="login" minlength="5" maxlength="20" placeholder="login" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label class="sr-only">Senha</label>
                        <input type="password" ng-model="usuarioEditar.senha" name="senha" minlength="6" maxlength="20" placeholder="Senha" class="form-control" required>
                        <div ng-if="formCadastro.senha.$dirty">
                            <div ng-if="formCadastro.senha.$invalid">
                                <p style="color: red; margin-left:5%;">  a senha deve ter no m&iacute;nimo seis caracteres</p>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="sr-only">Confirme sua senha</label>
                        <input type="password" ng-model="usuarioEditar.confirmarSenha" minlength="6" maxlength="20" placeholder="Confirme sua senha" name="confirmarSenha" class="form-control" required>

                    </div>

                    <div ng-if="formEditar.confirmarSenha.$dirty && formEditar.confirmarSenha.$valid">
                        <div ng-if="item.senha != item.confirmarSenha" class="alert alert-danger" role="alert">
                            <strong><span class="fa fa-close"></span> Opa! &nbsp</strong> Senhas n&atilde;o correspondem!
                        </div>
                        <div ng-if="usuarioEditar.senha && usuarioEditar.confirmarSenha && usuarioEditar.senha == usuarioEditar.confirmarSenha && usuarioEditar.confirmarSenha.length >5" class="alert alert-success" role="alert">
                            <strong><span class="glyphicon glyphicon-ok"></span> Ok! &nbsp</strong> As senhas correspondem!
                        </div>
                    </div>

                    <button type="submit" ng-disabled="usuarioEditar.senha != usuarioEditar.confirmarSenha" ng-click="editarUsuario(usuarioEditar)" data-dismiss="modal" class="btn btn-success">Salvar</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
            </div>
        </div>

    </div>
</div>

<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
    ga('create', 'UA-85149828-1', 'auto');
    ga('send', 'pageview');
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
</body>
<jsp:include page="../../rodape/rodape.jsp"></jsp:include>
</html>
