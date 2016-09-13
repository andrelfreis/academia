package br.com.andrelfreis.app3f.controller;

import javax.inject.Inject;

import br.com.andrelfreis.app3f.model.Modalidade;
import br.com.andrelfreis.app3f.model.repository.ModalidadeRepository;
import br.com.caelum.vraptor.Consumes;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;

@Controller
@Path("/service")
public class ModalidadeController {
	
    private Result result;
    private ModalidadeRepository modalidadeRepository;

    /**
     * @deprecated CDI eyes only
     */
    protected ModalidadeController() {
		this(null, null);
	}
    
    @Inject
    public ModalidadeController(Result result, ModalidadeRepository modalidadeRepository) {
    	this.result = result;
    	this.modalidadeRepository = modalidadeRepository;
    }
    
    @Get
    @Path("/modalidade")
    public void listarTodas() {
        result.use(Results.json())
            .withoutRoot()
            .from(modalidadeRepository.listarTodas())
            .serialize();
    }
    
    @Post
    @Path("/modalidade")
    @Consumes("application/json")
    public void adicionar(Modalidade modalidade) {
    	modalidadeRepository.insert(modalidade);
    	result.nothing();
    }
    
}
