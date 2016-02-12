1 ���̺� ���
drop table payment;

CREATE TABLE payment(
    payno                             INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
    item                              TEXT     NOT NULL COMMENT '������ ��ǰ',
    orderno                           VARCHAR(200)     NOT NULL COMMENT '��ǰ��ȣ',
    payfile1                          VARCHAR(100)     NOT NULL COMMENT '������ ��ǰ ����',
    pcnt                              SMALLINT     DEFAULT 0     NOT NULL COMMENT '��ǰ ����',
    paymoney                          MEDIUMINT    NOT NULL COMMENT '�����ݾ�',
    paycharge                         CHAR(1)    DEFAULT 'N'     NOT NULL COMMENT '��������',
    resive_name                       VARCHAR(30)    NULL  COMMENT '�޴»��',
    resive_post                       VARCHAR(10)    NULL  COMMENT '�޴»�������ȣ',
    resive_addr1                      VARCHAR(80)    NULL  COMMENT '�޴��ּ�1',
    resive_addr2                      VARCHAR(50)    NULL  COMMENT '�޴��ּ�2',
    resive_phone                      VARCHAR(20)    NULL  COMMENT '�޴»����ȭ��ȣ',
    paymeans                          VARCHAR(10)    NOT NULL COMMENT '������',
    card_input                        VARCHAR(20)    NULL  COMMENT 'ī�����',
    discount                          MEDIUMINT    DEFAULT 0     NULL  COMMENT 'ī���Һ�',
    deposit_input                     VARCHAR(20)    NULL  COMMENT '�������Ա�',
    phone_input                       VARCHAR(10)    NULL  COMMENT '�ڵ�������',
    payday                            DATETIME     NOT NULL COMMENT '���糯¥',
    contentno                         MEDIUMINT(7)     NULL  COMMENT 'contentno',
    mno                               INT(10)    NULL  COMMENT 'mno',
    dno                               INT(10)    NULL  COMMENT '��ȣ',
  FOREIGN KEY (contentno) REFERENCES p_content (contentno),
  FOREIGN KEY (mno) REFERENCES member (mno),
  FOREIGN KEY (dno) REFERENCES deliveryaddr (dno)
) COMMENT='�ֹ�/����';


2. ���
insert into payment(item, orderno, payfile1, pcnt, paymoney, paycharge, paymeans, resive_name, resive_post, resive_addr1, resive_addr2, resive_phone, payday, contentno, mno, dno)
values('���̽�', '201602020101', 'file1.jpg', '1', '35000', 'N', 'ī�����', '�մ���', '11111', '����� ���α� ��ö��', '�ֵ���ũ', '010-1111-1111', now(), '1', '1', '1');

insert into payment(item, orderno, payfile1, pcnt, paymoney, paycharge, paymeans, resive_name, resive_post, resive_addr1, resive_addr2, resive_phone, payday, contentno, mno, dno)
values('�̾���', '201602030101', 'file2.jpg', '1', '15000', 'N', 'ī�����', '�մ���', '11111', '����� ���α� ��ö��', '�ֵ���ũ', '010-1111-1111', now(), '1', '2', '1');

insert into payment(item, orderno, payfile1, pcnt, paymoney, paycharge, paymeans, resive_name, resive_post, resive_addr1, resive_addr2, resive_phone, payday, contentno, mno, dno)
values('���͸�', '201602040101', 'file3.jpg', '1', '50000', 'N', 'ī�����', '�մ���', '11111', '����� ���α� ��ö��', '�ֵ���ũ', '010-1111-1111', now(), '1', '3', '1');

insert into payment(item, orderno, payfile1, pcnt, paymoney, paycharge, paymeans, resive_name, resive_post, resive_addr1, resive_addr2, resive_phone, payday, contentno, mno, dno)
values('���͸�', '201602050101', 'file3.jpg', '1', '50000', 'N', 'ī�����', '�մ���', '11111', '����� ���α� ��ö��', '�ֵ���ũ', '010-1111-1111', now(), '1', '5', '1');

3. ���
select payno, item, payfile1, pcnt, paymoney, paycharge, resive_name, resive_addr, resive_phone, paymeans, card_input, discount, deposit_input, phone_input, contentno, mno, dno
from payment;
l
select * from payment;

4. ��ȸ
select payno, item, payfile1, pcnt, paymoney, paycharge, resive_name, resive_addr, resive_phone, paymeans, card_input, discount, deposit_input, phone_input, contentno, mno, dno
from payment
where mno = '1';

select * from payment
where orderno='201602020101';

5. ����
update payment
set pcnt='2'
where contentno='1';

update payment
set paycharge='Y', resive_name='', resive_post='', resive_addr1='', resive_addr2= '', resive_phone='', paymeans='', payday='', card_input='', discount='', deposit_input='', phone_input=''
where payno='1';

6. �� ã��
select count(payno) as cnt
from payment
where paymoney='30000';

7. ����
delete from payment

delete from payment
where payno='1';
