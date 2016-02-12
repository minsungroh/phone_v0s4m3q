1. 테이블 생성
drop table mypage;

CREATE TABLE mypage(
    mypageno                          MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
    orderstate                        VARCHAR(100)     NOT NULL COMMENT '주문상태',
    ordersubmit                       CHAR     DEFAULT 'N'     NULL  COMMENT '구매확정',
    point                             MEDIUMINT    DEFAULT 0     NOT NULL COMMENT '포인트',
    payno                             INT(10)    NULL  COMMENT '번호',
    mno                               INT(10)    NULL  COMMENT 'mno',
    traceno                           MEDIUMINT(10)    NULL  COMMENT '배송번호',
  FOREIGN KEY (payno) REFERENCES payment (payno),
  FOREIGN KEY (mno) REFERENCES member (mno),
  FOREIGN KEY (traceno) REFERENCES trace (traceno)
) COMMENT='주문내역';


2. 등록
insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('delivery_wait', 'N', '0', '1', '1', '1');
insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('delivery_wait', 'N', '0', '1', '2', '2');


insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('pay_ok', 'N', '0', '2', '1', '1');
insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('pay_ok', 'N', '0', '2', '1', '1');

insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('delivery', 'N', '0', '3', '1', '1');
insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('product_ready', 'N', '0', '3', '1', '1');
insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('product_ready', 'N', '0', '3', '2', '1');

insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('delivery', 'N', '0', '1', '1', '1');

insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('complate', 'N', '0', '3', '1', '1');
insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('complate', 'N', '0', '3', '1', '1');

insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('ok_wait', 'N', '0', '3', '1', '1');
insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('ok_wait', 'N', '0', '3', '1', '1');
insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('ok_wait', 'N', '0', '3', '1', '1');

insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('pay_wait', 'N', '0', '3', '5', '1');

insert into mypage(orderstate, ordersubmit, point, payno, mno, traceno)
values('pay_wait', 'N', '0', '3', '3', '1');


3. 목록
select mypageno, orderstate, ordersubmit, point, traceno, payno, mno
from mypage;


4. 조회
select mypageno, orderstate, ordersubmit, point, traceno, payno, mno
from mypage
where mypageno='1'


5. 수정
update mypage
set orderstate='발송중'
where mypageno='201602020001';

update mypage as m join payment as p on m.payno = p.payno
set m.ordersubmit='N'
where m.mno = '1' and p.orderno='201602020101';
m.point=''
6. 값 찾기
select count(mypageno) as cnt
from mypage
where orderstate = 'product_ready' and mno='1'

7. 삭제
delete from mypage
where mypageno='201602020001';

delete from mypage

8. 조인
-- 조인
select distinct m.payno
from mypage m
join payment p on p.paycharge=m.payno
where p.paycharge='N'
order by m.payno;

select m.payno, m.orderstate, p.payno, m.mno
from mypage m
join payment p on m.payno = p.payno 
where m.orderstate='delivery_wait' and m.mno='1';

select count(mypageno) as cnt
from mypage m, payment p
where m.payno = p.payno and m.orderstate='product_ready' and m.mno='1';

select count(mypageno) as cnt
from mypage m
join payment p on m.payno = p.payno 
where m.orderstate='product_ready' and m.mno='1'
and date(p.payday) >= date(subdate(now(), INTERVAL 30 DAY)) 
and date(p.payday) <= date(now());

select p.payday, p.paymoney, p.orderno, p.item, p.pcnt, m.payno
from mypage m
join payment p on m.payno = p.payno
and m.mno=1

select p.item, p.payfile1, p.pcnt, p.paymoney, p.payday, p.orderno, m.orderstate, m.mno, m.ordersubmit, t.traceno, t.waybil, p.paycharge
from mypage m
join payment p on m.payno = p.payno
join trace t on m.traceno = t.traceno
where m.mno=1 and p.paycharge='Y'

select p.item, p.payfile1, p.pcnt, p.paymoney, p.payday, p.orderno, m.orderstate, t.traceno, t.waybil, p.resive_name, 
p.resive_phone, p.resive_post, p.resive_addr1, p.resive_addr2, p.paymeans, p.card_input, p.discount, p.deposit_input, p.phone_input, p.paymoney
from mypage m
join payment p on m.payno = p.payno
join trace t on m.traceno = t.traceno
where p.orderno='201602020101';

select m.mypageno, m.orderstate, m.ordersubmit, m.point, m.traceno, m.payno, m.mno, p.paycharge
from mypage as m
join payment as p on m.payno = p.payno
where m.mno=1

select p.item, p.payfile1, p.pcnt, p.paymoney, p.payday, p.orderno, m.orderstate, t.traceno, t.waybil, p.resive_name, 
p.resive_phone, p.resive_post, p.resive_addr1, p.resive_addr2, p.paymeans, p.card_input, p.discount, p.deposit_input, p.phone_input, p.paymoney
from mypage m
join payment p on m.payno = p.payno
join trace t on m.traceno = t.traceno
where p.orderno='201602020101'
and date(p.payday) >= date(subdate(now(), INTERVAL 60 DAY)) 
and date(p.payday) <= date(now());