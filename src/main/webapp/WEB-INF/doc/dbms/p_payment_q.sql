1 ���̺� ���
drop table payment;

CREATE TABLE payment(
    payno                             INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
    item                              TEXT     NOT NULL COMMENT '������ ��ǰ',
    payfile1                          VARCHAR(100)     NOT NULL COMMENT '������ ��ǰ ����',
    pcnt                              SMALLINT     DEFAULT 0     NOT NULL COMMENT '��ǰ ����',
    paymoney                          MEDIUMINT    NOT NULL COMMENT '�����ݾ�',
    contentno                         MEDIUMINT(7)     NULL  COMMENT 'contentno',
    mno                               INT(10)    NULL  COMMENT 'mno',
  FOREIGN KEY (contentno) REFERENCES p_content (contentno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='�ֹ�/����';


2. ���
insert into payment(item, payfile1, pcnt, paymoney, contentno, mno)
values('���̽�', 'file1.jpg', '1', '30000', '1', '1');

insert into payment(item, payfile1, pcnt, paymoney, contentno, mno)
values('�̾���', 'file2.jpg', '1', '15000', '2', '2');

insert into payment(item, payfile1, pcnt, paymoney, contentno, mno)
values('���͸�','file3.jpg', '1', '35000', '3', '3');

3. ���
select payno, item, payfile1, pcnt, paymoney, contentno, mno
from payment;

select * from payment;

4. ��ȸ
select payno, item, payfile1, pcnt, paymoney, contentno, mno
from payment
where mno = '1';

5. ����
update payment
set pcnt='2'
where payno='1';

6. �� ã��
select count(payno) as cnt
from payment
where paymoney='30000';

7. ����
delete from payment

delete from payment
where payno='1';
