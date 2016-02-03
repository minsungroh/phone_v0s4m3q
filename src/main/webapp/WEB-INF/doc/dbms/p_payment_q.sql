1 테이블 등록
drop table payment;

CREATE TABLE payment(
    payno                             INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
    item                              TEXT     NOT NULL COMMENT '결재할 물품',
    payfile1                          VARCHAR(100)     NOT NULL COMMENT '결제할 물품 사진',
    pcnt                              SMALLINT     DEFAULT 0     NOT NULL COMMENT '상품 개수',
    paymoney                          MEDIUMINT    NOT NULL COMMENT '결제금액',
    contentno                         MEDIUMINT(7)     NULL  COMMENT 'contentno',
    mno                               INT(10)    NULL  COMMENT 'mno',
  FOREIGN KEY (contentno) REFERENCES p_content (contentno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='주문/결제';


2. 등록
insert into payment(item, payfile1, pcnt, paymoney, contentno, mno)
values('케이스', 'file1.jpg', '1', '30000', '1', '1');

insert into payment(item, payfile1, pcnt, paymoney, contentno, mno)
values('이어폰', 'file2.jpg', '1', '15000', '2', '2');

insert into payment(item, payfile1, pcnt, paymoney, contentno, mno)
values('배터리','file3.jpg', '1', '35000', '3', '3');

3. 목록
select payno, item, payfile1, pcnt, paymoney, contentno, mno
from payment;

select * from payment;

4. 조회
select payno, item, payfile1, pcnt, paymoney, contentno, mno
from payment
where mno = '1';

5. 수정
update payment
set pcnt='2'
where payno='1';

6. 값 찾기
select count(payno) as cnt
from payment
where paymoney='30000';

7. 삭제
delete from payment

delete from payment
where payno='1';
