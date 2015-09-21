DROP TABLE alunos;


CREATE TABLE pes_pessoa (
	  pes_id PRIMARY KEY
	, pes_nome NOT NULL
	, pes_data_nascimento NOT NULL
	, pes_sexo NOT NULL
	, pes_data_registro NOT NULL
	, pes_cpf 
	, pes_rg
);


CREATE TABLE usu_usuario (
	  usu_id SERIAL PRIMARY KEY
	, usu_email NOT NULL
	, usu_senha NOT NULL
	, usu_pes_id  REFERENCES pes_pessoa (pes_id) ON DELETE CASCADE
);

CREATE TABLE per_perfil (
	  per_id SERIAL PRIMARY KEY
	, per_nome NOT NULL	-- administrador, aluno, funcionario, 
);

CREATE TABLE pfu_perfil_usuario (
	  pfu_id SERIAL PRIMARY KEY
	, pfu_per_id  REFERENCES per_perfil (per_id) ON DELETE CASCADE
	, pfu_usu_id  REFERENCES usu_usuario (usu_id) ON DELETE CASCADE
);


CREATE TABLE alu_aluno (
	  alu_id PRIMARY KEY
	, alu_pes_id  REFERENCES pes_pessoa (pes_id) ON DELETE CASCADE
);

CREATE TABLE eml_email (
	  eml_id PRIMARY KEY
	, eml_pes_id  REFERENCES pes_pessoa (pes_id) ON DELETE CASCADE
	, eml_email NOT NULL
);

CREATE TABLE tel_telefone (
	  tel_id PRIMARY KEY
	, tel_pes_id  REFERENCES pes_pessoa (pes_id) ON DELETE CASCADE
	, tel_rotulo NOT NULL
	, tel_telefone NOT NULL
);

CREATE TABLE uf_uf (
	  uf_id PRIMARY KEY
	, uf_nome NOT NULL
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





