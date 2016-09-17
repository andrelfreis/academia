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
	private EntityManager entityManager;

	public List<Modalidade> findAll() {
		CriteriaQuery<Modalidade> cq = entityManager.getCriteriaBuilder().createQuery(Modalidade.class);
		cq.select(cq.from(Modalidade.class));
		return (List<Modalidade>) entityManager.createQuery(cq).getResultList();
	}

	public void insert(Modalidade modalidade) {
		entityManager.persist(modalidade);
	}
	
	public Modalidade find(Modalidade modalidade) {
		return entityManager.find(Modalidade.class, modalidade.getId());
	}
	
	public void delete(Modalidade modalidade) {
		entityManager.remove(find(modalidade));
	}
	
	
}
