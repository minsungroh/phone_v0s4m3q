1. 테이블 등록
drop table trace;

CREATE TABLE trace(
    traceno                           MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '배송번호',
    waybil                            BIGINT     NOT NULL COMMENT '송장번호',
    trace_state                       VARCHAR(100)     NOT NULL COMMENT '배송상태',
    tdate                             DATETIME     NOT NULL COMMENT '배송일',
    agent                             VARCHAR(100)     NOT NULL COMMENT '대리점',
    manager                           VARCHAR(20)    NOT NULL COMMENT '담당자',
    manager_phone                     VARCHAR(30)    NOT NULL COMMENT '담당자전화번호',
    content                           VARCHAR(200)     NOT NULL COMMENT '구분',
    payno                             INT(10)    NULL  COMMENT '번호',
  FOREIGN KEY (payno) REFERENCES payment (payno)
) COMMENT='배송추적';

-- 배송상태 : 물품준비중, 배송중, 배송완료

2. 등록
insert into trace(waybil, trace_state, tdate, agent, manager, manager_phone, content, payno)
values('160209001', '물품준비중', now(), '용산전자/02-111-2222', '김형석', '010-1111-1111', '배송지역으로 물품이 이동중입니다.', '1');

insert into trace(waybil, trace_state, tdate, agent, manager, manager_phone, content, payno)
values('160209001', '물품준비중', now(), '용산전자/02-111-2222', '김형석', '010-1111-1111', '고객으로부터 상품을 인수받았습니다.', '1');

insert into trace(waybil, trace_state, tdate, agent, manager, manager_phone, content, payno)
values('160209001', '물품준비중', now(), '용산전자/02-111-2222', '김형석', '010-1111-1111', '고객님의 상품이 배송중에 있습니다.', '1');

3. 목록
select traceno, waybil, trace_state, ddate, agent, manger, manager_phone, content, payno
from trace
where waybil='160209001';


select * from trace;
4. 조회
select t.traceno, t.waybil, t.trace_state, t.ddate, t.agent, t.manager, t.manager_phone, t.content, t.payno, p.payno, p.resive_post, p.resive_addr1, p.resive_addr2, p.resive_phone, p.resive_name, p.item, p.pcnt
from trace t
join payment p on t.payno = p.payno
where t.waybil='160209001' and t.deleveryno='1';


select traceno, waybil, trace_state, ddate, agent, manager, manager_phone, content, payno
from trace
where waybil='160209001';

5. 수정
update trace
set trace_state = '배송중';
where traceno='1';

6. 값 찾기
select count(traceno) as cnt
from trace
where waybil='012301230123';

7. 삭제
delete from trace;

delete from trace
where traceno='1';

