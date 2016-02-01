/**********************************/
/* Table Name: 분류 */
/**********************************/
CREATE TABLE code(
		codeno                        		MEDIUMINT(7)		 NOT NULL AUTO_INCREMENT COMMENT 'codeno',
		sort                          		VARCHAR(50)		 NOT NULL COMMENT 'sort'
) COMMENT='분류';

/**********************************/
/* Table Name: 카테고리 */
/**********************************/
CREATE TABLE phonecategory(
		phonecategoryno               		MEDIUMINT(7)		 NOT NULL AUTO_INCREMENT COMMENT 'phonecategoryno',
		title                         		VARCHAR(50)		 NOT NULL COMMENT 'title',
		orderno                       		SMALLINT(5)		 NOT NULL COMMENT 'orderno',
		visible                       		CHAR(1)		 NOT NULL COMMENT 'visible',
		ids                           		VARCHAR(100)		 NOT NULL COMMENT 'ids',
		cnt                           		MEDIUMINT(7)		 NOT NULL COMMENT 'cnt',
		codeno                        		MEDIUMINT(7)		 NULL  COMMENT 'codeno'
) COMMENT='카테고리';

/**********************************/
/* Table Name: 내용 */
/**********************************/
CREATE TABLE phoneoption(
		optionno                      		MEDIUMINT(7)		 NOT NULL AUTO_INCREMENT COMMENT 'optionno',
		title                         		VARCHAR(200)		 NOT NULL COMMENT 'title',
		content                       		MEDIUMTEXT		 NOT NULL COMMENT 'content',
		file                          		VARCHAR(100)		 NULL  COMMENT 'file',
		file1                         		VARCHAR(300)		 NULL  COMMENT 'file1',
		replycnt                      		SMALLINT(5)		 NOT NULL COMMENT 'replycnt',
		phonecategoryno               		MEDIUMINT(7)		 NULL  COMMENT 'phonecategoryno'
) COMMENT='내용';


ALTER TABLE code ADD CONSTRAINT IDX_code_PK PRIMARY KEY (codeno);

ALTER TABLE phonecategory ADD CONSTRAINT IDX_phonecategory_PK PRIMARY KEY (phonecategoryno);
ALTER TABLE phonecategory ADD CONSTRAINT IDX_phonecategory_FK0 FOREIGN KEY (codeno) REFERENCES code (codeno);
CREATE INDEX codeno ON phonecategory (codeno);

ALTER TABLE phoneoption ADD CONSTRAINT IDX_phoneoption_PK PRIMARY KEY (optionno);
ALTER TABLE phoneoption ADD CONSTRAINT IDX_phoneoption_FK0 FOREIGN KEY (phonecategoryno) REFERENCES phonecategory (phonecategoryno);
CREATE INDEX blogcategoryno ON phoneoption (blogcategoryno);

