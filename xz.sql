SET NAMES UTF8;
DROP DATABASE IF EXISTS ymx;
CREATE DATABASE ymx CHARSET=UTF8;
USE ymx;
/**商品类别**/
CREATE TABLE ymx_product_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);


/**6类商品中分别又有哪些型号**/
CREATE TABLE kind_of_everyfalimy(
  kid INT PRIMARY KEY AUTO_INCREMENT,   #小类别编号
  all_id  INT,                          #所属大类别编号
  title VARCHAR(64)                    #类别名称
);


/**电子产品类别**/
CREATE TABLE all_elect_product(
  cid INT PRIMARY KEY AUTO_INCREMENT,    #商品编号
  family_id INT,              #所属小类别编号
  big_falimily_id INT,        #所属大类别编号
  title VARCHAR(128),         #主标题
  subtitle VARCHAR(128),      #副标题
  price DECIMAL(10,2),        #价格
  promise VARCHAR(64),        #服务承诺
  spec VARCHAR(64),           #规格
  color VARCHAR(64),          #颜色
  is_onsale BOOLEAN,          #是否促销中
  hour_time INT,              #小时
  minute_time INT,            #分钟
  second_time INT             #秒钟
);
/**电子产品图片**/
CREATE TABLE ymx_elect_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  laptop_id INT,              #产品编号
  sm VARCHAR(128),            #小图片路径
  md VARCHAR(128),            #中图片路径
  lg VARCHAR(128),            #大图片路径
  spe VARCHAR(128)            #规格图片
);
/****首页商品????????????????????????????????****/
CREATE TABLE xz_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  details VARCHAR(128),
  pic VARCHAR(128),
  price DECIMAL(10,2),
  href VARCHAR(128),
  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT
);
/******数据导入******/
/**商品类别**/
INSERT INTO ymx_product_family VALUES
 (1,'电子产品'),
 (2,'图书'),
 (3,'衣服鞋子'),
 (4,'运动户外'),
 (5,'美妆'),
 (6,'玩具');

/**6类商品中分别又有哪些型号**/
INSERT INTO kind_of_everyfalimy VALUES
(1,1,'Huawei 华为 MateBook X 13英寸全金属超轻薄笔记本电脑');

/**电子商品???？？？？？？？？？？？？？？？？？？？？？？？？此处不知道咋写**/
/**华为类产品1**/
INSERT INTO all_elect_product VALUES
(1,1,1,'Huawei 华为 MateBook X 13英寸全金属超轻薄笔记本电脑(i5-7200U  
Win10 内含拓展坞)','Huawei 华为',6509,'买家收货后，亚马逊支付给卖家。
支持礼品卡、一键信用卡支付、银行卡等，但不支持货到付款',
'双核i5 4G+256G','流光金',true,12,24,50),
(2,1,1,'Huawei 华为 MateBook X 13英寸全金属超轻薄笔记本电脑(i5-7200U  
Win10 内含拓展坞)','Huawei 华为',6509,'买家收货后，亚马逊支付给卖家。
支持礼品卡、一键信用卡支付、银行卡等，但不支持货到付款',
'双核i5 8G+256G','流光金',true,12,24,50),
(3,1,1,'Huawei 华为 MateBook X 13英寸全金属超轻薄笔记本电脑(i5-7200U  
Win10 内含拓展坞)','Huawei 华为',6509,'买家收货后，亚马逊支付给卖家。
支持礼品卡、一键信用卡支付、银行卡等，但不支持货到付款',
'双核i5 4G+256G','深空灰',true,12,24,50),
(4,1,1,'Huawei 华为 MateBook X 13英寸全金属超轻薄笔记本电脑(i5-7200U  
Win10 内含拓展坞)','Huawei 华为',6509,'买家收货后，亚马逊支付给卖家。
支持礼品卡、一键信用卡支付、银行卡等，但不支持货到付款',
'双核i5 8G+256G','深空灰',true,12,24,50);


/**电子类产品图片**/
/**华为商品1**/
INSERT INTO ymx_elect_pic VALUES
(NULL, 1, 'img/product/1_1_sm.jpg','img/product/1_1_md.jpg',
'img/product/1_1_lg.jpg','img/product/1_4.png'),
(NULL, 1, 'img/product/1_2_sm.jpg','img/product/1_2_md.jpg',
'img/product/1_2_lg.jpg','img/product/1_4.png'),
(NULL, 1, 'img/product/1_3_sm.jpg','img/product/1_3_md.jpg',
'img/product/1_3_lg.jpg','img/product/1_4.png'),
(NULL, 2, 'img/product/2_1_sm.jpg','img/product/2_1_md.jpg',
'img/product/2_1_lg.jpg','img/product/2_4.png'),
(NULL, 2, 'img/product/2_2_sm.jpg','img/product/2_2_md.jpg',
'img/product/2_2_lg.jpg','img/product/2_4.png'),
(NULL, 2, 'img/product/2_3_sm.jpg','img/product/2_3_md.jpg',
'img/product/2_3_lg.jpg','img/product/2_4.png'),
(NULL, 3, 'img/product/3_1_sm.jpg','img/product/3_1_md.jpg',
'img/product/3_1_lg.jpg','img/product/3_4.png'),
(NULL, 3, 'img/product/3_2_sm.jpg','img/product/3_2_md.jpg',
'img/product/3_2_lg.jpg','img/product/3_4.png'),
(NULL, 3, 'img/product/3_3_sm.jpg','img/product/3_3_md.jpg',
'img/product/3_3_lg.jpg','img/product/3_4.png'),
(NULL, 4, 'img/product/4_1_sm.jpg','img/product/4_1_md.jpg',
'img/product/4_1_lg.jpg','img/product/4_4.png'),
(NULL, 4, 'img/product/4_2_sm.jpg','img/product/4_2_md.jpg',
'img/product/4_2_lg.jpg','img/product/4_4.png'),
(NULL, 4, 'img/product/4_3_sm.jpg','img/product/4_3_md.jpg',
'img/product/4_3_lg.jpg','img/product/4_4.png');

