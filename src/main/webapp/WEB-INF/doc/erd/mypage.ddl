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
		point                         		MEDIUMINT		 DEFAULT 0		 NOT NULL COMMENT '포인트',
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
/* Table Name: 주문/결제 */
/**********************************/
CREATE TABLE payment(
		payno                         		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
		item                          		TEXT		 NOT NULL COMMENT '결재할 물품',
		payfile1                      		VARCHAR(100)		 NOT NULL COMMENT '결제할 물품 사진',
		pcnt                          		SMALLINT		 DEFAULT 0		 NOT NULL COMMENT '상품 개수',
		paymoney                      		MEDIUMINT		 NOT NULL COMMENT '결제금액',
		contentno                     		MEDIUMINT(7)		 NULL  COMMENT 'contentno',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
  FOREIGN KEY (contentno) REFERENCES p_content (contentno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='주문/결제';

/**********************************/
/* Table Name: 주문내역 */
/**********************************/
CREATE TABLE incantation(
		ino                           		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
		incantateno                   		BIGINT		 NOT NULL COMMENT '주문번호',
		incantatedate                 		DATE		 NOT NULL COMMENT '주문일',
		payno                         		BIGINT		 NOT NULL COMMENT '결제번호',
		paymoney                      		MEDIUMINT		 NOT NULL COMMENT '결제금액',
		thumbfile                     		VARCHAR(100)		 NOT NULL COMMENT '파일',
		orderstate                    		VARCHAR(10)		 NOT NULL COMMENT '주문상태',
		ordersubmit                   		CHAR		 DEFAULT 'N'		 NULL  COMMENT '구매확정',
  FOREIGN KEY (payno) REFERENCES payment (payno)
) COMMENT='주문내역';

/**********************************/
/* Table Name: 배송추적 */
/**********************************/
CREATE TABLE trace(
		deleveryno                    		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '배송번호',
		delevery_state                		VARCHAR(100)		 NOT NULL COMMENT '배송상태',
		delevery_addr                 		VARCHAR(500)		 NOT NULL COMMENT '배송주소',
		payno                         		INT(10)		 NULL  COMMENT '번호',
  FOREIGN KEY (payno) REFERENCES payment (payno)
) COMMENT='배송추적';

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

