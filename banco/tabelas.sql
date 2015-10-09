


DROP TABLE app3f.pes_pessoa;
DROP SEQUENCE app3f.sq_pes_id;

DROP TABLE app3f.usu_usuario;
DROP SEQUENCE app3f.sq_usu_id;

DROP TABLE app3f.per_perfil;
DROP SEQUENCE app3f.sq_per_id;

DROP TABLE app3f.pfu_perfil_usuario;
DROP SEQUENCE app3f.sq_pfu_id;

DROP TABLE app3f.alunos;
DROP SEQUENCE app3f.sq_alu_id;

DROP TABLE app3f.eml_email_pessoa;
DROP SEQUENCE app3f.sq_eml_id;

DROP TABLE app3f.tel_telefone_pessoa;
DROP SEQUENCE app3f.sq_tel_id;

DROP TABLE app3f.uf_uf;
DROP SEQUENCE app3f.sq_uf_id;

DROP TABLE app3f.end_endereco;
DROP SEQUENCE app3f.sq_end_id;

DROP TABLE app3f.mod_modalidade;
DROP SEQUENCE app3f.sq_mod_id;

DROP TABLE app3f.pro_professor;
DROP SEQUENCE app3f.sq_pro_id;

DROP TABLE app3f.tur_turma;
DROP SEQUENCE app3f.sq_tur_id;

DROP TABLE app3f.dia_dia;
DROP SEQUENCE app3f.sq_dia_id;

DROP TABLE app3f.tdi_turma_dia;
DROP SEQUENCE app3f.sq_tdi_id;

DROP TABLE app3f.tal_turma_aluno;
DROP SEQUENCE app3f.sq_tal_id;

DROP TABLE app3f.con_convenio;
DROP SEQUENCE app3f.sq_con_id;

DROP TABLE app3f.coa_convenio_aluno;
DROP SEQUENCE app3f.sq_coa_id;

DROP TABLE app3f.pag_pagamento;
DROP SEQUENCE app3f.sq_pag_id;



CREATE TABLE app3f.pes_pessoa (
	  pes_id integer NOT NULL
	, pes_nome character varying(100) NOT NULL
	, pes_data_nascimento date NOT NULL
	, pes_sexo character(1) NOT NULL
	, pes_data_registro date NOT NULL DEFAULT CURRENT_DATE
	, pes_cpf character varying(11) NULL
	, pes_rg character varying(12) NULL
);
ALTER TABLE app3f.pes_pessoa
	  ADD CONSTRAINT pk_pes_id PRIMARY KEY (pes_id)
	, ADD CONSTRAINT ck_pes_sexo_valido CHECK (pes_sexo = 'M' OR pes_sexo = 'F')
	, ADD CONSTRAINT un_cpf_repetido_em_outra_pessoa UNIQUE (pes_cpf)
;
CREATE SEQUENCE app3f.sq_pes_id;



CREATE TABLE app3f.usu_usuario (
	  usu_id integer NOT NULL
	, usu_email character varying(200) NOT NULL
	, usu_senha character varying NOT NULL
	, usu_pes_id integer NOT NULL
);
ALTER TABLE app3f.usu_usuario
	  ADD CONSTRAINT pk_usu_id PRIMARY KEY (usu_id)
	, ADD CONSTRAINT fk_usu_pes_id FOREIGN KEY (usu_pes_id) REFERENCES app3f.pes_pessoa (pes_id) ON DELETE CASCADE
	, ADD CONSTRAINT un_pessoa_ja_eh_usuario UNIQUE (usu_pes_id)
;
CREATE UNIQUE INDEX un_email_usuario_repetido ON app3f.usu_usuario (lower(usu_email));
CREATE SEQUENCE app3f.sq_usu_id;



CREATE TABLE app3f.per_perfil (
	  per_id integer NOT NULL
	, per_nome character varying(50) NOT NULL	-- administrador, aluno, funcionario, 
);
ALTER TABLE app3f.per_perfil
	  ADD CONSTRAINT pk_per_id PRIMARY KEY (per_id)
