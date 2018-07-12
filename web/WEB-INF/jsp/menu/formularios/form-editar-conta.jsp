<div class="modal fade" id="editar" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header text-center">
			    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			    	<h4 class="modal-title text-muted" id="myModalLabel"> 
			        	<span class="fa fa-cog"></span> Editar Conta
			        </h4>
			</div>
			<div class="modal-body text-center">
				<form action="editarUsuario" method="post" autocomplete="off">
					<div class="row">
						<div class="col-md-7">
							<div class="form-group" ng-init="nome='${usuarioLogado.nomeCompleto}'">
								<label >Nome Completo</label>
								<input type="text" name="nome" minlength="5" class="form-control" ng-model="nome" required>
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label >Email</label>
								<input type="email" name="email" value="${usuarioLogado.email}" class="form-control" required>		
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label >Siape</label>
								<input type="text" value="${usuarioLogado.siape}" class="form-control text-center" required disabled>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Confirme sua Senha</label>
								<input type="password" name="senha" minlength="6" class="form-control" required>		
							</div>
						</div>
					</div>
			</div>
			<div class="modal-footer">
						<button class="btn btn-primary" type="submit" margin-bottom: 1%;">
							<span class="glyphicon glyphicon-ok"></span> Editar
						</button>
				</form>		
                	<button type="button" class="btn btn-default" data-dismiss="modal"> <span class="fa fa-close"></span> Fechar</button>
           </div>
       </div>
	</div>
</div>