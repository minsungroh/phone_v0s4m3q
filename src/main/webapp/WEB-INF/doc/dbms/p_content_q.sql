1. 테이블 등록
drop table p_content;

CREATE TABLE p_content(
    contentno                         MEDIUMINT(7)     NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT 'contentno',
    title                             VARCHAR(200)     NOT NULL COMMENT 'title',
    content                           MEDIUMTEXT     NOT NULL COMMENT 'content',
    file                              VARCHAR(100)     NULL  COMMENT 'file',
    file1                             VARCHAR(300)     NULL  COMMENT 'file1',
    itemnum                           VARCHAR(50)    NOT NULL COMMENT 'itemnum',
    reply                          TEXT     NOT NULL COMMENT 'replycnt',
    money                             MEDIUMINT(7)     NOT NULL COMMENT 'money',
    productcnt                        MEDIUMINT(7)     NULL  COMMENT 'productcnt'
) COMMENT='p_content';


2. 등록
insert into p_content(title, content, file, file1, itemnum, reply, money, productcnt)
values('케이스', '케이스를 주문합니다.', 'file1.jpg', 'file2.jpg', '201602020001', '구매', '30000', '1');

insert into p_content(title, content, file, file1, itemnum, reply, money, productcnt)
values('이어폰', '이어폰을 주문합니다.', 'file1.jpg', 'file2.jpg', '201602020001', '구매', '10000', '1');

insert into p_content(title, content, file, file1, itemnum, reply, money, productcnt)
values('배터리', '배터리를 주문합니다.', 'file1.jpg', 'file2.jpg', '201602020001', '구매', '40000', '1');

3. 목록
select contentno, title, content, file, file1, itemnum, replycnt, money, productcnt, mno
from p_content;

4. 조회
select contentno, title, content, file, file1, itemnum, replycnt, money, productcnt, mno
from p_content
where contentno='3';

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