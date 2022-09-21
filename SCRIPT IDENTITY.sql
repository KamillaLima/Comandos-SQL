-- A PARTIR DA VERS�O 12c

--Gerando chaves prim�rias(de codigo ou de id) e j� verificando se elas existem no banco de dados 
DROP TABLE T_TESTE_IDENTITY;

CREATE TABLE T_TESTE_IDENTITY (
  ID_TESTE          NUMBER GENERATED ALWAYS AS IDENTITY,
  DESC_TESTE        VARCHAR2(30)
);

   ALTER TABLE T_TESTE_IDENTITY
ADD CONSTRAINT PK_TESTE_IDENTITY
   PRIMARY KEY (ID_TESTE);

INSERT INTO T_TESTE_IDENTITY (DESC_TESTE) VALUES ('TESTE ID');

SELECT * FROM T_TESTE_IDENTITY;

-- https://oracle-base.com/articles/12c/identity-columns-in-oracle-12cr1
-- https://www.youtube.com/watch?v=RR2wg1gYQQw