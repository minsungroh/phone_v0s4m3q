1 테이블 등록
drop table payment;

CREATE TABLE payment(
    payno                             INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
    item                              TEXT     NOT NULL COMMENT '결재할 물품',
    orderno                           VARCHAR(200)     NOT NULL COMMENT '상품번호',
    payfile1                          VARCHAR(100)     NOT NULL COMMENT '결제할 물품 사진',
    pcnt                              SMALLINT     DEFAULT 0     NOT NULL COMMENT '상품 개수',
    paymoney                          MEDIUMINT    NOT NULL COMMENT '결제금액',
    paycharge                         CHAR(1)    DEFAULT 'N'     NOT NULL COMMENT '결제여부',
    resive_name                       VARCHAR(30)    NULL  COMMENT '받는사람',
    resive_post                       VARCHAR(10)    NULL  COMMENT '받는사람우편번호',
    resive_addr1                      VARCHAR(80)    NULL  COMMENT '받는주소1',
    resive_addr2                      VARCHAR(50)    NULL  COMMENT '받는주소2',
    resive_phone                      VARCHAR(20)    NULL  COMMENT '받는사람전화번호',
    paymeans                          VARCHAR(10)    NOT NULL COMMENT '결재방식',
    card_input                        VARCHAR(20)    NULL  COMMENT '카드결제',
    discount                          MEDIUMINT    DEFAULT 0     NULL  COMMENT '카드할부',
    deposit_input                     VARCHAR(20)    NULL  COMMENT '무통장입금',
    phone_input                       VARCHAR(10)    NULL  COMMENT '핸드폰결제',
    payday                            DATETIME     NOT NULL COMMENT '결재날짜',
    contentno                         MEDIUMINT(7)     NULL  COMMENT 'contentno',
    mno                               INT(10)    NULL  COMMENT 'mno',
    dno                               INT(10)    NULL  COMMENT '번호',
  FOREIGN KEY (contentno) REFERENCES p_content (contentno),
  FOREIGN KEY (mno) REFERENCES member (mno),
  FOREIGN KEY (dno) REFERENCES deliveryaddr (dno)
) COMMENT='주문/결제';


2. 등록
insert into payment(item, orderno, payfile1, pcnt, paymoney, paycharge, paymeans, resive_name, resive_post, resive_addr1, resive_addr2, resive_phone, payday, contentno, mno, dno)
values('케이스', '201602020101', 'file1.jpg', '1', '35000', 'N', '카드결제', '왕눈이', '11111', '서울시 종로구 관철동', '솔데스크', '010-1111-1111', now(), '1', '1', '1');

insert into payment(item, orderno, payfile1, pcnt, paymoney, paycharge, paymeans, resive_name, resive_post, resive_addr1, resive_addr2, resive_phone, payday, contentno, mno, dno)
values('이어폰', '201602030101', 'file2.jpg', '1', '15000', 'N', '카드결제', '왕눈이', '11111', '서울시 종로구 관철동', '솔데스크', '010-1111-1111', now(), '1', '2', '1');

insert into payment(item, orderno, payfile1, pcnt, paymoney, paycharge, paymeans, resive_name, resive_post, resive_addr1, resive_addr2, resive_phone, payday, contentno, mno, dno)
values('배터리', '201602040101', 'file3.jpg', '1', '50000', 'N', '카드결제', '왕눈이', '11111', '서울시 종로구 관철동', '솔데스크', '010-1111-1111', now(), '1', '3', '1');

insert into payment(item, orderno, payfile1, pcnt, paymoney, paycharge, paymeans, resive_name, resive_post, resive_addr1, resive_addr2, resive_phone, payday, contentno, mno, dno)
values('배터리', '201602050101', 'file3.jpg', '1', '50000', 'N', '카드결제', '왕눈이', '11111', '서울시 종로구 관철동', '솔데스크', '010-1111-1111', now(), '1', '5', '1');

3. 목록
select payno, item, payfile1, pcnt, paymoney, paycharge, resive_name, resive_addr, resive_phone, paymeans, card_input, discount, deposit_input, phone_input, contentno, mno, dno
from payment;
l
select * from payment;

4. 조회
select payno, item, payfile1, pcnt, paymoney, paycharge, resive_name, resive_addr, resive_phone, paymeans, card_input, discount, deposit_input, phone_input, contentno, mno, dno
from payment
where mno = '1';

select * from payment
where orderno='201602020101';

5. 수정
update payment
set pcnt='2'
where contentno='1';

update payment
set paycharge='Y', resive_name='', resive_post='', resive_addr1='', resive_addr2= '', resive_phone='', paymeans='', payday='', card_input='', discount='', deposit_input='', phone_input=''
where payno='1';

6. 값 찾기
select count(payno) as cnt
from payment
where paymoney='30000';

7. 삭제
delete from payment

delete from payment
where payno='1';
