angular.module("gestaoAcademia").controller("convenioCtrl", convenioCtrl);
	function convenioCtrl ($scope, $mdDialog, $http, convenioAPI) {
		
		$scope.convenios = [];

		var carregarConvenios = function () {
			convenioAPI.getConvenios().success(function(data, status) {
				$scope.convenios = data;
			});
		};

		$scope.adicionarConvenio = function (convenio) {
			convenioAPI.saveConvenio(convenio).success(function (data, status, headers) {
				var newId = headers("Location").split("/").pop();
				var convenioCriado = angular.copy(convenio);
				convenioCriado.id = newId;
				$scope.convenios.push(convenioCriado);
				delete $scope.convenio;
				carregarConvenios();
			});
		}

	    $scope.excluirConvenio = function (convenio) {
	    	convenioAPI.deleteConvenio(convenio).success(function (retorno) {
	    		var index = $scope.convenios.indexOf(convenio);
	    		$scope.convenios.splice(index, 1);
	    	});
    	};

		$scope.showConfirmExcluirConvenio = function(ev, convenio) {
			// Appending dialog to document.body to cover sidenav in docs app
		    var confirm = $mdDialog.confirm()
		          .title("Confirma a exclusão do convênio: " + convenio.nome + "?")
		          .textContent("")
		          .ariaLabel("Confirmar a exclusão do convênio: " + convenio.nome)
		          .targetEvent(ev)
		          .ok("NÃO")
		          .cancel("SIM");
		    $mdDialog.show(confirm).then(function() {
		      // you choose NO! That's ok to make cancel the default action!
		    }, function() {
				$scope.excluirConvenio(convenio);
		    });
		  };
		  
		carregarConvenios();  
		  
	};