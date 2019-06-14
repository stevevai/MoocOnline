/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50635
 Source Host           : localhost:3306
 Source Schema         : mooc-online

 Target Server Type    : MySQL
 Target Server Version : 50635
 File Encoding         : 65001

 Date: 14/06/2019 23:52:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article_article
-- ----------------------------
DROP TABLE IF EXISTS `article_article`;
CREATE TABLE `article_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `body` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created` datetime(6) NULL,
  `updated` datetime(6) NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `article_articlepost_author_id_b855d44d_fk_users_userprofile_id`(`author_id`) USING BTREE,
  CONSTRAINT `article_articlepost_author_id_b855d44d_fk_users_userprofile_id` FOREIGN KEY (`author_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of article_article
-- ----------------------------
INSERT INTO `article_article` VALUES (1, 'Card title', 'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.', '2019-05-25 03:42:22.000000', '2019-05-25 03:42:34.000000', 1);
INSERT INTO `article_article` VALUES (2, 'Card title', 'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.', '2019-05-25 03:43:02.000000', '2019-05-25 03:43:06.000000', 1);
INSERT INTO `article_article` VALUES (3, 'Card title', 'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.', '2019-05-25 03:43:44.000000', '2019-05-25 03:43:47.000000', 1);

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES (1, '教师');

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
INSERT INTO `auth_group_permissions` VALUES (10, 1, 48);
INSERT INTO `auth_group_permissions` VALUES (15, 1, 52);
INSERT INTO `auth_group_permissions` VALUES (11, 1, 61);
INSERT INTO `auth_group_permissions` VALUES (12, 1, 62);
INSERT INTO `auth_group_permissions` VALUES (13, 1, 63);
INSERT INTO `auth_group_permissions` VALUES (1, 1, 64);
INSERT INTO `auth_group_permissions` VALUES (2, 1, 65);
INSERT INTO `auth_group_permissions` VALUES (3, 1, 66);
INSERT INTO `auth_group_permissions` VALUES (4, 1, 67);
INSERT INTO `auth_group_permissions` VALUES (5, 1, 68);
INSERT INTO `auth_group_permissions` VALUES (6, 1, 69);
INSERT INTO `auth_group_permissions` VALUES (7, 1, 70);
INSERT INTO `auth_group_permissions` VALUES (8, 1, 71);
INSERT INTO `auth_group_permissions` VALUES (9, 1, 72);

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 122 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add permission', 1, 'add_permission');
INSERT INTO `auth_permission` VALUES (2, 'Can change permission', 1, 'change_permission');
INSERT INTO `auth_permission` VALUES (3, 'Can delete permission', 1, 'delete_permission');
INSERT INTO `auth_permission` VALUES (4, 'Can view permission', 1, 'view_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can add group', 2, 'add_group');
INSERT INTO `auth_permission` VALUES (6, 'Can change group', 2, 'change_group');
INSERT INTO `auth_permission` VALUES (7, 'Can delete group', 2, 'delete_group');
INSERT INTO `auth_permission` VALUES (8, 'Can view group', 2, 'view_group');
INSERT INTO `auth_permission` VALUES (9, 'Can add content type', 3, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (10, 'Can change content type', 3, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (11, 'Can delete content type', 3, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (12, 'Can view content type', 3, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (13, 'Can add 用户信息', 4, 'add_userprofile');
INSERT INTO `auth_permission` VALUES (14, 'Can change 用户信息', 4, 'change_userprofile');
INSERT INTO `auth_permission` VALUES (15, 'Can delete 用户信息', 4, 'delete_userprofile');
INSERT INTO `auth_permission` VALUES (16, 'Can view 用户信息', 4, 'view_userprofile');
INSERT INTO `auth_permission` VALUES (17, 'Can add log entry', 5, 'add_logentry');
INSERT INTO `auth_permission` VALUES (18, 'Can change log entry', 5, 'change_logentry');
INSERT INTO `auth_permission` VALUES (19, 'Can delete log entry', 5, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (20, 'Can view log entry', 5, 'view_logentry');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add Bookmark', 7, 'add_bookmark');
INSERT INTO `auth_permission` VALUES (26, 'Can change Bookmark', 7, 'change_bookmark');
INSERT INTO `auth_permission` VALUES (27, 'Can delete Bookmark', 7, 'delete_bookmark');
INSERT INTO `auth_permission` VALUES (28, 'Can view Bookmark', 7, 'view_bookmark');
INSERT INTO `auth_permission` VALUES (29, 'Can add User Setting', 8, 'add_usersettings');
INSERT INTO `auth_permission` VALUES (30, 'Can change User Setting', 8, 'change_usersettings');
INSERT INTO `auth_permission` VALUES (31, 'Can delete User Setting', 8, 'delete_usersettings');
INSERT INTO `auth_permission` VALUES (32, 'Can view User Setting', 8, 'view_usersettings');
INSERT INTO `auth_permission` VALUES (33, 'Can add User Widget', 9, 'add_userwidget');
INSERT INTO `auth_permission` VALUES (34, 'Can change User Widget', 9, 'change_userwidget');
INSERT INTO `auth_permission` VALUES (35, 'Can delete User Widget', 9, 'delete_userwidget');
INSERT INTO `auth_permission` VALUES (36, 'Can view User Widget', 9, 'view_userwidget');
INSERT INTO `auth_permission` VALUES (37, 'Can add log entry', 10, 'add_log');
INSERT INTO `auth_permission` VALUES (38, 'Can change log entry', 10, 'change_log');
INSERT INTO `auth_permission` VALUES (39, 'Can delete log entry', 10, 'delete_log');
INSERT INTO `auth_permission` VALUES (40, 'Can view log entry', 10, 'view_log');
INSERT INTO `auth_permission` VALUES (41, 'Can add captcha store', 11, 'add_captchastore');
INSERT INTO `auth_permission` VALUES (42, 'Can change captcha store', 11, 'change_captchastore');
INSERT INTO `auth_permission` VALUES (43, 'Can delete captcha store', 11, 'delete_captchastore');
INSERT INTO `auth_permission` VALUES (44, 'Can view captcha store', 11, 'view_captchastore');
INSERT INTO `auth_permission` VALUES (45, 'Can add 教师', 12, 'add_teacher');
INSERT INTO `auth_permission` VALUES (46, 'Can change 教师', 12, 'change_teacher');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 教师', 12, 'delete_teacher');
INSERT INTO `auth_permission` VALUES (48, 'Can view 教师', 12, 'view_teacher');
INSERT INTO `auth_permission` VALUES (49, 'Can add 课程', 13, 'add_course');
INSERT INTO `auth_permission` VALUES (50, 'Can change 课程', 13, 'change_course');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 课程', 13, 'delete_course');
INSERT INTO `auth_permission` VALUES (52, 'Can view 课程', 13, 'view_course');
INSERT INTO `auth_permission` VALUES (53, 'Can add course classify', 14, 'add_courseclassify');
INSERT INTO `auth_permission` VALUES (54, 'Can change course classify', 14, 'change_courseclassify');
INSERT INTO `auth_permission` VALUES (55, 'Can delete course classify', 14, 'delete_courseclassify');
INSERT INTO `auth_permission` VALUES (56, 'Can view course classify', 14, 'view_courseclassify');
INSERT INTO `auth_permission` VALUES (57, 'Can add course classify2', 15, 'add_courseclassify2');
INSERT INTO `auth_permission` VALUES (58, 'Can change course classify2', 15, 'change_courseclassify2');
INSERT INTO `auth_permission` VALUES (59, 'Can delete course classify2', 15, 'delete_courseclassify2');
INSERT INTO `auth_permission` VALUES (60, 'Can view course classify2', 15, 'view_courseclassify2');
INSERT INTO `auth_permission` VALUES (61, 'Can add 课程资源', 16, 'add_courseresources');
INSERT INTO `auth_permission` VALUES (62, 'Can change 课程资源', 16, 'change_courseresources');
INSERT INTO `auth_permission` VALUES (63, 'Can delete 课程资源', 16, 'delete_courseresources');
INSERT INTO `auth_permission` VALUES (64, 'Can view 课程资源', 16, 'view_courseresources');
INSERT INTO `auth_permission` VALUES (65, 'Can add 章节', 17, 'add_lesson');
INSERT INTO `auth_permission` VALUES (66, 'Can change 章节', 17, 'change_lesson');
INSERT INTO `auth_permission` VALUES (67, 'Can delete 章节', 17, 'delete_lesson');
INSERT INTO `auth_permission` VALUES (68, 'Can view 章节', 17, 'view_lesson');
INSERT INTO `auth_permission` VALUES (69, 'Can add 视频', 18, 'add_video');
INSERT INTO `auth_permission` VALUES (70, 'Can change 视频', 18, 'change_video');
INSERT INTO `auth_permission` VALUES (71, 'Can delete 视频', 18, 'delete_video');
INSERT INTO `auth_permission` VALUES (72, 'Can view 视频', 18, 'view_video');
INSERT INTO `auth_permission` VALUES (73, 'Can add 轮播课程', 13, 'add_bannercourse');
INSERT INTO `auth_permission` VALUES (74, 'Can change 轮播课程', 13, 'change_bannercourse');
INSERT INTO `auth_permission` VALUES (75, 'Can delete 轮播课程', 13, 'delete_bannercourse');
INSERT INTO `auth_permission` VALUES (76, 'Can view 轮播课程', 13, 'view_bannercourse');
INSERT INTO `auth_permission` VALUES (77, 'Can view 轮播课程', 19, 'view_bannercourse');
INSERT INTO `auth_permission` VALUES (78, 'Can add 轮播图', 20, 'add_banner');
INSERT INTO `auth_permission` VALUES (79, 'Can change 轮播图', 20, 'change_banner');
INSERT INTO `auth_permission` VALUES (80, 'Can delete 轮播图', 20, 'delete_banner');
INSERT INTO `auth_permission` VALUES (81, 'Can view 轮播图', 20, 'view_banner');
INSERT INTO `auth_permission` VALUES (82, 'Can add 课程评论', 21, 'add_coursecomments');
INSERT INTO `auth_permission` VALUES (83, 'Can change 课程评论', 21, 'change_coursecomments');
INSERT INTO `auth_permission` VALUES (84, 'Can delete 课程评论', 21, 'delete_coursecomments');
INSERT INTO `auth_permission` VALUES (85, 'Can view 课程评论', 21, 'view_coursecomments');
INSERT INTO `auth_permission` VALUES (86, 'Can add 用户课程', 22, 'add_usercourse');
INSERT INTO `auth_permission` VALUES (87, 'Can change 用户课程', 22, 'change_usercourse');
INSERT INTO `auth_permission` VALUES (88, 'Can delete 用户课程', 22, 'delete_usercourse');
INSERT INTO `auth_permission` VALUES (89, 'Can view 用户课程', 22, 'view_usercourse');
INSERT INTO `auth_permission` VALUES (90, 'Can add 用户收藏', 23, 'add_userfavourite');
INSERT INTO `auth_permission` VALUES (91, 'Can change 用户收藏', 23, 'change_userfavourite');
INSERT INTO `auth_permission` VALUES (92, 'Can delete 用户收藏', 23, 'delete_userfavourite');
INSERT INTO `auth_permission` VALUES (93, 'Can view 用户收藏', 23, 'view_userfavourite');
INSERT INTO `auth_permission` VALUES (94, 'Can add 邮箱验证码', 24, 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (95, 'Can change 邮箱验证码', 24, 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (96, 'Can delete 邮箱验证码', 24, 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (97, 'Can view 邮箱验证码', 24, 'view_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (98, 'Can add 手记', 25, 'add_articlepost');
INSERT INTO `auth_permission` VALUES (99, 'Can change 手记', 25, 'change_articlepost');
INSERT INTO `auth_permission` VALUES (100, 'Can delete 手记', 25, 'delete_articlepost');
INSERT INTO `auth_permission` VALUES (101, 'Can view 手记', 25, 'view_articlepost');
INSERT INTO `auth_permission` VALUES (102, 'Can view 手记', 25, 'view_article');
INSERT INTO `auth_permission` VALUES (103, 'Can add 手记', 25, 'add_article');
INSERT INTO `auth_permission` VALUES (104, 'Can change 手记', 25, 'change_article');
INSERT INTO `auth_permission` VALUES (105, 'Can delete 手记', 25, 'delete_article');
INSERT INTO `auth_permission` VALUES (106, 'Can add Tag', 26, 'add_tag');
INSERT INTO `auth_permission` VALUES (107, 'Can change Tag', 26, 'change_tag');
INSERT INTO `auth_permission` VALUES (108, 'Can delete Tag', 26, 'delete_tag');
INSERT INTO `auth_permission` VALUES (109, 'Can view Tag', 26, 'view_tag');
INSERT INTO `auth_permission` VALUES (110, 'Can add Tagged Item', 27, 'add_taggeditem');
INSERT INTO `auth_permission` VALUES (111, 'Can change Tagged Item', 27, 'change_taggeditem');
INSERT INTO `auth_permission` VALUES (112, 'Can delete Tagged Item', 27, 'delete_taggeditem');
INSERT INTO `auth_permission` VALUES (113, 'Can view Tagged Item', 27, 'view_taggeditem');
INSERT INTO `auth_permission` VALUES (114, 'Can add user note', 28, 'add_usernote');
INSERT INTO `auth_permission` VALUES (115, 'Can change user note', 28, 'change_usernote');
INSERT INTO `auth_permission` VALUES (116, 'Can delete user note', 28, 'delete_usernote');
INSERT INTO `auth_permission` VALUES (117, 'Can view user note', 28, 'view_usernote');
INSERT INTO `auth_permission` VALUES (118, 'Can add 课程Wiki', 29, 'add_coursewiki');
INSERT INTO `auth_permission` VALUES (119, 'Can change 课程Wiki', 29, 'change_coursewiki');
INSERT INTO `auth_permission` VALUES (120, 'Can delete 课程Wiki', 29, 'delete_coursewiki');
INSERT INTO `auth_permission` VALUES (121, 'Can view 课程Wiki', 29, 'view_coursewiki');

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `response` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hashkey` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expiration` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `hashkey`(`hashkey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
INSERT INTO `captcha_captchastore` VALUES (1, 'MUGH', 'mugh', '38c40598e14de157d4caff284c5070c9b4d6b73f', '2019-05-14 18:57:48.666330');
INSERT INTO `captcha_captchastore` VALUES (2, 'WFRQ', 'wfrq', 'e819d50532ea4e039cf5510b1becab41b5fffdf8', '2019-05-14 19:04:17.434159');
INSERT INTO `captcha_captchastore` VALUES (3, 'MNQT', 'mnqt', 'e88195511ca22d8beb15d7f56a5f0749b98a9b48', '2019-05-14 19:09:23.937845');
INSERT INTO `captcha_captchastore` VALUES (4, 'GBRM', 'gbrm', 'c497fa09b1e9530d457e9ff956956103c1442b07', '2019-05-14 19:10:04.560581');
INSERT INTO `captcha_captchastore` VALUES (5, 'OVBK', 'ovbk', 'eab1ff98e277cc3d7975c7df2fcf1ff31e549d1d', '2019-05-14 19:10:20.525240');
INSERT INTO `captcha_captchastore` VALUES (6, 'YBFY', 'ybfy', 'de344465a6c6ce6428f2b3a37de1c4c168c02521', '2019-05-14 19:11:00.588626');
INSERT INTO `captcha_captchastore` VALUES (7, 'AACJ', 'aacj', '543a89558bebb13556bb962734fb85713e05e909', '2019-05-14 19:11:03.562745');
INSERT INTO `captcha_captchastore` VALUES (8, 'QTYV', 'qtyv', '9eae915322efc968c321eb23a594c5f234f07020', '2019-05-14 19:11:19.865461');
INSERT INTO `captcha_captchastore` VALUES (9, 'LUIU', 'luiu', '67b09c4718116c356fd6f5bf56f8ce14503088bf', '2019-05-14 19:11:32.878760');
INSERT INTO `captcha_captchastore` VALUES (10, 'BIDA', 'bida', '885a5f04806e14d321ada8497e072cb49e97d4db', '2019-05-14 20:55:56.729368');
INSERT INTO `captcha_captchastore` VALUES (11, 'IFTR', 'iftr', '68997e41ca8539c158f494bf72e2f79d7965a1d6', '2019-05-14 20:57:06.078104');
INSERT INTO `captcha_captchastore` VALUES (12, 'XXII', 'xxii', '2d49f956874ae14a7a3d2294a754d573b5a80c6b', '2019-05-14 20:57:24.798390');
INSERT INTO `captcha_captchastore` VALUES (13, 'EAUR', 'eaur', '9f87d0cd830f73c7a8775098763012013f3ed584', '2019-05-14 21:01:15.626611');
INSERT INTO `captcha_captchastore` VALUES (14, 'WHJI', 'whji', '53dcd937cc8fd2bbb810c79fc7f67eb7bae645ec', '2019-05-14 21:02:20.672839');
INSERT INTO `captcha_captchastore` VALUES (15, 'XKSV', 'xksv', '02681561a1c28381220a0c0cd5b058d0206386a1', '2019-05-14 21:04:19.999174');

-- ----------------------------
-- Table structure for courses_course
-- ----------------------------
DROP TABLE IF EXISTS `courses_course`;
CREATE TABLE `courses_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `degree` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `learn_times` int(11) NOT NULL,
  `stu_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `you_need_know` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_tell` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL,
  `classify_detail_id` int(11) NULL DEFAULT NULL,
  `classify_root_id` int(11) NULL DEFAULT NULL,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_course_classify_detail_id_365e67e8_fk_courses_c`(`classify_detail_id`) USING BTREE,
  INDEX `courses_course_classify_root_id_e79c327c_fk_courses_c`(`classify_root_id`) USING BTREE,
  INDEX `courses_course_teacher_id_846fa526_fk_teachers_teacher_id`(`teacher_id`) USING BTREE,
  CONSTRAINT `courses_course_classify_detail_id_365e67e8_fk_courses_c` FOREIGN KEY (`classify_detail_id`) REFERENCES `courses_courseclassify2` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `courses_course_classify_root_id_e79c327c_fk_courses_c` FOREIGN KEY (`classify_root_id`) REFERENCES `courses_courseclassify` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_teachers_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers_teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of courses_course
-- ----------------------------
INSERT INTO `courses_course` VALUES (1, 'bootstrap快速入门', 'bootstrap是目前最流行的框架之一，能够带你快速搭建网页！', 'zj', 125, 14, 3, 'courses/images/bootstrap快速入门/bootstrap_start_KiMSHea.jpg', '本教程适合具有一定前端基础的人员，对HTML、CSS、JavaScript有一定的了解。', '（1）如何快速搭建网页\r\n（2）如何使用组件开发\r\n（3）使用bootstrap插件实现网页的开发', '2019-05-19 01:21:00.000000', 7, 1, 2, '简介：本教程主要向大家介绍了什么是bootstrap，bootstrap的环境及bootstrap中常用的样式、组件、插件的用法等。');
INSERT INTO `courses_course` VALUES (2, '初识HTML+CSS', 'HTML+CSS基础教程8小时带领大家步步深入学习标签用法和意义', 'cj', 540, 100, 0, 'courses/images/初识HTML+CSS/html_start_GtO9K2d.jpg', '没有任何WEB经验的WEB应用程序开发者、对WEB前端技术感兴趣的用户均可学习本教程。', '本教程代领大家轻松学习HTML、CSS样式基础知识，可以利用HTML、CSS样式技术制作出简单页面。', '2019-05-19 01:27:00.000000', 1, 1, 1, '简介：本课程从最基本的概念开始讲起，步步深入，带领大家学习HTML、CSS样式基础知识，了解各种常用标签的意义以及基本用法，后半部分教程主要讲解CSS样式代码添加，为后面的案例课程打下基础。');
INSERT INTO `courses_course` VALUES (3, 'Python入门', 'Python入门课程', 'cj', 120, 2, 0, 'courses/images/Python入门/540e57300001d6d906000338-240-135.jpg', 'Python入门课程', 'Python入门课程', '2019-05-19 01:29:00.000000', 12, 2, 3, 'Python入门课程');
INSERT INTO `courses_course` VALUES (4, 'Python进阶', 'Python进阶', 'zj', 240, 0, 0, 'courses/images/Python进阶/5705b7350001d59b06000338-240-135.jpg', 'Python进阶', 'Python进阶', '2019-05-19 01:31:00.000000', 12, 2, 3, 'Python进阶');
INSERT INTO `courses_course` VALUES (5, 'Python文件处理', 'Python文件处理', 'zj', 240, 0, 0, 'courses/images/Python文件处理/python文件处理.jpg', 'Python文件处理', 'Python文件处理', '2019-05-19 01:33:00.000000', 12, 2, 3, 'Python文件处理');
INSERT INTO `courses_course` VALUES (6, 'Python面向对象', 'Python面向对象', 'zj', 180, 0, 0, 'courses/images/Python面向对象/python面向对象.jpg', 'Python面向对象', 'Python面向对象', '2019-05-19 01:34:00.000000', 12, 2, 3, 'Python面向对象');
INSERT INTO `courses_course` VALUES (7, 'Python错误与异常', 'Python错误与异常', 'zj', 180, 0, 0, 'courses/images/Python错误与异常/python错误和异常.jpg', 'Python错误与异常', 'Python错误与异常', '2019-05-19 01:35:00.000000', 12, 2, 3, 'Python错误与异常');
INSERT INTO `courses_course` VALUES (8, 'MySQL复制', 'MySQL复制', 'cj', 120, 0, 0, 'courses/images/MySQL复制/mysql.jpg', 'MySQL复制', 'MySQL复制', '2019-05-19 01:38:00.000000', 40, 7, 3, 'MySQL复制');
INSERT INTO `courses_course` VALUES (9, 'Java入门第一季', 'Java入门第一季', 'cj', 600, 0, 0, 'courses/images/Java入门第一季/57035ff200014b8a06000338-240-135_dHfj8Nq.jpg', 'Java入门第一季', 'Java入门第一季', '2019-05-19 01:38:00.000000', 11, 2, 2, 'Java入门第一季');
INSERT INTO `courses_course` VALUES (10, '个性化推荐算法入门', '个性化推荐算法入门', 'cj', 120, 0, 0, 'courses/images/个性化推荐算法入门/个性化推荐算法.jpg', '个性化推荐算法入门', '个性化推荐算法入门', '2019-05-19 01:43:00.000000', 23, 4, 1, '个性化推荐算法入门');
INSERT INTO `courses_course` VALUES (11, 'Linux达人养成计划', 'Linux达人养成计划', 'cj', 360, 0, 0, 'courses/images/Linux达人养成计划/Linux达人计划.jpg', 'Linux达人养成计划', 'Linux达人养成计划', '2019-05-19 01:45:00.000000', 35, 6, 3, 'Linux达人养成计划');

-- ----------------------------
-- Table structure for courses_courseclassify
-- ----------------------------
DROP TABLE IF EXISTS `courses_courseclassify`;
CREATE TABLE `courses_courseclassify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of courses_courseclassify
-- ----------------------------
INSERT INTO `courses_courseclassify` VALUES (1, '前端开发', '2019-05-18 17:06:00.000000');
INSERT INTO `courses_courseclassify` VALUES (2, '后端开发', '2019-05-18 17:15:00.000000');
INSERT INTO `courses_courseclassify` VALUES (4, '算法&数学', '2019-05-18 17:20:00.000000');
INSERT INTO `courses_courseclassify` VALUES (6, '运维&测试', '2019-05-18 17:24:00.000000');
INSERT INTO `courses_courseclassify` VALUES (7, '数据库', '2019-05-18 17:25:00.000000');

-- ----------------------------
-- Table structure for courses_courseclassify2
-- ----------------------------
DROP TABLE IF EXISTS `courses_courseclassify2`;
CREATE TABLE `courses_courseclassify2`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL,
  `parent_classify_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_courseclassi_parent_classify_id_83a728bd_fk_courses_c`(`parent_classify_id`) USING BTREE,
  CONSTRAINT `courses_courseclassi_parent_classify_id_83a728bd_fk_courses_c` FOREIGN KEY (`parent_classify_id`) REFERENCES `courses_courseclassify` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of courses_courseclassify2
-- ----------------------------
INSERT INTO `courses_courseclassify2` VALUES (1, 'HTML/CSS', '2019-05-18 17:06:00.000000', 1);
INSERT INTO `courses_courseclassify2` VALUES (7, 'Bootstrap', '2019-05-18 17:08:00.000000', 1);
INSERT INTO `courses_courseclassify2` VALUES (11, 'Java', '2019-05-18 17:15:00.000000', 2);
INSERT INTO `courses_courseclassify2` VALUES (12, 'Python', '2019-05-18 17:15:00.000000', 2);
INSERT INTO `courses_courseclassify2` VALUES (15, 'Django', '2019-05-18 17:16:00.000000', 2);
INSERT INTO `courses_courseclassify2` VALUES (23, '算法与数据结构', '2019-05-18 17:20:00.000000', 4);
INSERT INTO `courses_courseclassify2` VALUES (24, '数学', '2019-05-18 17:21:00.000000', 4);
INSERT INTO `courses_courseclassify2` VALUES (35, 'Linux', '2019-05-18 17:24:00.000000', 6);
INSERT INTO `courses_courseclassify2` VALUES (36, '测试', '2019-05-18 17:25:00.000000', 6);
INSERT INTO `courses_courseclassify2` VALUES (40, 'MySQL', '2019-05-18 17:25:00.000000', 7);
INSERT INTO `courses_courseclassify2` VALUES (43, 'Oracle', '2019-05-18 17:26:00.000000', 7);
INSERT INTO `courses_courseclassify2` VALUES (44, 'SQL Server', '2019-05-18 17:26:00.000000', 7);

-- ----------------------------
-- Table structure for courses_courseresources
-- ----------------------------
DROP TABLE IF EXISTS `courses_courseresources`;
CREATE TABLE `courses_courseresources`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `download` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_courseresources_course_id_558dc9e2_fk_courses_course_id`(`course_id`) USING BTREE,
  CONSTRAINT `courses_courseresources_course_id_558dc9e2_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of courses_courseresources
-- ----------------------------
INSERT INTO `courses_courseresources` VALUES (1, 'bootstrap3.x源文件', 'course/resource/2019/05/bootstrap-3.3.7-dist.zip', '2019-05-20 03:16:00.000000', 1);
INSERT INTO `courses_courseresources` VALUES (2, '课程示例代码', 'course/resource/2019/05/media.zip', '2019-05-20 03:17:00.000000', 1);

-- ----------------------------
-- Table structure for courses_coursewiki
-- ----------------------------
DROP TABLE IF EXISTS `courses_coursewiki`;
CREATE TABLE `courses_coursewiki`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_coursewiki_course_id_87506a00_fk_courses_course_id`(`course_id`) USING BTREE,
  CONSTRAINT `courses_coursewiki_course_id_87506a00_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of courses_coursewiki
-- ----------------------------
INSERT INTO `courses_coursewiki` VALUES (1, '## 什么是 Bootstrap？\r\nBootstrap 是一个用于快速开发 Web 应用程序和网站的前端框架。Bootstrap 是基于 HTML、CSS、JAVASCRIPT 的。\r\n![](/media/editor/responsive_20190606220033764482.jpg)\r\n\r\n------------\r\n\r\n\r\n\r\n\r\n\r\n## 在线实例\r\n```html\r\n<div class=\"container\">\r\n  <div class=\"jumbotron\">\r\n    <h1>我的第一个 Bootstrap 页面</h1>\r\n    <p>重置窗口大小，查看响应式效果！</p> \r\n  </div>\r\n  <div class=\"row\">\r\n    <div class=\"col-sm-4\">\r\n      <h3>Column 1</h3>\r\n      <p>学的不仅是技术，更是梦想！</p>\r\n      <p>再牛逼的梦想,也抵不住你傻逼似的坚持！</p>\r\n    </div>\r\n  </div>\r\n</div>\r\n```', '2019-05-30 23:03:00.000000', 1);

-- ----------------------------
-- Table structure for courses_lesson
-- ----------------------------
DROP TABLE IF EXISTS `courses_lesson`;
CREATE TABLE `courses_lesson`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_lesson_course_id_16bc4882_fk_courses_course_id`(`course_id`) USING BTREE,
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of courses_lesson
-- ----------------------------
INSERT INTO `courses_lesson` VALUES (1, '第1章 课程介绍', '2019-05-20 00:59:00.000000', 1);
INSERT INTO `courses_lesson` VALUES (2, '第2章 环境搭建', '2019-05-20 00:59:00.000000', 1);
INSERT INTO `courses_lesson` VALUES (3, '第3章 全局样式', '2019-05-20 01:00:00.000000', 1);
INSERT INTO `courses_lesson` VALUES (4, '第1章 HTML/CSS介绍', '2019-05-20 22:23:00.000000', 2);
INSERT INTO `courses_lesson` VALUES (6, '第1章 Python介绍', '2019-06-05 21:46:00.000000', 3);

-- ----------------------------
-- Table structure for courses_video
-- ----------------------------
DROP TABLE IF EXISTS `courses_video`;
CREATE TABLE `courses_video`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL,
  `learn_times` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `video_file` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_video_lesson_id_59f2396e_fk_courses_lesson_id`(`lesson_id`) USING BTREE,
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of courses_video
-- ----------------------------
INSERT INTO `courses_video` VALUES (1, '1-1 课程介绍', '2019-05-20 01:01:00.000000', 2, 1, 'courses/videos/1-1 课程介绍/2019-06-04_151952.605720_极客学院一周学会bootstrap_哔哩哔哩_-つロ_干杯-bilibili_20196415162.mp4');
INSERT INTO `courses_video` VALUES (2, '2-1 bootstrap环境搭建', '2019-05-20 02:07:00.000000', 3, 2, 'courses/videos/2-1 bootstrap环境搭建/2019-06-04_152230.733893_极客学院一周学会bootstrap_哔哩哔哩_-つロ_干杯-bilibili_20196415162.mp4');
INSERT INTO `courses_video` VALUES (3, '2-2 bootstrap环境搭建', '2019-05-20 02:08:00.000000', 2, 2, 'courses/videos/2-2 bootstrap环境搭建/2019-06-04_152239.992514_极客学院一周学会bootstrap_哔哩哔哩_-つロ_干杯-bilibili_20196415162.mp4');
INSERT INTO `courses_video` VALUES (4, '2-3 bootstrap环境搭建', '2019-05-20 02:20:00.000000', 4, 2, 'courses/videos/2-3 bootstrap环境搭建/2019-06-04_152249.150547_极客学院一周学会bootstrap_哔哩哔哩_-つロ_干杯-bilibili_20196415162.mp4');
INSERT INTO `courses_video` VALUES (5, '3-1 Bootstrap中的全局样式', '2019-05-20 02:29:00.000000', 5, 3, 'courses/videos/3-1 Bootstrap中的全局样式/2019-06-04_152311.388182_极客学院一周学会bootstrap_哔哩哔哩_-つロ_干杯-bilibili_20196415162.mp4');
INSERT INTO `courses_video` VALUES (6, '3-2 Boostrap中的排版', '2019-05-20 02:31:00.000000', 4, 3, 'courses/videos/3-2 Boostrap中的排版/2019-06-04_152320.950575_极客学院一周学会bootstrap_哔哩哔哩_-つロ_干杯-bilibili_20196415162.mp4');
INSERT INTO `courses_video` VALUES (7, '3-3 Boostrap中的排版 - 文本', '2019-05-20 02:55:00.000000', 10, 3, 'courses/videos/3-3 Boostrap中的排版 - 文本/2019-06-04_152330.229512_极客学院一周学会bootstrap_哔哩哔哩_-つロ_干杯-bilibili_20196415162.mp4');
INSERT INTO `courses_video` VALUES (8, '1-1 HTML/CSS介绍', '2019-05-20 22:30:00.000000', 5, 4, 'courses/videos/1-1 HTML/CSS介绍/2019-06-04_152344.823690_极客学院一周学会bootstrap_哔哩哔哩_-つロ_干杯-bilibili_20196415162.mp4');
INSERT INTO `courses_video` VALUES (9, '1-2 HTML基本语法', '2019-05-26 18:42:00.000000', 5, 4, 'courses/videos/1-2 HTML基本语法/2019-06-04_152353.720496_极客学院一周学会bootstrap_哔哩哔哩_-つロ_干杯-bilibili_20196415162.mp4');
INSERT INTO `courses_video` VALUES (11, '1.1 Python入门介绍', '2019-06-05 21:47:00.000000', 10, 6, 'courses/videos/1.1 Python入门介绍/2019-06-05_214814.810677_极客学院一周学会bootstrap_哔哩哔哩_-つロ_干杯-bilibili_20196415162.mp4');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (5, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (25, 'article', 'article');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (1, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (11, 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES (3, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (19, 'courses', 'bannercourse');
INSERT INTO `django_content_type` VALUES (13, 'courses', 'course');
INSERT INTO `django_content_type` VALUES (14, 'courses', 'courseclassify');
INSERT INTO `django_content_type` VALUES (15, 'courses', 'courseclassify2');
INSERT INTO `django_content_type` VALUES (16, 'courses', 'courseresources');
INSERT INTO `django_content_type` VALUES (29, 'courses', 'coursewiki');
INSERT INTO `django_content_type` VALUES (17, 'courses', 'lesson');
INSERT INTO `django_content_type` VALUES (18, 'courses', 'video');
INSERT INTO `django_content_type` VALUES (20, 'operation', 'banner');
INSERT INTO `django_content_type` VALUES (21, 'operation', 'coursecomments');
INSERT INTO `django_content_type` VALUES (22, 'operation', 'usercourse');
INSERT INTO `django_content_type` VALUES (23, 'operation', 'userfavourite');
INSERT INTO `django_content_type` VALUES (28, 'operation', 'usernote');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (26, 'taggit', 'tag');
INSERT INTO `django_content_type` VALUES (27, 'taggit', 'taggeditem');
INSERT INTO `django_content_type` VALUES (12, 'teachers', 'teacher');
INSERT INTO `django_content_type` VALUES (24, 'users', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES (4, 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES (7, 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES (10, 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES (8, 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES (9, 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-05-13 23:10:18.208266');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2019-05-13 23:10:19.579189');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2019-05-13 23:10:23.639176');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2019-05-13 23:10:24.246025');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2019-05-13 23:10:24.282016');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2019-05-13 23:10:24.325012');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2019-05-13 23:10:24.355008');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2019-05-13 23:10:24.379003');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2019-05-13 23:10:24.412998');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2019-05-13 23:10:24.450991');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2019-05-13 23:10:24.489984');
INSERT INTO `django_migrations` VALUES (12, 'users', '0001_initial', '2019-05-13 23:10:28.906603');
INSERT INTO `django_migrations` VALUES (13, 'admin', '0001_initial', '2019-05-13 23:47:47.335362');
INSERT INTO `django_migrations` VALUES (14, 'admin', '0002_logentry_remove_auto_add', '2019-05-13 23:47:47.420349');
INSERT INTO `django_migrations` VALUES (15, 'admin', '0003_logentry_add_action_flag_choices', '2019-05-13 23:47:47.478338');
INSERT INTO `django_migrations` VALUES (16, 'sessions', '0001_initial', '2019-05-13 23:47:48.120238');
INSERT INTO `django_migrations` VALUES (17, 'xadmin', '0001_initial', '2019-05-13 23:47:51.909645');
INSERT INTO `django_migrations` VALUES (18, 'xadmin', '0002_log', '2019-05-13 23:47:54.004326');
INSERT INTO `django_migrations` VALUES (19, 'xadmin', '0003_auto_20160715_0100', '2019-05-13 23:47:54.835196');
INSERT INTO `django_migrations` VALUES (20, 'captcha', '0001_initial', '2019-05-14 18:52:28.106753');
INSERT INTO `django_migrations` VALUES (21, 'teachers', '0001_initial', '2019-05-17 23:49:30.936977');
INSERT INTO `django_migrations` VALUES (22, 'courses', '0001_initial', '2019-05-17 23:49:40.096688');
INSERT INTO `django_migrations` VALUES (23, 'users', '0002_auto_20190517_2343', '2019-05-17 23:49:40.145661');
INSERT INTO `django_migrations` VALUES (24, 'operation', '0001_initial', '2019-05-18 00:02:38.335814');
INSERT INTO `django_migrations` VALUES (25, 'operation', '0002_coursecomments_usercourse_userfavourite', '2019-05-18 00:27:16.797061');
INSERT INTO `django_migrations` VALUES (26, 'courses', '0002_auto_20190518_1646', '2019-05-18 16:46:50.293326');
INSERT INTO `django_migrations` VALUES (27, 'courses', '0003_remove_course_detail', '2019-05-18 17:50:25.151548');
INSERT INTO `django_migrations` VALUES (28, 'courses', '0004_course_detail', '2019-05-18 18:02:12.233958');
INSERT INTO `django_migrations` VALUES (29, 'courses', '0005_auto_20190518_1806', '2019-05-19 00:50:25.348932');
INSERT INTO `django_migrations` VALUES (30, 'teachers', '0002_auto_20190519_0049', '2019-05-19 00:50:25.411448');
INSERT INTO `django_migrations` VALUES (31, 'courses', '0006_auto_20190519_0114', '2019-05-19 01:14:49.310912');
INSERT INTO `django_migrations` VALUES (32, 'courses', '0007_auto_20190520_0046', '2019-05-20 00:47:15.927205');
INSERT INTO `django_migrations` VALUES (33, 'operation', '0003_coursecomments_video', '2019-05-20 14:48:40.144629');
INSERT INTO `django_migrations` VALUES (34, 'users', '0003_auto_20190521_2148', '2019-05-21 21:48:33.698396');
INSERT INTO `django_migrations` VALUES (35, 'users', '0004_auto_20190522_0004', '2019-05-22 00:04:34.381263');
INSERT INTO `django_migrations` VALUES (36, 'users', '0005_emailverifyrecord', '2019-05-22 00:46:43.136748');
INSERT INTO `django_migrations` VALUES (37, 'operation', '0004_remove_usercourse_status', '2019-05-23 05:27:33.300710');
INSERT INTO `django_migrations` VALUES (38, 'users', '0006_auto_20190524_0015', '2019-05-24 00:15:42.048931');
INSERT INTO `django_migrations` VALUES (39, 'courses', '0008_delete_bannercourse', '2019-05-24 00:52:37.666282');
INSERT INTO `django_migrations` VALUES (40, 'users', '0007_auto_20190524_0052', '2019-05-24 00:52:46.072247');
INSERT INTO `django_migrations` VALUES (41, 'article', '0001_initial', '2019-05-25 00:56:01.814336');
INSERT INTO `django_migrations` VALUES (42, 'article', '0002_auto_20190525_0109', '2019-05-25 01:10:18.833385');
INSERT INTO `django_migrations` VALUES (43, 'courses', '0009_auto_20190525_1406', '2019-05-25 14:06:25.037933');
INSERT INTO `django_migrations` VALUES (44, 'taggit', '0001_initial', '2019-05-25 15:06:45.210324');
INSERT INTO `django_migrations` VALUES (45, 'taggit', '0002_auto_20150616_2121', '2019-05-25 15:06:45.576820');
INSERT INTO `django_migrations` VALUES (46, 'taggit', '0003_taggeditem_add_unique_index', '2019-05-25 15:06:45.831638');
INSERT INTO `django_migrations` VALUES (47, 'courses', '0010_course_tags', '2019-05-25 15:06:45.882173');
INSERT INTO `django_migrations` VALUES (48, 'operation', '0005_usernote', '2019-05-25 16:10:44.246243');
INSERT INTO `django_migrations` VALUES (49, 'operation', '0006_auto_20190525_2259', '2019-05-25 23:00:29.987401');
INSERT INTO `django_migrations` VALUES (50, 'operation', '0007_auto_20190526_0108', '2019-05-26 01:09:17.153570');
INSERT INTO `django_migrations` VALUES (51, 'courses', '0011_remove_course_is_banner', '2019-05-26 15:16:55.937042');
INSERT INTO `django_migrations` VALUES (52, 'teachers', '0003_auto_20190527_0051', '2019-05-27 00:52:13.047736');
INSERT INTO `django_migrations` VALUES (53, 'courses', '0012_coursewiki', '2019-05-30 22:43:02.329648');
INSERT INTO `django_migrations` VALUES (54, 'courses', '0013_auto_20190610_1046', '2019-06-10 10:46:39.164957');
INSERT INTO `django_migrations` VALUES (55, 'operation', '0008_auto_20190610_1046', '2019-06-10 10:46:39.350688');
INSERT INTO `django_migrations` VALUES (56, 'users', '0008_auto_20190610_1046', '2019-06-10 10:46:39.413662');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('ei9wvdoe5vwumjmd6f40ufa8wwket4ly', 'MTc0OTdmZGFiZjc1MmI0NTNhNjg3MTg3MGZhZWMxMDdlNGVkYzEwMzp7Il9hdXRoX3VzZXJfaWQiOiIxNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImEwODJlMDJkMjkyMWU0MDM0OWMxOWQ3ODljZmFjZjU1ODQxMzFmMjAifQ==', '2019-05-29 19:12:19.718088');
INSERT INTO `django_session` VALUES ('ylzssfgx186xslvcr8e4yowjej05qspq', 'ZjhjODlhZjY3NTM5OTU1OGJlNzhmODg3YThiOTJiMTI4MmRhMmI5NTp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImE3ZWNhNDE5ZTk0OTlmOGRjOWU3ZmFjZmJjNGIxNjg3MDA3ZWRjYmUifQ==', '2019-05-29 13:30:27.439742');

-- ----------------------------
-- Table structure for operation_banner
-- ----------------------------
DROP TABLE IF EXISTS `operation_banner`;
CREATE TABLE `operation_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of operation_banner
-- ----------------------------
INSERT INTO `operation_banner` VALUES (1, 'Bootstarp基础教程', 'banner/2019/05/cb59014aab434cadaf0e2cfc695b7c4e.jpg', 'https://www.google.com/', 1, '2019-05-26 01:18:00.000000');
INSERT INTO `operation_banner` VALUES (2, 'Django入门教程', 'banner/2019/05/a605657aa8834aaea318731a683a5d04.jpg', 'http://www.baidu.com/', 2, '2019-05-27 01:20:00.000000');
INSERT INTO `operation_banner` VALUES (3, 'HTML进阶教程', 'banner/2019/05/71aad47743104826881878e50e75c981.jpg', 'http://xueshu.baidu.com/', 3, '2019-05-27 01:22:00.000000');

-- ----------------------------
-- Table structure for operation_coursecomments
-- ----------------------------
DROP TABLE IF EXISTS `operation_coursecomments`;
CREATE TABLE `operation_coursecomments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `video_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id`(`course_id`) USING BTREE,
  INDEX `operation_coursecomm_user_id_f5ff70b3_fk_users_use`(`user_id`) USING BTREE,
  INDEX `operation_coursecomments_video_id_69429cb3_fk_courses_video_id`(`video_id`) USING BTREE,
  CONSTRAINT `operation_coursecomm_user_id_f5ff70b3_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `operation_coursecomments_video_id_69429cb3_fk_courses_video_id` FOREIGN KEY (`video_id`) REFERENCES `courses_video` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of operation_coursecomments
-- ----------------------------
INSERT INTO `operation_coursecomments` VALUES (5, '请问本课程使用的是哪个Boostrap版本呢？Boostrap 3.3还是4？', '2019-06-05 19:11:23.022434', 1, 1, 1);
INSERT INTO `operation_coursecomments` VALUES (6, '@admin\n用的是3.3版本哦', '2019-06-05 19:13:10.059724', 1, 19, 1);

-- ----------------------------
-- Table structure for operation_usercourse
-- ----------------------------
DROP TABLE IF EXISTS `operation_usercourse`;
CREATE TABLE `operation_usercourse`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NULL,
  `course_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id`(`course_id`) USING BTREE,
  INDEX `operation_usercourse_section_id_9a4f8ea6_fk_courses_video_id`(`section_id`) USING BTREE,
  INDEX `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `operation_usercourse_section_id_9a4f8ea6_fk_courses_video_id` FOREIGN KEY (`section_id`) REFERENCES `courses_video` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of operation_usercourse
-- ----------------------------
INSERT INTO `operation_usercourse` VALUES (1, '2019-05-23 17:52:54.055524', 1, 1, 1);
INSERT INTO `operation_usercourse` VALUES (3, '2019-05-24 10:30:42.921848', 1, 1, 7);
INSERT INTO `operation_usercourse` VALUES (4, '2019-06-05 19:12:39.116290', 1, 1, 19);
INSERT INTO `operation_usercourse` VALUES (5, '2019-06-05 21:58:36.344102', 3, 11, 19);
INSERT INTO `operation_usercourse` VALUES (6, '2019-06-10 10:52:12.547346', 1, 1, 22);
INSERT INTO `operation_usercourse` VALUES (7, '2019-06-10 11:16:09.449053', 3, 11, 22);

-- ----------------------------
-- Table structure for operation_userfavourite
-- ----------------------------
DROP TABLE IF EXISTS `operation_userfavourite`;
CREATE TABLE `operation_userfavourite`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operation_userfavourite_user_id_28d88fe0_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `operation_userfavourite_user_id_28d88fe0_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of operation_userfavourite
-- ----------------------------
INSERT INTO `operation_userfavourite` VALUES (1, 1, 1, '2019-05-23 17:39:40.929680', 1);
INSERT INTO `operation_userfavourite` VALUES (2, 2, 2, '2019-05-23 17:39:48.775783', 1);
INSERT INTO `operation_userfavourite` VALUES (3, 1, 1, '2019-05-24 10:31:52.763380', 7);
INSERT INTO `operation_userfavourite` VALUES (4, 2, 2, '2019-05-24 10:31:55.069723', 7);
INSERT INTO `operation_userfavourite` VALUES (6, 2, 2, '2019-06-05 19:12:30.703629', 19);
INSERT INTO `operation_userfavourite` VALUES (7, 1, 1, '2019-06-05 19:12:34.432028', 19);

-- ----------------------------
-- Table structure for operation_usernote
-- ----------------------------
DROP TABLE IF EXISTS `operation_usernote`;
CREATE TABLE `operation_usernote`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notes` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `video_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operation_usernote_course_id_d8b3f8b8_fk_courses_course_id`(`course_id`) USING BTREE,
  INDEX `operation_usernote_user_id_c0a99b21_fk_users_userprofile_id`(`user_id`) USING BTREE,
  INDEX `operation_usernote_video_id_f3c49bb1_fk_courses_video_id`(`video_id`) USING BTREE,
  CONSTRAINT `operation_usernote_course_id_d8b3f8b8_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `operation_usernote_user_id_c0a99b21_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `operation_usernote_video_id_f3c49bb1_fk_courses_video_id` FOREIGN KEY (`video_id`) REFERENCES `courses_video` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of operation_usernote
-- ----------------------------
INSERT INTO `operation_usernote` VALUES (2, '<pre>\n<code class=\"language-python\">def get(self,request):\n    pass</code></pre>\n\n<p>这是我的第一篇手记</p>\n', '2019-05-25 22:17:32.204481', 1, 1, 1);
INSERT INTO `operation_usernote` VALUES (3, '<p><img alt=\"\" src=\"http://prpg634cf.bkt.clouddn.com/media/notes_images/2019/05/25/15023253524_589c7b137f_k.jpg\" style=\"height:300px; width:450px\" /></p>\n\n<p>测试上传一张图片.</p>\n', '2019-05-25 23:05:09.090468', 1, 1, 1);
INSERT INTO `operation_usernote` VALUES (4, '<pre>\n<code class=\"language-cpp\">dsadsadsa</code></pre>\n\n<p>&nbsp;</p>\n', '2019-05-31 13:47:50.064647', 1, 7, 1);
INSERT INTO `operation_usernote` VALUES (7, '<pre>\n<code class=\"language-markdown\"># Bootstrap\nBootstrap是世界上流行的前端框架</code></pre>\n\n<p>&nbsp;</p>\n', '2019-06-05 19:28:58.199307', 1, 19, 1);
INSERT INTO `operation_usernote` VALUES (8, '<p>Bootstrap下载与起步</p>\n\n<p><img alt=\"\" src=\"/media/notes_images/silence/2019/06/06/wcrsyk.JPG\" style=\"height:368px; width:600px\" /></p>\n', '2019-06-06 12:05:27.209758', 1, 19, 1);

-- ----------------------------
-- Table structure for taggit_tag
-- ----------------------------
DROP TABLE IF EXISTS `taggit_tag`;
CREATE TABLE `taggit_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  UNIQUE INDEX `slug`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of taggit_tag
-- ----------------------------
INSERT INTO `taggit_tag` VALUES (1, '全栈工程师', '');
INSERT INTO `taggit_tag` VALUES (3, '前端入门', '_1');
INSERT INTO `taggit_tag` VALUES (4, 'HTML', 'html');
INSERT INTO `taggit_tag` VALUES (6, '前端框架', '_2');
INSERT INTO `taggit_tag` VALUES (7, 'Twitter', 'twitter');
INSERT INTO `taggit_tag` VALUES (8, 'Bootstrap', 'bootstrap');

-- ----------------------------
-- Table structure for taggit_taggeditem
-- ----------------------------
DROP TABLE IF EXISTS `taggit_taggeditem`;
CREATE TABLE `taggit_taggeditem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `taggit_taggeditem_content_type_id_object_id_tag_id_4bb97a8e_uniq`(`content_type_id`, `object_id`, `tag_id`) USING BTREE,
  INDEX `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id`(`tag_id`) USING BTREE,
  INDEX `taggit_taggeditem_object_id_e2d7d1df`(`object_id`) USING BTREE,
  INDEX `taggit_taggeditem_content_type_id_object_id_196cc965_idx`(`content_type_id`, `object_id`) USING BTREE,
  CONSTRAINT `taggit_taggeditem_content_type_id_9957a03c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `taggit_tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of taggit_taggeditem
-- ----------------------------
INSERT INTO `taggit_taggeditem` VALUES (5, 1, 13, 1);
INSERT INTO `taggit_taggeditem` VALUES (6, 1, 13, 6);
INSERT INTO `taggit_taggeditem` VALUES (7, 1, 13, 7);
INSERT INTO `taggit_taggeditem` VALUES (4, 1, 13, 8);
INSERT INTO `taggit_taggeditem` VALUES (1, 2, 13, 1);
INSERT INTO `taggit_taggeditem` VALUES (2, 2, 13, 3);
INSERT INTO `taggit_taggeditem` VALUES (3, 2, 13, 4);

-- ----------------------------
-- Table structure for teachers_teacher
-- ----------------------------
DROP TABLE IF EXISTS `teachers_teacher`;
CREATE TABLE `teachers_teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `points` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fav_nums` int(11) NOT NULL,
  `add_time` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teachers_teacher
-- ----------------------------
INSERT INTO `teachers_teacher` VALUES (1, 'tom', 'teacher/images/default.jpg', 'male', '15958007370', 'hd', '善于使用案例', 0, '2019-05-19 00:12:00.000000');
INSERT INTO `teachers_teacher` VALUES (2, 'silentlight', 'teacher/images/silentlight', 'male', '15958007370', 'sf', '讲课通俗易懂', 3, '2019-05-19 00:53:00.000000');
INSERT INTO `teachers_teacher` VALUES (3, 'Bobby', 'teacher/images/Bobby/default.jpg', 'male', '15958007370', 'hd', '授之以渔', 0, '2019-05-19 00:57:00.000000');

-- ----------------------------
-- Table structure for users_emailverifyrecord
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifyrecord`;
CREATE TABLE `users_emailverifyrecord`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `send_type` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `send_time` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users_emailverifyrecord
-- ----------------------------
INSERT INTO `users_emailverifyrecord` VALUES (1, 'HSpn', '526416486@qq.com', 'update_email', '2019-05-22 18:30:17.329613');
INSERT INTO `users_emailverifyrecord` VALUES (2, 'CWrg', 'silentlight1997@foxmail.com', 'update_email', '2019-06-05 20:11:18.168716');

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NULL,
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `signature` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `user_type` smallint(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `users_userprofile_teacher_id_225c467d_fk_teachers_teacher_id`(`teacher_id`) USING BTREE,
  CONSTRAINT `users_userprofile_teacher_id_225c467d_fk_teachers_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers_teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES (1, 'pbkdf2_sha256$120000$MCnAGYrrKEhp$3PtMtIOKS5xtZm8YmfYbXvRhWsxpWNChX73xf9mYyvk=', '2019-06-10 12:50:29.430119', 1, 'admin', '', '', '526416486@qq.com', 1, 1, '2019-05-13 23:11:32.409447', 'silentlight', 'sa', 'male', '杭州', '15958007370', 'Super admin', 'users/images/2019/05/default.jpg', NULL, 0);
INSERT INTO `users_userprofile` VALUES (7, 'pbkdf2_sha256$120000$SgBAm9NzJGK2$KL1Lx7r9x7oT8195O2Gk42+9HvNsZ6FXxx1YHMwnkpg=', '2019-06-10 12:49:56.836540', 0, 'silentlight', '', '', 'test3@163.com', 1, 1, '2019-05-15 03:47:00.000000', 'silentlight', 'teacher', 'male', '杭州', '15958007370', '教师测试账号', 'users/images/2019/06/f72e1572-c291-48ac-b45c-6d8a5c1a15c0.jpg', 2, 2);
INSERT INTO `users_userprofile` VALUES (19, 'pbkdf2_sha256$120000$krdVRHkXbjnp$U4bkdjRxqvNNIRdQZaV+GHMVyOpGMu2xmdurRM/JZk0=', '2019-06-10 11:30:00.000000', 0, 'bobby', '', '', 'test14@163.com', 0, 1, '2019-06-05 16:32:00.000000', 'silence', 'qz', 'male', '浙江杭州', '15958007370', 'Sail the ocean', 'users/images/2019/06/default_tx_zbqgyo5.jpg', 3, 3);
INSERT INTO `users_userprofile` VALUES (22, 'pbkdf2_sha256$120000$fng6SGEG4YGd$AxQ9fkULqWmvLqzUySu+y8NxYJp0q/bgClFDoDk8QmY=', '2019-06-10 11:18:45.177999', 0, 'siren', '', '', 'test15@163.com', 0, 1, '2019-06-10 10:50:11.516074', 'siren', '', 'male', '杭州', '15958007370', '努力', 'users/images/2019/06/default_rCxG0UP.jpg', NULL, 3);

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq`(`userprofile_id`, `group_id`) USING BTREE,
  INDEX `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users_userprofile_groups
-- ----------------------------
INSERT INTO `users_userprofile_groups` VALUES (1, 7, 1);

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq`(`userprofile_id`, `permission_id`) USING BTREE,
  INDEX `users_userprofile_us_permission_id_393136b6_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `query` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_bookmark_content_type_id_60941679_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NULL,
  `ip_addr` char(39) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id`(`content_type_id`) USING BTREE,
  INDEX `xadmin_log_user_id_bb16a176_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES (1, '2019-05-18 17:10:06.047046', '127.0.0.1', '1', 'CourseClassify object (1)', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (2, '2019-05-18 17:16:45.329257', '127.0.0.1', '2', '后端开发', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (3, '2019-05-18 17:18:54.003910', '127.0.0.1', '3', '移动开发', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (4, '2019-05-18 17:21:12.488301', '127.0.0.1', '4', '算法&数学', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (5, '2019-05-18 17:23:41.544154', '127.0.0.1', '5', '云计算&大数据', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (6, '2019-05-18 17:25:34.060641', '127.0.0.1', '6', '运维&测试', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (7, '2019-05-18 17:26:54.125434', '127.0.0.1', '7', '数据库', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (8, '2019-05-19 00:16:36.406088', '127.0.0.1', '1', 'Teacher object (1)', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (9, '2019-05-19 00:53:18.641146', '127.0.0.1', '2', 'silentlight', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (10, '2019-05-19 00:57:29.833585', '127.0.0.1', '3', 'Bobby', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (11, '2019-05-19 01:21:26.263545', '127.0.0.1', '1', 'bootstrap快速入门', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (12, '2019-05-19 01:27:55.895453', '127.0.0.1', '2', '初识HTML+CSS', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (13, '2019-05-19 01:30:00.755242', '127.0.0.1', '3', 'Python入门', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (14, '2019-05-19 01:31:56.749232', '127.0.0.1', '4', 'Python进阶', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (15, '2019-05-19 01:33:09.906242', '127.0.0.1', '5', 'Python文件处理', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (16, '2019-05-19 01:34:32.538311', '127.0.0.1', '6', 'Python面向对象', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (17, '2019-05-19 01:35:12.212295', '127.0.0.1', '7', 'Python错误与异常', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (18, '2019-05-19 01:38:10.739649', '127.0.0.1', '8', 'MySQL复制', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (19, '2019-05-19 01:38:52.083840', '127.0.0.1', '9', 'Java入门第一季', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (20, '2019-05-19 01:43:36.975584', '127.0.0.1', '10', '个性化推荐算法入门', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (21, '2019-05-19 01:45:21.024021', '127.0.0.1', '11', 'Linux达人养成计划', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (22, '2019-05-20 00:59:58.777405', '127.0.0.1', '1', '第1章 课程介绍', 'create', '已添加。', 17, 1);
INSERT INTO `xadmin_log` VALUES (23, '2019-05-20 01:00:10.772530', '127.0.0.1', '2', '第2章 环境搭建', 'create', '已添加。', 17, 1);
INSERT INTO `xadmin_log` VALUES (24, '2019-05-20 01:00:20.731190', '127.0.0.1', '3', '第3章 全局样式', 'create', '已添加。', 17, 1);
INSERT INTO `xadmin_log` VALUES (25, '2019-05-20 01:02:54.461824', '127.0.0.1', '1', '1-1 课程介绍', 'create', '已添加。', 18, 1);
INSERT INTO `xadmin_log` VALUES (26, '2019-05-20 02:07:25.487303', '127.0.0.1', '2', '2-1 bootstrap环境搭建', 'create', '已添加。', 18, 1);
INSERT INTO `xadmin_log` VALUES (27, '2019-05-20 02:09:28.408714', '127.0.0.1', '3', '2-2 bootstrap环境搭建', 'create', '已添加。', 18, 1);
INSERT INTO `xadmin_log` VALUES (28, '2019-05-20 02:21:05.419230', '127.0.0.1', '4', '2-3 bootstrap环境搭建', 'create', '已添加。', 18, 1);
INSERT INTO `xadmin_log` VALUES (29, '2019-05-20 02:30:12.344848', '127.0.0.1', '5', '3-1 Bootstrap中的全局样式', 'create', '已添加。', 18, 1);
INSERT INTO `xadmin_log` VALUES (30, '2019-05-20 02:31:52.816534', '127.0.0.1', '6', '3-2 Boostrap中的排版', 'create', '已添加。', 18, 1);
INSERT INTO `xadmin_log` VALUES (31, '2019-05-20 02:55:31.917672', '127.0.0.1', '7', '3-3 Boostrap中的排版 - 文本', 'create', '已添加。', 18, 1);
INSERT INTO `xadmin_log` VALUES (32, '2019-05-20 03:16:16.260944', '127.0.0.1', '1', 'bootstrap3.x源文件', 'create', '已添加。', 16, 1);
INSERT INTO `xadmin_log` VALUES (33, '2019-05-20 03:17:13.358607', '127.0.0.1', '2', '课程示例代码', 'create', '已添加。', 16, 1);
INSERT INTO `xadmin_log` VALUES (34, '2019-05-20 22:23:27.814057', '127.0.0.1', '4', '1-1 HTML/CSS介绍', 'create', '已添加。', 17, 1);
INSERT INTO `xadmin_log` VALUES (35, '2019-05-20 22:23:57.449597', '127.0.0.1', '4', 'HTML/CSS介绍', 'change', '修改 name', 17, 1);
INSERT INTO `xadmin_log` VALUES (36, '2019-05-20 22:24:10.904091', '127.0.0.1', '4', '第1章 HTML/CSS介绍', 'change', '修改 name', 17, 1);
INSERT INTO `xadmin_log` VALUES (37, '2019-05-20 22:30:26.438049', '127.0.0.1', '8', '1-1 HTML/CSS介绍', 'create', '已添加。', 18, 1);
INSERT INTO `xadmin_log` VALUES (38, '2019-05-23 23:58:17.708289', '127.0.0.1', '1', '教师', 'create', '已添加。', 2, 1);
INSERT INTO `xadmin_log` VALUES (39, '2019-05-24 00:19:24.230796', '127.0.0.1', '7', 'teacher_silentlight', 'change', '修改 groups，username，is_staff，is_active，nick_name，job，gender，address，mobile，signature 和 image', 4, 1);
INSERT INTO `xadmin_log` VALUES (40, '2019-05-24 00:21:48.647593', '127.0.0.1', '1', '教师', 'change', '修改 permissions', 2, 1);
INSERT INTO `xadmin_log` VALUES (41, '2019-05-24 00:23:07.909842', '127.0.0.1', '1', '教师', 'change', '修改 permissions', 2, 1);
INSERT INTO `xadmin_log` VALUES (42, '2019-05-24 01:00:11.472857', '127.0.0.1', '7', 'teacher_silentlight', 'change', '修改 last_login，image，user_type 和 teacher', 4, 1);
INSERT INTO `xadmin_log` VALUES (43, '2019-05-25 14:14:18.880778', '127.0.0.1', '3', '移动开发', 'delete', '', 14, 1);
INSERT INTO `xadmin_log` VALUES (44, '2019-05-25 14:17:04.697771', '127.0.0.1', '5', '云计算&大数据', 'delete', '', 14, 1);
INSERT INTO `xadmin_log` VALUES (45, '2019-05-25 15:20:47.356727', '127.0.0.1', '2', '初识HTML+CSS', 'change', '修改 image 和 tags', 13, 1);
INSERT INTO `xadmin_log` VALUES (46, '2019-05-25 15:27:49.051504', '127.0.0.1', '2', '初识HTML+CSS', 'change', '修改 image 和 tags', 13, 1);
INSERT INTO `xadmin_log` VALUES (47, '2019-05-25 15:30:05.762292', '127.0.0.1', '1', 'bootstrap快速入门', 'change', '修改 image 和 tags', 13, 1);
INSERT INTO `xadmin_log` VALUES (48, '2019-05-26 01:18:41.532118', '127.0.0.1', '1', 'Bootstarp基础教程(位于第1位)', 'create', '已添加。', 20, 1);
INSERT INTO `xadmin_log` VALUES (49, '2019-05-26 18:42:25.821519', '127.0.0.1', '9', '1-2 HTML基本语法', 'create', '已添加。', 18, 1);
INSERT INTO `xadmin_log` VALUES (50, '2019-05-26 18:44:55.367740', '127.0.0.1', '8', '1-1 HTML/CSS介绍', 'change', '修改 learn_times', 18, 1);
INSERT INTO `xadmin_log` VALUES (51, '2019-05-27 01:21:19.691278', '127.0.0.1', '2', 'Django入门教程(位于第2位)', 'create', '已添加。', 20, 1);
INSERT INTO `xadmin_log` VALUES (52, '2019-05-27 01:22:28.180872', '127.0.0.1', '3', 'HTML进阶教程(位于第3位)', 'create', '已添加。', 20, 1);
INSERT INTO `xadmin_log` VALUES (53, '2019-05-30 23:09:20.517970', '127.0.0.1', '1', 'bootstrap快速入门Wiki', 'create', '已添加。', 29, 1);
INSERT INTO `xadmin_log` VALUES (54, '2019-05-30 23:51:04.515126', '127.0.0.1', '1', 'bootstrap快速入门Wiki', 'change', '修改 wiki', 29, 1);
INSERT INTO `xadmin_log` VALUES (55, '2019-05-30 23:54:29.244321', '127.0.0.1', '1', 'bootstrap快速入门Wiki', 'change', '修改 wiki', 29, 1);
INSERT INTO `xadmin_log` VALUES (56, '2019-05-30 23:55:35.882013', '127.0.0.1', '1', 'bootstrap快速入门Wiki', 'change', '修改 wiki', 29, 1);
INSERT INTO `xadmin_log` VALUES (57, '2019-05-30 23:58:28.539620', '127.0.0.1', '1', 'bootstrap快速入门Wiki', 'change', '修改 wiki', 29, 1);
INSERT INTO `xadmin_log` VALUES (58, '2019-05-31 13:43:02.078384', '127.0.0.1', '5', '第3章 测试', 'create', '已添加。', 17, 7);
INSERT INTO `xadmin_log` VALUES (59, '2019-05-31 13:43:27.034131', '127.0.0.1', '5', '第4章 测试', 'change', '修改 name', 17, 7);
INSERT INTO `xadmin_log` VALUES (60, '2019-05-31 13:44:34.274578', '127.0.0.1', '10', '4-1 测试视频', 'create', '已添加。', 18, 7);
INSERT INTO `xadmin_log` VALUES (61, '2019-06-04 15:06:49.279899', '127.0.0.1', '10', '4-1 测试视频', 'delete', '', 18, 7);
INSERT INTO `xadmin_log` VALUES (62, '2019-06-04 15:08:50.375691', '127.0.0.1', '1', '1-1 课程介绍', 'change', '修改 video_file', 18, 7);
INSERT INTO `xadmin_log` VALUES (63, '2019-06-04 15:19:52.932665', '127.0.0.1', '1', '1-1 课程介绍', 'change', '修改 video_file', 18, 7);
INSERT INTO `xadmin_log` VALUES (64, '2019-06-04 15:22:31.639754', '127.0.0.1', '2', '2-1 bootstrap环境搭建', 'change', '修改 video_file', 18, 7);
INSERT INTO `xadmin_log` VALUES (65, '2019-06-04 15:22:40.199483', '127.0.0.1', '3', '2-2 bootstrap环境搭建', 'change', '修改 video_file', 18, 7);
INSERT INTO `xadmin_log` VALUES (66, '2019-06-04 15:22:49.443482', '127.0.0.1', '4', '2-3 bootstrap环境搭建', 'change', '修改 video_file', 18, 7);
INSERT INTO `xadmin_log` VALUES (67, '2019-06-04 15:23:11.524165', '127.0.0.1', '5', '3-1 Bootstrap中的全局样式', 'change', '修改 video_file', 18, 7);
INSERT INTO `xadmin_log` VALUES (68, '2019-06-04 15:23:21.164539', '127.0.0.1', '6', '3-2 Boostrap中的排版', 'change', '修改 video_file', 18, 7);
INSERT INTO `xadmin_log` VALUES (69, '2019-06-04 15:23:30.327478', '127.0.0.1', '7', '3-3 Boostrap中的排版 - 文本', 'change', '修改 video_file', 18, 7);
INSERT INTO `xadmin_log` VALUES (70, '2019-06-04 15:23:45.065653', '127.0.0.1', '8', '1-1 HTML/CSS介绍', 'change', '修改 video_file', 18, 7);
INSERT INTO `xadmin_log` VALUES (71, '2019-06-04 15:23:53.971458', '127.0.0.1', '9', '1-2 HTML基本语法', 'change', '修改 video_file', 18, 7);
INSERT INTO `xadmin_log` VALUES (72, '2019-06-04 15:24:15.036432', '127.0.0.1', '5', '第4章 测试', 'delete', '', 17, 7);
INSERT INTO `xadmin_log` VALUES (73, '2019-06-05 21:47:11.320646', '127.0.0.1', '6', '第1章 Python介绍', 'create', '已添加。', 17, 1);
INSERT INTO `xadmin_log` VALUES (74, '2019-06-05 21:48:15.213619', '127.0.0.1', '11', '1.1 Python入门介绍', 'create', '已添加。', 18, 1);
INSERT INTO `xadmin_log` VALUES (75, '2019-06-06 22:02:36.478260', '127.0.0.1', '1', 'bootstrap快速入门Wiki', 'change', '修改 wiki', 29, 1);
INSERT INTO `xadmin_log` VALUES (76, '2019-06-06 22:05:42.141930', '127.0.0.1', '1', 'bootstrap快速入门Wiki', 'change', '修改 wiki', 29, 1);
INSERT INTO `xadmin_log` VALUES (77, '2019-06-06 22:13:34.499197', '127.0.0.1', '1', 'bootstrap快速入门Wiki', 'change', '修改 wiki', 29, 1);
INSERT INTO `xadmin_log` VALUES (78, '2019-06-06 22:29:18.146349', '127.0.0.1', '1', 'bootstrap快速入门Wiki', 'change', '修改 wiki', 29, 1);
INSERT INTO `xadmin_log` VALUES (79, '2019-06-06 23:47:32.658712', '127.0.0.1', '1', 'bootstrap快速入门Wiki', 'change', '修改 wiki', 29, 1);
INSERT INTO `xadmin_log` VALUES (80, '2019-06-07 16:40:46.316806', '127.0.0.1', '7', 'silentlight', 'change', '修改 last_login，username 和 image', 4, 1);
INSERT INTO `xadmin_log` VALUES (81, '2019-06-10 11:25:32.162962', '127.0.0.1', NULL, '', 'delete', '批量删除 13 个 用户信息', NULL, 1);
INSERT INTO `xadmin_log` VALUES (82, '2019-06-10 11:26:26.046616', '127.0.0.1', '19', 'silence', 'change', '修改 last_login，groups，is_staff，image 和 teacher', 4, 1);
INSERT INTO `xadmin_log` VALUES (83, '2019-06-10 11:27:40.916038', '127.0.0.1', '19', 'bobby', 'change', '修改 groups，username，is_staff 和 image', 4, 1);
INSERT INTO `xadmin_log` VALUES (84, '2019-06-10 11:29:30.781004', '127.0.0.1', '19', 'bobby', 'change', '修改 is_staff 和 image', 4, 1);
INSERT INTO `xadmin_log` VALUES (85, '2019-06-10 11:30:23.464845', '127.0.0.1', '19', 'bobby', 'change', '修改 last_login，groups 和 image', 4, 1);
INSERT INTO `xadmin_log` VALUES (86, '2019-06-10 11:32:03.903288', '127.0.0.1', '19', 'bobby', 'change', '修改 last_login，groups，is_staff，job 和 image', 4, 1);
INSERT INTO `xadmin_log` VALUES (87, '2019-06-10 11:35:17.299331', '127.0.0.1', '12', '3-4 Bootstrap的全局样式（2）', 'create', '已添加。', 18, 7);
INSERT INTO `xadmin_log` VALUES (88, '2019-06-10 11:35:24.447224', '127.0.0.1', NULL, '', 'delete', '批量删除 1 个 视频', NULL, 7);
INSERT INTO `xadmin_log` VALUES (89, '2019-06-10 11:40:12.487580', '127.0.0.1', '3', '课程资源', 'create', '已添加。', 16, 7);
INSERT INTO `xadmin_log` VALUES (90, '2019-06-10 11:40:18.665623', '127.0.0.1', NULL, '', 'delete', '批量删除 1 个 课程资源', NULL, 7);

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES (1, 'dashboard:home:pos', '', 1);
INSERT INTO `xadmin_usersettings` VALUES (2, 'courses_courseclassify_editform_portal', ',courseclassify2_set-group,,,,,,,', 1);
INSERT INTO `xadmin_usersettings` VALUES (3, 'site-theme', '/static/xadmin/css/themes/bootstrap-xadmin.css', 1);
INSERT INTO `xadmin_usersettings` VALUES (4, 'dashboard:home:pos', '', 7);
INSERT INTO `xadmin_usersettings` VALUES (5, 'dashboard:home:pos', '', 19);

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `widget_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
