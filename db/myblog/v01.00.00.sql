--version:01.00.00	create by Lanwei-HNU 
CREATE TABLE `cust_info` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL COMMENT '�û���',
  `name_py` VARCHAR(45) NOT NULL COMMENT '�û���ƴ��',
  `password` VARCHAR(45) NOT NULL COMMENT '�û�����',
  `mobile_phone` VARCHAR(45) NULL COMMENT '�û��ֻ�����',
  `email` VARCHAR(45) NULL COMMENT '�û�������',
  PRIMARY KEY (`id`))
COMMENT = '�û�������Ϣ��';
