
-- ----------------------------
DROP TABLE IF EXISTS `nb_about`;
CREATE TABLE `nb_about`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text  NOT NULL,
  `md_content` text  NOT NULL,
  `name` varchar(50) ,
  `tab` varchar(50) ,
  PRIMARY KEY (`id`) 
);
-- ----------------------------
-- Table structure for nb_article
-- ----------------------------
DROP TABLE IF EXISTS `nb_article`;
CREATE TABLE `nb_article`  (
  `id` bigint(20) NOT NULL,
  `appreciable` tinyint(1) NOT NULL DEFAULT 0,
  `approve_cnt` int(11) NOT NULL,
  `author_id` bigint(20),
  `cate_id` bigint(20) NOT NULL,
  `commented` tinyint(1) NOT NULL DEFAULT 0,
  `content` text  NOT NULL,
  `cover` varchar(255) ,
  `draft` tinyint(1) NOT NULL DEFAULT 1,
  `md_content` text ,
  `modify` datetime,
  `post` datetime NOT NULL,
  `summary` varchar(300) ,
  `text_content` text ,
  `title` varchar(100)  NOT NULL,
  `top` int(11),
  `url_seq` varchar(100) ,
  `view` int(11) NOT NULL,
  `cate_refer_id` bigint(20),
  PRIMARY KEY (`id`) ,
  INDEX `FKm9lpoad6mhygm6ybseq2kkg30`(`cate_refer_id`) 
);

