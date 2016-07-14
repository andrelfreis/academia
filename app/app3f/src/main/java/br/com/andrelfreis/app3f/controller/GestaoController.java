package br.com.andrelfreis.app3f.controller;

import javax.inject.Inject;

import br.com.andrelfreis.app3f.model.repository.ModalidadeRepository;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;

@Controller
@Path("/gestao")
public class GestaoController {
	
	private final Result result;
	private final ModalidadeRepository modalidadeRepository;

	/**
	 * @deprecated CDI eyes only
	 */
	protected GestaoController() {
		this(null,null);
	}
	
	@Inject
	public GestaoController(Result result, ModalidadeRepository modalidadeRepository) {
		this.result = result;
		this.modalidadeRepository = modalidadeRepository;
	}

   
    @Path("/modalidade")
    public void modalidade() {
    	
    }
}
