-- �� �� ��������
--1. ������̺��� ���� ���� �Ի��� ����� �̸�, �޿�, �Ի���
SELECT ENAME, SAL, HIREDATE FROM EMP 
    WHERE HIREDATE=(SELECT MIN(HIREDATE) FROM EMP);
-- 2. ȸ�翡�� ���� �޿��� ���� ����� �̸�, �޿�
SELECT ENAME, SAL FROM EMP 
    WHERE SAL=(SELECT MIN(SAL) FROM EMP);
-- 3. ȸ�� ��պ��� �޿��� ���� �޴� ����� �̸�, �޿�, �μ��ڵ�
SELECT ENAME, SAL, DEPTNO FROM EMP 
    WHERE SAL>(SELECT AVG(SAL) FROM EMP);
--4. ȸ�� ��� ������ �޿��� �޴� ����� �̸�, �޿�, �μ���
SELECT ENAME, SAL, DNAME FROM EMP E, DEPT D 
    WHERE E.DEPTNO=D.DEPTNO AND SAL<=(SELECT AVG(SAL) FROM EMP);
--5. SCOTT���� ���� �Ի��� ����� �̸�, �޿�, �Ի���, �޿� ���
SELECT ENAME, SAL, HIREDATE, GRADE 
    FROM EMP, SALGRADE 
    WHERE SAL BETWEEN LOSAL AND HISAL
      AND HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME='SCOTT');
--6. 5��(SCOTT���� ���� �Ի��� ����� �̸�, �޿�, �Ի���, �޿� ���)�� �μ��� �߰��ϰ� 
    --�޿��� ū �� ����
SELECT ENAME, SAL, HIREDATE, GRADE, DNAME 
    FROM EMP E, SALGRADE, DEPT D 
    WHERE SAL BETWEEN LOSAL AND HISAL AND 
        D.DEPTNO=E.DEPTNO AND 
        HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME='SCOTT')  
    ORDER BY SAL DESC;
--7. BLAKE ���� �޿��� ���� ������� ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL FROM EMP 
    WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME='BLAKE');
--8. MILLER���� �ʰ� �Ի��� ����� ���, �̸�, �Ի���
SELECT EMPNO, ENAME, HIREDATE FROM EMP 
    WHERE HIREDATE > (SELECT HIREDATE FROM EMP 
                        WHERE ENAME='MILLER');
--9. �����ü ��� �޿����� �޿��� ���� ������� ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL FROM EMP 
    WHERE SAL > (SELECT AVG(SAL) FROM EMP);
--10. CLARK�� ���� �μ���ȣ�̸�, ����� 7698�� ������ �޿����� ���� �޿��� �޴� �����
        -- ���, �̸�, �޿�
SELECT DEPTNO FROM EMP WHERE ENAME='CLARK'; -- ��������(CLARK�� �μ���ȣ)
SELECT SAL FROM EMP WHERE EMPNO=7698;  -- ��������(7698��� ������ �޿�)
SELECT EMPNO, ENAME, SAL FROM EMP 
    WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='CLARK') 
    AND SAL > (SELECT SAL FROM EMP WHERE EMPNO=7698);
--11.  �����ȭ. CLARK�� ���� �μ����̸�, ����� 7698�� ������ �޿����� ���� �޿��� 
    -- �޴� ������� ���, �̸�, �޿�
SELECT DNAME FROM EMP E, DEPT D 
    WHERE E.DEPTNO=D.DEPTNO AND ENAME='CLARK';-- ��������1
SELECT SAL FROM EMP WHERE EMPNO=7698; -- ��������2
SELECT EMPNO, ENAME, SAL FROM EMP E, DEPT D 
    WHERE E.DEPTNO=D.DEPTNO AND 
        DNAME=(SELECT DNAME FROM EMP E, DEPT D 
            WHERE E.DEPTNO=D.DEPTNO AND ENAME='CLARK') 
        AND SAL > (SELECT SAL FROM EMP WHERE EMPNO=7698);
--12. BLAKE�� ���� �μ��� �ִ� ��� ����� �̸��� �Ի�����
SELECT ENAME, HIREDATE FROM EMP 
    WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='BLAKE');
--13. ��� �޿� �̻��� �޴� ��� �������� ���ؼ� �����ȣ�� �̸� �� �޿��� ���� ������ ���)
SELECT EMPNO, ENAME FROM EMP 
    WHERE SAL>=(SELECT AVG(SAL) FROM EMP) 
    ORDER BY SAL DESC;

-- �� 3. ������ �������� ; IN, ALL, ANY=SOME, EXISTS
--(1) IN ; �������� ��� �� �ϳ��� ��ġ�ϸ� ��
-- �μ����� �Ի����� ���� ���� �����  �̸�, �Ի���, �μ���ȣ
SELECT DEPTNO, MAX(HIREDATE) FROM EMP GROUP BY DEPTNO; -- ������ ��������
SELECT ENAME, HIREDATE, DEPTNO FROM EMP
  WHERE (DEPTNO,HIREDATE) IN (SELECT DEPTNO, MAX(HIREDATE) FROM EMP GROUP BY DEPTNO);
