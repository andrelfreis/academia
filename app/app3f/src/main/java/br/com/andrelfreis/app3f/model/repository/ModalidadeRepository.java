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
		//System.out.println("Chegou aqui? id = " + modalidade.getId() + "; nome = " + modalidade.getNome());
		entityManager.persist(modalidade);
	}
	
	
	public Modalidade find(Modalidade modalidade) {
		System.out.println("Chegou aqui? id = " + modalidade.getId() + "; nome = " + modalidade.getNome());
		return entityManager.find(Modalidade.class, modalidade.getId());
	}
	
	
	public void remove(Modalidade modalidade) {
		Modalidade _modalidade = find(modalidade);
		System.out.println("Chegou aqui? id = " + _modalidade.getId() + "; nome = " + _modalidade.getNome());
		//entityManager.remove(modalidade);
	}
	
	
}
