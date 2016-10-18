angular.module("gestaoAcademia").controller("alunosModalidadeCtrl", alunosModalidadeCtrl);
	function alunosModalidadeCtrl ($scope, $mdDialog, $http, modalidadeAPI) {
		
		$scope.modalidades = [];

		var carregarModalidades = function (modalidadeCriada) {
			modalidadeAPI.getModalidades().success(function(data, status) {
				$scope.modalidades = data;
				console.log("modalidades no scope = " + $scope.modalidades);
				if (modalidadeCriada) {
					console.log("modalidadeCriada = " + modalidadeCriada.nome);
				}
			});
		};


		$scope.addTabModalidade = function (modalidade) {
			modalidadeAPI.saveModalidade(modalidade).success(function (data, status) {
				var modalidadeCriada = angular.copy(modalidade);
				$scope.modalidades.push(modalidadeCriada);
				delete $scope.modalidade;
				carregarModalidades(modalidadeCriada);
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