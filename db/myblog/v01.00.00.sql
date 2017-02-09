--version:01.00.00	create by Lanwei-HNU 
CREATE TABLE `cust_info` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL COMMENT '用户名',
  `name_py` VARCHAR(45) NOT NULL COMMENT '用户名拼音',
  `password` VARCHAR(45) NOT NULL COMMENT '用户密码',
  `mobile_phone` VARCHAR(45) NULL COMMENT '用户手机号码',
  `email` VARCHAR(45) NULL COMMENT '用户名邮箱',
  PRIMARY KEY (`id`))
COMMENT = '用户基础信息表';
