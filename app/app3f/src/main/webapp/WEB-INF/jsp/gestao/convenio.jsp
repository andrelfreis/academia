<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>

<html ng-app="gestaoAcademia" lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Academia 3F - Cadastro de Conv&ecirc;nios</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,400italic">
        <!-- Angular Material style sheet -->
  		<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/angular_material/1.0.7/angular-material.min.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
    </head>
    <body ng-controller="convenioCtrl" ng-cloak>	
        
		
        
        
        
        <!-- Angular Material requires Angular.js Libraries -->
  		<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular.min.js"></script>
  		<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-animate.min.js"></script>
	  	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-aria.min.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-messages.min.js"></script>
		
		<!-- Angular Material Library -->
  		<script src="http://ajax.googleapis.com/ajax/libs/angular_material/1.0.7/angular-material.min.js"></script>
  		
  		<!-- Your application bootstrap  -->
  		<script src="${pageContext.request.contextPath}/js/app.js"></script>
      	<script src="${pageContext.request.contextPath}/js/controllers/convenioCtrl.js"></script>
      	<script src="${pageContext.request.contextPath}/js/services/convenioAPIService.js"></script>
    </body>
</html>