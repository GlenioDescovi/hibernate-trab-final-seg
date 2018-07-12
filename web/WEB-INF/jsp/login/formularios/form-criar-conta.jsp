<form action="cria-usuario.html" method="post" autocomplete="off" name="formCadastro">
	<div class="form-group">
		<label class="sr-only">Nome</label>
		<input type="text" name="nome" minlength="5" placeholder="Nome Completo" class="form-control" required>
	</div>
	<div class="form-group">
		<label class="sr-only">Email</label>
		<input type="email" name="email" minlength="5" placeholder="Insira seu email" class="form-control" required>
	</div>
	<div class="form-group">
		<label class="sr-only">Login</label>
		<input type="text"	name="login" placeholder="login" class="form-control" required>
	</div>
	<div class="form-group">
		<label class="sr-only">Senha</label>
		<input type="password" name="senha" minlength="6" placeholder="Senha" ng-model="item.senha" class="form-control" required>
		<div ng-if="formCadastro.senha.$dirty">
			<div ng-if="formCadastro.senha.$invalid">
				<p style="color: red; margin-left:5%;">  a senha deve ter no m&iacute;nimo seis caracteres</p>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="sr-only">Confirme sua senha</label>
		<input type="password" minlength="6" placeholder="Confirme sua senha" name="confirmarSenha" ng-model="item.confirmarSenha" class="form-control" required>

	</div>

	<div ng-if="formCadastro.confirmarSenha.$dirty && formCadastro.confirmarSenha.$valid">
		<div ng-if="item.senha != item.confirmarSenha" class="alert alert-danger" role="alert">
			<strong><span class="fa fa-close"></span> Opa! &nbsp</strong> Senhas n&atilde;o correspondem!
		</div>
		<div ng-if="item.senha && item.confirmarSenha && item.senha == item.confirmarSenha && item.confirmarSenha.length >5" class="alert alert-success" role="alert">
			<strong><span class="glyphicon glyphicon-ok"></span> Ok! &nbsp</strong> As senhas correspondem!
		</div>
	</div>

	<button type="submit" ng-disabled="item.senha != item.confirmarSenha" class="btn btn-success">Cadastrar-se</button>
</form>
