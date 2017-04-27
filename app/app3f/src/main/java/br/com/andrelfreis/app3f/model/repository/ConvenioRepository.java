package br.com.andrelfreis.app3f.model.repository;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaQuery;

import br.com.andrelfreis.app3f.model.Convenio;

@RequestScoped
public class ConvenioRepository {
	
	@Inject
	private EntityManager entityManager;

	public List<Convenio> findAll() {
		CriteriaQuery<Convenio> cq = entityManager.getCriteriaBuilder().createQuery(Convenio.class);
		cq.select(cq.from(Convenio.class));
		return (List<Convenio>) entityManager.createQuery(cq).getResultList();
	}

	public void insert(Convenio convenio) {
		entityManager.persist(convenio);
	}
	
	public Convenio find(Convenio convenio) {
		return entityManager.find(Convenio.class, convenio.getId());
	}
	
	public Convenio findByName(Convenio convenio) {
		Convenio convenioEncontrado = (Convenio) entityManager
				.createQuery("SELECT c FROM Convenio c WHERE c.name = :convNome")
				.setParameter("convNome", convenio.getNome())
				.getSingleResult();
		return convenioEncontrado;
	}
	
	public void delete(Convenio convenio) {
		entityManager.remove(findByName(convenio));
	}
	
	
}
