/*
 Navicat Premium Data Transfer

 Source Server         : tss
 Source Server Type    : MySQL
 Source Server Version : 50638
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50638
 File Encoding         : 65001

 Date: 10/01/2020 21:32:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for attribute_group
-- ----------------------------
DROP TABLE IF EXISTS `attribute_group`;
CREATE TABLE `attribute_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of attribute_group
-- ----------------------------
INSERT INTO `attribute_group` VALUES (1, 'Механизм');
INSERT INTO `attribute_group` VALUES (2, 'Стекло');
INSERT INTO `attribute_group` VALUES (3, 'Ремешок');
INSERT INTO `attribute_group` VALUES (4, 'Корпус');
INSERT INTO `attribute_group` VALUES (5, 'Индикация');

-- ----------------------------
-- Table structure for attribute_material
-- ----------------------------
DROP TABLE IF EXISTS `attribute_material`;
CREATE TABLE `attribute_material`  (
  `attr_id` int(10) UNSIGNED NOT NULL,
  `material_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`attr_id`, `material_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of attribute_material
-- ----------------------------
INSERT INTO `attribute_material` VALUES (1, 1);
INSERT INTO `attribute_material` VALUES (2, 4);
INSERT INTO `attribute_material` VALUES (2, 5);
INSERT INTO `attribute_material` VALUES (2, 15);
INSERT INTO `attribute_material` VALUES (2, 16);
INSERT INTO `attribute_material` VALUES (2, 17);
INSERT INTO `attribute_material` VALUES (2, 20);
INSERT INTO `attribute_material` VALUES (2, 21);
INSERT INTO `attribute_material` VALUES (2, 22);
INSERT INTO `attribute_material` VALUES (3, 12);
INSERT INTO `attribute_material` VALUES (3, 23);
INSERT INTO `attribute_material` VALUES (3, 24);
INSERT INTO `attribute_material` VALUES (3, 25);
INSERT INTO `attribute_material` VALUES (3, 26);
INSERT INTO `attribute_material` VALUES (4, 2);
INSERT INTO `attribute_material` VALUES (4, 3);
INSERT INTO `attribute_material` VALUES (4, 27);
INSERT INTO `attribute_material` VALUES (4, 28);
INSERT INTO `attribute_material` VALUES (5, 1);
INSERT INTO `attribute_material` VALUES (5, 4);
INSERT INTO `attribute_material` VALUES (5, 5);
INSERT INTO `attribute_material` VALUES (5, 12);
INSERT INTO `attribute_material` VALUES (5, 13);
INSERT INTO `attribute_material` VALUES (6, 2);
INSERT INTO `attribute_material` VALUES (6, 29);
INSERT INTO `attribute_material` VALUES (6, 30);
INSERT INTO `attribute_material` VALUES (6, 31);
INSERT INTO `attribute_material` VALUES (6, 32);
INSERT INTO `attribute_material` VALUES (6, 33);
INSERT INTO `attribute_material` VALUES (7, 3);
INSERT INTO `attribute_material` VALUES (7, 6);
INSERT INTO `attribute_material` VALUES (8, 1);
INSERT INTO `attribute_material` VALUES (9, 2);
INSERT INTO `attribute_material` VALUES (9, 14);
INSERT INTO `attribute_material` VALUES (10, 4);
INSERT INTO `attribute_material` VALUES (10, 5);
INSERT INTO `attribute_material` VALUES (10, 13);
INSERT INTO `attribute_material` VALUES (11, 7);
INSERT INTO `attribute_material` VALUES (11, 8);
INSERT INTO `attribute_material` VALUES (11, 9);
INSERT INTO `attribute_material` VALUES (11, 10);
INSERT INTO `attribute_material` VALUES (12, 1);
INSERT INTO `attribute_material` VALUES (14, 3);
INSERT INTO `attribute_material` VALUES (16, 1);
INSERT INTO `attribute_material` VALUES (16, 4);
INSERT INTO `attribute_material` VALUES (16, 5);

-- ----------------------------
-- Table structure for attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `attribute_value`;
CREATE TABLE `attribute_value`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attr_group_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `value`(`value`) USING BTREE,
  INDEX `attr_group_id`(`attr_group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of attribute_value
-- ----------------------------
INSERT INTO `attribute_value` VALUES (1, 'Механика с автоподзаводом', 1);
INSERT INTO `attribute_value` VALUES (2, 'Механика с ручным заводом', 1);
INSERT INTO `attribute_value` VALUES (3, 'Кварцевый от батарейки', 1);
INSERT INTO `attribute_value` VALUES (4, 'Кварцевый от солнечного аккумулятора', 1);
INSERT INTO `attribute_value` VALUES (5, 'Сапфировое', 2);
INSERT INTO `attribute_value` VALUES (6, 'Минеральное', 2);
INSERT INTO `attribute_value` VALUES (7, 'Полимерное', 2);
INSERT INTO `attribute_value` VALUES (8, 'Стальной', 3);
INSERT INTO `attribute_value` VALUES (9, 'Кожаный', 3);
INSERT INTO `attribute_value` VALUES (10, 'Каучуковый', 3);
INSERT INTO `attribute_value` VALUES (11, 'Полимерный', 3);
INSERT INTO `attribute_value` VALUES (12, 'Нержавеющая сталь', 4);
INSERT INTO `attribute_value` VALUES (13, 'Титановый сплав', 4);
INSERT INTO `attribute_value` VALUES (14, 'Латунь', 4);
INSERT INTO `attribute_value` VALUES (15, 'Полимер', 4);
INSERT INTO `attribute_value` VALUES (16, 'Керамика', 4);
INSERT INTO `attribute_value` VALUES (17, 'Алюминий', 4);
INSERT INTO `attribute_value` VALUES (18, 'Аналоговые', 5);
INSERT INTO `attribute_value` VALUES (19, 'Цифровые', 5);

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'brand_no_image.jpg',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `alias`(`alias`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES (1, 'Test', 'casio', 'abt-1.jpg', 'In sit amet sapien eros Integer dolore magna aliqua');
INSERT INTO `banner` VALUES (2, 'Test1', 'citizen', 'abt-2.jpg', 'In sit amet sapien eros Integer dolore magna aliqua');
INSERT INTO `banner` VALUES (3, 'Test2', 'royal-london', 'abt-3.jpg', 'In sit amet sapien eros Integer dolore magna aliqua');
INSERT INTO `banner` VALUES (4, 'Test3', 'seiko', 'seiko.png', NULL);
INSERT INTO `banner` VALUES (5, 'Test4', 'diesel', 'diesel.png', NULL);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `alias`(`alias`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (15, 'Новости', 'novosti', 0, 'news', 'новости сайта');
INSERT INTO `category` VALUES (16, 'Контакты', 'kontakty', 0, 'contacts', 'контакты');

-- ----------------------------
-- Table structure for currency
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `symbol_left` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `symbol_right` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` float(15, 2) NOT NULL,
  `base` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of currency
-- ----------------------------
INSERT INTO `currency` VALUES (1, 'гривна', 'UAH', '', 'грн.', 25.80, '0');
INSERT INTO `currency` VALUES (2, 'доллар', 'USD', '$', '', 1.00, '1');
INSERT INTO `currency` VALUES (3, 'Евро', 'EUR', '€', '', 0.88, '0');

-- ----------------------------
-- Table structure for gallery
-- ----------------------------
DROP TABLE IF EXISTS `gallery`;
CREATE TABLE `gallery`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `material_id` int(10) UNSIGNED NOT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gallery
-- ----------------------------
INSERT INTO `gallery` VALUES (1, 2, 's-1.jpg');
INSERT INTO `gallery` VALUES (2, 2, 's-2.jpg');
INSERT INTO `gallery` VALUES (3, 2, 's-3.jpg');

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` tinyint(3) UNSIGNED NOT NULL,
  `brand_id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `price` float NOT NULL DEFAULT 0,
  `old_price` float NOT NULL DEFAULT 0,
  `status` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'no_image.jpg',
  `hit` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `alias`(`alias`) USING BTREE,
  INDEX `category_id`(`category_id`, `brand_id`) USING BTREE,
  INDEX `hit`(`hit`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES (1, 6, 1, 'Casio MRP-700-1AVEF', 'casio-mrp-700-1avef', NULL, 300, 0, '1', NULL, NULL, 'p-1.png', '0');
INSERT INTO `material` VALUES (11, 15, 2, 'Тестовый товар', 'testovyy-tovar', '<p>контент...</p>\r\n', 10, 0, '1', '', '', 'ca51554f075482479aa5243e18d18e13.png', '1');
INSERT INTO `material` VALUES (34, 15, 0, 'Новость 1', 'novost-1', '<p>tytyt</p>\r\n', 0, 0, '1', 'news', 'новости сайта', '484c0156ac0182f2ec1979a79619d406.png', '1');
INSERT INTO `material` VALUES (35, 16, 0, 'Новость3', 'novost-3', '<p>какой то текст</p>\r\n', 0, 0, '1', 'contacts', 'контакты', 'c802dc67b753d64fc6fb657ecc4584c1.png', '1');

-- ----------------------------
-- Table structure for modification
-- ----------------------------
DROP TABLE IF EXISTS `modification`;
CREATE TABLE `modification`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `material_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of modification
-- ----------------------------
INSERT INTO `modification` VALUES (1, 1, 'Silver', 300);
INSERT INTO `modification` VALUES (2, 1, 'Black', 300);
INSERT INTO `modification` VALUES (3, 1, 'Dark Black', 305);
INSERT INTO `modification` VALUES (4, 1, 'Red', 310);
INSERT INTO `modification` VALUES (5, 2, 'Silver', 80);
INSERT INTO `modification` VALUES (6, 2, 'Red', 70);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp(0) NULL DEFAULT NULL,
  `currency` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for order_material
-- ----------------------------
DROP TABLE IF EXISTS `order_material`;
CREATE TABLE `order_material`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(10) UNSIGNED NOT NULL,
  `material_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  CONSTRAINT `order_material_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for related_material
-- ----------------------------
DROP TABLE IF EXISTS `related_material`;
CREATE TABLE `related_material`  (
  `material_id` int(10) UNSIGNED NOT NULL,
  `related_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`material_id`, `related_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of related_material
-- ----------------------------
INSERT INTO `related_material` VALUES (1, 2);
INSERT INTO `related_material` VALUES (1, 5);
INSERT INTO `related_material` VALUES (2, 5);
INSERT INTO `related_material` VALUES (2, 10);
INSERT INTO `related_material` VALUES (5, 1);
INSERT INTO `related_material` VALUES (5, 7);
INSERT INTO `related_material` VALUES (5, 8);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `login` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` enum('user','admin') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `login`(`login`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '$2y$10$r.mm9BaeUQOj/ikYp3S0UeMFlQhhxUaP.d/lkrbmmpA8DVp7xsVW.', 'tovpeko@sss.by', 'Александра', 'minsk ', 'admin');

SET FOREIGN_KEY_CHECKS = 1;