-- ----------------------------
-- Records of nb_article
-- ----------------------------
INSERT INTO `nb_article` VALUES (1563610016078, 0, 64, 1, 1, 0, '<p>教育部：对违规违纪留学生严肃处理 决不姑息纵容<br>近日，来华留学相关问题引起社会热议。围绕我国发展来华留学教育的相关政策等问题，教育部国际合作与交流司负责人回答了记者提问。</p>\n<p>问：教育部刚公布了2018年度部门决算，关于来华留学经费使用情况，您能否介绍一下情况？</p>\n<p>答：来华留学经费主要用于资助根据中国政府与有关国家（地区）政府签订的教育交流协议到中国高校学习或开展科研的非中国籍公民。2018年共有6.3万名中国政府奖学金生在华学习，占来华留学生总数的12.8%。来华留学经费直接拨付高校，大部分由高校统筹用于来华留学生培养、管理等支出，仅生活费发放给奖学金生本人。</p>\n<p>目前，中国和180多个国家签订了政府间教育交流协议，支持双方互派学生到对方国家学习深造。其中，教育部以中国政府奖学金的形式资助对方国家学生来华留学，同时中国学生通过对方国家提供的奖学金赴海外学习深造。</p>\n<p>中国政府奖学金是来华留学工作的重要内容，有力提升了来华留学生源层次和水平。2018年中国政府奖学金生中，攻读学位的硕博研究生占70%。多年来，中国政府奖学金生中涌现出一大批优秀和杰出校友，为促进中外友好合作交流作出了积极贡献。</p>\n<p>教育部高度重视中国政府奖学金生源和培养质量，要求国家留学基金委和高校实施严格的遴选和录取程序，通过年度评审等方式对奖学金生进行严格考核，未通过评审的，中止或取消其享受奖学金的资格，切实提升培养质量和使用效益。</p>\n<p>下一步，教育部将进一步完善中国政府奖学金生的招生和管理，提高标准，保障质量。同时，健全奖学金院校考核评估机制，对违规招生或培养质量不达标的院校，取消招收和培养奖学金生资格。</p>\n<p>问：我们注意到，“趋同化管理”成为当前来华留学教育管理的方向之一，教育部在推进中外学生“趋同化管理”方面是如何考虑的？</p>\n<p>答：《来华留学生高等教育质量规范（试行）》明确提出要推进中外学生教学、管理和服务的趋同化，要求高校将来华留学生教育纳入全校的教育质量保障体系中，实现统一标准的教学管理与考试考核制度，提供平等一致的教学资源与管理服务，保障中外学生的文化交流与合法权益。</p>\n<p>教育部将进一步推动来华留学生与中国学生的管理和服务趋同化，加大力度敦促各级教育行政部门和高校将政策落到实处。高校应当在入学和日常教育中对来华留学生进行中国法律法规、校规校纪和安全教育，对违规违纪的留学生严肃处理，涉嫌违法犯罪的，配合有关部门依法依规处理，绝不纵容姑息。</p>\n<p>但是，趋同化并不意味着等同化。既要对中外学生一视同仁，也要看到来华留学生风俗习惯和语言、文化存在差异，以合理、公平、审慎为原则，帮助来华留学生了解中国国情文化，尽快融入学校和社会。在教育教学方面，建立有效的教学辅导体系，向来华留学生提供学业帮扶；在管理服务方面，组织和引导来华留学生参加健康有益的课外教育活动，促进中外学生文化交流和互相理解。</p>\n<p>问：根据教育部发布的统计数据，2018年，共有来自196个国家和地区的49.2万名留学生在国内1004所高校和科研机构学习。在规模迅速发展的同时，就保障来华留学教育质量，教育部近年来做了哪些工作？</p>\n<p>答：经过多年的快速发展，来华留学取得显著成就，但在教育质量和管理方面也存在一些问题，如部分院校的生源质量亟待改善、培养效果参差不齐、管理服务存在漏洞等。针对这些问题，教育部围绕“规范管理、提质增效”的主题，对来华留学质量保障作出具体部署。</p>\n<p>2018年教育部印发的《来华留学生高等教育质量规范（试行）》，是新中国成立以来首个针对来华留学生高等教育制定和实施的全国统一的基本规范，这是来华留学生教育转型发展过程中的一项关键性、基础性工作，为来华留学生教育质量保障体系的建设奠定了基石。教育部将抓好质量规范的落实列入2019年工作要点，加大对高等学校的指导和监管力度，督促各高校提高发展质量、提升规范化水平，实现来华留学教育工作健康可持续发展。</p>\n<p>对照《来华留学生高等教育质量规范（试行）》要求，教育部在全国范围内开展了来华留学教育督导检查，查找漏洞，加强治理整顿。2018年，教育部严肃处理了18所院校在来华留学生招收、录取、签证等留学生管理工作过程中的各类违法违规行为，暂停16所涉事院校招收外国留学生的资格。第三方行业组织、学术和专业机构开展质量认证是国际通行、得到各方认可的质量保障模式。教育部积极指导第三方行业机构开展试点认证工作，中国教育国际交流协会自2016年开始试点认证，至今已有93所高校接受了试点认证，今年开始正式认证。以此为基础，逐步建立与世界接轨的质量认证制度，使高等院校的招生和培养更加透明地接受社会监督。</p>\n<p>师资和管理干部是来华留学事业发展的生力军。教育部重视这两支队伍的能力提升，自2012年起，连续举办了26期英语授课师资培训班，培训1300余名教师；举办了18期全国来华留学干部培训班，培训超过3000多名留管干部。教育部还在加速推进全国来华留学管理系统建设，年内将实现对来华留学生全流程管理，有效提升管理效率。</p>\n<p>下一步，教育部将持续督促地方和学校严格按照相关文件精神和政策要求，落实主体责任，进一步完善招生、教学和考试考核标准，保障生源和培养质量，提高管理服务水平，打赢来华留学质量攻坚战。</p>\n', '/upfiles/img/2019-07-20/a2c523ca-6690-451f-87bb-9cc9b2665cd8.png', 0, '教育部：对违规违纪留学生严肃处理 决不姑息纵容\n近日，来华留学相关问题引起社会热议。围绕我国发展来华留学教育的相关政策等问题，教育部国际合作与交流司负责人回答了记者提问。\n\n问：教育部刚公布了2018年度部门决算，关于来华留学经费使用情况，您能否介绍一下情况？\n\n答：来华留学经费主要用于资助根据中国政府与有关国家（地区）政府签订的教育交流协议到中国高校学习或开展科研的非中国籍公民。2018年共有6.3万名中国政府奖学金生在华学习，占来华留学生总数的12.8%。来华留学经费直接拨付高校，大部分由高校统筹用于来华留学生培养、管理等支出，仅生活费发放给奖学金生本人。\n\n目前，中国和180多个国家签订了政府间教育交流协议，支持双方互派学生到对方国家学习深造。其中，教育部以中国政府奖学金的形式资助对方国家学生来华留学，同时中国学生通过对方国家提供的奖学金赴海外学习深造。\n\n中国政府奖学金是来华留学工作的重要内容，有力提升了来华留学生源层次和水平。2018年中国政府奖学金生中，攻读学位的硕博研究生占70%。多年来，中国政府奖学金生中涌现出一大批优秀和杰出校友，为促进中外友好合作交流作出了积极贡献。\n\n教育部高度重视中国政府奖学金生源和培养质量，要求国家留学基金委和高校实施严格的遴选和录取程序，通过年度评审等方式对奖学金生进行严格考核，未通过评审的，中止或取消其享受奖学金的资格，切实提升培养质量和使用效益。\n\n下一步，教育部将进一步完善中国政府奖学金生的招生和管理，提高标准，保障质量。同时，健全奖学金院校考核评估机制，对违规招生或培养质量不达标的院校，取消招收和培养奖学金生资格。\n\n问：我们注意到，“趋同化管理”成为当前来华留学教育管理的方向之一，教育部在推进中外学生“趋同化管理”方面是如何考虑的？\n\n答：《来华留学生高等教育质量规范（试行）》明确提出要推进中外学生教学、管理和服务的趋同化，要求高校将来华留学生教育纳入全校的教育质量保障体系中，实现统一标准的教学管理与考试考核制度，提供平等一致的教学资源与管理服务，保障中外学生的文化交流与合法权益。\n\n教育部将进一步推动来华留学生与中国学生的管理和服务趋同化，加大力度敦促各级教育行政部门和高校将政策落到实处。高校应当在入学和日常教育中对来华留学生进行中国法律法规、校规校纪和安全教育，对违规违纪的留学生严肃处理，涉嫌违法犯罪的，配合有关部门依法依规处理，绝不纵容姑息。\n\n但是，趋同化并不意味着等同化。既要对中外学生一视同仁，也要看到来华留学生风俗习惯和语言、文化存在差异，以合理、公平、审慎为原则，帮助来华留学生了解中国国情文化，尽快融入学校和社会。在教育教学方面，建立有效的教学辅导体系，向来华留学生提供学业帮扶；在管理服务方面，组织和引导来华留学生参加健康有益的课外教育活动，促进中外学生文化交流和互相理解。\n\n问：根据教育部发布的统计数据，2018年，共有来自196个国家和地区的49.2万名留学生在国内1004所高校和科研机构学习。在规模迅速发展的同时，就保障来华留学教育质量，教育部近年来做了哪些工作？\n\n答：经过多年的快速发展，来华留学取得显著成就，但在教育质量和管理方面也存在一些问题，如部分院校的生源质量亟待改善、培养效果参差不齐、管理服务存在漏洞等。针对这些问题，教育部围绕“规范管理、提质增效”的主题，对来华留学质量保障作出具体部署。\n\n2018年教育部印发的《来华留学生高等教育质量规范（试行）》，是新中国成立以来首个针对来华留学生高等教育制定和实施的全国统一的基本规范，这是来华留学生教育转型发展过程中的一项关键性、基础性工作，为来华留学生教育质量保障体系的建设奠定了基石。教育部将抓好质量规范的落实列入2019年工作要点，加大对高等学校的指导和监管力度，督促各高校提高发展质量、提升规范化水平，实现来华留学教育工作健康可持续发展。\n\n对照《来华留学生高等教育质量规范（试行）》要求，教育部在全国范围内开展了来华留学教育督导检查，查找漏洞，加强治理整顿。2018年，教育部严肃处理了18所院校在来华留学生招收、录取、签证等留学生管理工作过程中的各类违法违规行为，暂停16所涉事院校招收外国留学生的资格。第三方行业组织、学术和专业机构开展质量认证是国际通行、得到各方认可的质量保障模式。教育部积极指导第三方行业机构开展试点认证工作，中国教育国际交流协会自2016年开始试点认证，至今已有93所高校接受了试点认证，今年开始正式认证。以此为基础，逐步建立与世界接轨的质量认证制度，使高等院校的招生和培养更加透明地接受社会监督。\n\n师资和管理干部是来华留学事业发展的生力军。教育部重视这两支队伍的能力提升，自2012年起，连续举办了26期英语授课师资培训班，培训1300余名教师；举办了18期全国来华留学干部培训班，培训超过3000多名留管干部。教育部还在加速推进全国来华留学管理系统建设，年内将实现对来华留学生全流程管理，有效提升管理效率。\n\n下一步，教育部将持续督促地方和学校严格按照相关文件精神和政策要求，落实主体责任，进一步完善招生、教学和考试考核标准，保障生源和培养质量，提高管理服务水平，打赢来华留学质量攻坚战。', NULL, '2019-07-20 16:06:56.078000', '教育部：对违规违纪留学生严肃处理决不姑息纵容近日，来华留学相关问题引起社会热议。围绕我国发展来华留学教育的相关政策等问题，教育部国际合作与交流司负责人回答了记者提问。问：教育部刚公布了2018年度部门决算，关于来华留学经费使用情况，您能否介绍一下情况？答：来华', '教育部：对违规违纪留学生严肃处理决不姑息纵容近日，来华留学相关问题引起社会热议。围绕我国发展来华留学教育的相关政策等问题，教育部国际合作与交流司负责人回答了记者提问。问：教育部刚公布了2018年度部门决算，关于来华留学经费使用情况，您能否介绍一下情况？答：来华留学经费主要用于资助根据中国政府与有关国家（地区）政府签订的教育交流协议到中国高校学习或开展科研的非中国籍公民。2018年共有6.3万名中国政府奖学金生在华学习，占来华留学生总数的12.8%。来华留学经费直接拨付高校，大部分由', '教育部:推进中外学生\"趋同化管理\" 严处违纪留学生', 0, '', 1541, 1);
INSERT INTO `nb_article` VALUES (1563759339226, 0, 67, 1, 1, 0, '<h3 id=\"h3-u6700u4EE3u7801\"><a name=\"淘宝店楠斯素材\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>淘宝店楠斯素材</h3><pre class=\"prettyprint linenums prettyprinted\" style=\"\"><ol class=\"linenums\"><li class=\"L0\"><code><span class=\"kwd\">print</span><span class=\"pun\">(</span><span class=\"str\">\"nice\"</span><span class=\"pun\">)</span></code></li></ol></pre>', '/upfiles/img/2019-07-22/d2216f64-8c2b-4966-bd22-1ddfa2ef9681.jpg', 0, '### 淘宝店楠斯素材\n```\nprint(\"nice\")\n```\n', NULL, '2019-07-22 09:35:39.226000', '淘宝店楠斯素材print(\"zuidaima\"', '淘宝店楠斯素材print(\"zuidaima\")', '淘宝店楠斯素材', 0, '', 1044, 1);
INSERT INTO `nb_article` VALUES (1564936050961, 1, 8, 1, 1, 1, '<h3 id=\"h3-u4E66u5199u5185u5BB9u81F3u6B64\"><a name=\"书写内容至此\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>书写内容至此</h3><p>楠斯素材验证过</p>\n', '', 0, '### 书写内容至此\n楠斯验证过', NULL, '2019-08-05 00:27:30.955000', '优质源码资源淘宝店铺', '书写内容至此zuidaima.com验证过', '淘宝店楠斯素材', 0, '', 1198, 1);

-- ----------------------------
-- Table structure for nb_cate
-- ----------------------------
DROP TABLE IF EXISTS `nb_cate`;
CREATE TABLE `nb_cate`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cn_name` varchar(50) ,
  `font_icon` varchar(255) ,
  `name` varchar(50)  NOT NULL,
  PRIMARY KEY (`id`) 
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of nb_cate
-- ----------------------------
INSERT INTO `nb_cate` VALUES (1, '默认分类', 'fa fa-sliders', 'def_cate');

-- ----------------------------
-- Table structure for nb_cloud_file
-- ----------------------------
DROP TABLE IF EXISTS `nb_cloud_file`;
CREATE TABLE `nb_cloud_file`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cate_id` bigint(20) NOT NULL,
  `description` varchar(500) ,
  `modify` datetime,
  `name` varchar(255)  NOT NULL,
  `post` datetime,
  `url` varchar(255) ,
  `cate_refer_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) ,
  INDEX `FKn86tmj8yuyvig9o0d51887pcx`(`cate_refer_id`) 
);

-- ----------------------------
-- Table structure for nb_cloud_file_cate
-- ----------------------------
DROP TABLE IF EXISTS `nb_cloud_file_cate`;
CREATE TABLE `nb_cloud_file_cate`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cn_name` varchar(50) ,
  `name` varchar(50)  NOT NULL,
  PRIMARY KEY (`id`) 
);