;
CREATE UNIQUE INDEX un_perfil_repetido ON app3f.per_perfil (lower(per_nome));
CREATE SEQUENCE app3f.sq_per_id;



CREATE TABLE app3f.pfu_perfil_usuario (
	  pfu_id integer NOT NULL
	, pfu_per_id integer NOT NULL
	, pfu_usu_id integer NOT NULL
);
ALTER TABLE app3f.pfu_perfil_usuario
	  ADD CONSTRAINT pk_pfu_id PRIMARY KEY (pfu_id)
	, ADD CONSTRAINT fk_pfu_per_id FOREIGN KEY (pfu_per_id) REFERENCES app3f.per_perfil (per_id) ON DELETE CASCADE
	, ADD CONSTRAINT fk_pfu_usu_id FOREIGN KEY (pfu_usu_id) REFERENCES app3f.usu_usuario (usu_id) ON DELETE CASCADE
	, ADD CONSTRAINT un_perfil_repetido_no_usuario UNIQUE (pfu_per_id, pfu_usu_id)
;
CREATE SEQUENCE app3f.sq_pfu_id;



CREATE TABLE app3f.alu_aluno (
	  alu_id integer NOT NULL
	, alu_pes_id integer NOT NULL
);
ALTER TABLE app3f.alu_aluno
	  ADD CONSTRAINT pk_alu_id PRIMARY KEY (alu_id)
	, ADD CONSTRAINT fk_alu_pes_id FOREIGN KEY (alu_pes_id) REFERENCES app3f.pes_pessoa (pes_id) ON DELETE CASCADE
	, ADD CONSTRAINT un_pessoa_ja_eh_aluno UNIQUE (alu_pes_id)
;
CREATE SEQUENCE app3f.sq_alu_id;



CREATE TABLE app3f.eml_email_pessoa (
	  eml_id integer NOT NULL
	, eml_pes_id integer NOT NULL
	, eml_email character varying NOT NULL
);
ALTER TABLE app3f.eml_email_pessoa
	  ADD CONSTRAINT pk_eml_id PRIMARY KEY (eml_id)
	, ADD CONSTRAINT fk_eml_pes_id FOREIGN KEY (eml_pes_id) REFERENCES app3f.pes_pessoa (pes_id) ON DELETE CASCADE
;
CREATE UNIQUE INDEX un_email_pessoa_repetido ON app3f.eml_email_pessoa (eml_pes_id, lower(eml_email));
CREATE SEQUENCE app3f.sq_eml_id;



CREATE TABLE app3f.tel_telefone_pessoa (
	  tel_id integer NOT NULL
	, tel_pes_id integer NOT NULL  
	, tel_rotulo character varying(30) NOT NULL
	, tel_telefone character varying(15) NOT NULL
);
ALTER TABLE app3f.tel_telefone_pessoa
	  ADD CONSTRAINT pk_tel_id PRIMARY KEY (tel_id)
	, ADD CONSTRAINT fk_tel_pes_id FOREIGN KEY (tel_pes_id) REFERENCES app3f.pes_pessoa (pes_id) ON DELETE CASCADE
;
CREATE SEQUENCE app3f.sq_tel_id;



CREATE TABLE app3f.uf_uf (
	  uf_id integer NOT NULL
	, uf_sigla character(2) NOT NULL  
	, uf_nome character varying(2) NOT NULL
);
ALTER TABLE app3f.uf_uf
	  ADD CONSTRAINT pk_uf_id PRIMARY KEY (uf_id)
;
CREATE UNIQUE INDEX un_sigla_uf_repetida ON app3f.uf_uf (lower(uf_sigla));



