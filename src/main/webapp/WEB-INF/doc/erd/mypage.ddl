/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE member(
		mno                           		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT 'mno',
		id                            		VARCHAR(20)		 NOT NULL COMMENT 'id',
		passwd                        		VARCHAR(20)		 NOT NULL COMMENT 'passwd',
		mname                         		VARCHAR(20)		 NOT NULL COMMENT 'mname',
		Grade                         		CHAR(1)		 DEFAULT 'F'		 NOT NULL COMMENT '회원 등급',
		tel                           		VARCHAR(14)		 NOT NULL COMMENT 'tel',
		zipcode                       		VARCHAR(5)		 NULL  COMMENT 'zipcode',
		address1                      		VARCHAR(80)		 NULL  COMMENT 'address1',
		address2                      		VARCHAR(50)		 NULL  COMMENT 'address2',
		mdate                         		DATETIME		 NOT NULL COMMENT 'mdate',
		payno                         		INT(10)		 NULL  COMMENT '번호',
  CONSTRAINT id UNIQUE (id)
) COMMENT='회원';

/**********************************/
/* Table Name: 주문내역 */
/**********************************/
CREATE TABLE order(
		orderno                       		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
		orderno                       		MEDIUMINT		 NOT NULL COMMENT '주문번호',
		orderdate                     		DATE		 NOT NULL COMMENT '주문일',
		payno                         		MEDIUMINT		 NOT NULL COMMENT '결제번호',
		paymoney                      		BIGINT		 NOT NULL COMMENT '결제금액',
		thumbfile                     		VARCHAR(100)		 NOT NULL COMMENT '파일',
		orderstate                    		VARCHAR(10)		 NOT NULL COMMENT '주문상태',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='주문내역';

/**********************************/
/* Table Name: 회원포인트 */
/**********************************/
CREATE TABLE point(
		pointno                       		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '포인트번호',
		point                         		MEDIUMINT		 DEFAULT 0		 NOT NULL COMMENT '포인트점수',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='회원포인트';

/**********************************/
/* Table Name: 배송추적 */
/**********************************/
CREATE TABLE trace(
		deleveryno                    		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '배송번호',
		delevery_state                		VARCHAR(100)		 NOT NULL COMMENT '배송상태',
		delevery_addr                 		VARCHAR(500)		 NOT NULL COMMENT '배송주소',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='배송추적';

/**********************************/
/* Table Name: 주문/결제 */
/**********************************/
CREATE TABLE payment(
		payno                         		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
		item                          		TEXT		 NOT NULL COMMENT '결재할 물품',
		payfile1                      		VARCHAR(100)		 NOT NULL COMMENT '결제할 물품 사진',
		pcnt                          		SMALLINT		 DEFAULT 0		 NOT NULL COMMENT '상품 개수',
		paymoney                      		MEDIUMINT		 NOT NULL COMMENT '결제금액',
		delivemoney                   		SMALLINT		 NULL  COMMENT '배송비',
		orderno                       		INT(10)		 NULL  COMMENT '번호',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
		gno                           		MEDIUMINT(10)		 NULL  COMMENT '번호',
  FOREIGN KEY (mno) REFERENCES member (mno),
  FOREIGN KEY (payno) REFERENCES point (pointno),
  FOREIGN KEY (payno) REFERENCES trace (deleveryno)
) COMMENT='주문/결제';

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

