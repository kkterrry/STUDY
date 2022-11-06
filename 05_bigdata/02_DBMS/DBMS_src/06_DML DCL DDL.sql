----------------------------------��������---------------------------------------

CREATE TABLE MY_DATA (
    ID NUMBER(4) PRIMARY KEY,
    NAME VARCHAR2(10),
    USEDID  VARCHAR2(30),
    SALARY NUMBER(10,2)
);

INSERT INTO MY_DATA VALUES (1,'SCOTT','SSCOTT',10000);
INSERT INTO MY_DATA VALUES (2, 'FORD', 'FFORD',13000);
INSERT INTO MY_DATA VALUES (3, 'PATEL', 'PPATEL',33000);
INSERT INTO MY_DATA VALUES (4, 'REPORT', 'RREPORT', 23500);
INSERT INTO MY_DATA VALUES (5, 'GOOD', 'GGOOD', 44450);

SELECT ID, NAME, USEDID, TO_CHAR(SALARY,'99,999.00') SALARY
    FROM MY_DATA;

UPDATE MY_DATA SET SALARY = 65000 WHERE ID=3;

DELETE FROM MY_DATA WHERE NAME ='FORD';

UPDATE MY_DATA SET SALARY = 15000 WHERE SALARY<=15000;

DROP TABLE MY_DATA;

---------------------------������  ���� ����� �� ������ �� �������� ������ ���� ------------------------
-- �� �� DCL(����� ��������, ����ڱ��Ѻο�, ���ѹ�Ż, ����ڰ�������)
CREATE USER joeun IDENTIFIED BY tiger; -- joeun ���� ����
-- ���� �ο�(���Ǳ���, scott.emp, scott.dept�� ���� ��� ����)
GRANT CREATE SESSION TO joeun;
GRANT ALL ON EMP TO joeun; -- �������� emp���̺� ���� ��� ���� �ο�
GRANT SELECT ON DEPT TO joeun; -- �������� dept���̺� ���� selete ���� �ο�
SHOW USER;
-- ���ѹ�Ż(���ѹ�Ż�� ID�� �������� ��)
REVOKE ALL ON EMP FROM joeun; -- �������� emp ���̺� ���� ��� ���� ��Ż
REVOKE ALL ON DEPT FROM joeun;
-- ����� ���� ����(���� �� �������� �Ұ�)
DROP USER joeun CASCADE;

SHOW USER;
SELECT * FROM USER_TABLES; -- �� ������ ������ ���̺�
SELECT * FROM ALL_TABLES WHERE TABLE_NAME IN ('DEPT', 'EMP'); -- �� ������ ���ٰ����� ���̺�
SELECT * FROM DBA_TABLES; -- �Ϲݰ��������� �Ұ�
SELECT ENAME, DNAME, LOC 
  FROM SCOTT.EMP E, SCOTT.DEPT D
  WHERE E.DEPTNO=D.DEPTNO;
SELECT * FROM SCOTT.EMP;
EXIT; -- ��������








