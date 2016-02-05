package br.com.andrelfreis.app3f.model;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="tur_turma")
public class Turma {
	
	@Id
    @SequenceGenerator(name = "sq_tur_id", sequenceName = "sq_tur_id", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sq_tur_id")
	@Column(name="tur_id", updatable=false)
	private Long id; // tur_id integer NOT NULL
	
	@ManyToOne
	@JoinColumn(name="tur_mod_id")
	private Modalidade modalidade;// tur_mod_id integer NOT NULL 
	
	@ManyToOne
	@JoinColumn(name="tur_pro_id")
	private Professor professor;// tur_pro_id integer NOT NULL 
	
	@Column(name="tur_data_registro", nullable=false, updatable=false)
	private LocalDate dataRegistro = LocalDate.now(); // tur_data_registro date NOT NULL DEFAULT CURRENT_DATE
	
	@Column(name="tur_data_inicio", nullable=false)
	private LocalDate dataInicio; // tur_data_inicio date NOT NULL
	
	@Column(name="tur_hora_inicio", nullable=false)
	private LocalTime horaInicio; // tur_hora_inicio time NOT NULL
	
	@Column(name="tur_hora_termino", nullable=false)
	private LocalTime horaTermino; // tur_hora_termino time NOT NULL
	
	@Column(name="tur_data_termino", nullable=false)
	private LocalDate dataTermino; // tur_data_termino date NULL
	
	@Column(name="tur_valor_mensalidade", nullable=false)
	private BigDecimal valorMensalidade;// tur_valor_mensalidade numeric(7,2) NOT NULL
	
	
}
