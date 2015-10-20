package br.com.andrelfreis.app3f.controller;

import javax.inject.Inject;

import br.com.andrelfreis.app3f.model.repository.PessoaRepository;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;

@Controller
@Path("/pessoa")
public class PessoaController {
	
	@Inject
    private Result result;
   
	@Inject
    private PessoaRepository pessoaRepository;
 
    @Get
    @Path("/todas")
    public void listAll() {
        result.use(Results.json())
            .withoutRoot()
            .from(pessoaRepository.todas())
            .serialize();
    }
}
