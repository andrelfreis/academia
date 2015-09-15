DROP TABLE alunos;

/* ---------------
 * Usuarios
 * ---------------
*/

CREATE TABLE usu_usuario (
	  usu_id SERIAL PRIMARY KEY
	, usu_email -- email
	, usu_senha
	, usu_nome
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

/* ---------------
 * Academia
 * ---------------
*/

CREATE TABLE alu_aluno (
	  alu_id
	, alu_nome
	, alu_data_nascimento
	, alu_sexo
	, alu_data_registro
);

CREATE TABLE ema_email_aluno (
	  ema_id
	, ema_alu_id
	, ema_email
);

CREATE TABLE telefone_aluno (
	  tel_id
	, tel_alu_id
	, tel_rotulo
	, tel_telefone
);

CREATE TABLE uf_uf (
	  uf_id
	, uf_nome
);

CREATE TABLE end_endereco (
	  end_id
	, end_alu_id
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

CREATE TABLE prof_professor ()
	  prof_id
	, prof_nome
;


CREATE TABLE tur_turma (
	  tur_id
	, tur_mod_id
	, tur_prof_id
	, tur_data_registro
	, tur_data_inicio
	, tur_dias
	, tur_hora_inicio
	, tur_hora_termino
);



-- ??
CREATE TABLE mat_matricula (
	  mat_id
	, mat_tur_id
	, mat_alu_id
	, mat_data_inicio
	, mat_data_termino
	, mat_convenio
);


/* ---------------
 * Dúvidas Negócio
 * ---------------
 * Valor da mensalidade: por turma, por modalidade, reajuste? atrasos? multa? evasão?
 * Convênio, descontos?
 * CPF aluno? outros dados?
 * Professor dados?
 * 
 * 
 * 
 *  
*/



