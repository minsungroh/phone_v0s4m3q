1 ���̺� ���
drop table payment;

CREATE TABLE payment(
    payno                             INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
    orderno                           varchar(50)    NOT NULL,
    item                              TEXT     NOT NULL COMMENT '������ ��ǰ',
    payfile1                          VARCHAR(100)     NOT NULL COMMENT '������ ��ǰ ����',
    pcnt                              SMALLINT     DEFAULT 0     NOT NULL COMMENT '��ǰ ����',
    paymoney                          MEDIUMINT    NOT NULL COMMENT '�����ݾ�',
    mno                               INT(10)    NULL  COMMENT 'mno'
) COMMENT='�ֹ�/����';


2. ���
insert into payment(item, orderno, payfile1, pcnt, paymoney, mno)
values('���̽�', 'file1.jpg', '1', '30000', '1');

insert into payment(item, orderno, payfile1, pcnt, paymoney, mno)
values('�̾���', 'file2.jpg', '1', '15000', '1');

insert into payment(item, orderno, payfile1, pcnt, paymoney,  mno)
values('���͸�', 'file3.jpg', '1', '35000', '1');

3. ���
select payno, item, orderno, payfile1, pcnt, payment, mno
from payment;

select * from payment;

4. ��ȸ
select payno, item, orderno, payfile1, pcnt, payment, mno
from payment
where payno='1';

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
