--COMANDOS DML -- LINGUAGEM DE MANIPULACAO DE DADOS
--COMANDOS : INSERT/UPDATE/DELETE (CRUD)
--PRECISO DAR COMMIT!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--POPULAR (INSERIR DADOS) NA TABELA DEPARTAMWNRO
INSERT INTO T_SIP_DEPARTAMENTO  (CD_DEPTO,NM_DEPTO,SG_DEPTO) VALUES(1,'FINANCEIRO','FIN');--precisam ser inseridos na mesma ordem q eu coloquei no primeiro ()
--mas nao precisa estar na mesma ordem que eu criei a t_sip_departamento
INSERT INTO T_SIP_DEPARTAMENTO  VALUES(3,'MARKETING','MKT');  --dessa forma eu ja preciso mandar na ordem exata que eu criei a tabela 

--entrar na tabela t_sip_departamento na opcao data,lá é mostrado essas informações que foram inseridas
--segunda forma de visualizar os dados da tabela:
SELECT * FROM T_SIP_DEPARTAMENTO;
--(*) SIGNIFICA TODAS AS COLUNAS


--UPDATE - ATUALIZA UMA OU MAIS COLUNAS DA TABELA,
--AFETANDO UMA OU MAIS LINHAS  , FAZER UPDATE COM WHERE,PELO AMOR DE DEUS!!!!!!
UPDATE T_SIP_DEPARTAMENTO 
    SET NM_DEPTO = 'FINANCEIRO TESTE',
    SG_DEPTO = 'FTE'
WHERE CD_DEPTO = 1;
--No departamento que tiver o codigo um,o nome e a sigla do mesmo serão alterados
COMMIT;
--Commit vai tirar da memoria e jogar pro disco,se eu nao der commit nao vai ser retirado da memoria por disco


----AULA 24/08
--Insert com valores decimais 
INSERT INTO T_SIP_FUNCIONARIO  VALUES(12345,1,'JOÃO DA SILVA',TO_DATE('15/08/1987','DD/MM/YYYY'),TO_DATE('10/09/2018','DD/MM/YYYY'),'RUA X,25',3879.51);
--CHAVE ESTRANGEIRA: o cd_depto já foi cadastrado,entao eu devo utilizar um cd que ja tenha sido criado,ou irá dar problema
INSERT INTO T_SIP_FUNCIONARIO  VALUES(45781,1,'BRUNO MENDES',TO_DATE('15/08/1980','DD/MM/YYYY'),TO_DATE('05/06/2011','DD/MM/YYYY'),'RUA Y,245',5412.78);
SELECT * FROM T_SIP_FUNCIONARIO;
COMMIT;


--Campos com valores opcionais 
-- 2 formas para resolver esse problema:
--Metodo IMPLICITO : a coluna opcional é omitida na declaração do comando
INSERT INTO T_SIP_PROJETO (CD_PROJETO,NM_PROJETO,DT_INICIO) VALUES(1001,'PROJETO DEF',TO_DATE('12/07/2019','DD/MM/YYYY'));
SELECT * FROM T_SIP_PROJETO;

--Método EXPLICITO : a coluna opcional é informada na declaração do comando
--esse é o que deve ser utilizado no java,pq se eu usar o implicito,vou ter que fazer um if,else pra preencher o campo que tá faltando
INSERT INTO T_SIP_PROJETO VALUES (9654,'PROJETO WEB',TO_DATE('12/11/2015','DD/MM/YYYY'),NULL);
SELECT * FROM T_SIP_PROJETO;

INSERT INTO T_SIP_PROJETO VALUES (9674,'PROJETO JAVA',TO_DATE('17/02/2014','DD/MM/YYYY'),TO_DATE('25/01/2018','DD/MM/YYYY'));



--COPIANDO DE UMA TABELA PARA OUTRA TABELA IGUAL 
--PARTE 1 )
--A diferença dessa pra outra é que aqui os campos são nao nulos,ou sej,só serão inseridos os projetos que ja tenham sido finalizados
--Será uma tabela basicamente com os projetos já finalizados
--CREATE TABLE T_SIP_COPY_PROJETO_FIN
--(
--    CD_PROJETO  NUMBER(5)    NOT NULL,
--    NM_PROJETO  VARCHAR2(40) NOT NULL,
--    DT_INICIO   DATE         NOT NULL,
--    DT_TERMINO  DATE         NOT NULL
--);

--    ALTER TABLE T_SIP_COPY_PROJETO_FIN
--ADD CONSTRAINT PK_SIP_COPY_PROJETO_FIN
--PRIMARY KEY(CD_PROJETO);
DELETE FROM T_SIP_COPY_PROJETO_FIN;
--PARTE 2)
--Realizando a copia de dados de uma tabela para a outra
--Procurando apenas os projetos que estão finalizados
SELECT * FROM T_SIP_PROJETO WHERE DT_TERMINO IS NOT NULL ;
--is not null = diferente de null 
--se eu quiser puxar os projetos que NAO estão finalizados: SELECT * FROM T_SIP_PROJETO WHERE DT_TERMINO IS  NULL ;
--PARTE 3) 
--REALIZANDO A COPIA 
INSERT INTO T_SIP_COPY_PROJETO_FIN 
    (SELECT * FROM T_SIP_PROJETO WHERE DT_TERMINO IS NOT NULL);
--vendo a tabela atualizada
SELECT * FROM T_SIP_COPY_PROJETO_FIN;





--ALTERANDO INFORMAÇÕES EM UMA TABELA JÁ EXISTENTE 
UPDATE T_SIP_FUNCIONARIO 
    SET NM_FUNCIONARIO = 'MARIA DOS SANTOS',
        DT_NASCIMENTO = TO_DATE('12/08/1999' , 'DD/MM/YYYY')
    WHERE NR_MATRICULA = 12345;
    --SEMPRE NO WHERE USAR A CHAVE PRIMARIA,JÁ QUE ELA É UNICA É POSSIVEL ENCONTRAR O CAMPO A SER ALTERADO MAIS RAPIDO!

UPDATE T_SIP_FUNCIONARIO 
    SET VL_SALARIO = 2345.65
    WHERE NR_MATRICULA = 45781;
    --SEMPRE NO WHERE USAR A CHAVE PRIMARIA,JÁ QUE ELA É UNICA É POSSIVEL ENCONTRAR O CAMPO A SER ALTERADO MAIS RAPIDO!
    
    
--ALTERANDO INFORMAÇÕES EM UMA TABELA SEM USAR O WHERE
UPDATE T_SIP_FUNCIONARIO
    SET VL_SALARIO = VL_SALARIO + 200.45;
--Aqui será um aumento de 200 reais no salario de todos os funcionários


INSERT INTO T_SIP_FUNCIONARIO  VALUES(12345,1,'JOÃO DA SILVA',TO_DATE('10/05/1985','DD/MM/YYYY'),TO_DATE('15/09/2012','DD/MM/YYYY'),'RUA X,49',5684.66);


    