<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<link type="text/css" href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">

	<c:if test="${status == 'cadastroUsuario'}"> 
        <div class="alert alert-success" role="alert"> 
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok!</strong> &nbsp Conta criada com Sucesso.
        	 </strong><br><br>
        </div>
    </c:if> 

<c:set var="status" value="vazio" scope="page" />