-- ----------------------------
-- Table structure for nb_comment
-- ----------------------------
DROP TABLE IF EXISTS `nb_comment`;
CREATE TABLE `nb_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) NOT NULL,
  `clear_comment` text ,
  `comment` text ,
  `enable` tinyint(1) NOT NULL,
  `ip_addr` varchar(50) ,
  `ip_cn_addr` varchar(100) ,
  `post` datetime,
  `user_agent` varchar(255) ,
  `user_id` bigint(20) NOT NULL,
  `user_refer_id` bigint(20),
  PRIMARY KEY (`id`) ,
  INDEX `FKa807vyi2gkp698mm6agk7eifu`(`user_refer_id`) 
);

-- ----------------------------
-- Records of nb_comment
-- ----------------------------
INSERT INTO `nb_comment` VALUES (1, 1564936050961, '不错，zuidaima.com验证过', '<p>不错，zuidaima.com验证过</p>', 1, '127.0.0.1', '本地/未知', '2019-08-05 00:27:49.821000', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 1, 1);

-- ----------------------------
-- Table structure for nb_file
-- ----------------------------
DROP TABLE IF EXISTS `nb_file`;
CREATE TABLE `nb_file`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255)  NOT NULL,
  `post` datetime,
  `url` varchar(500) ,
  PRIMARY KEY (`id`) 
);

-- ----------------------------
-- Table structure for nb_function_panel
-- ----------------------------
DROP TABLE IF EXISTS `nb_function_panel`;
CREATE TABLE `nb_function_panel`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `jump_msg` varchar(255) ,
  `logo_href` varchar(255)  NOT NULL,
  `logo_icon` varchar(255)  NOT NULL,
  `logo_name` varchar(10)  NOT NULL,
  PRIMARY KEY (`id`) 
);

-- ----------------------------
-- Table structure for nb_keyword
-- ----------------------------
DROP TABLE IF EXISTS `nb_keyword`;
CREATE TABLE `nb_keyword`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `enable` tinyint(1) NOT NULL,
  `words` varchar(255)  NOT NULL,
  PRIMARY KEY (`id`) 
);

-- ----------------------------
-- Table structure for nb_message
-- ----------------------------
DROP TABLE IF EXISTS `nb_message`;
CREATE TABLE `nb_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `clear_comment` varchar(255) ,
  `comment` varchar(255)  NOT NULL,
  `enable` tinyint(1),
  `ip_addr` varchar(50) ,
  `ip_cn_addr` varchar(50) ,
  `post` datetime,
  `user_agent` varchar(255) ,
  `user_id` bigint(20) NOT NULL,
  `user_refer_id` bigint(20),
  PRIMARY KEY (`id`) ,
  INDEX `FKjldkpoxxyluabgc2jfloi47y4`(`user_refer_id`)
);

-- ----------------------------
-- Table structure for nb_note
-- ----------------------------
DROP TABLE IF EXISTS `nb_note`;
CREATE TABLE `nb_note`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `clear_content` text ,
  `content` text  NOT NULL,
  `md_content` text ,
  `modify` datetime,
  `post` datetime NOT NULL,
  `show` tinyint(1) NOT NULL,
  `title` varchar(50)  NOT NULL,
  `top` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) 
);

-- ----------------------------
-- Table structure for nb_panel
-- ----------------------------
DROP TABLE IF EXISTS `nb_panel`;
CREATE TABLE `nb_panel`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `enable` tinyint(1) NOT NULL,
  `order_index` int(11) NOT NULL,
  `panel_dom` varchar(255) ,
  `title_name` varchar(5)  NOT NULL,
  PRIMARY KEY (`id`) 
);

-- ----------------------------
-- Records of nb_panel
-- ----------------------------
INSERT INTO `nb_panel` VALUES (1, 1, 0, 'infoPanel', '信息面板');
INSERT INTO `nb_panel` VALUES (2, 1, 1, 'searchPanel', '搜索库');
INSERT INTO `nb_panel` VALUES (3, 1, 2, 'functionPanel', '功能区');
INSERT INTO `nb_panel` VALUES (4, 1, 3, 'catePanel', '分类堆');
INSERT INTO `nb_panel` VALUES (5, 1, 4, 'randomPanel', '博文栈');
INSERT INTO `nb_panel` VALUES (6, 1, 5, 'tagPanel', '标签页');
INSERT INTO `nb_panel` VALUES (7, 1, 6, 'linkPanel', '友链区');

-- ----------------------------
-- Table structure for nb_param
-- ----------------------------
DROP TABLE IF EXISTS `nb_param`;
CREATE TABLE `nb_param`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT 0,
  `name` varchar(50)  NOT NULL,
  `order_index` int(11) DEFAULT 0,
  `remark` varchar(255) ,
  `value` varchar(600) ,
  PRIMARY KEY (`id`) 
);

