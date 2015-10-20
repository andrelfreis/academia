package br.com.andrelfreis.app3f.model.repository;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaQuery;

import br.com.andrelfreis.app3f.model.Pessoa;

@RequestScoped
public class PessoaRepository {
	
	@Inject
	private EntityManager em;

	public List<Pessoa> todas() {
		CriteriaQuery<Pessoa> cq = em.getCriteriaBuilder().createQuery(Pessoa.class);
		cq.select(cq.from(Pessoa.class));
		return (List<Pessoa>) em.createQuery(cq).getResultList();
	}
	
}
