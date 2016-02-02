/**********************************/
/* Table Name: ȸ�� */
/**********************************/
CREATE TABLE member(
		mno                           		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT 'mno',
		id                            		VARCHAR(20)		 NOT NULL COMMENT 'id',
		passwd                        		VARCHAR(20)		 NOT NULL COMMENT 'passwd',
		mname                         		VARCHAR(20)		 NOT NULL COMMENT 'mname',
		Grade                         		CHAR(1)		 DEFAULT 'F'		 NOT NULL COMMENT 'ȸ�� ���',
		tel                           		VARCHAR(14)		 NOT NULL COMMENT 'tel',
		zipcode                       		VARCHAR(5)		 NULL  COMMENT 'zipcode',
		address1                      		VARCHAR(80)		 NULL  COMMENT 'address1',
		address2                      		VARCHAR(50)		 NULL  COMMENT 'address2',
		mdate                         		DATETIME		 NOT NULL COMMENT 'mdate',
		payno                         		INT(10)		 NULL  COMMENT '��ȣ',
  CONSTRAINT id UNIQUE (id)
) COMMENT='ȸ��';

/**********************************/
/* Table Name: �ֹ����� */
/**********************************/
CREATE TABLE order(
		orderno                       		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
		orderno                       		MEDIUMINT		 NOT NULL COMMENT '�ֹ���ȣ',
		orderdate                     		DATE		 NOT NULL COMMENT '�ֹ���',
		payno                         		MEDIUMINT		 NOT NULL COMMENT '������ȣ',
		paymoney                      		BIGINT		 NOT NULL COMMENT '�����ݾ�',
		thumbfile                     		VARCHAR(100)		 NOT NULL COMMENT '����',
		orderstate                    		VARCHAR(10)		 NOT NULL COMMENT '�ֹ�����',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='�ֹ�����';

/**********************************/
/* Table Name: ȸ������Ʈ */
/**********************************/
CREATE TABLE point(
		pointno                       		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '����Ʈ��ȣ',
		point                         		MEDIUMINT		 DEFAULT 0		 NOT NULL COMMENT '����Ʈ����',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='ȸ������Ʈ';

/**********************************/
/* Table Name: ������� */
/**********************************/
CREATE TABLE trace(
		deleveryno                    		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��۹�ȣ',
		delevery_state                		VARCHAR(100)		 NOT NULL COMMENT '��ۻ���',
		delevery_addr                 		VARCHAR(500)		 NOT NULL COMMENT '����ּ�',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='�������';

/**********************************/
/* Table Name: �ֹ�/���� */
/**********************************/
CREATE TABLE payment(
		payno                         		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
		item                          		TEXT		 NOT NULL COMMENT '������ ��ǰ',
		payfile1                      		VARCHAR(100)		 NOT NULL COMMENT '������ ��ǰ ����',
		pcnt                          		SMALLINT		 DEFAULT 0		 NOT NULL COMMENT '��ǰ ����',
		paymoney                      		MEDIUMINT		 NOT NULL COMMENT '�����ݾ�',
		delivemoney                   		SMALLINT		 NULL  COMMENT '��ۺ�',
		orderno                       		INT(10)		 NULL  COMMENT '��ȣ',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
		gno                           		MEDIUMINT(10)		 NULL  COMMENT '��ȣ',
  FOREIGN KEY (mno) REFERENCES member (mno),
  FOREIGN KEY (payno) REFERENCES point (pointno),
  FOREIGN KEY (payno) REFERENCES trace (deleveryno)
) COMMENT='�ֹ�/����';

/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE coupon(
		couponno                      		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
		coupon_serial                 		VARCHAR(100)		 NOT NULL COMMENT '������ȣ',
		coupon_label                  		VARCHAR(100)		 NOT NULL COMMENT '��������',
		coupon_money                  		VARCHAR		 NULL  COMMENT '�����ݾ�',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='����';

