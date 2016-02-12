1. ���̺� ���
drop table trace;

CREATE TABLE trace(
    traceno                           MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��۹�ȣ',
    waybil                            BIGINT     NOT NULL COMMENT '�����ȣ',
    trace_state                       VARCHAR(100)     NOT NULL COMMENT '��ۻ���',
    tdate                             DATETIME     NOT NULL COMMENT '�����',
    agent                             VARCHAR(100)     NOT NULL COMMENT '�븮��',
    manager                           VARCHAR(20)    NOT NULL COMMENT '�����',
    manager_phone                     VARCHAR(30)    NOT NULL COMMENT '�������ȭ��ȣ',
    content                           VARCHAR(200)     NOT NULL COMMENT '����',
    payno                             INT(10)    NULL  COMMENT '��ȣ',
  FOREIGN KEY (payno) REFERENCES payment (payno)
) COMMENT='�������';

-- ��ۻ��� : ��ǰ�غ���, �����, ��ۿϷ�

2. ���
insert into trace(waybil, trace_state, tdate, agent, manager, manager_phone, content, payno)
values('160209001', '��ǰ�غ���', now(), '�������/02-111-2222', '������', '010-1111-1111', '����������� ��ǰ�� �̵����Դϴ�.', '1');

insert into trace(waybil, trace_state, tdate, agent, manager, manager_phone, content, payno)
values('160209001', '��ǰ�غ���', now(), '�������/02-111-2222', '������', '010-1111-1111', '�����κ��� ��ǰ�� �μ��޾ҽ��ϴ�.', '1');

insert into trace(waybil, trace_state, tdate, agent, manager, manager_phone, content, payno)
values('160209001', '��ǰ�غ���', now(), '�������/02-111-2222', '������', '010-1111-1111', '������ ��ǰ�� ����߿� �ֽ��ϴ�.', '1');

3. ���
select traceno, waybil, trace_state, ddate, agent, manger, manager_phone, content, payno
from trace
where waybil='160209001';


select * from trace;
4. ��ȸ
select t.traceno, t.waybil, t.trace_state, t.ddate, t.agent, t.manager, t.manager_phone, t.content, t.payno, p.payno, p.resive_post, p.resive_addr1, p.resive_addr2, p.resive_phone, p.resive_name, p.item, p.pcnt
from trace t
join payment p on t.payno = p.payno
where t.waybil='160209001' and t.deleveryno='1';


select traceno, waybil, trace_state, ddate, agent, manager, manager_phone, content, payno
from trace
where waybil='160209001';

5. ����
update trace
set trace_state = '�����';
where traceno='1';

6. �� ã��
select count(traceno) as cnt
from trace
where waybil='012301230123';

7. ����
delete from trace;

delete from trace
where traceno='1';