-- �޿��� 3000�̻� �޴� ����� �Ҽӵ� �μ����� �ٹ��ϴ� ����� ��� �ʵ�
SELECT DEPTNO FROM EMP WHERE SAL>=3000; -- ��������
SELECT * FROM EMP
  WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE SAL>=3000);
--(2)ALL ; �������� ����� ��� �����ϸ� ��
SELECT SAL FROM EMP WHERE DEPTNO=30;
-- 30�� �μ� �޿��� ��κ��� ū ��� = 30�� �μ� �ִ� �޿����� ū ���
SELECT * FROM EMP
  WHERE SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO=30); -- ������ ��������
  
SELECT * FROM EMP
  WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30); -- ������ ��������
--(3)ANY=SOME ; �������� ��� �ϳ��� �����ϸ� ��
-- 30�� �μ� �޿��� �ϳ����̶� ū ��� = 30�� �μ� �ּ� �޿����� ū ���
SELECT * FROM EMP
  WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO=30); -- ������ �������� 
SELECT * FROM EMP
  WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DETPTNO=30); -- ������ ��������
--(4)EXISTS ; ���������� �����ϸ� ��
-- ���Ӻ��ϰ� �ִ� �������� ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL
  FROM EMP MANAGER
  WHERE EXISTS (SELECT * FROM EMP WHERE MANAGER.EMPNO=MGR); -- ��������
SELECT DISTINCT M.EMPNO, M.ENAME, M.SAL
  FROM EMP W, EMP M
  WHERE W.MGR=M.EMPNO; -- SELF JOIN
-- ���ܻ���� ��� �ʵ� ���
SELECT * FROM EMP MANAGER
  WHERE NOT EXISTS (SELECT * FROM EMP WHERE MANAGER.EMPNO=MGR); --��������
SELECT M.*
  FROM EMP W, EMP M
  WHERE W.MGR(+)=M.EMPNO AND W.ENAME IS NULL; -- SELF JOIN
-- ex1. ����(job)�� MANAGER�� ����� ���� �μ��� �μ���ȣ�� ������
SELECT DEPTNO FROM EMP WHERE JOB='MANAGER'; -- ��������
SELECT DEPTNO, LOC FROM DEPT
  WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB='MANAGER'); -- ��������
-- ex2. ������ 3000�̻��� ����� �� ������޺� �ְ� ������ �޴� ������� 
        -- ���, �̸�, ����, �Ի���, �޿�, �޿����(4,5��� �ְ�SAL ������)
SELECT GRADE, MAX(SAL)  FROM EMP, SALGRADE  
  WHERE SAL BETWEEN LOSAL AND HISAL AND SAL >= 3000
  GROUP BY GRADE; -- ��������
SELECT EMPNO, ENAME, JOB, HIREDATE, SAL, GRADE
  FROM EMP, SALGRADE
  WHERE SAL BETWEEN LOSAL AND HISAL  AND
    (GRADE, SAL) IN (SELECT GRADE, MAX(SAL)  FROM EMP, SALGRADE  
                      WHERE SAL BETWEEN LOSAL AND HISAL AND SAL >= 3000
                      GROUP BY GRADE); -- ��������

-- ex3. �Ի�б⺰ �ְ����� �޴� ����� 
        -- �б�, ���, �̸�, job, �����, �Ի�, �޿�, ��
SELECT HIREDATE, CEIL(TO_CHAR(HIREDATE, 'MM')/3) "�б�" FROM EMP; -- �б� ���ϴ� ��
SELECT CEIL(EXTRACT(MONTH FROM HIREDATE)/3) "QUARTER", MAX(SAL) FROM EMP
  GROUP BY CEIL(EXTRACT(MONTH FROM HIREDATE)/3); -- ��������
SELECT CEIL(EXTRACT(MONTH FROM HIREDATE)/3) "QUARTER", EMPNO, ENAME,
      JOB, MGR, HIREDATE, SAL, COMM
    FROM EMP
    WHERE (CEIL(EXTRACT(MONTH FROM HIREDATE)/3), SAL) 
      IN (SELECT CEIL(EXTRACT(MONTH FROM HIREDATE)/3), MAX(SAL) FROM EMP
                GROUP BY CEIL(EXTRACT(MONTH FROM HIREDATE)/3))
    ORDER BY QUARTER;
-- ex4. SALESMAN ��� ����麸�� �޿��� ���� �޴� ����� �̸�, �޿�(ALL)
SELECT ENAME, SAL FROM EMP
  WHERE SAL > ALL (SELECT SAL FROM EMP WHERE JOB='SALESMAN');
SELECT ENAME, SAL FROM EMP
  WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE JOB='SALESMAN');
-- ex5. �޿��� 3000�̸��� ����� �ֱ� �Ի��� ����� ���, �̸�, ����, �Ի���
SELECT MAX(HIREDATE) FROM EMP WHERE SAL<3000; -- ��������
SELECT EMPNO, ENAME, SAL*12+NVL(COMM,0) ANNUAL_SAL, HIREDATE
  FROM EMP
  WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP WHERE SAL<3000); -- ��������

