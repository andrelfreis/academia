angular.module("gestaoAcademia").factory("modalidadeAPI", function ($http) {
	var _getModalidades = function () {
		return $http.get("http://localhost:8080/app3f/service/modalidade");
	}
	
	var _saveModalidade = function (modalidade) {
		return $http.post("http://localhost:8080/app3f/service/modalidade", modalidade);
	}

	return {
		getModalidades: _getModalidades,
		saveModalidade: _saveModalidade
	}
	
});