angular.module("gestaoAcademia").controller("alunosModalidadeCtrl", alunosModalidadeCtrl);
	function alunosModalidadeCtrl ($scope, $mdDialog) {
		
		var modalidades = [
			{nome: "Taekwondo"}
		  , {nome: "Aikido"}
		  , {nome: "Pilates"}
		];

		$scope.modalidades = modalidades;

		var alunosTaekwondo = [
					{nome: "Aluno Taekwondo 1", turma: "Turma Ter-Qui 20h"}
				  , {nome: "Aluno Taekwondo 2", turma: "Turma Ter-Qui 20h"}
				  , {nome: "Aluno Taekwondo 3", turma: "Turma Seg-Qua-Sex 19:30h"}
				  , {nome: "Aluno Taekwondo 4", turma: "Turma Ter-Qui 20h"}
				  , {nome: "Aluno Taekwondo 5", turma: "Turma Ter-Qui 20h"}
				  , {nome: "Aluno Taekwondo 6", turma: "Turma Seg-Qua-Sex 19:30h"}
				  , {nome: "Aluno Taekwondo 7", turma: "Turma Seg-Qua-Sex 19:30h"}
				  , {nome: "Aluno Taekwondo 8", turma: "Turma Seg-Qua-Sex 19:30h"}
				  , {nome: "Aluno Taekwondo 9", turma: "Turma Ter-Qui 20h"}
				  , {nome: "Aluno Taekwondo 10", turma: "Turma Ter-Qui 20h"}
				  , {nome: "Aluno Taekwondo 11", turma: "Turma Ter-Qui 20h"}
				  , {nome: "Aluno Taekwondo 12", turma: "Turma Ter-Qui 20h"}
				  , {nome: "Aluno Taekwondo 13", turma: "Turma Ter-Qui 20h"}
				];

		var alunosAikido = [
					{nome: "Aluno Aikido 1", turma: "Turma Ter-Qua 15h"}
				  , {nome: "Aluno Aikido 2", turma: "Turma Ter-Qua 15h"}
				  , {nome: "Aluno Aikido 3", turma: "Turma Ter-Qua 15h"}
				  , {nome: "Aluno Aikido 4", turma: "Turma Sab 10h"}
				  , {nome: "Aluno Aikido 5", turma: "Turma Sab 10h"}
				  , {nome: "Aluno Aikido 6", turma: "Turma Sab 10h"}
				];

		var alunosPilates = [
					{nome: "Aluno Pilates 1", turma: "Turma Seg-Qua 10h"}
				  , {nome: "Aluno Pilates 2", turma: "Turma Ter-Sex 17h"}
				  , {nome: "Aluno Pilates 3", turma: "Turma Ter-Sex 17h"}
				  , {nome: "Aluno Pilates 4", turma: "Turma Seg-Qua 10h"}
				  , {nome: "Aluno Pilates 5", turma: "Turma Seg-Qua 10h"}
				  , {nome: "Aluno Pilates 6", turma: "Turma Ter-Sex 17h"}
				  , {nome: "Aluno Pilates 7", turma: "Turma Ter-Sex 17h"}
				  , {nome: "Aluno Pilates 8", turma: "Turma Ter-Sex 17h"}
				  , {nome: "Aluno Pilates 9", turma: "Turma Seg-Qua 10h"}
				];
		
		$scope.alunos = [];

		$scope.carregarAlunos = function (modalidade) {
			if (modalidade.nome === "Taekwondo") {
				$scope.alunos = alunosTaekwondo;
			}
			else if (modalidade.nome === "Aikido") {
				$scope.alunos = alunosAikido;	
			}
			else if (modalidade.nome === "Pilates") {
				$scope.alunos = alunosPilates;	
			}
			else {
				$scope.alunos = [];
			}
		}

		$scope.addTab = function (modalidade) {
			$scope.alunos = [];
			modalidades.push(angular.copy(modalidade));
			delete $scope.modalidade;
		}

	    $scope.removeTab = function (modalidade) {
    		var index = modalidades.indexOf(modalidade);
      		modalidades.splice(index, 1);
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
				$scope.removeTab(modalidade)
		    });
		  };

	};