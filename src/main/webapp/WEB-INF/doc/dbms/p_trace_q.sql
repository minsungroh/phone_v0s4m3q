1. 테이블 등록
drop table trace;

CREATE TABLE trace(
    deleveryno                        MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '배송번호',
    delevery_state                    VARCHAR(100)     NOT NULL COMMENT '배송상태',
    delevery_addr                     VARCHAR(500)     NOT NULL COMMENT '배송주소',
    payno                             INT(10)    NULL  COMMENT '번호',
  FOREIGN KEY (payno) REFERENCES payment (payno)
) COMMENT='배송추적';

-- 배송상태 : 물품준비중, 배송중, 배송완료

2. 등록
insert into trace(delevery_state, delevery_addr, payno)
values('물품준비중', '서울시 관철동', '1');

insert into trace(delevery_state, delevery_addr, payno)
values('물품준비중', '서울시 관철동', '2');

insert into trace(delevery_state, delevery_addr, payno)
values('물품준비중', '서울시 관철동', '3');


3. 목록
select deleveryno, delevery_state, delevery_addr, payno
from trace;


4. 조회
select deleveryno, delevery_state, delevery_addr, payno
from trace
where deleveryno='1';

5. 수정
update trace
set delevery_state = '배송중';
where deleveryno='1';

6. 값 찾기
select count(deleveryno) as cnt
from trace
where delevery_state = '배송중';

7. 삭제
delete from trace;

delete from trace
where deleveryno='1';

