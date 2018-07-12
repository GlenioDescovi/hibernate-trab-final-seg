<form action="login.html" method="post" autocomplete="off">
	<div class="form-group">
		<label class="sr-only">Login</label>
		<input class="form-control" type="text" minlength="5" maxlength="20" name="login" placeholder="Insira seu login" ng-model="login" required>
	</div>
	<div class="form-group">
		<label class="sr-only">Senha</label>
		<input class="form-control"	minlength="6" maxlength="20" type="password" name="senha" placeholder="Insira sua senha" required>
	</div>

	<div class="g-recaptcha" data-sitekey="6LcJLWMUAAAAAE-ElPwTVKp8eadAyKShR5oiqHyz"></div>

	<button type="submit" class="btn btn-success">Entrar</button>

	<div class="text-center" style="margin-top: 6%;">
		<h5>
			<a data-toggle="modal" data-toggle="modal" href="#">Esqueceu sua senha?</a>
		</h5>
	</div>
</form>


