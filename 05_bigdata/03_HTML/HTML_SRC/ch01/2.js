// 2.js
/* ������ �κ�(DB���� ����)
            * => �ڹٽ�ũ��Ʈ(�Լ������,���������;��)�� ��� */
name = prompt("�̸��� ?", "ȫ�浿");
document.write(name + '~ Welcome <br>'); /* <br> ���� */
function chk() {
    if (frm.tel.value.length < 4) {
        alert("��ȭ��ȣ�� 4�ڸ� �̻� �Է��ؾ� ��");
        return false; /* submit �̺�Ʈ�� ���� */
    }
}