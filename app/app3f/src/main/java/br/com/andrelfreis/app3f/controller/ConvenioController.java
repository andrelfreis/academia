package br.com.andrelfreis.app3f.controller;

import javax.inject.Inject;

import br.com.andrelfreis.app3f.model.Convenio;
import br.com.andrelfreis.app3f.model.repository.ConvenioRepository;
import br.com.caelum.vraptor.Consumes;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;

@Controller
@Path("/service")
public class ConvenioController {
	
    private Result result;
    private ConvenioRepository convenioRepository;

    /**
     * @deprecated CDI eyes only
     */
    protected ConvenioController() {
		this(null, null);
	}
    
    @Inject
    public ConvenioController(Result result, ConvenioRepository convenioRepository) {
    	this.result = result;
    	this.convenioRepository = convenioRepository;
    }
    
    @Get
    @Path("/convenio")
    public void findAll() {
        result.use(Results.json())
            .withoutRoot()
            .from(convenioRepository.findAll())
            .serialize();
    }
    
    @Post
    @Path("/convenio")
    @Consumes("application/json")
    public void insert(Convenio convenio) {
    	convenioRepository.insert(convenio);
    	result.include(convenio);
    	result.use(Results.status()).created("/convenio/"+convenio.getNome());
    }
    
    @Delete
    @Path("/convenio/{convenio.nome}")
    @Consumes("application/json")
    public void remover(Convenio convenio) {
    	convenioRepository.delete(convenio);
    	result.nothing();
    }
    
}
