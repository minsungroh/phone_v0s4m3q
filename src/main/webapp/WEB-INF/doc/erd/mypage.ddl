/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE member(
		mno                           		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT 'mno',
		id                            		VARCHAR(20)		 NOT NULL COMMENT 'id',
		passwd                        		VARCHAR(20)		 NOT NULL COMMENT 'passwd',
		mname                         		VARCHAR(20)		 NOT NULL COMMENT 'mname',
		grade                         		CHAR(1)		 DEFAULT 'F'		 NOT NULL COMMENT '회원 등급',
		money                         		MEDIUMINT		 DEFAULT 0		 NOT NULL COMMENT '구매금액',
		tel                           		VARCHAR(14)		 NOT NULL COMMENT 'tel',
		zipcode                       		VARCHAR(5)		 NULL  COMMENT 'zipcode',
		address1                      		VARCHAR(80)		 NULL  COMMENT 'address1',
		address2                      		VARCHAR(50)		 NULL  COMMENT 'address2',
		mdate                         		DATETIME		 NOT NULL COMMENT 'mdate',
  CONSTRAINT id UNIQUE (id)
) COMMENT='회원';

/**********************************/
/* Table Name: p_content */
/**********************************/
CREATE TABLE p_content(
		contentno                     		MEDIUMINT(7)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT 'contentno',
		title                         		VARCHAR(200)		 NOT NULL COMMENT 'title',
		content                       		MEDIUMTEXT		 NOT NULL COMMENT 'content',
		file                          		VARCHAR(100)		 NULL  COMMENT 'file',
		file1                         		VARCHAR(300)		 NULL  COMMENT 'file1',
		itemnum                       		VARCHAR(50)		 NOT NULL COMMENT 'itemnum',
		replycnt                      		TEXT		 NOT NULL COMMENT 'replycnt',
		money                         		MEDIUMINT(7)		 NOT NULL COMMENT 'money',
		productcnt                    		MEDIUMINT(7)		 NULL  COMMENT 'productcnt',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='p_content';

/**********************************/
/* Table Name: 배송주소록 */
/**********************************/
CREATE TABLE deliveryaddr(
		dno                           		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
		dcategory                     		VARCHAR(30)		 NOT NULL COMMENT '카테고리',
		dname                         		VARCHAR(30)		 NOT NULL COMMENT '이름',
		dzipcode                      		VARCHAR(10)		 NULL  COMMENT '우편번호',
		daddr1                        		VARCHAR(80)		 NULL  COMMENT '주소1',
		daddr2                        		VARCHAR(50)		 NULL  COMMENT '주소2',
		dphone                        		VARCHAR(20)		 NULL  COMMENT '휴대전화',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='배송주소록';

/**********************************/
/* Table Name: 주문/결제 */
/**********************************/
CREATE TABLE payment(
		payno                         		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
		item                          		TEXT		 NOT NULL COMMENT '결재할 물품',
		orderno                       		VARCHAR(200)		 NOT NULL COMMENT '상품번호',
		payfile1                      		VARCHAR(100)		 NOT NULL COMMENT '결제할 물품 사진',
		pcnt                          		SMALLINT		 DEFAULT 0		 NOT NULL COMMENT '상품 개수',
		paymoney                      		MEDIUMINT		 NOT NULL COMMENT '결제금액',
		paycharge                     		CHAR(1)		 DEFAULT 'N'		 NOT NULL COMMENT '결제여부',
		resive_name                   		VARCHAR(30)		 NULL  COMMENT '받는사람',
		resive_post                   		VARCHAR(10)		 NULL  COMMENT '받는사람우편번호',
		resive_addr1                  		VARCHAR(80)		 NULL  COMMENT '받는주소1',
		resive_addr2                  		VARCHAR(50)		 NULL  COMMENT '받는주소2',
		resive_phone                  		VARCHAR(20)		 NULL  COMMENT '받는사람전화번호',
		paymeans                      		VARCHAR(10)		 NOT NULL COMMENT '결재방식',
		card_input                    		VARCHAR(20)		 NULL  COMMENT '카드결제',
		discount                      		MEDIUMINT		 DEFAULT 0		 NULL  COMMENT '카드할부',
		deposit_input                 		VARCHAR(20)		 NULL  COMMENT '무통장입금',
		phone_input                   		VARCHAR(10)		 NULL  COMMENT '핸드폰결제',
		payday                        		DATETIME		 NOT NULL COMMENT '결재날짜',
		contentno                     		MEDIUMINT(7)		 NULL  COMMENT 'contentno',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
		dno                           		INT(10)		 NULL  COMMENT '번호',
  FOREIGN KEY (contentno) REFERENCES p_content (contentno),
  FOREIGN KEY (mno) REFERENCES member (mno),
  FOREIGN KEY (dno) REFERENCES deliveryaddr (dno)
) COMMENT='주문/결제';

/**********************************/
/* Table Name: 배송추적 */
/**********************************/
CREATE TABLE trace(
		traceno                       		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '배송번호',
		waybil                        		BIGINT		 NOT NULL COMMENT '송장번호',
		trace_state                   		VARCHAR(100)		 NOT NULL COMMENT '배송상태',
		tdate                         		DATETIME		 NOT NULL COMMENT '배송일',
		agent                         		VARCHAR(100)		 NOT NULL COMMENT '대리점',
		manager                       		VARCHAR(20)		 NOT NULL COMMENT '담당자',
		manager_phone                 		VARCHAR(30)		 NOT NULL COMMENT '담당자전화번호',
		content                       		VARCHAR(200)		 NOT NULL COMMENT '구분',
		payno                         		INT(10)		 NULL  COMMENT '번호',
  FOREIGN KEY (payno) REFERENCES payment (payno)
) COMMENT='배송추적';

/**********************************/
/* Table Name: 주문내역 */
/**********************************/
CREATE TABLE mypage(
		mypageno                      		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
		orderstate                    		VARCHAR(100)		 NOT NULL COMMENT '주문상태',
		ordersubmit                   		CHAR		 DEFAULT 'N'		 NULL  COMMENT '구매확정',
		point                         		MEDIUMINT		 DEFAULT 0		 NOT NULL COMMENT '포인트',
		payno                         		INT(10)		 NULL  COMMENT '번호',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
		traceno                       		MEDIUMINT(10)		 NULL  COMMENT '배송번호',
  FOREIGN KEY (payno) REFERENCES payment (payno),
  FOREIGN KEY (mno) REFERENCES member (mno),
  FOREIGN KEY (traceno) REFERENCES trace (traceno)
) COMMENT='주문내역';

/**********************************/
/* Table Name: 쿠폰 */
/**********************************/
CREATE TABLE coupon(
		couponno                      		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
		coupon_serial                 		VARCHAR(100)		 NOT NULL COMMENT '쿠폰번호',
		coupon_label                  		VARCHAR(100)		 NOT NULL COMMENT '쿠폰내역',
		coupon_money                  		VARCHAR		 NULL  COMMENT '쿠폰금액',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='쿠폰';

