package br.com.andrelfreis.app3f.model;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="con_convenio")
public class Convenio {
	
	@Id
    @SequenceGenerator(name = "sq_con_id", sequenceName = "sq_con_id", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sq_con_id")
	@Column(name="con_id", updatable=false)
	private Long id; // con_id integer NOT NULL
	
	@Column(name="con_nome")
	private String nome; // con_nome character varying(20) NOT NULL
	
	@Column(name="con_desconto")
	private BigDecimal desconto; // con_desconto numeric(5,2) NOT NULL
	
	
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
	public BigDecimal getDesconto() {
		return desconto;
	}
	public void setDesconto(BigDecimal desconto) {
		this.desconto = desconto;
	}
	
	
	

}
