package br.com.andrelfreis.app3f.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Result;

@Controller
public class TestsController {
	
	@Inject private Result result;
	
	@Get("/tests")
	public void tests() {
		result.include("mensagem", "Página para testes!");
	}
	
}
