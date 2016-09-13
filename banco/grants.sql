
-- GRANTS GERAIS
GRANT USAGE ON SCHEMA app3f to app3f;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA app3f TO app3f;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA app3f TO app3f;


-- GRANTS ESPECÍFICOS - Não precisa executar esses se usar GRANTS GERAIS
GRANT SELECT, INSERT, UPDATE, DELETE ON app3f.pes_pessoa TO app3f;
GRANT USAGE ON SEQUENCE app3f.sq_pes_id TO app3f;

GRANT SELECT, INSERT, UPDATE, DELETE ON app3f.usu_usuario TO app3f;
GRANT USAGE ON SEQUENCE app3f.sq_usu_id TO app3f;

GRANT SELECT, INSERT, UPDATE, DELETE ON app3f.per_perfil TO app3f;
GRANT USAGE ON SEQUENCE app3f. to app3f;

GRANT SELECT, INSERT, UPDATE, DELETE ON app3f.pfu_perfil_usuario TO app3f;


GRANT SELECT, INSERT, UPDATE, DELETE ON app3f.alunos TO app3f;


GRANT SELECT, INSERT, UPDATE, DELETE ON app3f.eml_email_pessoa TO app3f;


GRANT SELECT, INSERT, UPDATE, DELETE ON app3f.tel_telefone_pessoa TO app3f;


GRANT SELECT ON app3f.uf_uf TO app3f;


GRANT SELECT, INSERT, UPDATE, DELETE ON app3f.end_endereco TO app3f;


GRANT SELECT, INSERT, UPDATE, DELETE ON app3f.mod_modalidade TO app3f;


GRANT SELECT, INSERT, UPDATE, DELETE ON app3f.pro_professor TO app3f;


GRANT SELECT, INSERT, UPDATE, DELETE ON app3f.tur_turma TO app3f;


GRANT SELECT ON app3f.dia_dia TO app3f;


GRANT SELECT, INSERT, UPDATE, DELETE ON app3f.tdi_turma_dia TO app3f;


GRANT SELECT, INSERT, UPDATE, DELETE ON app3f.tal_turma_aluno TO app3f;


GRANT SELECT, INSERT, UPDATE, DELETE ON app3f.con_convenio TO app3f;


GRANT SELECT, INSERT, UPDATE, DELETE ON app3f.coa_convenio_aluno TO app3f;


GRANT SELECT, INSERT, UPDATE, DELETE ON app3f.pag_pagamento TO app3f;