<%--
  Created by IntelliJ IDEA.
  User: Glenio
  Date: 07/06/2018
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html ng-app="form" ng-cloak>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta Http-Equiv="Cache-Control" Content="no-cache">
    <meta Http-Equiv="Pragma" Content="no-cache">
    <meta Http-Equiv="Expires" Content="0">
    <title>| Login</title>

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

    <script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body ng-controller="formCtrl">
<!-- CABEÇALHO -->
<div class="container">
    <div class="row text-center">
        <div class="col-md-4 text-center">
            <br>
            <nav aria-label="...">
                <ul class="pager pull-left">
                    <li class="previous">
                        <a class="text-muted" href="#">
                            <span aria-hidden="true">&larr;</span> Portal
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="col-md-4" style="margin-top: 1%;">
            <img class="img-responsive" src="<c:url value='/resources/img/img_2_poli.png'/>" alt="logo"/>
        </div>
        <div class="col-md-4"></div>
    </div>
    <hr class="text-success">
</div>

<br>

<!-- FORMULARIOS -->
<div class="top-content">
    <div class="container">
        <!-- TITULO -->
        <ol class="breadcrumb">
            <li></li>
            <li class="active text-success" style="font-size: 120%">
                <i class="fa fa-info-circle text-success" aria-hidden="true">&nbsp
                    Sistema Final de segurança.
                </i>
            </li>
        </ol>
        <div class="text-center text-muted">
            <h1 class="title text-success"><strong>UFSM</strong> | Trabalho Final Segurança</h1>
        </div>

        <div class="row form-row">
            <!-- MENSAGENS CONTA-->
            <c:import url="mensagens/mensagens-conta.jsp" />

            <!-- CRIAR CONTA -->
            <div class="col-sm-5">
                <!-- MENSAGENS CONTA-->
                <c:import url="mensagens/mensagens-status-conta.jsp" />
                <!-- mensagem de erro e sucesso do angular - recuperacao de senha-->
                <div ng-if="mensagem.estado == 'Ok'" ng-model="mensagem" class="alert alert-success" role="alert">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <span class="glyphicon glyphicon-ok"></span> <strong>Ok! &nbsp</strong>{{mensagem.mensagem}}
                </div>
                <div ng-if="mensagem.estado == 'Erro'" ng-model="mensagem" class="alert alert-danger" role="alert">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <span class="glyphicon glyphicon-exit"></span> <strong>Erro! &nbsp</strong> {{mensagem.mensagem}}
                </div>
                <!-- FORMULÁRIO CRIAR CONTA -->
                <div class="form-box">
                    <div class="form-top">
                        <div class="form-top-left">
                            <h3 class="text-success"><strong>Crie uma conta</strong></h3>
                            <p class="text-muted text-success">Para criar uma conta, preencha os campos:</p>
                        </div>
                        <div class="form-top-right">
                            <i class="fa fa-pencil text-success"></i>
                        </div>
                    </div>
                    <div class="form-bottom">
                       <!--  -->
                    </div>
                </div>
            </div>

            <!-- BORDA -->
            <div class="col-sm-1 middle-border"></div>
            <div class="col-sm-1"></div>

            <!-- LOGIN -->
            <div class="col-sm-5">
                <!-- MENSAGENS LOGIN -->
                <c:import url="mensagens/mensagens-login.jsp" />

                <div class="form-box">
                    <div class="form-top">
                        <div class="form-top-left">
                            <h3 class="text-success"><strong>Login</strong></h3>
                            <h4 class="text-muted text-black" ><strong>Acesse com seus dados!</strong></h4>
                            <p class="text-muted text-success" >Para acessar sua conta, informe:</p>
                        </div>
                        <div class="form-top-right">
                            <i class="fa fa-key text-success"></i>
                        </div>
                    </div>
                    <div class="form-bottom">
                        <c:import url="formularios/form-login.jsp" />
                    </div>
                </div>
            </div>
        </div>

        <!-- RODAPE -->
        <jsp:include page="../rodape/rodape.jsp"></jsp:include>
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

<script src='https://www.google.com/recaptcha/api.js?render=6LcJLWMUAAAAAE-ElPwTVKp8eadAyKShR5oiqHyz'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>

</body>
</html>
