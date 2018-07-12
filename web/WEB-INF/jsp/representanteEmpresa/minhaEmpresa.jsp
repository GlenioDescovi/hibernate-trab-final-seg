<%--
  Created by IntelliJ IDEA.
  User: Glenio
  Date: 07/06/2018
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html ng-app="form" ng-cloak>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta Http-Equiv="Cache-Control" Content="no-cache">
    <meta Http-Equiv="Pragma" Content="no-cache">
    <meta Http-Equiv="Expires" Content="0">
    <title>| Minha Empresa</title>

    <link rel="shortcut icon" type="image/png" href="<c:url value='/resources/img/favicon.png'/>"/>
    <link rel="stylesheet" href="<c:url value='/resources/fonts/fonts.css'/>">
    <link type="text/css" href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">
    <link type="text/css" href="<c:url value='/resources/css/style.css'/>" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/resources/font-awesome/css/font-awesome.min.css'/>">

    <!-- ANGULAR -->
    <script src="<c:url value='/resources/angular/angular.js'/>"></script>
    <script src="<c:url value='/resources/angular/checklist-model.js'/>"></script>
    <script src="<c:url value='/resources/js/app.js'/>"></script>
    <script src="<c:url value='/resources/js/controllers/formEmpresaRepresentante.js'/>"></script>
    <script src="<c:url value='/resources/js/directives/uiDirectives.js'/>"></script>
    <script src="<c:url value='/resources/js/directives/ng-currency.js'/>"></script>
</head>
<body class="container" ng-controller="formEmpresaRepresentante">
<div class="row">
    <div class="col-md-10">
    </div>
    <div class="col-md-2">
        <jsp:include page="../menu/drop-menu.jsp"></jsp:include>
    </div>
</div>
<hr class="margin-titulo">

<!-- CAMINHO -->
<ol class="breadcrumb">
    <li></li>
    <li class="active"><a href="paginaInicial.priv">DASHBORD</a></li>
    <li>{{ minhaEmpresa.razaoSocial }}</li>
</ol>
<br>

<div class="row">
    <div class="col-md-12">
        <table class="table table-hover table-condensed table table-striped">
            <thead>
            <tr>
                <td class="text-center"><button data-toggle="modal" data-target="#adicionar" type="button" class="btn btn-success" title="Adicionar Cidade">
                    <i class="fa fa-plus-square-o"><strong> Adicionar Cidade</strong></i>
                </button></td>
                <td class="text-center"><strong></strong></td>
                <td class="text-center"><strong></strong></td>
                <td class="text-center"><strong></strong></td>
            </tr>
            <tr>
                <th class="text-muted text-center">Nome</th>
                <th class="text-center"><i class="fa fa-cogs fa-2x"></i></th>
            </tr>
            </thead>

            <tbody>
            <tr ng-repeat="cidade in cidades | orderBy:'nome'">
                <form>
                    <td class="text-muted text-center"width="90%">{{cidade.nome}}</td>
                    <td class="text-muted text-center"width="10%">
                        <div class="form-group">
                            <!-- <select ng-disabled="usuario.role.id_role >= 2"  class="text-muted text-center" width="8%" class="form-control" ng-model="usuario.role" ng-options="role.role for role in roles">
                                 <option value="">Selecione uma Permissão</option>
                             </select> -->

                            <%--<span class="input-group-addon" ><button class="btn btn-success" ng-click="functionAlteraNivel(usuario, nivel)">Alterar</button></span>--%>
                            <!--<button title="Alterar permissão do usuário" class="btn btn-success" ng-click="functionAlteraNivel(usuario, role)" ><i class="fa fa-refresh"></i></button> -->
                            <button class="btn btn-primary" data-toggle="modal" data-target="#editar" ng-click="openModal(cidade)"
                                    title="Editar cidade"><i class="fa fa-edit"></i></button> -
                            <button class="btn btn-danger" ng-click="deleteCidade(cidade)"
                                    title="Excluir"><i class="fa fa-close"></i></button>

                        </div></td>
                </form>
            </tr>
            </tbody>
            <tfoot>
            <tr class="active">
                <td class="text-center"><strong>...</strong></td>
                <td class="text-center"><strong>...</strong></td>
            </tr>
            </tfoot>
        </table>
    </div>
</div>

<div id="adicionar" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Cadastrar Empresa</h4>
            </div>
            <div class="modal-body col-md-12">

                <form autocomplete="off" name="formCadastro">
                    <div class="form-group col-md-12">
                        <label class="sr-only">Nome</label>
                        <input type="text" ng-model="cidade.nome" name="nome" minlength="5" maxlength="30" placeholder="Nome Cidade" class="form-control" required>
                    </div>
                    <br>
                    <button type="submit" data-dismiss="modal" ng-click="addCidade(cidade)" class="btn btn-success">Adicionar</button>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
            </div>
        </div>

    </div>
</div>
</body>

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
<jsp:include page="../../jsp/rodape/rodape.jsp"></jsp:include>

</html>


