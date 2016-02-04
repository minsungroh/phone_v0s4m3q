1. ���̺� ����
drop table mypage;

CREATE TABLE mypage(
    mypageno                          MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
    incantateno                       BIGINT     NOT NULL COMMENT '�ֹ���ȣ',
    incantatedate                     DATE     NOT NULL COMMENT '�ֹ���',
    paymoney                          MEDIUMINT    NOT NULL COMMENT '�����ݾ�',
    thumbfile                         VARCHAR(100)     NOT NULL COMMENT '����',
    orderstate                        VARCHAR(10)    NOT NULL COMMENT '�ֹ�����',
    ordersubmit                       CHAR     DEFAULT 'N'     NULL  COMMENT '����Ȯ��',
    point                             MEDIUMINT    DEFAULT 0     NOT NULL COMMENT '����Ʈ',
    payno                             INT(10)    NULL  COMMENT '��ȣ',
    mno                               INT(10)    NULL  COMMENT 'mno',
  FOREIGN KEY (payno) REFERENCES payment (payno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='�ֹ�����';


2. ���
insert into mypage(incantateno, incantatedate, paymoney, thumbfile, orderstate, ordersubmit, point, payno, mno)
values('201602020001', now(), '201602020001', '50000', 'file1.jpg', '�Աݴ��', 'N', '1');

insert into mypage(mypageno, mypagedate, payno, paymoney, thumbfile, orderstate, ordersubmit, mno)
values('201602020001', now(), '201602020001', '50000', 'file2.jpg', '�Աݴ��', 'N', '2');

insert into mypage(mypageno, mypagedate, payno, paymoney, thumbfile, orderstate, ordersubmit, mno)
values('201602020001', now(), '201602020001', '50000', 'file3.jpg', '�Աݴ��', 'N', '3');


3. ���
select ino, mypageno, mypagedate, payno, paymoney, thumbfile, orderstate, ordersubmit, mno
from mypage;


4. ��ȸ
select ino, mypageno, mypagedate, payno, paymoney, thumbfile, orderstate, ordersubmit, mno
from mypage
where mypageno='201602020001';


5. ����
update mypage
set orderstate='�߼���'
where mypageno='201602020001';


6. �� ã��
select count(mpno) as cnt
from mypage
where payno = '201602020001';

7. ����
delete from mypage
where mypageno='201602020001';

delete from mypage

