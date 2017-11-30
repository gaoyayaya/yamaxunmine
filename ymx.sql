SET NAMES UTF8;
DROP DATABASE IF EXISTS ymx;
CREATE DATABASE ymx CHARSET=UTF8;
USE ymx;

/**表1-----------商品类别**/
CREATE TABLE ymx_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32),
  pic   VARCHAR(32),
  href  VARCHAR(64),
  title VARCHAR(64),
  subtitle VARCHAR(64)
);

/**表2-----------6类商品中分别又有哪些型号**/
CREATE TABLE kind_of_everyfalimy(
  kid INT PRIMARY KEY AUTO_INCREMENT,   #小类别编号
  all_id  INT,                          #所属大类别编号
  title VARCHAR(64),                    #类别名称
  price VARCHAR(64),                    #价格区间
  img VARCHAR(64)                       #图片
);

/**表3-----------电子产品表**/
CREATE TABLE elect_all_product(
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

/**表4----------电子产品图片**/
CREATE TABLE elect_all_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  laptop_id INT,              #产品编号
  sm VARCHAR(128),            #小图片路径
  md VARCHAR(128),            #中图片路径
  lg VARCHAR(128),            #大图片路径
  spe VARCHAR(128)            #规格图片
);

/*表5--------图书大类型表*/
/**1-中文图书，2-进口图书，3-电子书，4-教材教辅，5-少儿，6-文学艺术，
7-人文社科，8-经济管理，9-励志与成功**/
CREATE TABLE big_kind_book(
  zid INT PRIMARY KEY AUTO_INCREMENT,   #类别编号
  title VARCHAR(64),                    #类别名称
  count INT(100)                        #数量
);

/*表6--------图书小类型表*/
/**小类别：
1-文学，2-小说，3-传记....对应于网页的顺序**/
CREATE TABLE small_kind_book(
  bid INT PRIMARY KEY AUTO_INCREMENT,   #小类别编号
  all_id  INT,                          #所属大类别编号
  yy_id  INT,                          #所属图书类别编号
  title VARCHAR(64),                    #类别名称
  count INT(255)
);

/*表7--------图书总产品表*/
CREATE TABLE book_product(
  aid INT PRIMARY KEY AUTO_INCREMENT,   
  large_id INT,                         #所属总类别编号
  middle_id INT,                         #所属中类别编号
  small_id INT,                         #所属小类别编号
  title VARCHAR(100),                   #图书标题
  copy INT,                             #1:精装/0:平装/2:电子书
  on_sale INT,                          #0:不满减，1：满200减100,2:满100减50
  price FLOAT,                          #价格
  writer VARCHAR(20),                   #作者
  time INT,                             #上架时间
  send_way INT,                         #0:不免运费1：亚马逊配送（免运费）
  intro FLOAT,                          #评价星数
  introimg VARCHAR(64),                 #星数路径
  discount FLOAT,                       #打几折
  is_new INT                            #0:旧书/1:新书
);


/**表8-----------图书产品图片**/
CREATE TABLE book_list(
  hid INT PRIMARY KEY AUTO_INCREMENT,
  z_id INT,                  #书本编号
  lg_pic VARCHAR(32),        #大图路径
  md_pic VARCHAR(32),        #中图路径
  sm_pic VARCHAR(32)         #小图路径
);
/**表9-------------用户信息**/
CREATE TABLE ymx_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),
  avatar VARCHAR(128),        #头像图片路径
  user_name VARCHAR(32),      #用户名，如王小明
  gender INT                  #性别  0-女  1-男
);
/*******************/
/******数据导入******/
/*******************/

/**1---------商品类别**/
INSERT INTO ymx_family VALUES
 (1,'电子产品','img/index/banner1.jpg','5-book.html','全新Kindle Oasis','现货火热发售'),
 (2,'图书','img/index/banner2.jpg','5-book.html','满200元减100元','数万畅销图书'),
 (3,'居家生活','img/index/banner3.jpg','5-book.html','美好家庭生活','狂欢净享11.11'),
 (4,'玩具','img/index/banner4.jpg','5-book.html','LEGO乐高','99元起'),
 (5,'母婴','img/index/banner5.jpg','5-book.html','新生机，新活力','最高5折优惠'),
 (6,'运动户外','img/index/banner6.jpg','5-book.html','金秋出游热销','售价低至49元');

