package br.com.andrelfreis.app3f.controller;

import javax.inject.Inject;

import br.com.andrelfreis.app3f.model.repository.ModalidadeRepository;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;

@Controller
@Path("/service")
public class ModalidadeController {
	
	@Inject
    private Result result;
   
	@Inject
    private ModalidadeRepository modalidadeRepository;
 
    @Get
    @Path("/modalidade")
    public void listarTodas() {
        result.use(Results.json())
            .withoutRoot()
            .from(modalidadeRepository.listarTodas())
            .serialize();
    }
}
