1. ���̺� ���
drop table trace;

CREATE TABLE trace(
    deleveryno                        MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��۹�ȣ',
    delevery_state                    VARCHAR(100)     NOT NULL COMMENT '��ۻ���',
    delevery_addr                     VARCHAR(500)     NOT NULL COMMENT '����ּ�',
    payno                             INT(10)    NULL  COMMENT '��ȣ',
  FOREIGN KEY (payno) REFERENCES payment (payno)
) COMMENT='�������';

-- ��ۻ��� : ��ǰ�غ���, �����, ��ۿϷ�

2. ���
insert into trace(delevery_state, delevery_addr, payno)
values('��ǰ�غ���', '����� ��ö��', '1');

insert into trace(delevery_state, delevery_addr, payno)
values('��ǰ�غ���', '����� ��ö��', '2');

insert into trace(delevery_state, delevery_addr, payno)
values('��ǰ�غ���', '����� ��ö��', '3');


3. ���
select deleveryno, delevery_state, delevery_addr, payno
from trace;


4. ��ȸ
select deleveryno, delevery_state, delevery_addr, payno
from trace
where deleveryno='1';

5. ����
update trace
set delevery_state = '�����';
where deleveryno='1';

6. �� ã��
select count(deleveryno) as cnt
from trace
where delevery_state = '�����';

7. ����
delete from trace;

delete from trace
where deleveryno='1';