/**2---------6类商品中分别又有哪些型号**/
INSERT INTO kind_of_everyfalimy VALUES
(1,1,'Huawei 华为 MateBook X 13英寸全金属超轻薄笔记本电脑',
'6509-7509','img/product/elect/1_1_md.jpg');



/**3---------电子商品???？？？？？？？？？？？？？？？？？？？？？？？？此处不知道咋写**/
/**华为类产品1**/
INSERT INTO elect_all_product VALUES
(1,1,1,'Huawei 华为 MateBook X 13英寸全金属超轻薄笔记本电脑(i5-7200U  
Win10 内含拓展坞)','Huawei 华为',6509,'买家收货后，亚马逊支付给卖家。
支持礼品卡、一键信用卡支付、银行卡等，但不支持货到付款',
'双核i5 4G+256G','流光金',true,12,24,50),
(2,1,1,'Huawei 华为 MateBook X 13英寸全金属超轻薄笔记本电脑(i5-7200U  
Win10 内含拓展坞)','Huawei 华为',7509,'买家收货后，亚马逊支付给卖家。
支持礼品卡、一键信用卡支付、银行卡等，但不支持货到付款',
'双核i5 8G+256G','流光金',true,12,24,50),
(3,1,1,'Huawei 华为 MateBook X 13英寸全金属超轻薄笔记本电脑(i5-7200U  
Win10 内含拓展坞)','Huawei 华为',6509,'买家收货后，亚马逊支付给卖家。
支持礼品卡、一键信用卡支付、银行卡等，但不支持货到付款',
'双核i5 4G+256G','深空灰',true,12,24,50),
(4,1,1,'Huawei 华为 MateBook X 13英寸全金属超轻薄笔记本电脑(i5-7200U  
Win10 内含拓展坞)','Huawei 华为',7509,'买家收货后，亚马逊支付给卖家。
支持礼品卡、一键信用卡支付、银行卡等，但不支持货到付款',
'双核i5 8G+256G','深空灰',true,12,24,50);

/**4-----------电子类产品图片**/
/**华为商品1**/
INSERT INTO elect_all_pic VALUES
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

/*表5--------图书大类型表*/
INSERT INTO big_kind_book VALUES
(1,'中文图书',7),
(2,'进口图书',3),
(3,'电子书',6),
(4,'教材教辅',5),
(5,'少儿',5),
(6,'文学艺术',5),
(7,'人文社科',5),
(8,'经济管理',4),
(9,'励志与成功',4);

/*表6--------图书小类型表*/
INSERT INTO small_kind_book VALUES
(1,2,1,'教材教辅',2),
(2,2,1,'少儿',1),
(3,2,1,'文学',2),
(4,2,1,'社科',1),
(5,2,1,'经管',1),
(6,2,2,'Childrens` Books',1),
(7,2,2,'Literature` Fiction',1),
(8,2,2,'进口港台图书',1),
(9,2,3,'小说',1),
(10,2,3,'经管',1),
(11,2,3,'文学',1),
(12,2,3,'科技',1),
(13,2,3,'特价书',1),
(14,2,3,'网络小说',1),
(15,2,4,'考试',1),
(16,2,4,'外语学习',1),
(17,2,4,'教材',1),
(18,2,4,'中小学辅导',1),
(19,2,4,'工具书',1),
(20,2,5,'0-2岁',1),
(21,2,5,'3-6岁',1),
(22,2,5,'7-10岁',1),
(23,2,5,'11-14岁',1),
(24,2,5,'儿童绘本',1),
(25,2,6,'小说',1),
(26,2,6,'文学',1),
(27,2,6,'青春与动漫',1),
(28,2,6,'传记',1),
(29,2,6,'艺术',1),
(30,2,7,'历史',1),
(31,2,7,'国学古籍',1),
(32,2,7,'哲学与宗教',1),
(33,2,7,'法律',1),
(34,2,7,'心理学',1),
(35,2,8,'投资理财',1),
(36,2,8,'管理',1),
(37,2,8,'经济与金融',1),
(38,2,8,'市场营销',1),
(39,2,9,'心灵读物',1),
(40,2,9,'人际交往',1),
(41,2,9,'职场',1),
(42,2,9,'成功学',1);

