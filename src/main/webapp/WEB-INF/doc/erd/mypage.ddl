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
/* Table Name: ����ּҷ� */
/**********************************/
CREATE TABLE deliveryaddr(
		dno                           		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
		dcategory                     		VARCHAR(30)		 NOT NULL COMMENT 'ī�װ�',
		dname                         		VARCHAR(30)		 NOT NULL COMMENT '�̸�',
		dzipcode                      		VARCHAR(10)		 NULL  COMMENT '�����ȣ',
		daddr1                        		VARCHAR(80)		 NULL  COMMENT '�ּ�1',
		daddr2                        		VARCHAR(50)		 NULL  COMMENT '�ּ�2',
		dphone                        		VARCHAR(20)		 NULL  COMMENT '�޴���ȭ',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='����ּҷ�';

/**********************************/
/* Table Name: �ֹ�/���� */
/**********************************/
CREATE TABLE payment(
		payno                         		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
		item                          		TEXT		 NOT NULL COMMENT '������ ��ǰ',
		orderno                       		VARCHAR(200)		 NOT NULL COMMENT '��ǰ��ȣ',
		payfile1                      		VARCHAR(100)		 NOT NULL COMMENT '������ ��ǰ ����',
		pcnt                          		SMALLINT		 DEFAULT 0		 NOT NULL COMMENT '��ǰ ����',
		paymoney                      		MEDIUMINT		 NOT NULL COMMENT '�����ݾ�',
		paycharge                     		CHAR(1)		 DEFAULT 'N'		 NOT NULL COMMENT '��������',
		resive_name                   		VARCHAR(30)		 NULL  COMMENT '�޴»��',
		resive_post                   		VARCHAR(10)		 NULL  COMMENT '�޴»�������ȣ',
		resive_addr1                  		VARCHAR(80)		 NULL  COMMENT '�޴��ּ�1',
		resive_addr2                  		VARCHAR(50)		 NULL  COMMENT '�޴��ּ�2',
		resive_phone                  		VARCHAR(20)		 NULL  COMMENT '�޴»����ȭ��ȣ',
		paymeans                      		VARCHAR(10)		 NOT NULL COMMENT '������',
		card_input                    		VARCHAR(20)		 NULL  COMMENT 'ī�����',
		discount                      		MEDIUMINT		 DEFAULT 0		 NULL  COMMENT 'ī���Һ�',
		deposit_input                 		VARCHAR(20)		 NULL  COMMENT '�������Ա�',
		phone_input                   		VARCHAR(10)		 NULL  COMMENT '�ڵ�������',
		payday                        		DATETIME		 NOT NULL COMMENT '���糯¥',
		contentno                     		MEDIUMINT(7)		 NULL  COMMENT 'contentno',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
		dno                           		INT(10)		 NULL  COMMENT '��ȣ',
  FOREIGN KEY (contentno) REFERENCES p_content (contentno),
  FOREIGN KEY (mno) REFERENCES member (mno),
  FOREIGN KEY (dno) REFERENCES deliveryaddr (dno)
) COMMENT='�ֹ�/����';

/**********************************/
/* Table Name: ������� */
/**********************************/
CREATE TABLE trace(
		traceno                       		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��۹�ȣ',
		waybil                        		BIGINT		 NOT NULL COMMENT '�����ȣ',
		trace_state                   		VARCHAR(100)		 NOT NULL COMMENT '��ۻ���',
		tdate                         		DATETIME		 NOT NULL COMMENT '�����',
		agent                         		VARCHAR(100)		 NOT NULL COMMENT '�븮��',
		manager                       		VARCHAR(20)		 NOT NULL COMMENT '�����',
		manager_phone                 		VARCHAR(30)		 NOT NULL COMMENT '�������ȭ��ȣ',
		content                       		VARCHAR(200)		 NOT NULL COMMENT '����',
		payno                         		INT(10)		 NULL  COMMENT '��ȣ',
  FOREIGN KEY (payno) REFERENCES payment (payno)
) COMMENT='�������';

/**********************************/
/* Table Name: �ֹ����� */
/**********************************/
CREATE TABLE mypage(
		mypageno                      		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��ȣ',
		orderstate                    		VARCHAR(100)		 NOT NULL COMMENT '�ֹ�����',
		ordersubmit                   		CHAR		 DEFAULT 'N'		 NULL  COMMENT '����Ȯ��',
		point                         		MEDIUMINT		 DEFAULT 0		 NOT NULL COMMENT '����Ʈ',
		payno                         		INT(10)		 NULL  COMMENT '��ȣ',
		mno                           		INT(10)		 NULL  COMMENT 'mno',
		traceno                       		MEDIUMINT(10)		 NULL  COMMENT '��۹�ȣ',
  FOREIGN KEY (payno) REFERENCES payment (payno),
  FOREIGN KEY (mno) REFERENCES member (mno),
  FOREIGN KEY (traceno) REFERENCES trace (traceno)
) COMMENT='�ֹ�����';

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

