


DROP TABLE pes_pessoa;
DROP SEQUENCE sq_pes_id;

DROP TABLE usu_usuario;
DROP SEQUENCE sq_usu_id;

DROP TABLE per_perfil;
DROP SEQUENCE sq_per_id;

DROP TABLE pfu_perfil_usuario;
DROP SEQUENCE sq_pfu_id;

DROP TABLE alunos;
DROP SEQUENCE sq_alu_id;




CREATE TABLE pes_pessoa (
	  pes_id integer NOT NULL
	, pes_nome character varying(100) NOT NULL
	, pes_data_nascimento date NOT NULL
	, pes_sexo character(1) NOT NULL
	, pes_data_registro date NOT NULL DEFAULT CURRENT_DATE
	, pes_cpf character varying(11)
	, pes_rg character varying(12)
);
ALTER TABLE pes_pessoa
	  ADD CONSTRAINT pk_pes_id PRIMARY KEY (pes_id)
	, ADD CONSTRAINT ck_pes_sexo_valido CHECK (pes_sexo = 'M' or pes_sexo = 'F')
	, ADD CONSTRAINT un_pes_cpf UNIQUE (pes_cpf)
;
CREATE SEQUENCE sq_pes_id;





CREATE TABLE usu_usuario (
	  usu_id integer NOT NULL
	, usu_email character varying(200) NOT NULL
	, usu_senha character varying NOT NULL
	, usu_pes_id integer 
);
ALTER TABLE usu_usuario
	  ADD CONSTRAINT pk_usu_id PRIMARY KEY (usu_id)
	, ADD CONSTRAINT un_usu_email UNIQUE (usu_email)
	, ADD CONSTRAINT fk_usu_pes_id FOREIGN KEY (usu_pes_id) REFERENCES pes_pessoa (pes_id) ON DELETE CASCADE
;
CREATE SEQUENCE sq_usu_id;




CREATE TABLE per_perfil (
	  per_id integer NOT NULL PRIMARY KEY DEFAULT nextval('sq_per_id')
	, per_nome character varying(50) NOT NULL	-- administrador, aluno, funcionario, 
);
CREATE SEQUENCE sq_per_id;

CREATE SEQUENCE sq_pfu_id;

CREATE TABLE pfu_perfil_usuario (
	  pfu_id integer NOT NULL PRIMARY KEY DEFAULT nextval('sq_pfu_id')
	, pfu_per_id  REFERENCES per_perfil (per_id) ON DELETE CASCADE
	, pfu_usu_id  REFERENCES usu_usuario (usu_id) ON DELETE CASCADE
);


CREATE TABLE alu_aluno (
	  alu_id SERIAL PRIMARY KEY
	, alu_pes_id  REFERENCES pes_pessoa (pes_id) ON DELETE CASCADE
);

CREATE TABLE eml_email (
	  eml_id SERIAL PRIMARY KEY
	, eml_pes_id  REFERENCES pes_pessoa (pes_id) ON DELETE CASCADE
	, eml_email character varying NOT NULL
);

CREATE TABLE tel_telefone (
	  tel_id SERIAL PRIMARY KEY
	, tel_pes_id  REFERENCES pes_pessoa (pes_id) ON DELETE CASCADE
	, tel_rotulo character varying(30) NOT NULL
	, tel_telefone character varying(15) NOT NULL
);

CREATE TABLE uf_uf (
	  uf_id SERIAL PRIMARY KEY
	, uf_sigla character(2) UNIQUE NOT NULL  
	, uf_nome character varying(2) NOT NULL
);

CREATE TABLE end_endereco (
	  end_id PRIMARY KEY
	, end_pes_id  REFERENCES pes_pessoa (pes_id) ON DELETE CASCADE
	, end_logradouro NOT NULL
	, end_numero NOT NULL
	, end_complemento 
	, end_bairro 
	, end_cidade NOT NULL
	, end_uf_id REFERENCES uf_uf (uf_id)
	, end_cep
);


CREATE TABLE mod_modalidade (
	  mod_id PRIMARY KEY
	, mod_nome NOT NULL -- taekwondo, pilates
);

CREATE TABLE pro_professor ()
	  pro_id PRIMARY KEY
	, pro_pes_id  REFERENCES pes_pessoa (pes_id) ON DELETE CASCADE
;


CREATE TABLE tur_turma (
	  tur_id PRIMARY KEY
	, tur_mod_id REFERENCES mod_modalidade (mod_id)
	, tur_pro_id REFERENCES pro_professor (pro_id)
	, tur_data_registro NOT NULL
	, tur_data_inicio NOT NULL
	, tur_dias NOT NULL
	, tur_hora_inicio NOT NULL
	, tur_hora_termino NOT NULL
	, tur_valor_mensalidade NOT NULL
);

CREATE TABLE con_convenio (
	  con_id PRIMARY KEY
	, con_nome NOT NULL
	, con_desconto
);

CREATE TABLE coa_convenio_aluno (
	  coa_id PRIMARY KEY
	, coa_con_id REFERENCES con_convenio (con_id) ON DELETE CASCADE
	, coa_alu_id REFERENCES alu_aluno (alu_id) ON DELETE CASCADE
);


CREATE TABLE tal_turma_aluno (
	  tal_id PRIMARY KEY
	, tal_tur_id  REFERENCES tur_turma (tur_id) ON DELETE CASCADE
	, tal_alu_id  REFERENCES alu_aluno (alu_id) ON DELETE CASCADE
	, tal_data_registro NOT NULL
	, tal_valor_aluno NOT NULL
	, tal_data_vencimento NOT NULL
	, tal_observacao text
);


-- GRANT SELECT, INSERT, UPDATE, DELETE ON TO app3f;

