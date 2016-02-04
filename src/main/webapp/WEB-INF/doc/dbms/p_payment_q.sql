1 테이블 등록
drop table payment;

CREATE TABLE payment(
    payno                             INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
    item                              TEXT     NOT NULL COMMENT '결재할 물품',
    orderno                           VARCHAR(200)     NOT NULL COMMENT '상품번호',
    payfile1                          VARCHAR(100)     NOT NULL COMMENT '결제할 물품 사진',
    pcnt                              SMALLINT     DEFAULT 0     NOT NULL COMMENT '상품 개수',
    paymoney                          MEDIUMINT    NOT NULL COMMENT '결제금액',
    paycharge                         char(1)    DEFAULT 'N'     NOT NULL COMMENT '결제여부',
    paymeans                        varchar(100) not null,
    contentno                         MEDIUMINT(7)     NULL  COMMENT 'contentno',
    mno                               INT(10)    NULL  COMMENT 'mno',
    dno                               INT(10)    NULL  COMMENT '번호',
  FOREIGN KEY (contentno) REFERENCES p_content (contentno),
  FOREIGN KEY (mno) REFERENCES member (mno),
  FOREIGN KEY (dno) REFERENCES deliveryaddr (dno)
) COMMENT='주문/결제';


2. 등록
insert into payment(item, orderno, payfile1, pcnt, paymoney, paycharge, paymeans, contentno, mno, dno)
values('케이스', '201602020101', 'file1.jpg', '1', '35000', 'N', '카드결제','1', '1', '1');

insert into payment(item, orderno, payfile1, pcnt, paymoney, paycharge, paymeans, contentno, mno, dno)
values('이어폰', '201602020102', 'file2.jpg', '1', '15000', 'N', '무통장입금', '2', '2', '2');

insert into payment(item, orderno, payfile1, pcnt, paymoney, paycharge, paymeans, contentno, mno, dno)
values('배터리','201602020103','file3.jpg', '1', '50000', 'N', '실시간계좌', '3', '3', '3');

3. 목록
select payno, item, payfile1, pcnt, paymoney, paycharge, contentno, mno
from payment;

select * from payment;

4. 조회
select payno, item, payfile1, pcnt, paymoney, paycharge, contentno, mno
from payment
where mno = '1';

5. 수정
update payment
set pcnt='2'
where contentno='1';

update payment
set paycharge='Y'
where contentno='1';

6. 값 찾기
select count(payno) as cnt
from payment
where paymoney='30000';

7. 삭제
delete from payment

delete from payment
where payno='1';
