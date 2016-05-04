(function(){
    "use strict";

    var app = angular.module("gestaoAcademia", ["ngMaterial"]);
    app.controller("alunosModalidadeCtrl", alunosModalidadeCtrl);
    function alunosModalidadeCtrl ($scope) {
		$scope.modalidades = [
			{nome: "Taekwondo"}
		  , {nome: "Aikido"}
		  , {nome: "Pilates"}
		];
		
		var alunosTaekwondo = [
				  	{nome: "Aluno Taekwondo 1"}
				  , {nome: "Aluno Taekwondo 2"}
				  , {nome: "Aluno Taekwondo 3"}
				  , {nome: "Aluno Taekwondo 4"}
				  , {nome: "Aluno Taekwondo 5"}
				  , {nome: "Aluno Taekwondo 6"}
				  , {nome: "Aluno Taekwondo 7"}
				  , {nome: "Aluno Taekwondo 8"}
				  , {nome: "Aluno Taekwondo 9"}
				  , {nome: "Aluno Taekwondo 10"}
				  , {nome: "Aluno Taekwondo 11"}
				  , {nome: "Aluno Taekwondo 12"}
				  , {nome: "Aluno Taekwondo 13"}
			  	];

		var alunosAikido = [
					{nome: "Aluno Aikido 1"}
				  , {nome: "Aluno Aikido 2"}
				  , {nome: "Aluno Aikido 3"}
				  , {nome: "Aluno Aikido 4"}
				  , {nome: "Aluno Aikido 5"}
				  , {nome: "Aluno Aikido 6"}
				];

		var alunosPilates = [
					{nome: "Aluno Pilates 1"}
				  , {nome: "Aluno Pilates 2"}
				  , {nome: "Aluno Pilates 3"}
				  , {nome: "Aluno Pilates 4"}
				  , {nome: "Aluno Pilates 5"}
				  , {nome: "Aluno Pilates 6"}
				  , {nome: "Aluno Pilates 7"}
				  , {nome: "Aluno Pilates 8"}
				  , {nome: "Aluno Pilates 9"}
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
			
		}
	};
        
    
})();