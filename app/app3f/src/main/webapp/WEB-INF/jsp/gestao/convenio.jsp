<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>

<html ng-app="gestaoAcademia" lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Academia 3F - Cadastro de Conv&ecirc;nios</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,400italic">
        <!-- Angular Material style sheet -->
  		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/lib/angular-material.min.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
    </head>
    <body ng-controller="convenioCtrl" ng-cloak>	
        
        <h1>Cadastro de Conv&ecirc;nios</h1>
		
		<form name="convenioForm" ng-submit="adicionarConvenio(convenio)" layout="column" class="md-padding">
        	<div>
        		<md-subheader>Novo Convênio:</md-subheader>
            	<md-input-container>
                	<label>Nome</label>
               		<input required type="text" name="convenioNome" ng-model="convenio.nome" maxlength="20">
               		<div ng-messages="convenioForm.convenioNome.$error">
              			<div ng-message="required">O nome é obrigatório</div>
            		</div>
                </md-input-container>
                <md-input-container>
               		<label>Desconto %</label>
               		<input required type="number" name="convenioDesconto" ng-model="convenio.desconto">
               		<div ng-messages="convenioForm.convenioDesconto.$error">
              			<div ng-message="required">Você precisa preencher o desconto.</div>
            		</div>
           		</md-input-container>
             	<md-button class="md-primary md-raised" ng-disabled="!convenio.nome && !convenio.desconto" type="submit">Salvar</md-button>
        	</div>
       	</form>
		
		
		<hr/>
		<md-list>
			<md-list-item ng-repeat="convenio in convenios">
				<span class="md-title">{{ convenio.nome }}: {{ convenio.desconto }}%</span>
			</md-list-item>
		</md-list>
		        
        
        
        <!-- Angular Material requires Angular.js Libraries -->
  		<script src="${pageContext.request.contextPath}/js/lib/angular.min.js"></script>
  		<script src="${pageContext.request.contextPath}/js/lib/angular-animate.min.js"></script>
	  	<script src="${pageContext.request.contextPath}/js/lib/angular-aria.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/lib/angular-messages.min.js"></script>
		
		<!-- Angular Material Library -->
  		<script src="${pageContext.request.contextPath}/js/lib/angular-material.min.js"></script>
  		
  		<!-- Your application bootstrap  -->
  		<script src="${pageContext.request.contextPath}/js/app.js"></script>
      	<script src="${pageContext.request.contextPath}/js/controllers/convenioCtrl.js"></script>
      	<script src="${pageContext.request.contextPath}/js/services/convenioAPIService.js"></script>
    </body>
</html>