/*表7--------图书总产品表*/
 /**编号，所属总类别，所属中类别，所属小类别，图书标题，1:精装/0:平装/2:电子书，
 0:不满减，1:满200减100,2:满100减50，价格，作者，上架时间，0:不免运费1：亚马逊配送（免运费），
评价星数，打几折**/
 
INSERT INTO book_product VALUES
(1,2,1,1,'肖秀荣2018考研政治命题人考点预测',0,0,25,'肖秀荣',5555555555555,1,3.5,'img/book/book-index/3-5start.jpg',7.8,0),
(2,2,1,1,'英语单词大书',1,1,55.4,'梅丽·卖金农',5555555555555,0,5,'img/book/book-index/5start.jpg',5,0),
(3,2,1,2,'米奇妙妙屋数学启蒙画故事书',0,2,63.7,'美国迪士尼公司',5555555555555,1,4,'img/book/book-index/4start.jpg',8,0),
(4,2,1,3,'解忧杂货铺',0,0,47.9,'东野圭吾',5555555555555,1,4.5,'img/book/book-index/4-5start.jpg',4.5,0),
(5,2,1,4,'丝绸之路：一部全新的世界史',1,0,62.72,'彼得·弗兰科潘',5555555555555,1,3.5,'img/book/book-index/3-5start.jpg',6,0),
(6,2,1,5,'数据思维(从数据分析到商业价值)',0,2,62.40,'王汉生',5555555555555,1,4,'img/book/book-index/4start.jpg',7,0),
(7,2,1,3,'父亲的失乐园',2,1,20.40,'阿里埃勒·萨巴尔',5555555555555,1,4.5,'img/book/book-index/4-5start.jpg',7.5,0),
(8,2,2,6,'I Am a Bunny(英语)',1,0,24.80,'Ole Risom',5555555555555,0,5,'img/book/book-index/5start.jpg',8.5,0),
(9,2,2,7,'Call me by your name',0,1,112.80,'Andre Aciman',5555555555555,1,3.5,'img/book/book-index/3-5start.jpg',5.5,0),
(10,2,2,8,'台版密码花园',1,2,4.80,'乔汉娜·贝斯福',5555555555555,0,4,'img/book/book-index/4start.jpg',9,0),
(11,2,3,9,'朱元璋传',2,0,27.40,'张宏杰',5555555555555,1,4.5,'img/book/book-index/4-5start.jpg',3,0),
(12,2,3,10,'特郎普自传',2,1,25.40,'唐纳德·特郎普',5555555555555,0,5,'img/book/book-index/5start.jpg',3.5,0),
(13,2,3,11,'悟空传',0,2,20.40,'今何在',5555555555555,1,3.5,'img/book/book-index/3-5start.jpg',4.5,0),
(14,2,3,12,'Python编程 从入门到实践',2,0,59.20,'埃里克',5555555555555,0,4,'img/book/book-index/4start.jpg',5.5,0),
(15,2,3,13,'杀死一只知更鸟',2,1,23.20,'哈珀·李',5555555555555,1,4.5,'img/book/book-index/4-5start.jpg',6.5,0),
(16,2,3,14,'楚乔传原著(特工皇妃)',2,2,41.20,'潇湘冬儿',5555555555555,1,5,'img/book/book-index/5start.jpg',7,0),
(17,2,4,15,'新东方·高中英语词汇',1,0,30.00,'俞敏洪',5555555555555,0,3.5,'img/book/book-index/3-5start.jpg',7.5,0),
(18,2,4,16,'英译中国现代散文选1',0,1,31.80,'张培根',5555555555555,1,4,'img/book/book-index/4start.jpg',8,0),
(19,2,4,17,'普通高等教育:高等数学(上册)(第七版)',1,2,29.50,'同济大学',5555555555555,0,4.5,'img/book/book-index/4-5start.jpg',8.5,0),
(20,2,4,18,'朝花夕拾(珍藏版)',0,0,13.86,'鲁迅',5555555555555,1,5,'img/book/book-index/5start.jpg',9,0),
(21,2,4,19,'英汉大词典(第二版)',1,1,182.10,'陆谷孙',5555555555555,0,3.5,'img/book/book-index/3-5start.jpg',9.5,1),
(22,2,5,20,'米菲Easy English双语阅读',0,2,42.54,'迪克·布鲁纳',5555555555555,1,4,'img/book/book-index/4start.jpg',1,1),
(23,2,5,21,'幼儿十万个为什么',1,0,56.99,'漫果文化',5555555555555,0,4.5,'img/book/book-index/4-5start.jpg',1.5,1),
(24,2,5,22,'培养孩子好性格的80个经典维尼故事',0,1,34.36,'美国迪士尼公司',5555555555555,1,5,'img/book/book-index/5start.jpg',2,1),
(25,2,5,23,'DK万物运转的秘密:给青少年的物理世界入门',1,3,66.60,'大麦·麦考利',5555555555555,0,3.5,'img/book/book-index/3-5start.jpg',2.5,1),
(26,2,5,24,'天啊，这本书没有名字',0,0,30.60,'埃尔维·杜莱',5555555555555,1,4,'img/book/book-index/4start.jpg',3,1),
(27,2,6,25,'我有一杯酒，可以慰风尘',1,1,28.66,'关东野客',5555555555555,0,4.5,'img/book/book-index/4-5start.jpg',3.5,1),
(28,2,6,26,'世界尽头的图书馆',0,2,19.50,'常鸿娜',5555555555555,1,5,'img/book/book-index/5start.jpg',4,1),
(29,2,6,27,'我又没有很想你',1,0,22.70,'伟大的安妮',5555555555555,0,3.5,'img/book/book-index/3-5start.jpg',4.5,1),
(30,2,6,28,'苏东坡传(经典珍藏版)',0,1,15.70,'林语堂',5555555555555,1,4,'img/book/book-index/4start.jpg',5,1),
(31,2,6,29,'设计中的设计',1,2,34.50,'原研',5555555555555,0,4.5,'img/book/book-index/4-5start.jpg',5.5,1),
(32,2,7,30,'历史的温度：寻找历史背面的故事、热血、真性情',0,0,35.70,'张玮',5555555555555,1,5,'img/book/book-index/5start.jpg',6,1),
(33,2,7,31,'中国通史',0,0,35.70,'吕思勉',5555555555555,0,3.5,'img/book/book-index/3-5start.jpg',6.5,1),
(34,2,7,32,'中国哲学简史',1,1,30.70,'冯友兰',5555555555555,1,4,'img/book/book-index/4start.jpg',7,1),
(35,2,7,33,'中国娱乐法',0,2,44.90,'余锋',5555555555555,0,4.5,'img/book/book-index/4-5start.jpg',7.5,1),
(36,2,7,34,'梦的解析(经典全译本)',1,0,35.70,'西格蒙德·弗洛伊德',5555555555555,1,5,'img/book/book-index/5start.jpg',8,1),
(37,2,8,35,'证券解析(第六版)',0,1,86.00,'本杰明·格雷厄姆',5555555555555,0,3.5,'img/book/book-index/3-5start.jpg',8.5,1),
(38,2,8,36,'逆向管理:先行动后思考',1,2,23.42,'埃米尼亚·伊贝拉',5555555555555,0,4,'img/book/book-index/4start.jpg',9,1),
(39,2,8,37,'聪明的投资者(第四版)',0,0,65.90,'本杰明·格雷厄姆',5555555555555,1,4.5,'img/book/book-index/4-5start.jpg',9.5,1),
(40,2,8,38,'影响力(经典版)',2,1,20.00,'罗伯特·西奥迪尼',5555555555555,1,5,'img/book/book-index/5start.jpg',5,1),
(41,2,9,39,'非暴力沟通',0,2,18.70,'马歇尔·卢森堡',5555555555555,0,3.5,'img/book/book-index/3-5start.jpg',7.5,1),
(42,2,9,40,'人性的弱点',2,0,20.70,'戴尔·卡耐基',5555555555555,1,4,'img/book/book-index/4start.jpg',8,1),
(43,2,9,41,'你从未真正拼过(跟大咖学精进,跑好职场第一棒)',2,1,20.60,'LinkedIn',5555555555555,0,4.5,'img/book/book-index/4-5start.jpg',7,1),
(44,2,9,42,'如何打造你的独特观点',2,1,30.70,'斋藤孝',5555555555555,1,5,'img/book/book-index/5start.jpg',7,1);





