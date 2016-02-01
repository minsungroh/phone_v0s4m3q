/**********************************/
/* Table Name: 관리자 */
/**********************************/
CREATE TABLE admin1(
		admin1no                      		INT		 NOT NULL AUTO_INCREMENT COMMENT '번호',
		email                         		VARCHAR(50)		 NOT NULL COMMENT '이메일',
		passwd                        		VARCHAR(20)		 NOT NULL COMMENT '패스워드',
		auth                          		VARCHAR(20)		 NOT NULL COMMENT '메일인증코드',
		act                           		CHAR(1)		 NOT NULL COMMENT '권한',
		confirm                       		CHAR(1)		 NOT NULL COMMENT '이메일링크클릭여부',
		mdate                         		DATETIME		 NOT NULL COMMENT '날짜',
		mno                           		INT		 NULL  COMMENT '번호',
		art3no                        		MEDIUMINT		 NULL  COMMENT '번호'
) COMMENT='관리자';

/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE member(
		mno                           		INT		 NOT NULL AUTO_INCREMENT COMMENT '번호',
		id                            		VARCHAR(20)		 NOT NULL COMMENT '아이디',
		passwd                        		VARCHAR(20)		 NOT NULL COMMENT '패스워드',
		mname                         		VARCHAR(20)		 NOT NULL COMMENT '이름',
		tel                           		VARCHAR(14)		 NOT NULL COMMENT '연락처',
		zipcode                       		VARCHAR(5)		 NULL  COMMENT '우편번호',
		address1                      		VARCHAR(80)		 NULL  COMMENT '주소',
		address2                      		VARCHAR(50)		 NULL  COMMENT '주소2',
		mdate                         		DATETIME		 NOT NULL COMMENT '날짜',
		admin1no                      		INT		 NULL  COMMENT '번호'
) COMMENT='회원';

/**********************************/
/* Table Name: 질문게시판 */
/**********************************/
CREATE TABLE art3(
		art3no                        		MEDIUMINT		 NOT NULL AUTO_INCREMENT COMMENT '번호',
		rname                         		VARCHAR(20)		 NOT NULL COMMENT '성명',
		email                         		VARCHAR(100)		 NULL  COMMENT '이메일',
		title                         		VARCHAR(200)		 NOT NULL COMMENT '제목',
		content                       		VARCHAR(4000)		 NOT NULL COMMENT '내용',
		passwd                        		VARCHAR(15)		 NOT NULL COMMENT '패스워드',
		cnt                           		SMALLINT(5)		 NULL  COMMENT 'cnt',
		rdate                         		DATETIME		 NOT NULL COMMENT '날짜',
		url                           		VARCHAR(100)		 NULL  COMMENT 'url'
) COMMENT='질문게시판';


ALTER TABLE admin1 ADD CONSTRAINT IDX_admin1_PK PRIMARY KEY (admin1no);
ALTER TABLE admin1 ADD CONSTRAINT email UNIQUE (email);

ALTER TABLE member ADD CONSTRAINT IDX_member_PK PRIMARY KEY (mno);
ALTER TABLE member ADD CONSTRAINT IDX_member_FK0 FOREIGN KEY (admin1no) REFERENCES admin1 (admin1no);
ALTER TABLE member ADD CONSTRAINT id UNIQUE (id);

ALTER TABLE art3 ADD CONSTRAINT IDX_art3_PK PRIMARY KEY (art3no);

