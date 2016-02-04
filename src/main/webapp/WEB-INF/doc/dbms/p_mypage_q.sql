1. 테이블 생성
drop table mypage;

CREATE TABLE mypage(
    mypageno                          MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
    incantateno                       BIGINT     NOT NULL COMMENT '주문번호',
    incantatedate                     DATE     NOT NULL COMMENT '주문일',
    paymoney                          MEDIUMINT    NOT NULL COMMENT '결제금액',
    thumbfile                         VARCHAR(100)     NOT NULL COMMENT '파일',
    orderstate                        VARCHAR(10)    NOT NULL COMMENT '주문상태',
    ordersubmit                       CHAR     DEFAULT 'N'     NULL  COMMENT '구매확정',
    point                             MEDIUMINT    DEFAULT 0     NOT NULL COMMENT '포인트',
    payno                             INT(10)    NULL  COMMENT '번호',
    mno                               INT(10)    NULL  COMMENT 'mno',
  FOREIGN KEY (payno) REFERENCES payment (payno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='주문내역';


2. 등록
insert into mypage(incantateno, incantatedate, paymoney, thumbfile, orderstate, ordersubmit, point, payno, mno)
values('201602020001', now(), '201602020001', '50000', 'file1.jpg', '입금대기', 'N', '1');

insert into mypage(mypageno, mypagedate, payno, paymoney, thumbfile, orderstate, ordersubmit, mno)
values('201602020001', now(), '201602020001', '50000', 'file2.jpg', '입금대기', 'N', '2');

insert into mypage(mypageno, mypagedate, payno, paymoney, thumbfile, orderstate, ordersubmit, mno)
values('201602020001', now(), '201602020001', '50000', 'file3.jpg', '입금대기', 'N', '3');


3. 목록
select ino, mypageno, mypagedate, payno, paymoney, thumbfile, orderstate, ordersubmit, mno
from mypage;


4. 조회
select ino, mypageno, mypagedate, payno, paymoney, thumbfile, orderstate, ordersubmit, mno
from mypage
where mypageno='201602020001';


5. 수정
update mypage
set orderstate='발송중'
where mypageno='201602020001';


6. 값 찾기
select count(mpno) as cnt
from mypage
where payno = '201602020001';

7. 삭제
delete from mypage
where mypageno='201602020001';

delete from mypage

