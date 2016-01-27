
DELETE FROM app3f.pes_pessoa;
DELETE FROM app3f.mod_modalidade;


/* CREATE TABLE app3f.pes_pessoa (
	  pes_id integer NOT NULL
	, pes_nome character varying(100) NOT NULL
	, pes_data_nascimento date NOT NULL
	, pes_sexo character(1) NOT NULL
	, pes_data_registro date NOT NULL DEFAULT CURRENT_DATE
	, pes_cpf character varying(11) NULL
	, pes_rg character varying(12) NULL
*/

INSERT INTO app3f.pes_pessoa
  (pes_id, pes_nome, pes_data_nascimento, pes_sexo, pes_data_registro, pes_cpf, pes_rg)
VALUES 
  (1, 'André Luis Fernandes Reis', '18-Feb-1979', 'M', DEFAULT, '27368008858', '305911259')
, (2, 'Fabiana Gonçalves de Matos Reis', '06-Apr-1977', 'F', DEFAULT, '27537272875', '286007174')
, (3, 'Alessandro Souza Fernandes', '02-Sep-1976', 'M', DEFAULT, '25600276826', '123456789')
;

/* CREATE TABLE app3f.alu_aluno (
	  alu_id integer NOT NULL
	, alu_pes_id integer NOT NULL
*/
INSERT INTO app3f.alu_aluno
  (alu_id, alu_pes_id)
VALUES
  (1, 1)
, (2, 2)
;


/* CREATE TABLE app3f.pro_professor (
	  pro_id integer NOT NULL
	, pro_pes_id integer NOT NULL REFERENCES app3f.pes_pessoa (pes_id) ON DELETE CASCADE
*/
INSERT INTO app3f.pro_professor
  (pro_id, pro_pes_id)
VALUES
  (1, 3)
;
	

/* CREATE TABLE app3f.mod_modalidade (
	  mod_id integer NOT NULL
	, mod_nome character varying(20) NOT NULL -- taekwondo, pilates
*/

INSERT INTO app3f.mod_modalidade
  (mod_id, mod_nome)
VALUES
  (1, 'Taekwondo')
, (2, 'Pilates')
, (3, 'Aikido')
;