-- ----------------------------
-- Records of nb_param
-- ----------------------------
INSERT INTO `nb_param` VALUES (1, 0, 'init_status', 0, '标记用户App 的初始化设置页面设置过', '1');
INSERT INTO `nb_param` VALUES (2, 10, 'all_comment_open', 0, '是否全局开放评论', '1');
INSERT INTO `nb_param` VALUES (3, 10, 'menu_note_show', 0, '导航菜单_笔记是否显示，默认显示', '1');
INSERT INTO `nb_param` VALUES (4, 10, 'menu_project_show', 0, '导航菜单_我的作品是否显示，默认不显示', '0');
INSERT INTO `nb_param` VALUES (5, 10, 'menu_mine_show', 0, '导航菜单_关于我是否显示，默认显示', '1');
INSERT INTO `nb_param` VALUES (6, 10, 'menu_cloud_file_show', 0, '导航菜单_云文件是否显示，默认显示', '1');
INSERT INTO `nb_param` VALUES (7, 10, 'menu_search_show', 0, '导航菜单_搜索是否显示，默认显示', '1');
INSERT INTO `nb_param` VALUES (8, 10, 'menu_link_show', 0, '是否显示额外的导航链接（譬如github）', '0');
INSERT INTO `nb_param` VALUES (9, 9, 'app_id', 0, 'qq登录API的app_id', '');
INSERT INTO `nb_param` VALUES (10, 9, 'app_key', 0, 'qq登录API的app_key', '');
INSERT INTO `nb_param` VALUES (11, 10, 'qq_login', 0, '是否开放qq登录', '0');
INSERT INTO `nb_param` VALUES (12, 0, 'is_set_master', 0, '是否设置了网站管理员', '1');
INSERT INTO `nb_param` VALUES (13, 10, 'is_open_message', 0, '是否开启留言功能', '0');
INSERT INTO `nb_param` VALUES (14, 10, 'info_panel_order', 0, '网站信息和会员中心显示顺序，1表示网站信息显示在首要位置', '1');
INSERT INTO `nb_param` VALUES (15, 9, 'upload_type', 0, '上传方式类型，默认local，本地上传', 'LOCAL');
INSERT INTO `nb_param` VALUES (16, 9, 'is_open_oss_upload', 0, '是否开启云服务器上传，默认0不开启', '0');
INSERT INTO `nb_param` VALUES (17, 9, 'qiniu_accessKey', 0, '七牛云AccessKey', '');
INSERT INTO `nb_param` VALUES (18, 9, 'qiniu_secretKey', 0, '七牛云SecretKey', '');
INSERT INTO `nb_param` VALUES (19, 9, 'qiniu_bucket', 0, '七牛云bucket', '');
INSERT INTO `nb_param` VALUES (20, 10, 'page_modern', 0, '首页博文分页模式0：流式，1：按钮加载', '0');
INSERT INTO `nb_param` VALUES (21, 10, 'index_style', 0, '首页样式，简约/普通（simple/normal）', 'normal');
INSERT INTO `nb_param` VALUES (22, -1, 'blog_index_page_size', 0, '博客首页文章页面数据量大小，大于10才有效,否则则根据参数来判断', '10');
INSERT INTO `nb_param` VALUES (23, 10, 'statistic_analysis', 0, '是否开启访问统计，默认不开启', '0');
INSERT INTO `nb_param` VALUES (24, 10, 'article_summary_words_length', 0, '首页展示文章的摘要的文字数量，默认243', '243');
INSERT INTO `nb_param` VALUES (25, 10, 'website_title', 0, '网站标题的文字', '新闻网');
INSERT INTO `nb_param` VALUES (26, 10, 'footer_words', 0, '页脚的文字', '此处一般可写一些备案号之类的文字');
INSERT INTO `nb_param` VALUES (27, 10, 'index_top_words', 0, '首页置顶文字', '写下你的座右铭吧');
INSERT INTO `nb_param` VALUES (28, 10, 'menu_home', 0, '导航菜单_首页', '主页');
INSERT INTO `nb_param` VALUES (29, 10, 'menu_project', 0, '导航菜单_我的作品', '作品');
INSERT INTO `nb_param` VALUES (30, 10, 'menu_note', 0, '导航菜单_笔记', '笔记');
INSERT INTO `nb_param` VALUES (31, 10, 'menu_link', 0, '导航菜单_额外的链接', '代码');
INSERT INTO `nb_param` VALUES (32, 10, 'menu_link_icon', 0, '导航菜单_额外的链接的字体图标logo', 'fa fa-code');
INSERT INTO `nb_param` VALUES (33, 10, 'menu_link_href', 0, '导航菜单_额外的链接url', '');
INSERT INTO `nb_param` VALUES (34, 10, 'menu_mine', 0, '导航菜单_关于我', '关于');
INSERT INTO `nb_param` VALUES (35, 10, 'menu_cloud_file', 0, '导航菜单_云文件', '文件');
INSERT INTO `nb_param` VALUES (36, 11, 'wechat_pay', 0, '微信付款码', '/static/assets/img/wechat.png');
INSERT INTO `nb_param` VALUES (37, 11, 'alipay', 0, '支付宝付款码', '/static/assets/img/alipay.png');
INSERT INTO `nb_param` VALUES (38, 10, 'info_label', 0, '信息板内容', '此处填写网站的一些信息');
INSERT INTO `nb_param` VALUES (39, 10, 'menu_search', 0, '导航菜单_搜索', '搜索');
INSERT INTO `nb_param` VALUES (40, 10, 'website_logo_words', 0, '网站logo的文字', '楠斯个人博客');
INSERT INTO `nb_param` VALUES (41, 10, 'website_logo_small_words', 0, '网站logo的文字旁的小字', '这是一个小标题');
INSERT INTO `nb_param` VALUES (42, 10, 'comment_notice', 0, '评论置顶公告', '遵守国家法律法规，请勿回复无意义内容，请不要回复嵌套过多的楼层！');
INSERT INTO `nb_param` VALUES (43, 10, 'project_top_notice', 0, '项目置顶公告', '资源分享');
INSERT INTO `nb_param` VALUES (44, 10, 'message_panel_words', 0, '留言板的提示信息文字', '欢迎大家');
INSERT INTO `nb_param` VALUES (45, 10, 'qiniu_domain', 0, '七牛云文件服务器域名', '');
INSERT INTO `nb_param` VALUES (46, 8, 'mail_smpt_server_addr', 0, 'SMTP服务器', '');
INSERT INTO `nb_param` VALUES (47, 8, 'mail_smpt_server_port', 0, 'SMTP端口号', '');
INSERT INTO `nb_param` VALUES (48, 8, 'mail_server_account', 0, '发件人邮箱', '229670104@qq.com');
INSERT INTO `nb_param` VALUES (49, 8, 'mail_sender_name', 0, '发件人邮箱帐号（一般为@前面部分）', 'nbv4_user');
INSERT INTO `nb_param` VALUES (50, 8, 'mail_server_password', 0, '邮箱登入密码', '');

-- ----------------------------
-- Table structure for nb_project
-- ----------------------------
DROP TABLE IF EXISTS `nb_project`;
CREATE TABLE `nb_project`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cate_id` bigint(20) NOT NULL,
  `cover` varchar(255)  NOT NULL,
  `description` varchar(255) ,
  `modify` datetime,
  `name` varchar(11)  NOT NULL,
  `post` datetime,
  `url` varchar(255) ,
  `cate_refer_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) 

);

-- ----------------------------
-- Table structure for nb_project_cate
-- ----------------------------
DROP TABLE IF EXISTS `nb_project_cate`;
CREATE TABLE `nb_project_cate`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cn_name` varchar(50) ,
  `name` varchar(50)  NOT NULL,
  PRIMARY KEY (`id`) 
);

-- ----------------------------
-- Table structure for nb_tag
-- ----------------------------
DROP TABLE IF EXISTS `nb_tag`;
CREATE TABLE `nb_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50)  NOT NULL,
  PRIMARY KEY (`id`) 
);

-- ----------------------------
-- Records of nb_tag
-- ----------------------------
INSERT INTO `nb_tag` VALUES (1, 'undefined');
INSERT INTO `nb_tag` VALUES (2, '淘宝店楠斯素材');

