/**********************************/
/* Table Name: ȸ�� */
/**********************************/
CREATE TABLE member(
		mno                           		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT 'mno',
		id                            		VARCHAR(20)		 NOT NULL COMMENT 'id',
		passwd                        		VARCHAR(20)		 NOT NULL COMMENT 'passwd',
		mname                         		VARCHAR(20)		 NOT NULL COMMENT 'mname',
		grade                         		CHAR(1)		 DEFAULT 'F'		 NOT NULL COMMENT 'ȸ�� ���',
		money                         		MEDIUMINT		 DEFAULT 0		 NOT NULL COMMENT '���űݾ�',
		point                         		MEDIUMINT		 DEFAULT 0		 NOT NULL COMMENT '����Ʈ',
		tel                           		VARCHAR(14)		 NOT NULL COMMENT 'tel',
		zipcode                       		VARCHAR(5)		 NULL  COMMENT 'zipcode',
		address1                      		VARCHAR(80)		 NULL  COMMENT 'address1',
		address2                      		VARCHAR(50)		 NULL  COMMENT 'address2',
		mdate                         		DATETIME		 NOT NULL COMMENT 'mdate',
  CONSTRAINT id UNIQUE (id)
) COMMENT='ȸ��';

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
/* Table Name: �ֹ�/���� */
/**********************************/
CREATE TABLE payment(
		payno                         		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
		item                          		TEXT		 NOT NULL COMMENT '������ ��ǰ',
		payfile1                      		VARCHAR(100)		 NOT NULL COMMENT '������ ��ǰ ����',
		pcnt                          		SMALLINT		 DEFAULT 0		 NOT NULL COMMENT '��ǰ ����',
		paymoney                      		MEDIUMINT		 NOT NULL COMMENT '�����ݾ�',
		contentno                     		MEDIUMINT(7)		 NULL  COMMENT 'contentno',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
  FOREIGN KEY (contentno) REFERENCES p_content (contentno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='�ֹ�/����';

/**********************************/
/* Table Name: �ֹ����� */
/**********************************/
CREATE TABLE incantation(
		ino                           		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
		incantateno                   		BIGINT		 NOT NULL COMMENT '�ֹ���ȣ',
		incantatedate                 		DATE		 NOT NULL COMMENT '�ֹ���',
		payno                         		BIGINT		 NOT NULL COMMENT '������ȣ',
		paymoney                      		MEDIUMINT		 NOT NULL COMMENT '�����ݾ�',
		thumbfile                     		VARCHAR(100)		 NOT NULL COMMENT '����',
		orderstate                    		VARCHAR(10)		 NOT NULL COMMENT '�ֹ�����',
		ordersubmit                   		CHAR		 DEFAULT 'N'		 NULL  COMMENT '����Ȯ��',
  FOREIGN KEY (payno) REFERENCES payment (payno)
) COMMENT='�ֹ�����';

/**********************************/
/* Table Name: ������� */
/**********************************/
CREATE TABLE trace(
		deleveryno                    		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��۹�ȣ',
		delevery_state                		VARCHAR(100)		 NOT NULL COMMENT '��ۻ���',
		delevery_addr                 		VARCHAR(500)		 NOT NULL COMMENT '����ּ�',
		payno                         		INT(10)		 NULL  COMMENT '��ȣ',
  FOREIGN KEY (payno) REFERENCES payment (payno)
) COMMENT='�������';

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

