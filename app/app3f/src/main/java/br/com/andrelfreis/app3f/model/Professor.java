package br.com.andrelfreis.app3f.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="pro_professor")
public class Professor {
	
	@Id   
	@SequenceGenerator(name = "sq_pro_id", sequenceName = "sq_pro_id", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sq_pro_id")
	@Column(name="pro_id", updatable=false)
	private Long id; // pro_id integer NOT NULL
	
	@OneToOne
	@JoinColumn(name="pro_pes_id")
	private Pessoa pessoa; // pro_pes_id integer NOT NULL REFERENCES app3f.pes_pessoa (pes_id) ON DELETE CASCADE

	
	
	/* *****************
	 * Getters & Setters
	 ***************** */
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Pessoa getPessoa() {
		return pessoa;
	}
	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}
	
	
	
	
}