-- �� �� ��������
-- 14.  �̸��� ��T���� �ִ� ����� �ٹ��ϴ� �μ����� �ٹ��ϴ� ��� ������ ��� ��ȣ,�̸�,�޿�(�� ��� �� ���)
SELECT EMPNO, ENAME, SAL FROM emp 
    WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%T%')
    ORDER BY EMPNO;
-- 15. �μ� ��ġ�� Dallas�� ��� �������� ���� �̸�,����,�޿�
SELECT ENAME, JOB, SAL FROM EMP 
    WHERE DEPTNO = (SELECT DEPTNO FROM DEPT 
                    WHERE INITCAP(LOC)='Dallas');
SELECT ENAME, JOB, SAL FROM EMP E, DEPT D 
    WHERE E.DEPTNO=D.DEPTNO AND INITCAP(LOC)='Dallas';
-- 16. EMP ���̺��� King���� �����ϴ� ��� ����� �̸��� �޿�
SELECT ENAME, SAL FROM EMP 
    WHERE MGR=(SELECT EMPNO FROM EMP WHERE INITCAP(ENAME)='King');

SELECT ENAME, SAL FROM EMP W 
    WHERE EXISTS (SELECT * FROM EMP 
                    WHERE EMPNO=W.MGR AND INITCAP(ENAME)='King');
-- 17. SALES�μ� ����� �̸�, ����
SELECT ENAME, JOB FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME='SALES'); -- �������� �̿�
SELECT ENAME, JOB FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND DNAME='SALES'; -- EQUI JOIN �̿�
-- 18. ������ �μ� 30�� ���� ���޺��� ���� ����� ��� �ʵ�
SELECT * FROM EMP 
    WHERE SAL>(SELECT MIN(SAL)  FROM EMP WHERE DEPTNO=30); -- �����༭������
SELECT * FROM EMP 
    WHERE SAL > ANY (SELECT sal  FROM EMP WHERE DEPTNO=30); -- �����༭������
-- 19. �μ� 10���� �μ� 30�� ����� ���� ������ �ð� �ִ� ����� �̸��� ����
SELECT ENAME, JOB FROM EMP WHERE DEPTNO=10 AND 
            JOB IN (SELECT JOB FROM EMP WHERE DEPTNO=30);
-- 20.  FORD�� ������ ���޵� ���� ����� ��� �ʵ�
SELECT * FROM EMP 
    WHERE (JOB, SAL) = (SELECT JOB, SAL FROM EMP 
                        WHERE ENAME='FORD') AND ENAME != 'FORD';
-- 21. �̸��� JONES�� ������ JOB�� ���ų� FORD�� SAL �̻��� �޴� ����� ������
--�̸�, ����, �μ���ȣ, �޿�
    -- ��, ������ ���ĺ� ��, ������ ���� ������ ���
SELECT JOB FROM EMP WHERE ENAME='JONES';--������ ��������
SELECT SAL FROM EMP WHERE ENAME='FORD'; --������ ��������
SELECT ENAME, JOB, DEPTNO, SAL FROM EMP 
    WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME='JONES') OR 
        SAL>=(SELECT SAL FROM EMP WHERE ENAME='FORD')
    ORDER BY JOB, SAL DESC;
-- 22. SCOTT �Ǵ� WARD�� ������ ���� ����� ������ �̸�,����,�޿�
SELECT ENAME, JOB, SAL FROM EMP 
    WHERE SAL IN (SELECT SAL FROM EMP WHERE ENAME='SCOTT' OR ENAME='WARD') 
        AND ENAME NOT IN ('SCOTT', 'WARD');
        
SELECT ENAME, JOB, SAL FROM EMP 
    WHERE SAL IN (SELECT SAL FROM EMP WHERE ENAME IN ('SCOTT','WARD')) 
        AND ENAME NOT IN ('SCOTT','WARD');
-- 23. CHICAGO���� �ٹ��ϴ� ����� ���� ������ �ϴ� ������� �̸�,����
SELECT ENAME, JOB FROM EMP 
    WHERE JOB IN (SELECT JOB FROM EMP E, DEPT D 
                    WHERE E.DEPTNO=D.DEPTNO AND LOC='CHICAGO');
-- 24. �μ����� ������ ��� ���޺��� ���� ����� ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL
  FROM EMP E
  WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO);
 -- �μ���ȣ�� �μ��� ����� �߰� 
SELECT EMPNO, ENAME, SAL, DEPTNO, 
        (SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO)
  FROM EMP E
  WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO);
  
-- 25. �������� ��� ���޺��� ���� ������ �޴� ����� �μ���ȣ, �̸�, �޿�

-- 26. ��� �� �� �̻����κ��� ���� ���� �� �ִ� ����� ����, �̸�, ���, �μ���ȣ�� ���(��, �μ���ȣ ������ �������� ����)

-- 27.  ���� ����� ���, �̸�, ����, �μ���ȣ