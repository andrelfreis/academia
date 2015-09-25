


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
	, pes_cpf character varying(11) NULL
	, pes_rg character varying(12) NULL
);
ALTER TABLE pes_pessoa
	  ADD CONSTRAINT pk_pes_id PRIMARY KEY (pes_id)
	, ADD CONSTRAINT ck_pes_sexo_valido CHECK (pes_sexo = 'M' OR pes_sexo = 'F')
	, ADD CONSTRAINT un_cpf_repetido_em_outra_pessoa UNIQUE (pes_cpf)
;
CREATE SEQUENCE sq_pes_id;



CREATE TABLE usu_usuario (
	  usu_id integer NOT NULL
	, usu_email character varying(200) NOT NULL
	, usu_senha character varying NOT NULL
	, usu_pes_id integer NOT NULL
);
ALTER TABLE usu_usuario
	  ADD CONSTRAINT pk_usu_id PRIMARY KEY (usu_id)
	--, ADD CONSTRAINT un_usu_email UNIQUE (usu_email)
	, ADD CONSTRAINT fk_usu_pes_id FOREIGN KEY (usu_pes_id) REFERENCES pes_pessoa (pes_id) ON DELETE CASCADE
	, ADD CONSTRAINT un_pessoa_ja_eh_usuario UNIQUE (usu_pes_id)
;
CREATE UNIQUE INDEX un_email_usuario_repetido ON usu_usuario (lower(usu_email));
CREATE SEQUENCE sq_usu_id;



CREATE TABLE per_perfil (
	  per_id integer NOT NULL
	, per_nome character varying(50) NOT NULL	-- administrador, aluno, funcionario, 
);
ALTER TABLE per_perfil
	  ADD CONSTRAINT pk_per_id PRIMARY KEY (per_id)
	--, ADD CONSTRAINT un_per_nome UNIQUE (per_nome)
;
CREATE UNIQUE INDEX un_perfil_repetido ON per_perfil (lower(per_nome));
CREATE SEQUENCE sq_per_id;



CREATE TABLE pfu_perfil_usuario (
	  pfu_id integer NOT NULL
	, pfu_per_id integer NOT NULL
	, pfu_usu_id integer NOT NULL
);
ALTER TABLE pfu_perfil_usuario
	  ADD CONSTRAINT pk_pfu_id PRIMARY KEY (pfu_id)
	, ADD CONSTRAINT fk_pfu_per_id FOREIGN KEY (pfu_per_id) REFERENCES per_perfil (per_id) ON DELETE CASCADE
	, ADD CONSTRAINT fk_pfu_usu_id FOREIGN KEY (pfu_usu_id) REFERENCES usu_usuario (usu_id) ON DELETE CASCADE
	, ADD CONSTRAINT un_perfil_repetido_no_usuario UNIQUE (pfu_per_id, pfu_usu_id)
;
CREATE SEQUENCE sq_pfu_id;



CREATE TABLE alu_aluno (
	  alu_id integer NOT NULL
	, alu_pes_id integer NOT NULL
);
ALTER TABLE alu_aluno
	  ADD CONSTRAINT pk_alu_id PRIMARY KEY (alu_id)
	, ADD CONSTRAINT fk_alu_pes_id FOREIGN KEY (alu_pes_id) REFERENCES pes_pessoa (pes_id) ON DELETE CASCADE
	, ADD CONSTRAINT un_pessoa_ja_eh_aluno UNIQUE (alu_pes_id)
;
CREATE SEQUENCE sq_alu_id;



CREATE TABLE eml_email_pessoa (
	  eml_id integer NOT NULL
	, eml_pes_id integer NOT NULL
	, eml_email character varying NOT NULL
);
ALTER TABLE eml_email_pessoa
	  ADD CONSTRAINT pk_eml_id PRIMARY KEY (eml_id)
	, ADD CONSTRAINT fk_eml_pes_id FOREIGN KEY (eml_pes_id) REFERENCES pes_pessoa (pes_id) ON DELETE CASCADE
	--, ADD CONSTRAINT un_email_repetido_nesta_pessoa UNIQUE (eml_pes_id, eml_email)
;
CREATE UNIQUE INDEX un_email_pessoa_repetido ON eml_email_pessoa (eml_pes_id, lower(usu_email));
CREATE SEQUENCE sq_eml_id;



CREATE TABLE tel_telefone_pessoa (
	  tel_id integer NOT NULL
	, tel_pes_id integer NOT NULL  
	, tel_rotulo character varying(30) NOT NULL
	, tel_telefone character varying(15) NOT NULL
);
ALTER TABLE tel_telefone_pessoa
	  ADD CONSTRAINT pk_tel_id PRIMARY KEY (tel_id)
	  ADD CONSTRAINT fk_tel_pes_id FOREIGN KEY (tel_pes_id) REFERENCES pes_pessoa (pes_id) ON DELETE CASCADE
