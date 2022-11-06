<�� ��������>
-- 1. �μ���� ������� ����ϴ� �뵵�� ��, DNAME_ENAME_VU �� �ۼ��Ͻÿ�
CREATE OR REPLACE VIEW EMPv0
    AS SELECT DNAME, ENAME FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO;
SELECT * FROM EMPv0;

-- 2. ������ ���ӻ������ ����ϴ� �뵵�� ��,  WORKER_MANAGER_VU�� �ۼ��Ͻÿ�
CREATE OR REPLACE VIEW WORKER_MANAGER_VU
    AS SELECT W.ENAME "�λ��", M.ENAME "���" FROM EMP W, EMP M WHERE W.MGR = M.EMPNO;
SELECT * FROM WORKER_MANAGER_VU;

-- 3. �μ��� �޿��հ� ����� ����Ͻÿ�(�μ���ȣ, �޿��հ�, ���). ? ģ������
SELECT DEPTNO, SUM, ROWNUM RANK 
    FROM (SELECT DEPTNO, SUM(SAL) SUM
                FROM EMP GROUP BY DEPTNO ORDER BY SUM DESC);

-- 3-1. �μ��� �޿��հ� ����� 2~3���� �μ���ȣ, �޿��հ�, ����� ����Ͻÿ�.
SELECT DEPTNO, SUM, RANK
  FROM (SELECT DEPTNO, SUM, ROWNUM RANK
          FROM (SELECT DEPTNO, SUM(SAL) SUM 
                FROM EMP GROUP BY DEPTNO ORDER BY SUM desc))
                     WHERE RANK>=2 AND RANK<=3;

-- 4. ������̺��� ���, �����, �Ի����� �Ի����� �ֽſ��� ������ ��� ������ �����Ͻÿ�
SELECT EMPNO, ENAME, HIREDATE FROM EMP ORDER BY HIREDATE DESC;

-- 5. ������̺��� ���, �����, �Ի����� �Ի����� �ֽſ��� ������ ��� 5���� ����Ͻÿ�
SELECT EMPNO, ENAME, HIREDATE
    FROM (SELECT EMPNO, ENAME, HIREDATE FROM EMP ORDER BY HIREDATE DESC)
            WHERE ROWNUM<=5;
-- 6. ��� ���̺��� ���, �����, �Ի����� �ֽź��� ������ ������ 6��°�� ���� ������� 10��° ������� ���
SELECT RN, EMPNO, ENAME, ENAME, HIREDATE
  FROM (SELECT ROWNUM RN, A.*
            FROM (SELECT EMPNO, ENAME, HIREDATE FROM EMP ORDER BY HIREDATE DESC) A)
  WHERE RN>=6 AND RN<=10;
