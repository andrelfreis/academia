angular.module("gestaoAcademia").controller("alunosModalidadeCtrl", alunosModalidadeCtrl);
	function alunosModalidadeCtrl ($scope, $mdDialog, $http) {
		
		$scope.modalidades = [];

		var carregarModalidades = function () {
			$http.get("http://localhost:8080/app3f/service/modalidade").success(function(data, status) {
				$scope.modalidades = data;
			});
		};


		$scope.addTabModalidade = function (modalidade) {
			$http.post("http://localhost:8080/app3f/service/modalidade", modalidade).success(function (retorno) {
				console.log("RETORNO =" + retorno);
				$scope.modalidades.push(angular.copy(modalidade));
				delete $scope.modalidade;
				//carregarModalidades();
			});
		}

	    $scope.removeTabModalidade = function (modalidade) {
	    	$http.delete("http://localhost:8080/app3f/service/modalidade/"+modalidade.id).success(function (retorno) {
	    		var index = $scope.modalidades.indexOf(modalidade);
	    		$scope.modalidades.splice(index, 1);
	    	});
    	};

		$scope.showConfirmExcluirModalidade = function(ev, modalidade) {
			// Appending dialog to document.body to cover sidenav in docs app
		    var confirm = $mdDialog.confirm()
		          .title("Confirma a exclusão da modalidade: " + modalidade.nome + "?")
		          .textContent("")
		          .ariaLabel("Confirmar a exclusão da modalidade: " + modalidade.nome)
		          .targetEvent(ev)
		          .ok("NÃO")
		          .cancel("SIM");
		    $mdDialog.show(confirm).then(function() {
		      // you choose NO! That's ok to make cancel the default action!
		    }, function() {
				$scope.removeTabModalidade(modalidade);
		    });
		  };
		  
		carregarModalidades();  
		  
	};