INSERT INTO book_list VALUES
(1,1,'img/book/product/1-1-lg.jpg','img/book/product/1-1-md.jpg','img/book/product/1-1-sm.jpg'),
(NULL,1,'img/book/product/1-2-lg.jpg','img/book/product/1-2-md.jpg','img/book/product/1-2-sm.jpg'),
(NULL,1,'img/book/product/1-3-lg.jpg','img/book/product/1-3-md.jpg','img/book/product/1-3-sm.jpg'),
(NULL,2,'img/book/product/2-1-lg.jpg','img/book/product/2-1-md.jpg','img/book/product/2-1-sm.jpg'),
(NULL,2,'img/book/product/2-2-lg.jpg','img/book/product/2-2-md.jpg','img/book/product/2-2-sm.jpg'),
(NULL,2,'img/book/product/2-3-lg.jpg','img/book/product/2-3-md.jpg','img/book/product/2-3-sm.jpg'),
(NULL,3,'img/book/product/3-1-lg.jpg','img/book/product/3-1-md.jpg','img/book/product/3-1-sm.jpg'),
(NULL,3,'img/book/product/3-2-lg.jpg','img/book/product/3-2-md.jpg','img/book/product/3-2-sm.jpg'),
(NULL,3,'img/book/product/3-3-lg.jpg','img/book/product/3-3-md.jpg','img/book/product/3-3-sm.jpg'),
(NULL,4,'img/book/product/4-1-lg.jpg','img/book/product/4-1-md.jpg','img/book/product/4-1-sm.jpg'),
(NULL,4,'img/book/product/4-2-lg.jpg','img/book/product/4-2-md.jpg','img/book/product/4-2-sm.jpg'),
(NULL,4,'img/book/product/4-3-lg.jpg','img/book/product/4-3-md.jpg','img/book/product/4-3-sm.jpg'),
(NULL,5,'img/book/product/5-1-lg.jpg','img/book/product/5-1-md.jpg','img/book/product/5-1-sm.jpg'),
(NULL,5,'img/book/product/5-2-lg.jpg','img/book/product/5-2-md.jpg','img/book/product/5-2-sm.jpg'),
(NULL,5,'img/book/product/5-3-lg.jpg','img/book/product/5-3-md.jpg','img/book/product/5-3-sm.jpg'),
(NULL,6,'img/book/product/6-1-lg.jpg','img/book/product/6-1-md.jpg','img/book/product/6-1-sm.jpg'),
(NULL,7,'img/book/product/7-1-lg.jpg','img/book/product/7-1-md.jpg','img/book/product/7-1-sm.jpg'),
(NULL,8,'img/book/product/8-1-lg.jpg','img/book/product/8-1-md.jpg','img/book/product/8-1-sm.jpg'),
(NULL,8,'img/book/product/8-2-lg.jpg','img/book/product/8-2-md.jpg','img/book/product/8-2-sm.jpg'),
(NULL,9,'img/book/product/9-1-lg.jpg','img/book/product/9-1-md.jpg','img/book/product/9-1-sm.jpg'),
(NULL,10,'img/book/product/10-1-lg.jpg','img/book/product/10-1-md.jpg','img/book/product/10-1-sm.jpg'),
(NULL,11,'img/book/product/11-1-lg.jpg','img/book/product/11-1-md.jpg','img/book/product/11-1-sm.jpg'),
(NULL,11,'img/book/product/11-2-lg.jpg','img/book/product/11-2-md.jpg','img/book/product/11-2-sm.jpg'),
(NULL,12,'img/book/product/12-1-lg.jpg','img/book/product/12-1-md.jpg','img/book/product/12-1-sm.jpg'),
(NULL,12,'img/book/product/12-2-lg.jpg','img/book/product/12-2-md.jpg','img/book/product/12-2-sm.jpg'),
(NULL,13,'img/book/product/13-1-lg.jpg','img/book/product/13-1-md.jpg','img/book/product/13-1-sm.jpg'),
(NULL,13,'img/book/product/13-2-lg.jpg','img/book/product/13-2-md.jpg','img/book/product/13-2-sm.jpg'),
(NULL,14,'img/book/product/14-1-lg.jpg','img/book/product/14-1-md.jpg','img/book/product/14-1-sm.jpg'),
(NULL,15,'img/book/product/15-1-lg.jpg','img/book/product/15-1-md.jpg','img/book/product/15-1-sm.jpg'),
(NULL,15,'img/book/product/15-2-lg.jpg','img/book/product/15-2-md.jpg','img/book/product/15-2-sm.jpg'),
(NULL,16,'img/book/product/16-1-sm.jpg','img/book/product/16-1-sm.jpg','img/book/product/16-1-sm.jpg'),
(NULL,17,'img/book/product/17-1-lg.jpg','img/book/product/17-1-md.jpg','img/book/product/17-1-sm.jpg'),
(NULL,17,'img/book/product/17-2-lg.jpg','img/book/product/17-2-md.jpg','img/book/product/17-2-sm.jpg'),
(NULL,18,'img/book/product/18-1-lg.jpg','img/book/product/18-1-md.jpg','img/book/product/18-1-sm.jpg'),
(NULL,18,'img/book/product/18-2-lg.jpg','img/book/product/18-2-md.jpg','img/book/product/18-2-sm.jpg'),
(NULL,19,'img/book/product/19-1-lg.jpg','img/book/product/19-1-md.jpg','img/book/product/19-1-sm.jpg'),
(NULL,20,'img/book/product/20-1-lg.jpg','img/book/product/20-1-md.jpg','img/book/product/20-1-sm.jpg'),
(NULL,20,'img/book/product/20-2-lg.jpg','img/book/product/20-2-md.jpg','img/book/product/20-2-sm.jpg'),
(NULL,21,'img/book/product/21-1-lg.jpg','img/book/product/21-1-md.jpg','img/book/product/21-1-sm.jpg'),
(NULL,21,'img/book/product/21-2-lg.jpg','img/book/product/21-2-md.jpg','img/book/product/21-2-sm.jpg'),
(NULL,22,'img/book/product/22-1-lg.jpg','img/book/product/22-1-md.jpg','img/book/product/22-1-sm.jpg'),
(NULL,22,'img/book/product/22-2-lg.jpg','img/book/product/22-2-md.jpg','img/book/product/22-2-sm.jpg'),
(NULL,23,'img/book/product/23-1-lg.jpg','img/book/product/23-1-md.jpg','img/book/product/23-1-sm.jpg'),
(NULL,23,'img/book/product/23-2-lg.jpg','img/book/product/23-2-md.jpg','img/book/product/23-2-sm.jpg'),
(NULL,24,'img/book/product/24-1-lg.jpg','img/book/product/24-1-md.jpg','img/book/product/24-1-sm.jpg'),
(NULL,24,'img/book/product/24-2-lg.jpg','img/book/product/24-2-md.jpg','img/book/product/24-2-sm.jpg'),
(NULL,25,'img/book/product/25-1-lg.jpg','img/book/product/25-1-md.jpg','img/book/product/25-1-sm.jpg'),
(NULL,25,'img/book/product/25-2-lg.jpg','img/book/product/25-2-md.jpg','img/book/product/25-2-sm.jpg'),
(NULL,26,'img/book/product/26-1-lg.jpg','img/book/product/26-1-md.jpg','img/book/product/26-1-sm.jpg'),
(NULL,26,'img/book/product/26-2-lg.jpg','img/book/product/26-2-md.jpg','img/book/product/26-2-sm.jpg'),
(NULL,27,'img/book/product/27-1-lg.jpg','img/book/product/27-1-md.jpg','img/book/product/27-1-sm.jpg'),
(NULL,27,'img/book/product/27-2-lg.jpg','img/book/product/27-2-md.jpg','img/book/product/27-2-sm.jpg'),
(NULL,28,'img/book/product/28-1-lg.jpg','img/book/product/28-1-md.jpg','img/book/product/28-1-sm.jpg'),
(NULL,28,'img/book/product/28-2-lg.jpg','img/book/product/28-2-md.jpg','img/book/product/28-2-sm.jpg'),
(NULL,29,'img/book/product/29-1-lg.jpg','img/book/product/29-1-md.jpg','img/book/product/29-1-sm.jpg'),
(NULL,29,'img/book/product/29-2-lg.jpg','img/book/product/29-2-md.jpg','img/book/product/29-2-sm.jpg'),
(NULL,30,'img/book/product/30-1-lg.jpg','img/book/product/30-1-md.jpg','img/book/product/30-1-sm.jpg'),
(NULL,30,'img/book/product/30-2-lg.jpg','img/book/product/30-2-md.jpg','img/book/product/30-2-sm.jpg'),
(NULL,31,'img/book/product/31-1-lg.jpg','img/book/product/31-1-md.jpg','img/book/product/31-1-sm.jpg'),
(NULL,32,'img/book/product/32-1-lg.jpg','img/book/product/32-1-md.jpg','img/book/product/32-1-sm.jpg'),
(NULL,32,'img/book/product/32-2-lg.jpg','img/book/product/32-2-md.jpg','img/book/product/32-2-sm.jpg'),
(NULL,33,'img/book/product/33-1-lg.jpg','img/book/product/33-1-md.jpg','img/book/product/33-1-sm.jpg'),
(NULL,33,'img/book/product/33-2-lg.jpg','img/book/product/33-2-md.jpg','img/book/product/33-2-sm.jpg'),
(NULL,34,'img/book/product/34-1-lg.jpg','img/book/product/34-1-md.jpg','img/book/product/34-1-sm.jpg'),
(NULL,34,'img/book/product/34-2-lg.jpg','img/book/product/34-2-md.jpg','img/book/product/34-2-sm.jpg'),
(NULL,35,'img/book/product/35-1-lg.jpg','img/book/product/35-1-md.jpg','img/book/product/35-1-sm.jpg'),
(NULL,36,'img/book/product/36-1-lg.jpg','img/book/product/36-1-md.jpg','img/book/product/36-1-sm.jpg'),
(NULL,36,'img/book/product/36-2-lg.jpg','img/book/product/36-2-md.jpg','img/book/product/36-2-sm.jpg'),
(NULL,36,'img/book/product/36-3-lg.jpg','img/book/product/36-3-md.jpg','img/book/product/36-3-sm.jpg'),
(NULL,37,'img/book/product/37-1-lg.jpg','img/book/product/37-1-md.jpg','img/book/product/37-1-sm.jpg'),
(NULL,37,'img/book/product/37-2-lg.jpg','img/book/product/37-2-md.jpg','img/book/product/37-2-sm.jpg'),
(NULL,38,'img/book/product/38-1-lg.jpg','img/book/product/38-1-md.jpg','img/book/product/38-1-sm.jpg'),
(NULL,38,'img/book/product/38-2-lg.jpg','img/book/product/38-2-md.jpg','img/book/product/38-2-sm.jpg'),
(NULL,39,'img/book/product/39-1-lg.jpg','img/book/product/39-1-md.jpg','img/book/product/39-1-sm.jpg'),
(NULL,39,'img/book/product/39-2-lg.jpg','img/book/product/39-2-md.jpg','img/book/product/39-2-sm.jpg'),
(NULL,40,'img/book/product/40-1-lg.jpg','img/book/product/40-1-md.jpg','img/book/product/40-1-sm.jpg'),
(NULL,40,'img/book/product/40-2-lg.jpg','img/book/product/40-2-md.jpg','img/book/product/40-2-sm.jpg'),
(NULL,41,'img/book/product/41-1-lg.jpg','img/book/product/41-1-md.jpg','img/book/product/41-1-sm.jpg'),
(NULL,42,'img/book/product/42-1-md.jpg','img/book/product/42-1-md.jpg','img/book/product/42-1-md.jpg'),
(NULL,43,'img/book/product/43-1-md.jpg','img/book/product/43-1-md.jpg','img/book/product/43-1-md.jpg'),
(NULL,44,'img/book/product/44-1-md.jpg','img/book/product/44-1-md.jpg','img/book/product/44-1-md.jpg');


/**9----用户信息**/
INSERT INTO ymx_user VALUES
(NULL, 'dingding', '123456', 'ding@qq.com', '13501234567', 'img/avatar/default.png', '丁伟', '1'),
(NULL, 'dangdang', '123456', 'dang@qq.com', '13501234568', 'img/avatar/default.png', '林当', '1'),
(NULL, 'doudou', '123456', 'dou@qq.com', '13501234569', 'img/avatar/default.png', '窦婧童', '1'),
(NULL, 'yaya', '123456', 'ya@qq.com', '13501234560', 'img/avatar/default.png', '秦小雅', '0');