-- ----------------------------
-- Table structure for nb_tag_refer
-- ----------------------------
DROP TABLE IF EXISTS `nb_tag_refer`;
CREATE TABLE `nb_tag_refer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `refer_id` bigint(20) NOT NULL,
  `show` tinyint(1) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  `type` varchar(50)  NOT NULL,
  PRIMARY KEY (`id`) 
);

-- ----------------------------
-- Records of nb_tag_refer
-- ----------------------------
INSERT INTO `nb_tag_refer` VALUES (1, 1563610016078, 1, 1, 'article');
INSERT INTO `nb_tag_refer` VALUES (2, 1563759339226, 1, 1, 'article');
INSERT INTO `nb_tag_refer` VALUES (3, 1564936050961, 1, 2, 'article');

-- ----------------------------
-- Table structure for nb_upload
-- ----------------------------
DROP TABLE IF EXISTS `nb_upload`;
CREATE TABLE `nb_upload`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `disk_path` varchar(255)  NOT NULL,
  `type` varchar(50)  NOT NULL,
  `upload` datetime,
  `virtual_path` varchar(255)  NOT NULL,
  PRIMARY KEY (`id`) 
);

-- ----------------------------
-- Records of nb_upload
-- ----------------------------
INSERT INTO `nb_upload` VALUES (1, 'F:/upload/noteblogv4/img/2019-07-20/a2c523ca-6690-451f-87bb-9cc9b2665cd8.png', 'image/png', '2019-07-20 16:06:04.124000', '/upfiles/img/2019-07-20/a2c523ca-6690-451f-87bb-9cc9b2665cd8.png');
INSERT INTO `nb_upload` VALUES (2, 'F:/upload/noteblogv4/img/2019-07-22/e3ebebab-eb1a-4d4e-90ae-b9b302e61e05.jpg', 'image/jpeg', '2019-07-22 09:34:19.342000', '/upfiles/img/2019-07-22/e3ebebab-eb1a-4d4e-90ae-b9b302e61e05.jpg');
INSERT INTO `nb_upload` VALUES (3, 'F:/upload/noteblogv4/img/2019-07-22/d2216f64-8c2b-4966-bd22-1ddfa2ef9681.jpg', 'image/jpeg', '2019-07-22 09:34:53.993000', '/upfiles/img/2019-07-22/d2216f64-8c2b-4966-bd22-1ddfa2ef9681.jpg');

-- ----------------------------
-- Table structure for sys_logger
-- ----------------------------
DROP TABLE IF EXISTS `sys_logger`;
CREATE TABLE `sys_logger`  (
  `id` varchar(255)  NOT NULL,
  `content_type` varchar(255) ,
  `ip_addr` varchar(255) ,
  `ip_info` varchar(255) ,
  `request_method` varchar(255) ,
  `session_id` varchar(255) ,
  `time` datetime,
  `url` varchar(255) ,
  `user_agent` varchar(255) ,
  `username` varchar(255) ,
  PRIMARY KEY (`id`) 
);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `enable` tinyint(1) NOT NULL,
  `icon` varchar(255) ,
  `name` varchar(255) ,
  `order_index` int(11),
  `parent_id` bigint(20) NOT NULL,
  `remark` varchar(255) ,
  `role_id` bigint(20),
  `type` varchar(255) ,
  `resource_id` bigint(20),
  PRIMARY KEY (`id`) 
);

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 1, 'layui-icon layui-icon-home', '菜单根目录', 0, 0, NULL, NULL, 'ROOT', NULL);
INSERT INTO `sys_menu` VALUES (2, 1, 'layui-icon layui-icon-console', '仪表盘', 0, 1, '管理页面仪表盘界面', 1, 'PARENT', 4);
INSERT INTO `sys_menu` VALUES (3, 0, 'layui-icon layui-icon-auz', '权限管理', 1, 1, NULL, 1, 'PARENT', NULL);
INSERT INTO `sys_menu` VALUES (4, 0, 'fa fa-list-ul', '菜单管理', 0, 3, '菜单管理页面', 1, 'LEAF', 8);
INSERT INTO `sys_menu` VALUES (5, 0, 'fa fa-user-o', '角色管理', 1, 3, '后台角色管理页面', 1, 'LEAF', 16);
INSERT INTO `sys_menu` VALUES (6, 0, 'fa fa-users', '用户管理', 2, 3, '用户管理界面', 1, 'LEAF', 22);
INSERT INTO `sys_menu` VALUES (7, 1, 'layui-icon layui-icon-edit', '内容发布', 2, 1, NULL, 1, 'PARENT', NULL);
INSERT INTO `sys_menu` VALUES (8, 1, 'fa fa-send-o', '发布文章', 0, 7, '博文发布页面', 1, 'LEAF', 34);
INSERT INTO `sys_menu` VALUES (9, 1, 'fa fa-file-text-o', '随记随笔', 1, 7, '随笔/笔记发布页面', 1, 'LEAF', 50);
INSERT INTO `sys_menu` VALUES (10, 1, 'layui-icon layui-icon-template-1', '内容管理', 3, 1, NULL, 1, 'PARENT', NULL);
INSERT INTO `sys_menu` VALUES (11, 1, 'fa fa-newspaper-o', '文章管理', 0, 10, '博文管理页面', 1, 'LEAF', 42);
INSERT INTO `sys_menu` VALUES (12, 1, 'fa fa-file-o', '随笔管理', 1, 10, '随笔管理页面', 1, 'LEAF', 49);
INSERT INTO `sys_menu` VALUES (13, 1, 'layui-icon layui-icon-read', '字典管理', 4, 1, NULL, 1, 'PARENT', NULL);
INSERT INTO `sys_menu` VALUES (14, 1, 'fa fa-clone', '分类管理', 0, 13, '分类管理页面', 1, 'LEAF', 55);
INSERT INTO `sys_menu` VALUES (15, 1, 'fa fa-hdd-o', '项目分类管理', 1, 13, '项目分类管理页面', 1, 'LEAF', 71);
INSERT INTO `sys_menu` VALUES (16, 1, 'fa fa-hdd-o', '云文件分类管理', 2, 13, '云文件分类管理页面', 1, 'LEAF', 60);
INSERT INTO `sys_menu` VALUES (17, 1, 'fa fa-dot-circle-o', '关键字管理', 3, 13, '关键字管理页面', 1, 'LEAF', 64);
INSERT INTO `sys_menu` VALUES (18, 1, 'fa fa-tags', '标签管理', 4, 13, '标签管理页面', 1, 'LEAF', 77);
INSERT INTO `sys_menu` VALUES (19, 1, 'layui-icon layui-icon-set', '偏好设置', 5, 1, NULL, 1, 'PARENT', NULL);
INSERT INTO `sys_menu` VALUES (20, 1, 'fa fa-qrcode', '二维码设置', 0, 19, '微信和支付宝二维码图片设置界面', 1, 'LEAF', 102);
INSERT INTO `sys_menu` VALUES (21, 1, 'fa fa-cogs', '网站基本设置', 1, 19, '网站基本设置界面', 1, 'LEAF', 100);
INSERT INTO `sys_menu` VALUES (22, 1, 'fa fa-cog', '网站风格设置', 2, 19, '网站风格设置界面', 1, 'LEAF', 103);
INSERT INTO `sys_menu` VALUES (23, 1, 'fa fa-address-card-o', '个人资料', 3, 19, '管理员个人信息设置', 1, 'LEAF', 101);
INSERT INTO `sys_menu` VALUES (24, 1, 'fa fa-server', '邮件服务器', 4, 19, '网站发送邮件服务器设置', 1, 'LEAF', 104);
INSERT INTO `sys_menu` VALUES (25, 1, 'layui-icon layui-icon-diamond', '个人内容', 6, 1, NULL, 1, 'PARENT', NULL);
INSERT INTO `sys_menu` VALUES (26, 1, 'fa fa-hdd-o', '关于内容', 0, 25, '关于tab内容管理页面', 1, 'LEAF', 84);
INSERT INTO `sys_menu` VALUES (27, 1, 'fa fa-laptop', '资源项目分享', 1, 25, '项目管理页面', 1, 'LEAF', 93);
INSERT INTO `sys_menu` VALUES (28, 1, 'fa fa-file-archive-o', '云文件分享', 2, 25, '云文件管理页面', 1, 'LEAF', 27);
INSERT INTO `sys_menu` VALUES (29, 1, 'layui-icon layui-icon-username', '消息管理', 7, 1, NULL, 1, 'PARENT', NULL);
INSERT INTO `sys_menu` VALUES (30, 1, 'fa fa-comments-o', '评论管理', 0, 29, '评论管理页面', 1, 'LEAF', 80);
INSERT INTO `sys_menu` VALUES (31, 1, 'fa fa-globe', '留言管理', 1, 29, '消息管理页面', 1, 'LEAF', 83);

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group` varchar(255) ,
  `name` varchar(50)  NOT NULL,
  `permission` varchar(50)  NOT NULL,
  `type` varchar(255) ,
  `url` varchar(255)  NOT NULL,
  PRIMARY KEY (`id`) 
);

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES (1, 'PAGE', '用户注销请求地址', 'user:logout:page', 'OTHER', '/management/logout');
INSERT INTO `sys_resource` VALUES (2, 'PAGE', '字体图标预览', 'user:font:page', 'NAV_LINK', '/font/list');
INSERT INTO `sys_resource` VALUES (3, 'PAGE', '后台管理首页', 'management:index:page', 'OTHER', '/management/index');
INSERT INTO `sys_resource` VALUES (4, 'ROUTER', '管理页面仪表盘界面', 'management:index:dashboard', 'NAV_LINK', '/management/dashboard');
INSERT INTO `sys_resource` VALUES (5, 'AJAX', '添加新角色操作', 'permission:role:create', 'OTHER', '/management/role/create');
INSERT INTO `sys_resource` VALUES (6, 'AJAX', '删除角色菜单', 'permission:menu:delete', 'OTHER', '/management/menu/delete');
INSERT INTO `sys_resource` VALUES (7, 'AJAX', '更新角色所拥有的资源信息', 'permission:role:update_role_resource', 'OTHER', '/management/update/role/resource');
INSERT INTO `sys_resource` VALUES (8, 'ROUTER', '菜单管理页面', 'permission:menu:router', 'NAV_LINK', '/management/menu');
INSERT INTO `sys_resource` VALUES (9, 'AJAX', '修改角色操作', 'permission:role:update', 'OTHER', '/management/role/update');
INSERT INTO `sys_resource` VALUES (10, 'AJAX', '菜单管理界面的菜单数据', 'permission:menu:table_list', 'OTHER', '/management/menu/list');
INSERT INTO `sys_resource` VALUES (11, 'AJAX', '修改角色菜单', 'permission:menu:update', 'OTHER', '/management/menu/update');
INSERT INTO `sys_resource` VALUES (12, 'AJAX', '删除角色操作', 'permission:role:delete', 'OTHER', '/management/role/delete');
INSERT INTO `sys_resource` VALUES (13, 'ROUTER', '添加角色菜单界面', 'permission:menu:add', 'OTHER', '/management/menu/add');
INSERT INTO `sys_resource` VALUES (14, 'ROUTER', '修改角色菜单界面', 'permission:menu:edit', 'OTHER', '/management/menu/edit');
INSERT INTO `sys_resource` VALUES (15, 'AJAX', '添加新角色菜单操作', 'permission:menu:create', 'OTHER', '/management/menu/create');
INSERT INTO `sys_resource` VALUES (16, 'ROUTER', '后台角色管理页面', 'permission:role:router', 'NAV_LINK', '/management/role');
INSERT INTO `sys_resource` VALUES (17, 'AJAX', '后台角色管理页面的资源树', 'permission:role:resource_tree', 'OTHER', '/management/resource/tree');
INSERT INTO `sys_resource` VALUES (18, 'AJAX', '用户信息分页数据', 'management:user:table_list', 'OTHER', '/management/users/list');
INSERT INTO `sys_resource` VALUES (19, 'AJAX', '修改用户的角色关联信息', 'management:user:role_update', 'OTHER', '/management/users/roles/id/update');
INSERT INTO `sys_resource` VALUES (20, 'AJAX', '修改用户的角色关联信息', 'management:user:role_update', 'OTHER', '/management/users/roles/str/update');
INSERT INTO `sys_resource` VALUES (21, 'AJAX', '查询用户的角色信息', 'management:user:role_list', 'OTHER', '/management/users/roles/list');
INSERT INTO `sys_resource` VALUES (22, 'ROUTER', '用户管理界面', 'management:user:router', 'NAV_LINK', '/management/users');
INSERT INTO `sys_resource` VALUES (23, 'AJAX', '修改用户状态信息', 'management:user:enable_update', 'OTHER', '/management/users/enable/update');
INSERT INTO `sys_resource` VALUES (24, 'AJAX', '修改用户昵称信息', 'management:user:nickname_update', 'OTHER', '/management/users/nickname/update');
INSERT INTO `sys_resource` VALUES (25, 'ROUTER', '云文件发布页面', 'management:cloudFile:add_page', 'NAV_LINK', '/management/cloudFile/add');
INSERT INTO `sys_resource` VALUES (26, 'AJAX', '删除云文件操作', 'management:cloudFile:delete', 'OTHER', '/management/cloudFile/delete/{id}');
INSERT INTO `sys_resource` VALUES (27, 'ROUTER', '云文件管理页面', 'management:cloudFile:list_page', 'NAV_LINK', '/management/cloudFile');
INSERT INTO `sys_resource` VALUES (28, 'ROUTER', '云文件管编辑页面', 'management:cloudFile:edit_page', 'OTHER', '/management/cloudFile/edit');
INSERT INTO `sys_resource` VALUES (29, 'AJAX', '修改一个云文件', 'management:cloudFile:update', 'OTHER', '/management/cloudFile/update');
INSERT INTO `sys_resource` VALUES (30, 'AJAX', '发布一个新的项目', 'management:cloudFile:create', 'OTHER', '/management/cloudFile/create');
INSERT INTO `sys_resource` VALUES (31, 'AJAX', '云文件管理页面中的数据接口', 'management:cloudFile:list_data', 'OTHER', '/management/cloudFile/list');
INSERT INTO `sys_resource` VALUES (32, 'AJAX', '删除文章操作', 'management:article:delete', 'OTHER', '/management/article/delete/{id}');
INSERT INTO `sys_resource` VALUES (33, 'AJAX', '修改文章的置顶状态', 'management:article:update_top', 'OTHER', '/management/article/update/top/{id}');
INSERT INTO `sys_resource` VALUES (34, 'ROUTER', '博文发布页面', 'management:article:post_page', 'NAV_LINK', '/management/article/post');
INSERT INTO `sys_resource` VALUES (35, 'AJAX', '修改文章的可评论状态', 'management:article:update_commented', 'OTHER', '/management/article/update/commented/{id}');
INSERT INTO `sys_resource` VALUES (36, 'AJAX', '修改文章的可赞赏状态', 'management:article:update_appreciable', 'OTHER', '/management/article/update/appreciable/{id}');
INSERT INTO `sys_resource` VALUES (37, 'AJAX', '编辑文章页面的tag数据包含选中的(selected)', 'management:article:edit_article_tags', 'OTHER', '/management/article/edit/tags');
INSERT INTO `sys_resource` VALUES (38, 'AJAX', '修改一篇博文', 'management:article:update', 'OTHER', '/management/article/update');
INSERT INTO `sys_resource` VALUES (39, 'AJAX', '发布一篇新的博文', 'management:article:create', 'OTHER', '/management/article/create');
INSERT INTO `sys_resource` VALUES (40, 'ROUTER', '博文管编辑页面', 'management:article:edit_page', 'OTHER', '/management/article/edit');
INSERT INTO `sys_resource` VALUES (41, 'AJAX', '博文管理页面中的数据接口', 'management:article:list_data', 'OTHER', '/management/article/list');
INSERT INTO `sys_resource` VALUES (42, 'ROUTER', '博文管理页面', 'management:article:list_page', 'NAV_LINK', '/management/article');
INSERT INTO `sys_resource` VALUES (43, 'AJAX', '删除笔记操作', 'management:note:delete', 'OTHER', '/management/note/delete/{id}');
INSERT INTO `sys_resource` VALUES (44, 'AJAX', '修改笔记的置顶状态', 'management:note:update_top', 'OTHER', '/management/note/update/top/{id}');
INSERT INTO `sys_resource` VALUES (45, 'AJAX', '修改一篇随笔/笔记', 'management:note:update', 'OTHER', '/management/note/update');
INSERT INTO `sys_resource` VALUES (46, 'AJAX', '修改笔记的显隐状态', 'management:note:update_show', 'OTHER', '/management/note/update/show/{id}');
INSERT INTO `sys_resource` VALUES (47, 'AJAX', '编辑随笔/笔记页面的tag数据包含选中的(selected)', 'management:note:edit_note_tags', 'OTHER', '/management/note/edit/tags');
INSERT INTO `sys_resource` VALUES (48, 'AJAX', '随笔管理页面中的数据接口', 'management:note:list_data', 'OTHER', '/management/note/list');
INSERT INTO `sys_resource` VALUES (49, 'ROUTER', '随笔管理页面', 'management:note:list_page', 'NAV_LINK', '/management/note');
INSERT INTO `sys_resource` VALUES (50, 'ROUTER', '随笔/笔记发布页面', 'management:note:post_page', 'NAV_LINK', '/management/note/post');
INSERT INTO `sys_resource` VALUES (51, 'AJAX', '发布一篇新的随笔/笔记', 'management:note:create', 'OTHER', '/management/note/create');
INSERT INTO `sys_resource` VALUES (52, 'ROUTER', '随笔管编辑页面', 'management:note:edit_page', 'OTHER', '/management/note/edit');
INSERT INTO `sys_resource` VALUES (53, 'AJAX', '修改分类操作', 'management:cate:update', 'OTHER', '/management/dictionary/cate/update');
INSERT INTO `sys_resource` VALUES (54, 'AJAX', '删除分类操作', 'management:cate:delete', 'OTHER', '/management/dictionary/cate/delete');
INSERT INTO `sys_resource` VALUES (55, 'ROUTER', '分类管理页面', 'management:cate:page', 'NAV_LINK', '/management/dictionary/cate');
INSERT INTO `sys_resource` VALUES (56, 'AJAX', '分类管理分页数据', 'management:cate:list', 'OTHER', '/management/dictionary/cate/list');
INSERT INTO `sys_resource` VALUES (57, 'AJAX', '添加分类操作', 'management:cate:create', 'OTHER', '/management/dictionary/cate/create');
INSERT INTO `sys_resource` VALUES (58, 'AJAX', '修改云文件分类操作', 'management:cloudFileCate:update', 'OTHER', '/management/dictionary/cloudFileCate/update');
INSERT INTO `sys_resource` VALUES (59, 'AJAX', '删除云文件分类操作', 'management:cloudFileCate:delete', 'OTHER', '/management/dictionary/cloudFileCate/delete');
INSERT INTO `sys_resource` VALUES (60, 'ROUTER', '云文件分类管理页面', 'management:cloudFileCate:page', 'NAV_LINK', '/management/dictionary/cloudFileCate');
INSERT INTO `sys_resource` VALUES (61, 'AJAX', '云文件分类管理分页数据', 'management:cloudFileCate:list', 'OTHER', '/management/dictionary/cloudFileCate/list');
INSERT INTO `sys_resource` VALUES (62, 'AJAX', '添加云文件分类操作', 'management:cloudFileCate:create', 'OTHER', '/management/dictionary/cloudFileCate/create');
INSERT INTO `sys_resource` VALUES (63, 'AJAX', '删除关键字操作', 'management:keyword:delete', 'OTHER', '/management/dictionary/keyword/delete');
INSERT INTO `sys_resource` VALUES (64, 'ROUTER', '关键字管理页面', 'management:keyword:page', 'NAV_LINK', '/management/dictionary/keyword');
INSERT INTO `sys_resource` VALUES (65, 'AJAX', '更新关键字状态操作', 'management:keyword:enable_update', 'OTHER', '/management/dictionary/keyword/update/enable');
INSERT INTO `sys_resource` VALUES (66, 'AJAX', '关键字管理分页数据', 'management:keyword:list', 'OTHER', '/management/dictionary/keyword/list');
INSERT INTO `sys_resource` VALUES (67, 'AJAX', '添加关键字操作', 'management:keyword:create', 'OTHER', '/management/dictionary/keyword/create');
INSERT INTO `sys_resource` VALUES (68, 'AJAX', '更新关键字文本操作', 'management:keyword:update', 'OTHER', '/management/dictionary/keyword/update');
INSERT INTO `sys_resource` VALUES (69, 'AJAX', '修改项目分类操作', 'management:projectCate:update', 'OTHER', '/management/dictionary/projectCate/update');
INSERT INTO `sys_resource` VALUES (70, 'AJAX', '删除项目分类操作', 'management:projectCate:delete', 'OTHER', '/management/dictionary/projectCate/delete');
INSERT INTO `sys_resource` VALUES (71, 'ROUTER', '项目分类管理页面', 'management:projectCate:page', 'NAV_LINK', '/management/dictionary/projectCate');
INSERT INTO `sys_resource` VALUES (72, 'AJAX', '项目分类管理分页数据', 'management:projectCate:list', 'OTHER', '/management/dictionary/projectCate/list');
INSERT INTO `sys_resource` VALUES (73, 'AJAX', '添加项目分类操作', 'management:projectCate:create', 'OTHER', '/management/dictionary/projectCate/create');
INSERT INTO `sys_resource` VALUES (74, 'AJAX', '修改标签数据操作接口', 'management:tag:update', 'OTHER', '/management/dictionary/tag/update');
INSERT INTO `sys_resource` VALUES (75, 'AJAX', '删除标签数据操作接口', 'management:tag:delete', 'OTHER', '/management/dictionary/tag/delete');
INSERT INTO `sys_resource` VALUES (76, 'AJAX', '标签管理页面分页数据接口', 'management:tag:list', 'OTHER', '/management/dictionary/tag/list');
INSERT INTO `sys_resource` VALUES (77, 'ROUTER', '标签管理页面', 'management:tag:page', 'NAV_LINK', '/management/dictionary/tag');
INSERT INTO `sys_resource` VALUES (78, 'AJAX', '修改评论状态', 'management:comment:update', 'OTHER', '/management/comment/update');
INSERT INTO `sys_resource` VALUES (79, 'AJAX', '评论管理页面分页数据接口', 'management:comment:list', 'OTHER', '/management/comment/list');
INSERT INTO `sys_resource` VALUES (80, 'ROUTER', '评论管理页面', 'management:comment:page', 'NAV_LINK', '/management/comment');
INSERT INTO `sys_resource` VALUES (81, 'AJAX', '修改评论状态', 'management:message:update', 'OTHER', '/management/message/update');
INSERT INTO `sys_resource` VALUES (82, 'AJAX', '消息管理页面分页数据接口', 'management:message:list', 'OTHER', '/management/message/list');
INSERT INTO `sys_resource` VALUES (83, 'ROUTER', '消息管理页面', 'management:message:page', 'NAV_LINK', '/management/message');
INSERT INTO `sys_resource` VALUES (84, 'ROUTER', '关于tab内容管理页面', 'management:profile:page', 'NAV_LINK', '/management/profile');
INSERT INTO `sys_resource` VALUES (85, 'AJAX', '删除关于tab内容操作', 'management:profile:delete', 'OTHER', '/management/profile/delete');
INSERT INTO `sys_resource` VALUES (86, 'ROUTER', '添加tab页面', 'management:profile:add', 'NAV_LINK', '/management/profile/add');
INSERT INTO `sys_resource` VALUES (87, 'ROUTER', 'tab内容编辑页面', 'management:profile:edit', 'OTHER', '/management/profile/edit');
INSERT INTO `sys_resource` VALUES (88, 'AJAX', '添加关于关于tab内容操作', 'management:profile:create', 'OTHER', '/management/profile/create');
INSERT INTO `sys_resource` VALUES (89, 'AJAX', '更新关于tab内容操作', 'management:profile:update', 'OTHER', '/management/profile/update');
INSERT INTO `sys_resource` VALUES (90, 'AJAX', '关于tab内容管理分页数据', 'management:profile:list', 'OTHER', '/management/profile/list');
INSERT INTO `sys_resource` VALUES (91, 'ROUTER', '项目发布页面', 'management:project:add_page', 'NAV_LINK', '/management/project/add');
INSERT INTO `sys_resource` VALUES (92, 'AJAX', '删除项目操作', 'management:project:delete', 'OTHER', '/management/project/delete/{id}');
INSERT INTO `sys_resource` VALUES (93, 'ROUTER', '项目管理页面', 'management:project:list_page', 'NAV_LINK', '/management/project');
INSERT INTO `sys_resource` VALUES (94, 'ROUTER', '项目管编辑页面', 'management:project:edit_page', 'OTHER', '/management/project/edit');
INSERT INTO `sys_resource` VALUES (95, 'AJAX', '修改一篇项目', 'management:project:update', 'OTHER', '/management/project/update');
INSERT INTO `sys_resource` VALUES (96, 'AJAX', '发布一个新的项目', 'management:project:create', 'OTHER', '/management/project/create');
INSERT INTO `sys_resource` VALUES (97, 'AJAX', '项目管理页面中的数据接口', 'management:project:list_data', 'OTHER', '/management/project/list');
INSERT INTO `sys_resource` VALUES (98, 'AJAX', '网站设置修改操作', 'management:settings:update', 'OTHER', '/management/settings/update');
INSERT INTO `sys_resource` VALUES (99, 'AJAX', '网站邮件服务器修改操作', 'management:settings:mail_update', 'OTHER', '/management/settings/mail/update');
INSERT INTO `sys_resource` VALUES (100, 'ROUTER', '网站基本设置界面', 'management:settings:common', 'NAV_LINK', '/management/settings/common');
INSERT INTO `sys_resource` VALUES (101, 'ROUTER', '管理员个人信息设置', 'management:settings:profile', 'NAV_LINK', '/management/settings/profile');
INSERT INTO `sys_resource` VALUES (102, 'ROUTER', '微信和支付宝二维码图片设置界面', 'management:settings:qrcode', 'NAV_LINK', '/management/settings/qrcode');
INSERT INTO `sys_resource` VALUES (103, 'ROUTER', '网站风格设置界面', 'management:settings:theme', 'NAV_LINK', '/management/settings/theme');
INSERT INTO `sys_resource` VALUES (104, 'ROUTER', '网站发送邮件服务器设置', 'management:settings:mail', 'NAV_LINK', '/management/settings/mail');
INSERT INTO `sys_resource` VALUES (105, 'AJAX', '支付宝/微信二维码修改操作', 'management:settings:pay_update', 'OTHER', '/management/settings/pay/update');
INSERT INTO `sys_resource` VALUES (106, 'AJAX', '网站管理员修改操作', 'management:settings:profile_update', 'OTHER', '/management/settings/profile/update');
INSERT INTO `sys_resource` VALUES (107, 'AJAX', '通用上传接口', 'management:common:upload', 'OTHER', '/management/upload');
INSERT INTO `sys_resource` VALUES (108, 'AJAX', 'editormd编辑器上传接口', 'management:editormd:upload', 'OTHER', '/management/upload/editorMD');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cn_name` varchar(50) ,
  `name` varchar(50)  NOT NULL,
  PRIMARY KEY (`id`) 
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '网站管理员', 'ROLE_MASTER');
INSERT INTO `sys_role` VALUES (2, '网站访客', 'ROLE_USER');

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource`  (
  `resource_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`resource_id`, `role_id`) 
) ;

-- ----------------------------
-- Records of sys_role_resource
-- ----------------------------
INSERT INTO `sys_role_resource` VALUES (1, 1, 1);
INSERT INTO `sys_role_resource` VALUES (2, 1, 1);
INSERT INTO `sys_role_resource` VALUES (3, 1, 1);
INSERT INTO `sys_role_resource` VALUES (4, 1, 1);
INSERT INTO `sys_role_resource` VALUES (5, 1, 1);
INSERT INTO `sys_role_resource` VALUES (6, 1, 1);
INSERT INTO `sys_role_resource` VALUES (7, 1, 1);
INSERT INTO `sys_role_resource` VALUES (8, 1, 1);
INSERT INTO `sys_role_resource` VALUES (9, 1, 1);
INSERT INTO `sys_role_resource` VALUES (10, 1, 1);
INSERT INTO `sys_role_resource` VALUES (11, 1, 1);
INSERT INTO `sys_role_resource` VALUES (12, 1, 1);
INSERT INTO `sys_role_resource` VALUES (13, 1, 1);
INSERT INTO `sys_role_resource` VALUES (14, 1, 1);
INSERT INTO `sys_role_resource` VALUES (15, 1, 1);
INSERT INTO `sys_role_resource` VALUES (16, 1, 1);
INSERT INTO `sys_role_resource` VALUES (17, 1, 1);
INSERT INTO `sys_role_resource` VALUES (18, 1, 1);
INSERT INTO `sys_role_resource` VALUES (19, 1, 1);
INSERT INTO `sys_role_resource` VALUES (20, 1, 1);
INSERT INTO `sys_role_resource` VALUES (21, 1, 1);
INSERT INTO `sys_role_resource` VALUES (22, 1, 1);
INSERT INTO `sys_role_resource` VALUES (23, 1, 1);
INSERT INTO `sys_role_resource` VALUES (24, 1, 1);
INSERT INTO `sys_role_resource` VALUES (25, 1, 1);
INSERT INTO `sys_role_resource` VALUES (26, 1, 1);
INSERT INTO `sys_role_resource` VALUES (27, 1, 1);
INSERT INTO `sys_role_resource` VALUES (28, 1, 1);
INSERT INTO `sys_role_resource` VALUES (29, 1, 1);
INSERT INTO `sys_role_resource` VALUES (30, 1, 1);
INSERT INTO `sys_role_resource` VALUES (31, 1, 1);
INSERT INTO `sys_role_resource` VALUES (32, 1, 1);
INSERT INTO `sys_role_resource` VALUES (33, 1, 1);
INSERT INTO `sys_role_resource` VALUES (34, 1, 1);
INSERT INTO `sys_role_resource` VALUES (35, 1, 1);
INSERT INTO `sys_role_resource` VALUES (36, 1, 1);
INSERT INTO `sys_role_resource` VALUES (37, 1, 1);
INSERT INTO `sys_role_resource` VALUES (38, 1, 1);
INSERT INTO `sys_role_resource` VALUES (39, 1, 1);
INSERT INTO `sys_role_resource` VALUES (40, 1, 1);
INSERT INTO `sys_role_resource` VALUES (41, 1, 1);
INSERT INTO `sys_role_resource` VALUES (42, 1, 1);
INSERT INTO `sys_role_resource` VALUES (43, 1, 1);
INSERT INTO `sys_role_resource` VALUES (44, 1, 1);
INSERT INTO `sys_role_resource` VALUES (45, 1, 1);
INSERT INTO `sys_role_resource` VALUES (46, 1, 1);
INSERT INTO `sys_role_resource` VALUES (47, 1, 1);
INSERT INTO `sys_role_resource` VALUES (48, 1, 1);
INSERT INTO `sys_role_resource` VALUES (49, 1, 1);
INSERT INTO `sys_role_resource` VALUES (50, 1, 1);
INSERT INTO `sys_role_resource` VALUES (51, 1, 1);
INSERT INTO `sys_role_resource` VALUES (52, 1, 1);
INSERT INTO `sys_role_resource` VALUES (53, 1, 1);
INSERT INTO `sys_role_resource` VALUES (54, 1, 1);
INSERT INTO `sys_role_resource` VALUES (55, 1, 1);
INSERT INTO `sys_role_resource` VALUES (56, 1, 1);
INSERT INTO `sys_role_resource` VALUES (57, 1, 1);
INSERT INTO `sys_role_resource` VALUES (58, 1, 1);
INSERT INTO `sys_role_resource` VALUES (59, 1, 1);
INSERT INTO `sys_role_resource` VALUES (60, 1, 1);
INSERT INTO `sys_role_resource` VALUES (61, 1, 1);
INSERT INTO `sys_role_resource` VALUES (62, 1, 1);
INSERT INTO `sys_role_resource` VALUES (63, 1, 1);
INSERT INTO `sys_role_resource` VALUES (64, 1, 1);
INSERT INTO `sys_role_resource` VALUES (65, 1, 1);
INSERT INTO `sys_role_resource` VALUES (66, 1, 1);
INSERT INTO `sys_role_resource` VALUES (67, 1, 1);
INSERT INTO `sys_role_resource` VALUES (68, 1, 1);
INSERT INTO `sys_role_resource` VALUES (69, 1, 1);
INSERT INTO `sys_role_resource` VALUES (70, 1, 1);
INSERT INTO `sys_role_resource` VALUES (71, 1, 1);
INSERT INTO `sys_role_resource` VALUES (72, 1, 1);
INSERT INTO `sys_role_resource` VALUES (73, 1, 1);
INSERT INTO `sys_role_resource` VALUES (74, 1, 1);
INSERT INTO `sys_role_resource` VALUES (75, 1, 1);
INSERT INTO `sys_role_resource` VALUES (76, 1, 1);
INSERT INTO `sys_role_resource` VALUES (77, 1, 1);
INSERT INTO `sys_role_resource` VALUES (78, 1, 1);
INSERT INTO `sys_role_resource` VALUES (79, 1, 1);
INSERT INTO `sys_role_resource` VALUES (80, 1, 1);
INSERT INTO `sys_role_resource` VALUES (81, 1, 1);
INSERT INTO `sys_role_resource` VALUES (82, 1, 1);
INSERT INTO `sys_role_resource` VALUES (83, 1, 1);
INSERT INTO `sys_role_resource` VALUES (84, 1, 1);
INSERT INTO `sys_role_resource` VALUES (85, 1, 1);
INSERT INTO `sys_role_resource` VALUES (86, 1, 1);
INSERT INTO `sys_role_resource` VALUES (87, 1, 1);
INSERT INTO `sys_role_resource` VALUES (88, 1, 1);
INSERT INTO `sys_role_resource` VALUES (89, 1, 1);
INSERT INTO `sys_role_resource` VALUES (90, 1, 1);
INSERT INTO `sys_role_resource` VALUES (91, 1, 1);
INSERT INTO `sys_role_resource` VALUES (92, 1, 1);
INSERT INTO `sys_role_resource` VALUES (93, 1, 1);
INSERT INTO `sys_role_resource` VALUES (94, 1, 1);
INSERT INTO `sys_role_resource` VALUES (95, 1, 1);
INSERT INTO `sys_role_resource` VALUES (96, 1, 1);
INSERT INTO `sys_role_resource` VALUES (97, 1, 1);
INSERT INTO `sys_role_resource` VALUES (98, 1, 1);
INSERT INTO `sys_role_resource` VALUES (99, 1, 1);
INSERT INTO `sys_role_resource` VALUES (100, 1, 1);
INSERT INTO `sys_role_resource` VALUES (101, 1, 1);
INSERT INTO `sys_role_resource` VALUES (102, 1, 1);
INSERT INTO `sys_role_resource` VALUES (103, 1, 1);
INSERT INTO `sys_role_resource` VALUES (104, 1, 1);
INSERT INTO `sys_role_resource` VALUES (105, 1, 1);
INSERT INTO `sys_role_resource` VALUES (106, 1, 1);
INSERT INTO `sys_role_resource` VALUES (107, 1, 1);
INSERT INTO `sys_role_resource` VALUES (108, 1, 1);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(100) ,
  `create` datetime,
  `default_role_id` bigint(20) NOT NULL,
  `email` varchar(255) ,
  `enable` tinyint(1) NOT NULL,
  `nickname` varchar(50) ,
  `password` varchar(255) ,
  `qq_num` varchar(20) ,
  `qq_open_id` varchar(255) ,
  `username` varchar(20) ,
  `wechat_open_id` varchar(255) ,
  PRIMARY KEY (`id`) 
);

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '/static/assets/img/bmy.png', '2019-07-19 11:12:48.061000', 1, '123455677@qq.com', 1, 'nbv4_user', '9db06bcff9248837f86d1a6bcf41c9e7', NULL, NULL, 'admin', NULL);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`role_id`, `user_id`) 
);

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