CREATE TABLE app3f.end_endereco (
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
ALTER TABLE app3f.end_endereco
	  ADD CONSTRAINT pk_end_id PRIMARY KEY (end_id)
	, ADD CONSTRAINT fk_end_pes_id FOREIGN KEY (end_pes_id) REFERENCES app3f.pes_pessoa (pes_id) ON DELETE CASCADE 
	, ADD CONSTRAINT fk_end_if_id FOREIGN KEY (end_uf_id) REFERENCES app3f.uf_uf (uf_id) 
;
CREATE SEQUENCE app3f.sq_end_id;



CREATE TABLE app3f.mod_modalidade (
	  mod_id integer NOT NULL
	, mod_nome character varying(8) NOT NULL -- taekwondo, pilates
);
ALTER TABLE app3f.mod_modalidade
	  ADD CONSTRAINT pk_mod_id PRIMARY KEY (mod_id)
;
CREATE UNIQUE INDEX un_modalidade_repetida ON app3f.mod_modalidade (lower(mod_nome));
CREATE SEQUENCE app3f.sq_mod_id;



CREATE TABLE app3f.pro_professor (
	  pro_id integer NOT NULL
	, pro_pes_id integer NOT NULL REFERENCES app3f.pes_pessoa (pes_id) ON DELETE CASCADE
);
ALTER TABLE app3f.pro_professor
	  ADD CONSTRAINT pk_pro_id PRIMARY KEY (pro_id)
	, ADD CONSTRAINT fk_pro_pes_id FOREIGN KEY (pro_pes_id) REFERENCES app3f.pes_pessoa (pes_id) ON DELETE CASCADE 
	, ADD CONSTRAINT un_pessoa_ja_eh_professor UNIQUE (pro_pes_id)
;
CREATE SEQUENCE app3f.sq_pro_id;



CREATE TABLE app3f.tur_turma (
	  tur_id integer NOT NULL
	, tur_mod_id integer NOT NULL 
	, tur_pro_id integer NOT NULL 
	, tur_data_registro date NOT NULL DEFAULT CURRENT_DATE
	, tur_data_inicio date NOT NULL
	, tur_hora_inicio time NOT NULL
	, tur_hora_termino time NOT NULL
	, tur_data_termino date NULL
	, tur_valor_mensalidade numeric(7,2) NOT NULL
);
ALTER TABLE app3f.tur_turma
	  ADD CONSTRAINT pk_tur_id PRIMARY KEY (tur_id)
	, ADD CONSTRAINT fk_tur_mod_id FOREIGN KEY (tur_mod_id) REFERENCES app3f.mod_modalidade (mod_id) 
	, ADD CONSTRAINT fk_tur_pro_id FOREIGN KEY (tur_pro_id) REFERENCES app3f.pro_professor (pro_id) 
	, ADD CONSTRAINT ck_hora_inicio_menor_que_hora_termino CHECK (tur_hora_inicio < tur_hora_termino)
;
CREATE SEQUENCE app3f.sq_tur_id;



CREATE TABLE app3f.dia_dia (
	  dia_id integer NOT NULL
	, dia_nome character varying(7) NOT NULL -- 1-domingo a 7-sábado
);
ALTER TABLE app3f.dia_dia
	  ADD CONSTRAINT pk_dia_id PRIMARY KEY (dia_id)
;
CREATE UNIQUE INDEX un_dia_repetido ON app3f.dia_dia (lower(dia_nome));



CREATE TABLE app3f.tdi_turma_dia (
	  tdi_id integer NOT NULL
	, tdi_tur_id integer NOT NULL
	, tdi_dia_id integer NOT NULL
);
ALTER TABLE app3f.tdi_turma_dia
	  ADD CONSTRAINT pk_tdi_id PRIMARY KEY (tdi_id) 
	, ADD CONSTRAINT fk_tdi_tur_id FOREIGN KEY (tdi_tur_id) REFERENCES app3f.tur_turma (tur_id) ON DELETE CASCADE
	, ADD CONSTRAINT fk_tdi_dia_id FOREIGN KEY (tdi_dia_id) REFERENCES app3f.dia_dia (dia_id) ON DELETE CASCADE
	, ADD CONSTRAINT un_dia_turma_repetido UNIQUE (tdi_tur_id, tdi_dia_id)
;
CREATE SEQUENCE app3f.sq_tdi_id;



CREATE TABLE app3f.tal_turma_aluno (
	  tal_id integer NOT NULL
	, tal_tur_id integer NOT NULL REFERENCES app3f.tur_turma (tur_id) ON DELETE CASCADE
	, tal_alu_id integer NOT NULL  REFERENCES app3f.alu_aluno (alu_id) ON DELETE CASCADE
	, tal_data_registro date NOT NULL DEFAULT CURRENT_DATE
	, tal_valor_aluno numeric(7,2) NOT NULL
	, tal_dia_vencimento smallint NOT NULL
	, tal_observacao character varying NULL
);
ALTER TABLE app3f.tal_turma_aluno
	  ADD CONSTRAINT pk_tal_id PRIMARY KEY (tal_id)
	, ADD CONSTRAINT fk_tal_tur_id FOREIGN KEY (tal_tur_id) REFERENCES app3f.tur_turma (tur_id)
	, ADD CONSTRAINT fk_tal_alu_id FOREIGN KEY (tal_alu_id) REFERENCES app3f.alu_aluno (alu_id)
	, ADD CONSTRAINT ck_dia_vencimento_valido CHECK (tal_dia_vencimento > 0 AND tal_dia_vencimento < 32)
	, ADD CONSTRAINT un_aluno_repetido_na_turma UNIQUE (tal_tur_id, tal_alu_id)
;
CREATE SEQUENCE app3f.sq_tal_id;



CREATE TABLE app3f.con_convenio (
	  con_id integer NOT NULL
	, con_nome character varying(200) NOT NULL
	, con_desconto numeric(5,2) NOT NULL
);
ALTER TABLE app3f.con_convenio
	  ADD CONSTRAINT pk_con_id PRIMARY KEY (con_id)
	, ADD CONSTRAINT ck_desconto_valido CHECK (con_desconto > -1 AND con_desconto < 101)
;
CREATE UNIQUE INDEX un_convenio_repetido ON app3f.con_convenio (lower(con_nome));
CREATE SEQUENCE app3f.sq_con_id;



CREATE TABLE app3f.coa_convenio_aluno (
	  coa_id integer NOT NULL
	, coa_con_id integer NOT NULL REFERENCES app3f.con_convenio (con_id) ON DELETE CASCADE
	, coa_alu_id integer NOT NULL REFERENCES app3f.alu_aluno (alu_id) ON DELETE CASCADE
);
ALTER TABLE app3f.coa_convenio_aluno
	  ADD CONSTRAINT pk_coa_id PRIMARY KEY (coa_id)
	, ADD CONSTRAINT fk_coa_con_id FOREIGN KEY (coa_con_id) REFERENCES app3f.con_convenio (con_id)
	, ADD CONSTRAINT fk_coa_alu_id FOREIGN KEY (coa_alu_id) REFERENCES app3f.alu_aluno (alu_id)
	, ADD CONSTRAINT un_convenio_aluno_repetido UNIQUE (coa_con_id, coa_alu_id)
;
CREATE SEQUENCE app3f.sq_coa_id;



CREATE TABLE app3f.pag_pagamento (
	  pag_id integer NOT NULL
	, pag_data_registro date NOT NULL DEFAULT CURRENT_DATE
	, pag_tal_id integer NOT NULL
	, pag_data_vencimento date NOT NULL
	, pag_valor_vencimento numeric(7,2) NOT NULL
	, pag_data_pagamento date NULL
	, pag_valor_pago numeric(7,2) NULL
);
ALTER TABLE app3f.pag_pagamento
	  ADD CONSTRAINT pk_pag_id PRIMARY KEY (pag_id)
	, ADD CONSTRAINT fk_pag_tal_id FOREIGN KEY (pag_tal_id) REFERENCES app3f.tal_turma_aluno (tal_id)
;
CREATE SEQUENCE app3f.sq_pag_id;




