1. ���̺� ���
drop table p_content;

CREATE TABLE p_content(
    contentno                         MEDIUMINT(7)     NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��ǰ��ȣ',
    title                             VARCHAR(200)     NOT NULL COMMENT '��ǰ�̸�',
    content                           MEDIUMTEXT     NOT NULL COMMENT '����',
    file                              VARCHAR(100)     NULL  COMMENT 'Thumb����',
    file1                             VARCHAR(300)     NULL  COMMENT '÷������',
    itemnum                        VARCHAR(50)       not null Comment '��ǰ�Ϸù�ȣ',
    replycnt                          text    NOT NULL COMMENT '���',
    money                             MEDIUMINT(10)    NOT NULL COMMENT '��ǰ��',
    productcnt                        MEDIUMINT(10)    DEFAULT 0     NULL  COMMENT '��ǰ����',
    p_categoryno                      MEDIUMINT(7)     NULL  COMMENT 'ī�װ���ȣ'
) COMMENT='��ǰ����';


2. ���
insert into p_content(title, content, file, file1, itemnum, replycnt, money, productcnt, p_categoryno)
values('���̽�', '���̽��� �ֹ��մϴ�.', 'file1.jpg', 'file2.jpg', '201602020001', '����', '30000', '1', '1');

insert into p_content(title, content, file, file1, itemnum, replycnt, money, productcnt, p_categoryno)
values('�̾���', '�̾����� �ֹ��մϴ�.', 'file1.jpg', 'file2.jpg', '201602020001', '����', '10000', '1', '1');

insert into p_content(title, content, file, file1, itemnum, replycnt, money, productcnt, p_categoryno)
values('���͸�', '���͸��� �ֹ��մϴ�.', 'file1.jpg', 'file2.jpg', '201602020001', '����', '40000', '1', '1');

3. ���
select contentno, title, content, file, file1, itemnum, replycnt, money, productcnt, p_categoryno
from p_content;

4. ��ȸ
select contentno, title, content, file, file1, itemnum, replycnt, money, productcnt, p_categoryno
from p_content
where contentno='1';

5. ����
update p_content
set productcnt='2'
where contentno='1';

6. �� ã��
select count(contentno) as cnt
from p_content
where title='���̽�';

7. ����
delete from p_content;

delete from p_content
where contentno='1';