;
CREATE SEQUENCE sq_tel_id;



CREATE TABLE uf_uf (
	  uf_id integer NOT NULL
	, uf_sigla character(2) NOT NULL  
	, uf_nome character varying(2) NOT NULL
);
ALTER TABLE uf_uf
	  ADD CONSTRAINT pk_uf_id PRIMARY KEY (uf_id)
	--, ADD CONSTRAINT un_sigla_uf_repetida UNIQUE (uf_sigla)
	--, ADD CONSTRAINT un_nome_uf_repetido UNIQUE (uf_nome)
;
CREATE UNIQUE INDEX un_sigla_uf_repetida ON uf_uf (lower(uf_sigla));
CREATE UNIQUE INDEX un_nome_uf_repetido ON uf_uf (lower(uf_nome));
CREATE SEQUENCE sq_uf_id;



CREATE TABLE end_endereco (
	  end_id integer NOT NULL
	, end_pes_id integer NOT NULL 
	, end_logradouro character varying(200) NOT NULL
	, end_numero character varying(10) NULL
	, end_complemento character varying(10) NULL
	, end_bairro character varying(50) NULL
	, end_cidade character varying(100) NOT NULL
	, end_uf_id integer NOT NULL 
	, end_cep character varying(8) NULL
);
ALTER TABLE end_endereco
	  ADD CONSTRAINT pk_end_id PRIMARY KEY (end_id)
	, ADD CONSTRAINT fk_end_pes_id FOREIGN KEY (end_pes_id) REFERENCES pes_pessoa (pes_id) ON DELETE CASCADE 
	, ADD CONSTRAINT fk_end_if_id FOREIGN KEY (end_uf_id) REFERENCES uf_uf (uf_id) ON DELETE RESTRICT
;
CREATE SEQUENCE sq_end_id;



CREATE TABLE mod_modalidade (
	  mod_id integer NOT NULL
	, mod_nome character varying(8) NOT NULL -- taekwondo, pilates
);
ALTER TABLE mod_modalidade
	  ADD CONSTRAINT pk_mod_id PRIMARY KEY (mod_id)
	--, ADD CONSTRAINT un_modalidade_repetida UNIQUE (mod_nome)
;
CREATE UNIQUE INDEX un_modalidade_repetida ON mod_modalidade (lower(mod_nome));
CREATE SEQUENCE sq_mod_id;



CREATE TABLE pro_professor ()
	  pro_id integer NOT NULL
	, pro_pes_id integer NOT NULL REFERENCES pes_pessoa (pes_id) ON DELETE CASCADE
;
ALTER TABLE pro_professor
	  ADD CONSTRAINT pk_pro_id PRIMARY KEY (pro_id)
	, ADD CONSTRAINT fk_pro_pes_id FOREIGN KEY (pro_pes_id) REFERENCES pes_pessoa (pes_id) ON DELETE CASCADE 
	, ADD CONSTRAINT un_pessoa_ja_eh_professor UNIQUE (pro_pes_id)
;
CREATE SEQUENCE sq_pro_id;



CREATE TABLE tur_turma (
	  tur_id integer NOT NULL
	, tur_mod_id integer NOT NULL REFERENCES mod_modalidade (mod_id)
	, tur_pro_id integer NOT NULL REFERENCES pro_professor (pro_id)
	, tur_data_registro date NOT NULL DEFAULT CURRENT_DATE
	, tur_data_inicio date NOT NULL
	, tur_dias NOT NULL
	, tur_hora_inicio time NOT NULL
	, tur_hora_termino time NOT NULL
	, tur_valor_mensalidade numeric(7,2) NOT NULL
);

CREATE SEQUENCE sq_tur_id;


CREATE TABLE tal_turma_aluno (
	  tal_id PRIMARY KEY
	, tal_tur_id  REFERENCES tur_turma (tur_id) ON DELETE CASCADE
	, tal_alu_id  REFERENCES alu_aluno (alu_id) ON DELETE CASCADE
	, tal_data_registro NOT NULL
	, tal_valor_aluno NOT NULL
	, tal_data_vencimento NOT NULL
	, tal_observacao character varying NULL
);

CREATE SEQUENCE sq_tal_id;


CREATE TABLE con_convenio (
	  con_id PRIMARY KEY
	, con_nome NOT NULL
	, con_desconto
);

CREATE SEQUENCE sq_con_id;



CREATE TABLE coa_convenio_aluno (
	  coa_id PRIMARY KEY
	, coa_con_id REFERENCES con_convenio (con_id) ON DELETE CASCADE
	, coa_alu_id REFERENCES alu_aluno (alu_id) ON DELETE CASCADE
);

CREATE SEQUENCE sq_coa_id;





-- GRANT SELECT, INSERT, UPDATE, DELETE ON TO app3f;

