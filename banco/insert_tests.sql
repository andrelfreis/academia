
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
  (nextval('sq_pes_id'), 'André Luis Fernandes Reis', '18-Feb-1979', 'M', DEFAULT, '27368008858', '305911259')
, (nextval('sq_pes_id'), 'Fabiana Gonçalves de Matos Reis', '06-Apr-1977', 'F', DEFAULT, '27537272875', '286007174')
;



