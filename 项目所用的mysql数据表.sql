/*
 Navicat Premium Data Transfer

 Source Server         : MySQL80
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : localhost:3307
 Source Schema         : decalonshop

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 25/06/2024 11:31:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `link_user` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '联系人',
  `link_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '地址',
  `link_phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '电话',
  `user_id` bigint NULL DEFAULT NULL COMMENT '所属用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '地址表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (7, '杭州', '余杭区202幢', '1333333', 2);
INSERT INTO `address` VALUES (8, '12345678901', '1111', '12345678901', 1);

-- ----------------------------
-- Table structure for avatar
-- ----------------------------
DROP TABLE IF EXISTS `avatar`;
CREATE TABLE `avatar`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '文件类型，后缀 。 jpg …',
  `size` bigint NULL DEFAULT NULL COMMENT '文件大小',
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '文件路径',
  `md5` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '头像表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of avatar
-- ----------------------------
INSERT INTO `avatar` VALUES (11, 'png', 38, '/avatar/e412d9a3-5103-4ec0-aa49-2a2839389752.png', 'f0142aa4314be7cea0a8c6b2321124c3');
INSERT INTO `avatar` VALUES (13, 'jpg', 9, '/avatar/f84d169f-cb3e-4b76-ad55-b65dcc77ece2.jpg', '39ebbfce95b797b5acbc2943b2f24a5f');

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `good_id` bigint NULL DEFAULT NULL COMMENT '对应的商品id',
  `show_order` int NULL DEFAULT NULL COMMENT '播放顺序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '轮播图表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES (8, 9, 3);
INSERT INTO `carousel` VALUES (9, 10, 2);
INSERT INTO `carousel` VALUES (10, 11, 4);
INSERT INTO `carousel` VALUES (12, 13, 4);
INSERT INTO `carousel` VALUES (13, 15, 5);

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `count` int NULL DEFAULT NULL COMMENT '数量',
  `create_time` datetime NULL DEFAULT NULL COMMENT '加入时间',
  `good_id` bigint NULL DEFAULT NULL COMMENT '商品id',
  `standard` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '商品规格',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '购物车表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (23, 1, '2024-06-19 09:55:25', 13, '43', 1);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '类别名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (27, '电脑');
INSERT INTO `category` VALUES (28, '手机');
INSERT INTO `category` VALUES (29, '耳机');
INSERT INTO `category` VALUES (30, '钢笔');
INSERT INTO `category` VALUES (31, '铅笔');
INSERT INTO `category` VALUES (32, '文具盒');
INSERT INTO `category` VALUES (33, '男装');
INSERT INTO `category` VALUES (34, '女装');
INSERT INTO `category` VALUES (35, '运动鞋');
INSERT INTO `category` VALUES (36, '板鞋');
INSERT INTO `category` VALUES (37, '红酒');
INSERT INTO `category` VALUES (38, '啤酒');
INSERT INTO `category` VALUES (41, '水果');

-- ----------------------------
-- Table structure for good
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '商品名称',
  `description` varchar(1600) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '描述',
  `discount` double(10, 2) NOT NULL DEFAULT 1.00 COMMENT '折扣',
  `sales` bigint NOT NULL DEFAULT 0 COMMENT '销量',
  `sale_money` double(10, 2) NULL DEFAULT 0.00 COMMENT '销售额',
  `category_id` bigint NULL DEFAULT NULL COMMENT '分类id',
  `imgs` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '商品图片',
  `create_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否推荐。0不推荐，1推荐',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除，0未删除，1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES (9, '笔记本book 21-pro', '笔记本book21-pro，M1系列芯片，性能提升强劲', 1.00, 1, 7999.00, 27, '/file/5a9c597e-e089-4a72-9e10-0afe6e64678b.png', '2023-11-12 17:11:12.590675', 1, 0);
INSERT INTO `good` VALUES (10, 'iPhone', '智能手机phone最新款，2023最新款', 1.00, 1, 6999.00, 28, '/file/0d714449-1522-4e95-a6e2-a16899c8b5c9.webp', '2023-11-12 17:13:29.475016', 1, 0);
INSERT INTO `good` VALUES (11, '山竹水果', '水果山竹，水果之王', 1.00, 8, 79.92, 41, '/file/8d9f6418-d56e-4aac-9998-98ab6c0b8be8.webp', '2023-11-12 17:16:15.502456', 1, 0);
INSERT INTO `good` VALUES (12, '宠物猫-布偶', '布偶宠物猫，性格温和，容易养', 1.00, 0, 0.00, 39, '/file/1c33cf16-3539-45e5-a6ba-60982e2f4d1f.png', '2023-11-12 17:23:23.687024', 1, 1);
INSERT INTO `good` VALUES (13, '运动鞋', '运动鞋', 1.00, 51, 5100.00, 35, '/file/33b96aec-6336-4b4f-8ae1-597f06c434bd.jpg', '2024-06-17 14:54:10.990610', 0, 0);
INSERT INTO `good` VALUES (14, 'AUSDOM耳机', '耳罩式耳机', 1.00, 0, 0.00, 29, '/file/84cdbfc1-5126-4a2e-be25-9a3214fe998c.webp', '2024-06-18 21:57:18.917377', 1, 0);
INSERT INTO `good` VALUES (15, '红酒', '红酒', 1.00, 0, 0.00, 37, '/file/0c611fcd-72dd-454a-8e8c-1757952c0faa.webp', '2024-06-18 22:02:42.053235', 0, 0);
INSERT INTO `good` VALUES (16, '珠江啤酒', '啤酒', 1.00, 1, 10.00, 38, '/file/6c54b2ce-5699-4a2e-8e47-b199e8ea21d5.webp', '2024-06-18 22:46:27.226967', 0, 0);
INSERT INTO `good` VALUES (17, '钢笔', '钢笔', 1.00, 0, 0.00, 30, '/file/a73b0aef-77dd-4a88-a863-0f0cb19f9c08.webp', '2024-06-18 22:47:17.739284', 0, 0);
INSERT INTO `good` VALUES (18, '铅笔', '铅笔', 1.00, 0, 0.00, 31, '/file/773c00d7-cca1-403e-a0ff-1ec4cf7f7a29.webp', '2024-06-18 22:48:16.899700', 0, 0);
INSERT INTO `good` VALUES (19, 'test1', '1', 1.00, 0, 0.00, 35, '/file/773c00d7-cca1-403e-a0ff-1ec4cf7f7a29.webp', '2024-06-19 10:06:47.996621', 0, 0);

-- ----------------------------
-- Table structure for good_standard
-- ----------------------------
DROP TABLE IF EXISTS `good_standard`;
CREATE TABLE `good_standard`  (
  `good_id` bigint NULL DEFAULT NULL COMMENT '商品id',
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '规格',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `store` bigint NULL DEFAULT NULL COMMENT '库存'
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '商品规格表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of good_standard
-- ----------------------------
INSERT INTO `good_standard` VALUES (12, '纯种', 10000.00, 10);
INSERT INTO `good_standard` VALUES (12, '精品猫', 99999.00, 1);
INSERT INTO `good_standard` VALUES (9, '21基础款', 5000.00, 10);
INSERT INTO `good_standard` VALUES (9, '21升级款', 7999.00, 99);
INSERT INTO `good_standard` VALUES (13, '42', 100.00, 0);
INSERT INTO `good_standard` VALUES (13, '43', 150.00, 150);
INSERT INTO `good_standard` VALUES (14, '黑色', 160.00, 20);
INSERT INTO `good_standard` VALUES (14, '白色', 170.00, 10);
INSERT INTO `good_standard` VALUES (10, '智能手机-基础班', 3999.00, 98);
INSERT INTO `good_standard` VALUES (10, '智能手机-专业版', 6999.00, 33);
INSERT INTO `good_standard` VALUES (11, '1斤装', 9.99, 992);
INSERT INTO `good_standard` VALUES (11, '10斤装', 999.00, 23);
INSERT INTO `good_standard` VALUES (15, '一瓶', 300.00, 100);
INSERT INTO `good_standard` VALUES (15, '一箱', 1800.00, 100);
INSERT INTO `good_standard` VALUES (16, '一瓶', 10.00, 999);
INSERT INTO `good_standard` VALUES (17, '一支', 190.00, 100);
INSERT INTO `good_standard` VALUES (18, '一支', 6.00, 120);
INSERT INTO `good_standard` VALUES (19, '1', 1.00, 1);
INSERT INTO `good_standard` VALUES (19, '2', 2.00, 2);

-- ----------------------------
-- Table structure for icon
-- ----------------------------
DROP TABLE IF EXISTS `icon`;
CREATE TABLE `icon`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图标的识别码',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片的名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '图标表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of icon
-- ----------------------------
INSERT INTO `icon` VALUES (26, '&#xe60a;', NULL);
INSERT INTO `icon` VALUES (27, '&#xe709;', NULL);
INSERT INTO `icon` VALUES (28, '&#xe8c7;', NULL);
INSERT INTO `icon` VALUES (29, '&#xe617;', NULL);
INSERT INTO `icon` VALUES (30, '&#xe605;', NULL);
INSERT INTO `icon` VALUES (32, '&#xe73d;', NULL);

-- ----------------------------
-- Table structure for icon_category
-- ----------------------------
DROP TABLE IF EXISTS `icon_category`;
CREATE TABLE `icon_category`  (
  `category_id` bigint NOT NULL COMMENT '分类id',
  `icon_id` bigint NOT NULL COMMENT '图标id',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '商品分类 - 图标关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of icon_category
-- ----------------------------
INSERT INTO `icon_category` VALUES (27, 26);
INSERT INTO `icon_category` VALUES (28, 26);
INSERT INTO `icon_category` VALUES (29, 26);
INSERT INTO `icon_category` VALUES (30, 27);
INSERT INTO `icon_category` VALUES (31, 27);
INSERT INTO `icon_category` VALUES (32, 27);
INSERT INTO `icon_category` VALUES (33, 28);
INSERT INTO `icon_category` VALUES (34, 28);
INSERT INTO `icon_category` VALUES (35, 29);
INSERT INTO `icon_category` VALUES (36, 29);
INSERT INTO `icon_category` VALUES (37, 30);
INSERT INTO `icon_category` VALUES (38, 30);
INSERT INTO `icon_category` VALUES (41, 32);

-- ----------------------------
-- Table structure for order_goods
-- ----------------------------
DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE `order_goods`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint NULL DEFAULT NULL COMMENT '订单id',
  `good_id` bigint NULL DEFAULT NULL COMMENT '商品id',
  `count` int NULL DEFAULT NULL COMMENT '数量',
  `standard` varchar(1600) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '规格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_goods
-- ----------------------------
INSERT INTO `order_goods` VALUES (15, 15, 10, 1, '智能手机-专业版');
INSERT INTO `order_goods` VALUES (16, 16, 11, 6, '1斤装');
INSERT INTO `order_goods` VALUES (17, 17, 9, 1, '21升级款');
INSERT INTO `order_goods` VALUES (18, 18, 13, 1, '42');
INSERT INTO `order_goods` VALUES (19, 19, 13, 1, '42');
INSERT INTO `order_goods` VALUES (20, 20, 13, 1, '42');
INSERT INTO `order_goods` VALUES (21, 21, 13, 1, '42');
INSERT INTO `order_goods` VALUES (22, 22, 11, 1, '1斤装');
INSERT INTO `order_goods` VALUES (23, 23, 16, 1, '一瓶');
INSERT INTO `order_goods` VALUES (24, 24, 13, 47, '42');
INSERT INTO `order_goods` VALUES (25, 25, 13, 1, '42');
INSERT INTO `order_goods` VALUES (26, 26, 13, 1, '42');
INSERT INTO `order_goods` VALUES (27, 27, 11, 1, '1斤装');

-- ----------------------------
-- Table structure for standard
-- ----------------------------
DROP TABLE IF EXISTS `standard`;
CREATE TABLE `standard`  (
  `goodId` bigint NOT NULL COMMENT '商品id',
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '商品规格',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '该规格的价格',
  `store` bigint NULL DEFAULT NULL COMMENT '该规格的库存',
  PRIMARY KEY (`goodId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '规格表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of standard
-- ----------------------------

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '文件类型',
  `size` bigint NULL DEFAULT NULL COMMENT '大小',
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '文件路径',
  `is_delete` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除',
  `enable` tinyint(1) NULL DEFAULT NULL COMMENT '是否启用',
  `md5` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '系统文件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (7, '07.jpg', 'jpg', 1814, '/file/7dfd10628edc4b4e97de19c1cb86585e.jpg', 1, 0, '04271616ebc6914643c3af592dd58bef');
INSERT INTO `sys_file` VALUES (8, '9a49edb823cc4cb799cb3438a7419a83.jpg', 'jpg', 132, '/file/2b6249b9ba24491a9048c1e8c0b5256e.jpg', 1, 0, 'f11ed5acc29b90770a453eceb7524712');
INSERT INTO `sys_file` VALUES (9, '9a49edb823cc4cb799cb3438a7419a83.jpg', 'jpg', 132, '/file/2b6249b9ba24491a9048c1e8c0b5256e.jpg', 1, 0, 'f11ed5acc29b90770a453eceb7524712');
INSERT INTO `sys_file` VALUES (10, '9a49edb823cc4cb799cb3438a7419a83.jpg', 'jpg', 132, '/file/2b6249b9ba24491a9048c1e8c0b5256e.jpg', 1, 0, 'f11ed5acc29b90770a453eceb7524712');
INSERT INTO `sys_file` VALUES (11, '9a49edb823cc4cb799cb3438a7419a83.jpg', 'jpg', 132, '/file/2b6249b9ba24491a9048c1e8c0b5256e.jpg', 1, 0, 'f11ed5acc29b90770a453eceb7524712');
INSERT INTO `sys_file` VALUES (12, '5a776cc21c1b407bbd2595a7af726a61.jpg', 'jpg', 846, '/file/0e8132c00dc6484faa18b2d1487b34ec.jpg', 1, 0, '8f0a34a66bbc1a794b7c138897a66dad');
INSERT INTO `sys_file` VALUES (13, '5a776cc21c1b407bbd2595a7af726a61.jpg', 'jpg', 846, '/file/0e8132c00dc6484faa18b2d1487b34ec.jpg', 1, 0, '8f0a34a66bbc1a794b7c138897a66dad');
INSERT INTO `sys_file` VALUES (14, '5a776cc21c1b407bbd2595a7af726a61.jpg', 'jpg', 846, '/file/0e8132c00dc6484faa18b2d1487b34ec.jpg', 1, 0, '8f0a34a66bbc1a794b7c138897a66dad');
INSERT INTO `sys_file` VALUES (15, '5a776cc21c1b407bbd2595a7af726a61.jpg', 'jpg', 846, '/file/0e8132c00dc6484faa18b2d1487b34ec.jpg', 1, 0, '8f0a34a66bbc1a794b7c138897a66dad');
INSERT INTO `sys_file` VALUES (16, '5a776cc21c1b407bbd2595a7af726a61.jpg', 'jpg', 846, '/file/0e8132c00dc6484faa18b2d1487b34ec.jpg', 1, 0, '8f0a34a66bbc1a794b7c138897a66dad');
INSERT INTO `sys_file` VALUES (17, '5a776cc21c1b407bbd2595a7af726a61.jpg', 'jpg', 846, '/file/0e8132c00dc6484faa18b2d1487b34ec.jpg', 1, 0, '8f0a34a66bbc1a794b7c138897a66dad');
INSERT INTO `sys_file` VALUES (18, '02.jpg', 'jpg', 33, '/file/84ad8a9829424254811ce2220edc2d3b.jpg', 1, 0, 'fcf09e93c497c75cf2b3656f80f997cc');
INSERT INTO `sys_file` VALUES (19, '01.jpg', 'jpg', 26, '/file/cef757d124ec4b169cffd65de5e3c47c.jpg', 1, 0, 'd5b6bb3b068c1980d77c59079248a4a4');
INSERT INTO `sys_file` VALUES (20, '03.jpg', 'jpg', 22, '/file/7791be8ea1ee4aa0a149ae8e75c857d6.jpg', 1, 0, '75e8b3e8790e514fb799857f636a1623');
INSERT INTO `sys_file` VALUES (21, '04.jpg', 'jpg', 25, '/file/867aaf026b684b1e8b1a10c87e31df7e.jpg', 1, 0, '1d7397d5a4ce0995f711a1484d593f44');
INSERT INTO `sys_file` VALUES (22, '05.jpg', 'jpg', 19, '/file/f9f26a01e13d4ba68d7f7bd12df282e0.jpg', 1, 0, 'b2d243af2652abf08a491074c8f099ea');
INSERT INTO `sys_file` VALUES (23, '06.jpg', 'jpg', 11, '/file/286aa7816325455b8cdcd522aca833fe.jpg', 1, 0, 'c160a645c3dacb58ffb123a4239dcb50');
INSERT INTO `sys_file` VALUES (24, '230892C84EFF474374441B8BB328CEA7.jpg', 'jpg', 1531, '/file/2fbac822-ed72-4d96-9dcb-21ea50d17853.jpg', 1, 0, '6a393d5b02422a99acedc99778e24ab3');
INSERT INTO `sys_file` VALUES (25, '653A169BCEC9ED732FF6255149ED2764.jpg', 'jpg', 845, '/file/bd5fbe6e-4099-43fb-b8f3-bf690f5adc2c.jpg', 1, 0, '5fab7b4889adfe022e48d9c087ff42a7');
INSERT INTO `sys_file` VALUES (26, '1.png', 'png', 47, '/file/bc3082bc-0cfc-40e9-9e83-8fe3e3ca982e.png', 0, 0, 'b8b1242cb02994c3a6e4cd39fd11e8e2');
INSERT INTO `sys_file` VALUES (27, 'c8adb15efa3ba09e4bdd8105f026ae5e.png', 'png', 1285, '/file/17bf2b1e-ca96-4d9a-9bfc-d7f8736ae82c.png', 0, 0, 'c8adb15efa3ba09e4bdd8105f026ae5e');
INSERT INTO `sys_file` VALUES (28, '9054f9a8e408dbe36cb55c9895012a8b.png', 'png', 1574, '/file/c7fe03b2-29e8-44ba-9987-747f143dcdc0.png', 0, 0, '9054f9a8e408dbe36cb55c9895012a8b');
INSERT INTO `sys_file` VALUES (29, '1.png', 'png', 47, '/file/bc3082bc-0cfc-40e9-9e83-8fe3e3ca982e.png', 0, 0, 'b8b1242cb02994c3a6e4cd39fd11e8e2');
INSERT INTO `sys_file` VALUES (30, '1.jpg', 'jpg', 191, '/file/86e42e4d-8bd9-4257-8c5c-f3ba04f582ce.jpg', 0, 0, 'f32a75724fd46cc30790b9ad5db5c148');
INSERT INTO `sys_file` VALUES (31, '14d398ffd3667a2fd4136f4543f73836.png', 'png', 389, '/file/4998b959-1730-4712-a117-10b168270df2.png', 0, 0, '14d398ffd3667a2fd4136f4543f73836');
INSERT INTO `sys_file` VALUES (32, '993d824a74151bea014eae0411be4336.png', 'png', 1424, '/file/31f4b7e8-53ee-4c20-bdb2-48618fa991ee.png', 0, 0, '993d824a74151bea014eae0411be4336');
INSERT INTO `sys_file` VALUES (33, '215dbf89511c75a622bfe1053b01b71e.png', 'png', 1321, '/file/1c33cf16-3539-45e5-a6ba-60982e2f4d1f.png', 0, 0, '215dbf89511c75a622bfe1053b01b71e');
INSERT INTO `sys_file` VALUES (34, '3eb3982b407910ce98913f6412afd02a.png', 'png', 424, '/file/5a9c597e-e089-4a72-9e10-0afe6e64678b.png', 0, 0, '3eb3982b407910ce98913f6412afd02a');
INSERT INTO `sys_file` VALUES (35, 'content (1).jpg', 'jpg', 50, '/file/33b96aec-6336-4b4f-8ae1-597f06c434bd.jpg', 0, 0, '1a380891e138d92f2365f943f7176d67');
INSERT INTO `sys_file` VALUES (36, 'images.jpg', 'jpg', 9, '/file/5a454688-b68b-43ed-a2f0-91add546f9bb.jpg', 0, 0, '39ebbfce95b797b5acbc2943b2f24a5f');
INSERT INTO `sys_file` VALUES (37, 'a5df71e14b0fe9e7da63b4f1fdadb15bd189c51b56aae-5PRAdK_fw658webp.webp', 'webp', 44, '/file/84cdbfc1-5126-4a2e-be25-9a3214fe998c.webp', 0, 0, '4f70b4b68b3e2ddfbf059e8295997e16');
INSERT INTO `sys_file` VALUES (38, 'e4b21639016fe4614193f92e2fc62f821c07831022f2a-VNLifn_fw658webp.webp', 'webp', 63, '/file/0d714449-1522-4e95-a6e2-a16899c8b5c9.webp', 0, 0, '462df04cec1bfea204d029475e15c762');
INSERT INTO `sys_file` VALUES (39, '59722d46761c5f9fe1214d52e2aa35358e3c347079e58-zhyixG_fw658webp.webp', 'webp', 65, '/file/8d9f6418-d56e-4aac-9998-98ab6c0b8be8.webp', 0, 0, '5122421328e45d598721100f9a70fddd');
INSERT INTO `sys_file` VALUES (40, 'e74059169d3f0152a80fd0a4a68bd390740dd44b4fbc2-QbLKQ5_fw658webp.webp', 'webp', 37, '/file/0c611fcd-72dd-454a-8e8c-1757952c0faa.webp', 0, 0, 'a23c721d4b03e5fdae8946139218816e');
INSERT INTO `sys_file` VALUES (41, '11f8f7c90b7134a667a2d6b438a3bdecef6b9a111464a1-VGRN7M_fw658webp.webp', 'webp', 175, '/file/6c54b2ce-5699-4a2e-8e47-b199e8ea21d5.webp', 0, 0, '8777d4c1ec674aa3ae384ecf77da1f8a');
INSERT INTO `sys_file` VALUES (42, '2584ead09f4daf3ef4af8ad4fd666ab56e3fcdc638b2-nVMOSj_fw658webp.webp', 'webp', 11, '/file/a73b0aef-77dd-4a88-a863-0f0cb19f9c08.webp', 0, 0, '7787aa484efd1bb8bc1e6ecc18a91006');
INSERT INTO `sys_file` VALUES (43, 'c0f503b741b47e8555e5406b2c00f9d7f3052fbbe395c-EYYQqt_fw658webp.webp', 'webp', 13, '/file/773c00d7-cca1-403e-a0ff-1ec4cf7f7a29.webp', 0, 0, 'd546e8eb7b1b7e9c65c0a850321742a8');
INSERT INTO `sys_file` VALUES (44, 'c0f503b741b47e8555e5406b2c00f9d7f3052fbbe395c-EYYQqt_fw658webp.webp', 'webp', 13, '/file/773c00d7-cca1-403e-a0ff-1ec4cf7f7a29.webp', 0, 0, 'd546e8eb7b1b7e9c65c0a850321742a8');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '手机号码',
  `address` varchar(1600) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '地址',
  `avatar_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '头像链接',
  `role` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '管理员', '110238372@qq.com', '13333333333', '上海市闵行路古荡小区11单元110', '/avatar/e412d9a3-5103-4ec0-aa49-2a2839389752.png', 'admin');
INSERT INTO `sys_user` VALUES (2, 'user', 'e10adc3949ba59abbe56e057f20f883e', '新用户', '726381263@qq.com', '15888888888', '浙江省杭州市西湖区翠苑1单元202', '/avatar/e412d9a3-5103-4ec0-aa49-2a2839389752.png', 'user');
INSERT INTO `sys_user` VALUES (5, 'user1', 'e10adc3949ba59abbe56e057f20f883e', '新用户', NULL, NULL, NULL, NULL, 'user');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '订单号',
  `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '总价',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `link_user` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '联系人',
  `link_phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '联系电话',
  `link_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '地址',
  `state` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '订单状态',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (15, '20231112180622711294', 6999.00, 2, '杭州', '1333333', '余杭区202幢', '已收货', '2023-11-12 18:06:22');
INSERT INTO `t_order` VALUES (16, '20231112181636951844', 59.94, 2, '杭州', '1333333', '余杭区202幢', '已发货', '2023-11-12 18:16:36');
INSERT INTO `t_order` VALUES (17, '20231112214958576445', 7999.00, 2, '杭州', '1333333', '余杭区202幢', '已发货', '2023-11-12 21:49:58');
INSERT INTO `t_order` VALUES (18, '20240617145448318722', 100.00, 1, '12345678901', '12345678901', '1111', '已收货', '2024-06-17 14:54:48');
INSERT INTO `t_order` VALUES (19, '20240617170637659330', 100.00, 1, '12345678901', '12345678901', '1111', '已收货', '2024-06-17 17:06:37');
INSERT INTO `t_order` VALUES (20, '20240618110226245494', 100.00, 1, '12345678901', '12345678901', '1111', '已收货', '2024-06-18 11:02:26');
INSERT INTO `t_order` VALUES (21, '20240618110252751648', 100.00, 1, '12345678901', '12345678901', '1111', '已收货', '2024-06-18 11:02:52');
INSERT INTO `t_order` VALUES (22, '20240618110753611444', 9.99, 1, '12345678901', '12345678901', '1111', '已支付', '2024-06-18 11:07:53');
INSERT INTO `t_order` VALUES (23, '20240619085336141179', 10.00, 1, '12345678901', '12345678901', '1111', '已发货', '2024-06-19 08:53:36');
INSERT INTO `t_order` VALUES (24, '20240619095550277043', 4700.00, 1, '12345678901', '12345678901', '1111', '已发货', '2024-06-19 09:55:50');
INSERT INTO `t_order` VALUES (25, '20240619095624865559', 100.00, 1, '12345678901', '12345678901', '1111', '待付款', '2024-06-19 09:56:24');
INSERT INTO `t_order` VALUES (26, '20240619095856963427', 100.00, 1, '12345678901', '12345678901', '1111', '待付款', '2024-06-19 09:58:56');
INSERT INTO `t_order` VALUES (27, '20240619095915039307', 9.99, 1, '12345678901', '12345678901', '1111', '已发货', '2024-06-19 09:59:15');

SET FOREIGN_KEY_CHECKS = 1;
