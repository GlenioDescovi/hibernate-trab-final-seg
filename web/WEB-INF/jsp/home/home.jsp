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
    <title>| Home Page</title>

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
<body class="container">
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
    <li class="active"><a href="paginaInicial.priv">DASHBORD/</a></li>
    <li></li>
</ol>
<br>
<div class="row" style="margin-top: 5%">
    <c:if test="${usuarioLogado.role.id_role==1}">
        <!-- ADMIN -->
        <div class="col-md-offset-1 col-md-2" >
            <div class="text-black text-center">
                <a href="dashboardAdmin.priv">
                    <button class="btn btn-default" type="button">
                  <span class="fa-stack fa-5x">
                     <i class="text-black fa fa-list-ul fa-stack-1x"></i>
                  </span>
                    </button>
                </a>
                <h3><b>Admin</b></h3>
            </div>
        </div> <!-- FIM ADMIN -->
    </c:if>
<c:if test="${usuarioLogado.role.id_role==2}">
    <!-- empresa -->
    <div class="col-md-6">
        <div class="text-black text-center">
            <a href="minhaEmpresa.priv">
                <button class="btn btn-default" type="button">
                  <span class="fa-stack fa-5x">
                     <i class="text-black fa fa-industry fa-stack-1x"></i>
                  </span>
                </button>
            </a>
            <h3><b>Empresa</b></h3>
        </div>
    </div> <!-- FIM empresa -->
</c:if>

<c:if test="${usuarioLogado.role.id_role==3}">
    <!-- empresa -->
    <div class="col-md-2">
        <div class="text-black text-center">
            <a>
                <button class="btn btn-default" type="button">
                  <span class="fa-stack fa-5x">
                     <i class="text-black fa fa-flask fa-stack-1x"></i>
                  </span>
                </button>
            </a>
            <h3><b>Laboratório</b></h3>
        </div>
    </div> <!-- FIM lab -->
</c:if>

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
<jsp:include page="../rodape/rodape.jsp"></jsp:include>
</html>
