package br.com.andrelfreis.app3f.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="pes_pessoa")
public class Pessoa {
	
	@Id
    @SequenceGenerator(name = "sq_pes_id", sequenceName = "sq_pes_id", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sq_pes_id")
	@Column(name="pes_id", updatable=false)
    private Long id; // pes_id integer NOT NULL
	
	@Column(name="pes_nome")
	private String nome; //	pes_nome character varying(100) NOT NULL
	
	@Column(name="pes_data_nascimento")
	private LocalDate dataNascimento; // pes_data_nascimento date NOT NULL
	
	@Column(name="pes_sexo", length=1)
	private String sexo; // pes_sexo character(1) NOT NULL
	
	@Column(name="pes_data_registro", nullable=false, updatable=false)
	private LocalDate dataRegistro = LocalDate.now(); // pes_data_registro date NOT NULL DEFAULT CURRENT_DATE
	
	@Column(name="pes_cpf")
	private String cpf; // pes_cpf character varying(11) NULL
	
	@Column(name="pes_rg")
	private String rg; // pes_rg character varying(12) NULL
	
	
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
	public LocalDate getDataNascimento() {
		return dataNascimento;
	}
	public void setDataNascimento(LocalDate dataNascimento) {
		this.dataNascimento = dataNascimento;
	}
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	public LocalDate getDataRegistro() {
		return dataRegistro;
	}
	public void setDataRegistro(LocalDate dataRegistro) {
		this.dataRegistro = dataRegistro;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getRg() {
		return rg;
	}
	public void setRg(String rg) {
		this.rg = rg;
	}
	
	
}
