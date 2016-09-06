<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>

<html ng-app="gestaoAcademia" lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Gest&atilde;o Academia - alunos por modalidade</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,400italic">
        <!-- Angular Material style sheet -->
  		<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/angular_material/1.0.7/angular-material.min.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
    </head>
    <body ng-controller="alunosModalidadeCtrl" ng-cloak>		
        <div class="tabModalidades">
  			<md-content>
			    <md-tabs md-dynamic-height="" md-border-bottom="" md-stretch-tabs="auto">
					<md-tab ng-repeat="modalidade in modalidades" md-on-select="carregarAlunos(modalidade)" label="{{ modalidade.nome }}">
						<md-content class="md-padding">
							<md-list>
				               <md-list-item class="md-2-line" ng-repeat="aluno in alunos">
				                  <img alt="foto do aluno {{ aluno.nome }}" ng-src="${pageContext.request.contextPath}/img/taekwondo-avatar.jpg" class="md-avatar" />
				                  <div class="md-list-item-text" layout="column">
				                    <h3>{{ aluno.nome }}</h3>
				                    <h4>{{ aluno.turma }}</h4>
				                  </div>
				                </md-list-item>
				               </md-list>
			               <md-button class="md-primary md-raised md-warn" ng-click="showConfirmExcluirModalidade($event, modalidade)" ng-hide="alunos.length > 0" ng-disabled="modalidades.length <= 1">
			                  Excluir Modalidade
			               </md-button>
						</md-content>
					</md-tab>
					<md-tab>
						<md-tab-label>              
		             	+ Modalidade
		             	</md-tab-label>
		            	<md-tab-body>
		              		<form ng-submit="addTab(modalidade)" layout="column" class="md-padding">
				                <div>
				                  <md-input-container>
				                    <label for="id_nome_modalidade">Nova Modalidade</label>
				                    <input type="text" id="id_nome_modalidade" ng-model="modalidade.nome">
				                  </md-input-container>
				                  <md-button class="add-tab md-primary md-raised" ng-disabled="!modalidade.nome" type="submit">Salvar</md-button>
				                </div>
		              		</form>
						</md-tab-body>
					</md-tab>
				</md-tabs>
			</md-content>
		</div>

        
        
        
        <!-- Angular Material requires Angular.js Libraries -->
  		<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular.min.js"></script>
  		<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-animate.min.js"></script>
	  	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-aria.min.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-messages.min.js"></script>
		
		<!-- Angular Material Library -->
  		<script src="http://ajax.googleapis.com/ajax/libs/angular_material/1.0.7/angular-material.min.js"></script>
  		
  		<!-- Your application bootstrap  -->
  		<script src="${pageContext.request.contextPath}/js/app.js"></script>
      <script src="${pageContext.request.contextPath}/js/controllers/alunosModalidadeCtrl.js"></script>
    </body>
</html>