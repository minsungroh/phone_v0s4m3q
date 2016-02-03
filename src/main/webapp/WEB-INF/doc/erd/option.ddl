/**********************************/
/* Table Name: �з� */
/**********************************/
CREATE TABLE p_code(
		codeno                        		MEDIUMINT(7)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '�ڵ��ȣ',
		sort                          		VARCHAR(50)		 NOT NULL COMMENT '�з�'
) COMMENT='�з�';

/**********************************/
/* Table Name: ī�װ� */
/**********************************/
CREATE TABLE p_category(
		phonecategoryno               		MEDIUMINT(7)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT 'ī�װ���ȣ',
		title                         		VARCHAR(50)		 NOT NULL COMMENT '����',
		orderno                       		SMALLINT(5)		 NOT NULL COMMENT '���ļ���',
		visible                       		CHAR(1)		 NOT NULL COMMENT '��������',
		ids                           		VARCHAR(100)		 NOT NULL COMMENT '��������',
		cnt                           		MEDIUMINT(7)		 NOT NULL COMMENT '��ϵ� �� ��',
		codeno                        		MEDIUMINT(7)		 NULL  COMMENT '�ڵ��ȣ',
  FOREIGN KEY (codeno) REFERENCES p_code (codeno)
) COMMENT='ī�װ�';

/**********************************/
/* Table Name: ��ǰ���� */
/**********************************/
CREATE TABLE p_content(
		contentno                     		MEDIUMINT(7)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��ǰ��ȣ',
		title                         		VARCHAR(200)		 NOT NULL COMMENT 'ī�װ� ����',
		content                       		MEDIUMTEXT		 NOT NULL COMMENT '����',
		file                          		VARCHAR(100)		 NULL  COMMENT 'Thumb����',
		file1                         		VARCHAR(300)		 NULL  COMMENT '÷������',
		replycnt                      		SMALLINT(5)		 NOT NULL COMMENT '���',
		phonecategoryno               		MEDIUMINT(7)		 NULL  COMMENT 'ī�װ���ȣ',
  FOREIGN KEY (phonecategoryno) REFERENCES p_category (phonecategoryno)
) COMMENT='��ǰ����';

