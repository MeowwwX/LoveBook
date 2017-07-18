
DROP TABLE IF EXISTS `ORDERS`;
DROP TABLE IF EXISTS `LEAVEWORD`;
DROP TABLE IF EXISTS `CART_MERCHANDISE`;
DROP TABLE IF EXISTS `CART`;
DROP TABLE IF EXISTS `MERCHANDISE`;
DROP TABLE IF EXISTS `CATEGORY`;
DROP TABLE IF EXISTS `MEMBER`;
DROP TABLE IF EXISTS `MEMBERLEVEL`;
DROP TABLE IF EXISTS `ADMINS`;

COMMIT;

CREATE TABLE `ADMINS` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `ADMINTYPE` int(4) DEFAULT NULL,
  `NAME` char(12) DEFAULT NULL,
  `USERNAME` char(12) NOT NULL UNIQUE,
  `PASSWORD` char(12) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gb2312;



CREATE TABLE `MEMBERLEVEL` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `LEVELNAME` char(20) NOT NULL UNIQUE,
  `FAVOURABLE` int(4) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gb2312;



CREATE TABLE `MEMBER` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `MEMBERLEVEL_ID` int(4) NOT NULL,
  `USERNAME` char(12) NOT NULL UNIQUE,
  `PASSWORD` char(12) NOT NULL,
  `NAME` char(20) DEFAULT NULL,
  `PHONE` char(15) DEFAULT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL,
  `ZIPCODE` char(10) DEFAULT NULL,
  `REGISTERDATE` datetime DEFAULT NULL,
  `LASTLOGINDATE` datetime DEFAULT NULL,
  `LOGINTIMES` int(4) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (MEMBERLEVEL_ID) REFERENCES MEMBERLEVEL(ID)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=gb2312;



CREATE TABLE `CATEGORY` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `CATENAME` char(40) NOT NULL UNIQUE,
  `CATEDESC` text DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gb2312;



