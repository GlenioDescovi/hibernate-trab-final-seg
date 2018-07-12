

<div class="modal fade" id="excluirConta" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header text-center">
			    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			    	<h4 class="modal-title text-muted" >
			        	<span class="fa fa-trash"></span> Excluir Conta
			        </h4>
			</div>
			<div class="modal-body text-center">
				<h4 class="modal-title" >
					<strong> Tem certeza que deseja excluir sua conta? </strong>  </br></br>
					Lembre-se que todas as solicita&ccedil;&otilde;es relacionadas a esse usu&aacute;rio ser&atilde;o apagados.
				</h4>
				<hr>
				<form action="removerConta" method="post" autocomplete="off">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label >Siape</label>
								<input type="text" name="siape" maxlength="9" ng-model="excluir.siape" class="form-control" required ui-number>	
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Senha Atual</label>
								<input type="password" name="senha" class="form-control" required>		
							</div>
						</div>
					</div>
			</div>
			<div class="modal-footer">
						<button class="btn btn-primary" type="submit" margin-bottom: 1%;">
							<span class="glyphicon glyphicon-ok"></span> Excluir
						</button>
				</form>		
                	<button type="button" class="btn btn-default" data-dismiss="modal"> <span class="fa fa-close"></span> Fechar</button>
           </div>
       </div>
	</div>
</div>