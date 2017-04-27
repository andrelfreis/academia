angular.module("gestaoAcademia").factory("convenioAPI", function ($http) {
	var _getConvenios = function () {
		return $http.get("http://localhost:8080/app3f/service/convenio");
	}
	
	var _saveConvenio = function (convenio) {
		return $http.post("http://localhost:8080/app3f/service/convenio", convenio);
	}
	
	var _deleteConvenio = function (convenio) {
		return $http.delete("http://localhost:8080/app3f/service/convenio/"+convenio.nome);
	}

	return {
		getConvenios: _getConvenios,
		saveConvenio: _saveConvenio,
		deleteConvenio: _deleteConvenio
	}
	
});