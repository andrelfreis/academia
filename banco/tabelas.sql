DROP TABLE alunos;


CREATE TABLE pes_pessoa_fisica (
	  pes_id
	, pes_nome
	, pes_data_nascimento
	, pes_sexo
	, pes_data_registro
	, pes_cpf
	, pes_rg
);


CREATE TABLE usu_usuario (
	  usu_id SERIAL PRIMARY KEY
	, usu_email
	, usu_senha
	, usu_pes_id
);

CREATE TABLE per_perfil (
	  per_id SERIAL PRIMARY KEY
	, per_nome	-- administrador, aluno, funcionario, 
);

CREATE TABLE pfu_perfil_usuario (
	  pfu_id SERIAL PRIMARY KEY
	, pfu_per_id  REFERENCES per_perfil (per_id) ON DELETE CASCADE
	, pfu_usu_id  REFERENCES usu_usuario (usu_id) ON DELETE CASCADE
);


CREATE TABLE alu_aluno (
	  alu_id
	, alu_pes_id
);

CREATE TABLE eml_email (
	  eml_id
	, eml_pes_id
	, eml_email
);

CREATE TABLE tel_telefone (
	  tel_id
	, tel_pes_id
	, tel_rotulo
	, tel_telefone
);

CREATE TABLE uf_uf (
	  uf_id
	, uf_nome
);

CREATE TABLE end_endereco (
	  end_id
	, end_pes_id
	, end_logradouro
	, end_numero
	, end_complemento
	, end_bairro
	, end_cidade
	, end_uf_id
	, end_cep
);


CREATE TABLE mod_modalidade (
	  mod_id
	, mod_nome -- taekwondo, pilates
);

CREATE TABLE pro_professor ()
	  pro_id
	, pro_pes_id
;


CREATE TABLE tur_turma (
	  tur_id
	, tur_mod_id
	, tur_pro_id
	, tur_data_registro
	, tur_data_inicio
	, tur_dias
	, tur_hora_inicio
	, tur_hora_termino
	, tur_valor_mensalidade
);

CREATE TABLE con_convenio (
	  con_id
	, con_nome
	, con_desconto
);

CREATE TABLE coa_convenio_aluno (
	  coa_id
	, coa_con_id
	, coa_alu_id
);


CREATE TABLE tal_turma_aluno (
	  tal_id
	, tal_tur_id
	, tal_alu_id
	, tal_data_registro
	, tal_valor_aluno
	, tal_data_vencimento
	, tal_observacao
);





