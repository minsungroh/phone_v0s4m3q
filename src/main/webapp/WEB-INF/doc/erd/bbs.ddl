/**********************************/
/* Table Name: ȸ�� */
/**********************************/
CREATE TABLE member(
		mno                           		INT		 NOT NULL AUTO_INCREMENT COMMENT '��ȣ',
		id                            		VARCHAR(20)		 NOT NULL COMMENT '���̵�',
		passwd                        		VARCHAR(20)		 NOT NULL COMMENT '�н�����',
		mname                         		VARCHAR(20)		 NOT NULL COMMENT '�̸�',
		tel                           		VARCHAR(14)		 NOT NULL COMMENT '����ó',
		zipcode                       		VARCHAR(5)		 NULL  COMMENT '�����ȣ',
		address1                      		VARCHAR(80)		 NULL  COMMENT '�ּ�',
		address2                      		VARCHAR(50)		 NULL  COMMENT '�ּ�2',
		mdate                         		DATETIME		 NOT NULL COMMENT '��¥'
) COMMENT='ȸ��';

/**********************************/
/* Table Name: �����Խ��� */
/**********************************/
CREATE TABLE art3(
		art3no                        		MEDIUMINT		 NOT NULL AUTO_INCREMENT COMMENT '��ȣ',
		rname                         		VARCHAR(20)		 NOT NULL COMMENT 'rname',
		email                         		VARCHAR(100)		 NULL  COMMENT 'email',
		title                         		VARCHAR(200)		 NOT NULL COMMENT 'title',
		content                       		VARCHAR(4000)		 NOT NULL COMMENT 'content',
		passwd                        		VARCHAR(15)		 NOT NULL COMMENT 'passwd',
		cnt                           		SMALLINT(5)		 NULL  COMMENT 'cnt',
		rdate                         		DATETIME		 NOT NULL COMMENT 'rdate',
		url                           		VARCHAR(100)		 NULL  COMMENT 'url'
) COMMENT='�����Խ���';

/**********************************/
/* Table Name: ������ */
/**********************************/
CREATE TABLE admin1(
		admin1no                      		INT		 NOT NULL AUTO_INCREMENT COMMENT '��ȣ',
		email                         		VARCHAR(50)		 NOT NULL COMMENT '�̸���',
		passwd                        		VARCHAR(20)		 NOT NULL COMMENT '�н�����',
		auth                          		VARCHAR(20)		 NOT NULL COMMENT '���������ڵ�',
		act                           		CHAR(1)		 NOT NULL COMMENT '����',
		confirm                       		CHAR(1)		 NOT NULL COMMENT '�̸��ϸ�ũŬ������',
		mdate                         		DATETIME		 NOT NULL COMMENT '��¥',
		mno                           		INT		 NULL  COMMENT '��ȣ',
		art3no                        		MEDIUMINT		 NULL  COMMENT '��ȣ'
) COMMENT='������';


ALTER TABLE member ADD CONSTRAINT IDX_member_PK PRIMARY KEY (mno);
ALTER TABLE member ADD CONSTRAINT id UNIQUE (id);

ALTER TABLE art3 ADD CONSTRAINT IDX_art3_PK PRIMARY KEY (art3no);

ALTER TABLE admin1 ADD CONSTRAINT IDX_admin1_PK PRIMARY KEY (admin1no);
ALTER TABLE admin1 ADD CONSTRAINT IDX_admin1_FK0 FOREIGN KEY (mno) REFERENCES member (mno);
ALTER TABLE admin1 ADD CONSTRAINT IDX_admin1_FK1 FOREIGN KEY (art3no) REFERENCES art3 (art3no);
ALTER TABLE admin1 ADD CONSTRAINT email UNIQUE (email);

