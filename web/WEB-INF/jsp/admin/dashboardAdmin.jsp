<%--
  Created by IntelliJ IDEA.
  User: Glenio
  Date: 13/06/2018
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>| Home Administrador</title>

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
<body>
<main class="container" style="margin-bottom: 5%;">

    <!-- TITULO -->
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
        <li><a href="paginaInicial.priv">DASHBORD</a></li>
        <li class="active">Admin</li>
        <li></li>
    </ol>
    <br>
    <!-- MENU -->
    <div class="row">
        <!-- EMPRESA -->
        <div class="col-md-3">
            <div class="text-black text-center">
                <a href="gerenciarEmpresas.priv">
                    <button class="btn btn-default" type="button">
                  <span class="fa-stack fa-5x">
                     <i class="text-black fa fa-industry fa-stack-1x"></i>
                  </span>
                    </button>
                </a>
                <h3><b>Gerenciar Empresa</b></h3>
            </div>
        </div>

        <!--Usuário-->
        <div class="col-md-6">
            <div class="text-black text-center">
                <a href="gerenciarUsuarios.priv">
                    <button class="btn btn-default" type="button">
                  <span class="fa-stack fa-5x">
                     <i class="text-black fa fa-users fa-stack-1x"></i>
                  </span>
                    </button>
                </a>
                <h3><b>Gerenciar Usuários</b></h3>
            </div>
        </div>

        <!-- LAB -->
        <div class="col-md-3">
            <div class="text-black text-center">
                <a href="gerenciarLaboratorios.priv">
                    <button class="btn btn-default" type="button">
                  <span class="fa-stack fa-5x">
                     <i class="text-black fa fa-flask fa-stack-1x"></i>
                  </span>
                    </button>
                </a>
                <h3><b>Gerenciar Laboratório</b></h3>
            </div>
        </div>
    </div>   <!-- ./menu -->

</main>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
</body>
<jsp:include page="../rodape/rodape.jsp"></jsp:include>

</html>