CREATE TABLE `MERCHANDISE` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `CATEGORY_ID` int(4) NOT NULL,
  `MERNAME` char(40) NOT NULL,
  `PRICE` decimal(8,2) DEFAULT NULL,
  `SPRICE` decimal(8,2) DEFAULT NULL,
  `MERMODEL` char(40) DEFAULT NULL,
  `PICTURE` varchar(100) DEFAULT NULL,
  `MERDESC` text DEFAULT NULL,
  `MANUFACTURER` char(60) DEFAULT NULL,
  `LEAVEFACTORYDATE` datetime DEFAULT NULL,
  `SPECIAL` int(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY(ID)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=gb2312;



CREATE TABLE `CART` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `MEMBER_ID` int(4) NOT NULL,
  `MONEY` decimal(9,2) DEFAULT NULL,
  `CARTSTATUS` int(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER(ID)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gb2312;



CREATE TABLE `CART_MERCHANDISE` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `CART_ID` int(4) NOT NULL,
  `MERCHANDISE_ID` int(4) NOT NULL,
  `MERNUMBER` int(4) NOT NULL DEFAULT '1',
  `PRICE` decimal(8,2) NOT NULL DEFAULT '0.00',
  `MONEY` decimal(9,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`ID`),
  FOREIGN KEY (CART_ID) REFERENCES CART(ID),
  FOREIGN KEY (MERCHANDISE_ID) REFERENCES MERCHANDISE(ID)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=gb2312;



CREATE TABLE `LEAVEWORD` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `MEMBER_ID` int(4) NOT NULL,
  `ADMIN_ID` int(4) DEFAULT NULL,
  `TITLE` char(60) DEFAULT NULL,
  `CONTENT` text NOT NULL,
  `LEAVEDATE` datetime DEFAULT NULL,
  `ANSWERCONTENT` text DEFAULT NULL,
  `ANSWERDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER(ID),
  FOREIGN KEY (ADMIN_ID) REFERENCES ADMINS(ID)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gb2312;



CREATE TABLE `ORDERS` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `MEMBER_ID` int(4) NOT NULL,
  `CART_ID` int(4) NOT NULL,
  `ORDERNO` char(20) NOT NULL,
  `ORDERDATE` datetime DEFAULT NULL,
  `ORDERSTATUS` int(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER(ID),
  FOREIGN KEY (CART_ID) REFERENCES CART(ID)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gb2312;


INSERT INTO `ADMINS` VALUES ('1', '1', '��Ʒ����Ա', 'Admin1', 'Admin1'), ('2', '2', '��������Ա', 'Admin2', 'Admin2'), ('3', '3', '��Ա����Ա', 'Admin3', 'Admin3'), ('4', '4', 'ϵͳ����Ա', 'Admin4', 'Admin4');

INSERT INTO `MEMBERLEVEL` VALUES ('1', '��ͨ��Ա', '95'), ('2', '�ƽ��Ա', '90'), ('3', '�׽��Ա', '85'), ('4', '��ʯ��Ա', '80');

INSERT INTO `MEMBER` VALUES ('1', '4', 'liuqiao', 'liuqiao', '����', '13971559323', '����ʡ�人�к�ɽ��', '432200', '2009-04-20 18:40:30', '2009-04-23 17:40:08', '7', 'liuqiao1982@sina.com');
INSERT INTO `MEMBER` VALUES ('2', '1', 'jinwu', 'jinwu', '����', '13456754323', '�㶫ʡ������', '435567', '2009-04-20 21:05:58', '2009-04-21 15:33:41', '2', 'jinwu@sina.com');
INSERT INTO `MEMBER` VALUES ('3', '1', 'hujie', 'hujie', '����', '13456789067', '�人�к�ɽ��³ĥ·', '432254', '2009-04-20 21:17:08', '2009-04-21 15:32:36', '3', 'hujie@sohu.com');
INSERT INTO `MEMBER` VALUES ('8', '3', 'chenlin', 'chenlin', '����', '13456756789', '����ʡ�人��������', '432543', '2009-04-20 22:44:30', '2009-04-21 15:33:08', '2', 'chenlin@sohu.com');
INSERT INTO `MEMBER` VALUES ('9', '1', 'ggg', 'ggg', '�ø�', '66771111111', 'ggg', 'ggg', '2009-04-24 15:44:50', '2009-04-24 15:44:50', '0', 'gg@ff.cn');
INSERT INTO `MEMBER` VALUES ('10', '1', 'ggg1', '111', '�ø�', '66771111111', 'ggg', 'ggg', '2009-04-24 16:11:16', '2009-04-24 16:11:16', '0', 'gg@ff.cn');

INSERT INTO `CATEGORY` VALUES ('1', '�������', '�������صĸ����鼮'), ('2', '������', '������صĸ����鼮'), ('3', 'Ӣ����', 'Ӣ����صĸ����鼮'), ('4', 'С˵��', '����С˵');

INSERT INTO `MERCHANDISE` VALUES ('1', '1', 'JavaScript �߼��������', '45.00', '34.00', 'c1', 'Picture/9211839-1_b.jpg', 'JavaScript��ĿǰWeb�ͻ��˿�������Ҫ������ԣ�Ҳ��Ajax�ĺ��ļ���֮һ', '�����ʵ������', '2009-04-21 00:00:00', '1');

INSERT INTO MERCHANDISE VALUES('2', '1', 'Ajaxʵս', '65.00', '0.00', 'c2', 'Picture/9161326-1_b.jpg', '������ĿǰAjax������Ϊȫ�������һ�����������в����ж��ڻ���֪ʶ�Ľ��ܣ����ж���Ajax�������ش����ϵ�ܹ����������̽�֡�', '�����ʵ������', '2009-04-21 00:00:00', '0');

INSERT INTO MERCHANDISE VALUES('3', '1', 'CSS�����̳�', '54.00', '43.00', 'c3', 'Picture/9211839-1_b.jpg', '�����������CSS �����飬�ص㽲�������ʹ��CSS ʵ�ֻ���Web ��׼����վ������ʵ����վ���ݺͱ�������롣\r\n����������������֡���һ���ֽ�����CSS �Ļ���֪ʶ�ͻ������������CSS �ֱ����ҳ�����е�һЩ����Ԫ�ؼ�����ʽ���������ı���ͼ���б����ӡ���񡢱��ȡ��ڶ�������Ҫ�����˻���CSS ��ʵ����ҳ�������ֵ���ظ����뼼�����������������岼�ֵȡ�������󻹸�����һ����ʵ�İ�������������������ݽ������ۺ����ۡ�', '��е��ҵ������', '2002-04-09 00:00:00', '1');

INSERT INTO MERCHANDISE VALUES('4', '1', '��ͨCSS���߼�Web��׼�������', '44.00', '33.00', 'c3', 'Picture/9221944-1_b.jpg', '���齫�����õ�CSS����������һ���ڽ��ܻ�����CSS��������ʵ��֮�������˺��ĵ�CSS����������ͼ�����ӡ��б���ݡ�����ơ����ݱ������Լ���CSS���֡�', '��е��ҵ������', '2004-04-15 00:00:00', '0');

INSERT INTO MERCHANDISE VALUES('5', '1', '��и�ɻ���Web���:����XHTML��CSS�����վ�����������Ӧ��', '50.00', '0.00', 'c5', 'Picture/9232841-1_b.jpg', '�д����Ĵ�ͳtable���ֺ����ڵ�div���ֽ��бȽϡ�', '��ѧ������', '2009-04-15 00:00:00', '0');

INSERT INTO MERCHANDISE VALUES('6', '3', '�±࿼��Ӣ�������ǵ��ʣ�2010��棩', '65.00', '0.00', 'e1', 'Picture/20511678-1_b.jpg', '�������������ѡ���е����Ѵ���Ҳ��������һ���������Ҹ��ݴ��Ҫ�������ע�⣬ּ�ڱ��Ͽ����ڿ���ʱ��Ҫ������ɺ�ѡ���ϣ����Ϊ��������ɨ���˿����е��ϰ����', '��е��ҵ������', '2000-05-10 00:00:00', '0');

INSERT INTO MERCHANDISE VALUES('7', '3', '�°�����˵��', '65.00', '54.00', 'e2', 'Picture/20525298-1_b.jpg', '�����й���¼�°�������˵ʮ��ƪ��������ְ��˵����ÿƪ��˵�󶼸����꾡�ı���ע�����Ѵʽ��������˽�������ʷ����״���˽�°�����·���̵ľ������ϣ�Ҳ��ѧϰӢ�ļ��ݽ����ɵ���÷���', '��ѧ������', '2006-04-12 00:00:00', '1');

INSERT INTO MERCHANDISE VALUES('8', '4', '�ص�����6', '45.00', '33.00', 'n1', 'Picture/20516672-1_b.jpg', '����û��һ��С˵�����񡶲ص����롷�������漣���Ӯ��ר�ҡ�ѧ�ߡ����ˡ���ꡢý�塢ȫ����֪���ĳ�������Լ���ǧ������ͨ���ߵĿ���׷�������ص����롷�ǵ����й���ǧ�������ԡ��˽����ص���ѡ������Ҳ�ǵ�������Ļ���С˵��Ŀǰ�����Ѵﵽ���˵�200����ᡣ', '��ѧ������', '2006-04-12 00:00:00', '1');

INSERT INTO MERCHANDISE VALUES('9', '4', '��ݵ�֤��', '55.00', '0.00', 'n2', 'Picture/20373098-1_b.jpg', '���鳬Խ��һ������ķ��ع��£����������������������ͣ���5����Ҫ�����������ÿ����ʷʱ�ڵİ����������������µ��ռ���������ͨ�������ȥ�ĸ�������ʱ�����������ֹ��ҷ�չ��������ЩĬĬ���ŵ�Ļ��Ӣ�۾������ı��ʡ�ȫ�齲������һ���ҵ������鱨��Ա��Խ47�����������������ͨ������������ʷʱ�ڵı�Ǩ����ȫ�µ��ӽ�������һ������ս���ϡ�����������Ƴɵġ��������ˣ���ͨ��һ������ݵ�֤���������˹��͹�����������������ʷ��Ӱ��', '���ճ�����', '2009-04-08 00:00:00', '0');

INSERT INTO MERCHANDISE VALUES('10', '2', '�ͷ��ؽ�����Ʊ�', '75.00', '0.00', 'm4', 'Picture/20522936-1_b.jpg', '���ڴ�����Űͷ��ص�ǰ��ϱ����?�ͷ������о��ͷ��ط����Ȩ����ʿ��ά?������̽������?�ͷ��ص�˼�뾫�裬�ڱ���������ǳ���ؽ��ܰͷ��ط�����˾���񱨱�Ļƽ��򡣷��ض�����ɼ۱��˵Ĺ�˾�ܶ�Զ֮��', '���ճ�����', '2002-03-20 00:00:00', '0');

INSERT INTO MERCHANDISE VALUES('11', '4', '����ս��', '56.00', '45.00', 'm9', 'Picture/9304959-1_b.jpg', 'Ϊʲô�㲻֪����������˽�е��������У�ŵ���׵�½һ�߲��ӵ������ʣ�����Ƹ�����ıʷ��', '�廪��ѧ������', '2005-03-16 00:00:00', '1');

INSERT INTO MERCHANDISE VALUES('12', '4', 'ƶ��ߵİ�����', '66.00', '45.00', 'n6', 'Picture/20525341-1_b.jpg', 'ʮ����ľưɷ���Ա��Ħ�������������ƶ����', '���ճ�����', '2009-04-09 00:00:00', '1');

INSERT INTO MERCHANDISE VALUES('13', '1', 'ʿ��ͻ��', '36.00', '0.00', 'n5', 'Picture/9255064-1_b.jpg', '����Ĳ���һ��С˵��������ѧ���������������ǳɳ�����ʷ��ÿһλ���߶����������������ҵ��Լ���һЩӰ�ӡ�', '���ճ�����', '2009-04-09 00:00:00', '0');

INSERT INTO MERCHANDISE VALUES('14', '2', '�쵼����ʲô', '66.00', '0.00', 'm5', 'Picture/9250656-1_b.jpg', '���쵼����ʲô���㼯���ڶ������£�������������쵼����δ����Ӿ���Ͳ�ȷ�����ء���ν���ѧϰ����֯����δٽ������Լ��ڵ����������֯�й���֪ʶ��Ա���ر����¼��ܵ����⡣�µ��쵼������Ϊ�ٽ���һ���쵼���ķ�չ�ṩ���µļ��ɣ�ΪΣ�������ṩ���µ��쵼������ҲΪ�����ھ����л�ʤ�������֯�ṩ���µ�·����', '���ճ�����', '2009-04-09 00:00:00', '0');

INSERT INTO MERCHANDISE VALUES('15', '2', '������ʲô', '56.00', '50.00', 'm8', 'Picture/8768781-1_b.jpg', '�����ǹ�ȥ���������˼����µļ��ʵ�õ��ܽᡣ���жԸ����µĹ������������꾡�Ľ��ܣ�������ν�֮���õ����ӵ��ճ���֯�н����˲��������н�������ߴӾ��еĿ�����˼ά��ת�䵽���Եġ����������ϵ�������������ܳ���ѧϰ��˼ά�С���ʱ���ľ������ƶԹ�����������µ���ս����ҵ��ѧϰǱ������Ӧ�ٶȺ���Ӧ����ȡ���˴�ͳ���ʲ���ģ���г��ݶ���ʲ�������ָ�ꡣ�Կͻ�Ϊ���Ĳ���ֻ��Ӫ�����ŵ�����˼�룬����������������ҵ�����鲻��Ҫ��������ͳ�Ĺ���ʵ������Ҫ�����Ǵ������ڷ�硵���ҵ������Ѱ������Ч�Ĺ���˼�룬��ʵ����ҵ��Ч���ش�ͻ�ơ�', '���������', '2009-01-14 00:00:00', '1');

INSERT INTO `LEAVEWORD` VALUES ('1', '2', null, '�ǳ���л', '�ǳ���л���ܷ��㣡', '2009-04-20 21:14:44', null, null), ('2', '2', null, '����', '����ĵ���������վ��', '2009-04-20 21:15:40', null, null), ('3', '3', null, '֧��', '֧�ֵ�������', '2009-04-20 22:38:58', null, null);

COMMIT;