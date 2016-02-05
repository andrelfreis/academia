package br.com.andrelfreis.app3f.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="mod_modalidade")
public class Modalidade {
	
	@Id
    @SequenceGenerator(name = "sq_mod_id", sequenceName = "sq_mod_id", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sq_mod_id")
	@Column(name="mod_id", updatable=false)
	private Long id; // mod_id integer NOT NULL
	
	@Column(name="mod_nome")
	private String nome; // mod_nome character varying(20) NOT NULL -- taekwondo, pilates

	
	
	/* *****************
	 * Getters & Setters
	 ***************** */
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	
	

}
