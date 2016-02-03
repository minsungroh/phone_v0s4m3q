1. 테이블 등록
drop table p_content;

CREATE TABLE p_content(
    contentno                         MEDIUMINT(7)     NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '물품번호',
    title                             VARCHAR(200)     NOT NULL COMMENT '상품이름',
    content                           MEDIUMTEXT     NOT NULL COMMENT '내용',
    file                              VARCHAR(100)     NULL  COMMENT 'Thumb파일',
    file1                             VARCHAR(300)     NULL  COMMENT '첨부파일',
    itemnum                        VARCHAR(50)       not null Comment '제품일련번호',
    replycnt                          text    NOT NULL COMMENT '댓글',
    money                             MEDIUMINT(10)    NOT NULL COMMENT '상품값',
    productcnt                        MEDIUMINT(10)    DEFAULT 0     NULL  COMMENT '상품개수',
    p_categoryno                      MEDIUMINT(7)     NULL  COMMENT '카테고리번호'
) COMMENT='물품내용';


2. 등록
insert into p_content(title, content, file, file1, itemnum, replycnt, money, productcnt, p_categoryno)
values('케이스', '케이스를 주문합니다.', 'file1.jpg', 'file2.jpg', '201602020001', '구매', '30000', '1', '1');

insert into p_content(title, content, file, file1, itemnum, replycnt, money, productcnt, p_categoryno)
values('이어폰', '이어폰을 주문합니다.', 'file1.jpg', 'file2.jpg', '201602020001', '구매', '10000', '1', '1');

insert into p_content(title, content, file, file1, itemnum, replycnt, money, productcnt, p_categoryno)
values('배터리', '배터리를 주문합니다.', 'file1.jpg', 'file2.jpg', '201602020001', '구매', '40000', '1', '1');

3. 목록
select contentno, title, content, file, file1, itemnum, replycnt, money, productcnt, p_categoryno
from p_content;

4. 조회
select contentno, title, content, file, file1, itemnum, replycnt, money, productcnt, p_categoryno
from p_content
where contentno='1';

5. 수정
update p_content
set productcnt='2'
where contentno='1';

6. 값 찾기
select count(contentno) as cnt
from p_content
where title='케이스';

7. 삭제
delete from p_content;

delete from p_content
where contentno='1';