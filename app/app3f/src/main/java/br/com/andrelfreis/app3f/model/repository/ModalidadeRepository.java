package br.com.andrelfreis.app3f.model.repository;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaQuery;

import br.com.andrelfreis.app3f.model.Modalidade;

@RequestScoped
public class ModalidadeRepository {
	
	@Inject
	private EntityManager em;

	public List<Modalidade> listarTodas() {
		CriteriaQuery<Modalidade> cq = em.getCriteriaBuilder().createQuery(Modalidade.class);
		cq.select(cq.from(Modalidade.class));
		return (List<Modalidade>) em.createQuery(cq).getResultList();
	}
	
	
}
