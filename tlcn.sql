/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80028 (8.0.28)
 Source Host           : localhost:3306
 Source Schema         : tlcn

 Target Server Type    : MySQL
 Target Server Version : 80028 (8.0.28)
 File Encoding         : 65001

 Date: 15/09/2024 23:04:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_hide` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `brands_name_unique`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES (1, 'Apple', 'apple', '1', 'Việt Nam', 0, '2024-02-01 02:28:25', '2024-06-11 23:35:43');
INSERT INTO `brands` VALUES (6, 't', 't', '2', 'Việt Nam', 1, '2024-06-16 20:25:35', '2024-06-16 20:27:14');

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `quantity` int UNSIGNED NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `variant_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `carts_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carts
-- ----------------------------

-- ----------------------------
-- Table structure for categories_products
-- ----------------------------
DROP TABLE IF EXISTS `categories_products`;
CREATE TABLE `categories_products`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL DEFAULT 1,
  `show_hide` tinyint(1) NOT NULL DEFAULT 1,
  `parent_category_id` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `categories_products_name_unique`(`name` ASC) USING BTREE,
  INDEX `categories_products_parent_category_id_foreign`(`parent_category_id` ASC) USING BTREE,
  CONSTRAINT `categories_products_parent_category_id_foreign` FOREIGN KEY (`parent_category_id`) REFERENCES `categories_products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories_products
-- ----------------------------
INSERT INTO `categories_products` VALUES (3, 'Iphone', 'iphone', 'Iphone', 5, 1, NULL, '2024-02-01 02:29:15', '2024-06-08 16:29:29');
INSERT INTO `categories_products` VALUES (4, 'cate', 'cate', 'cate', 2, 1, NULL, '2024-06-08 15:03:35', NULL);

-- ----------------------------
-- Table structure for images_products
-- ----------------------------
DROP TABLE IF EXISTS `images_products`;
CREATE TABLE `images_products`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `image_path` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL DEFAULT 1,
  `show_hide` tinyint(1) NOT NULL DEFAULT 1,
  `variation_gallery_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `images_products_variation_gallery_id_foreign`(`variation_gallery_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of images_products
-- ----------------------------
INSERT INTO `images_products` VALUES (13, '/images/iphone-12-black.jpg', '/images/iphone-12-black.jpg', 1, 1, 7, '2024-04-02 09:53:02', '2024-04-02 09:53:02');
INSERT INTO `images_products` VALUES (14, '/images/iphone-12-white.jpg', '/images/iphone-12-white.jpg', 1, 1, 8, '2024-04-02 09:53:02', '2024-04-02 09:53:02');
INSERT INTO `images_products` VALUES (15, '/images/iphone-12-blue.jpg', '/images/iphone-12-blue.jpg', 1, 1, 9, '2024-04-02 09:53:02', '2024-04-02 09:53:02');
INSERT INTO `images_products` VALUES (16, '/images/s21-gray.jpg', '/images/s21-gray.jpg', 1, 1, 10, '2024-04-02 09:53:02', '2024-04-02 09:53:02');
INSERT INTO `images_products` VALUES (17, '/images/s21-black.jpg', '/images/s21-black.jpg', 1, 1, 11, '2024-04-02 09:53:02', '2024-04-02 09:53:02');
INSERT INTO `images_products` VALUES (18, '/images/s21-pink.jpg', '/images/s21-pink.jpg', 1, 1, 12, '2024-04-02 09:53:02', '2024-04-02 09:53:02');

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED NULL DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_index`(`queue` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jobs
-- ----------------------------
INSERT INTO `jobs` VALUES (1, 'email', '{\"uuid\":\"71e239c5-c85e-4325-9094-3e6f3ed7189e\",\"displayName\":\"App\\\\Jobs\\\\SendEmailForgotPass\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmailForgotPass\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\SendEmailForgotPass\\\":4:{s:8:\\\"\\u0000*\\u0000email\\\";s:21:\\\"vutrieu2002@gmail.com\\\";s:7:\\\"\\u0000*\\u0000code\\\";s:6:\\\"072601\\\";s:7:\\\"\\u0000*\\u0000name\\\";s:18:\\\"Vũ Đức Triệu\\\";s:5:\\\"queue\\\";s:5:\\\"email\\\";}\"}}', 0, NULL, 1714921215, 1714921215);
INSERT INTO `jobs` VALUES (2, 'email', '{\"uuid\":\"94c0c9ab-b644-4156-8ed8-dbeb789929b3\",\"displayName\":\"App\\\\Jobs\\\\SendEmailForgotPass\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmailForgotPass\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\SendEmailForgotPass\\\":4:{s:8:\\\"\\u0000*\\u0000email\\\";s:21:\\\"vutrieu2002@gmail.com\\\";s:7:\\\"\\u0000*\\u0000code\\\";s:6:\\\"823097\\\";s:7:\\\"\\u0000*\\u0000name\\\";s:18:\\\"Vũ Đức Triệu\\\";s:5:\\\"queue\\\";s:5:\\\"email\\\";}\"}}', 0, NULL, 1714921455, 1714921455);

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `order_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `variant_id` bigint UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_items_order_id_foreign`(`order_id` ASC) USING BTREE,
  INDEX `order_items_product_id_foreign`(`product_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 991 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES (1, 1, 100.00, 1, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (2, 1, 100.00, 1, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (3, 1, 100.00, 1, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (4, 1, 100.00, 1, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (5, 1, 100.00, 1, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (6, 1, 100.00, 1, 28, 28, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (7, 1, 100.00, 1, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (8, 1, 100.00, 1, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (9, 1, 100.00, 1, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (10, 1, 100.00, 1, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (11, 1, 100.00, 6, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (12, 1, 100.00, 6, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (13, 1, 100.00, 6, 23, 23, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (14, 1, 100.00, 6, 1, 1, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (15, 1, 100.00, 6, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (16, 1, 100.00, 6, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (17, 1, 100.00, 6, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (18, 1, 100.00, 6, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (19, 1, 100.00, 6, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (20, 1, 100.00, 6, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (21, 1, 100.00, 8, 29, 29, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (22, 1, 100.00, 8, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (23, 1, 100.00, 8, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (24, 1, 100.00, 8, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (25, 1, 100.00, 8, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (26, 1, 100.00, 8, 0, 0, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (27, 1, 100.00, 8, 11, 11, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (28, 1, 100.00, 8, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (29, 1, 100.00, 8, 21, 21, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (30, 1, 100.00, 8, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (31, 1, 100.00, 10, 23, 23, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (32, 1, 100.00, 10, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (33, 1, 100.00, 10, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (34, 1, 100.00, 10, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (35, 1, 100.00, 10, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (36, 1, 100.00, 10, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (37, 1, 100.00, 10, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (38, 1, 100.00, 10, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (39, 1, 100.00, 10, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (40, 1, 100.00, 10, 11, 11, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (41, 1, 100.00, 12, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (42, 1, 100.00, 12, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (43, 1, 100.00, 12, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (44, 1, 100.00, 12, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (45, 1, 100.00, 12, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (46, 1, 100.00, 12, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (47, 1, 100.00, 12, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (48, 1, 100.00, 12, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (49, 1, 100.00, 12, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (50, 1, 100.00, 12, 23, 23, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (51, 1, 100.00, 16, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (52, 1, 100.00, 16, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (53, 1, 100.00, 16, 0, 0, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (54, 1, 100.00, 16, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (55, 1, 100.00, 16, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (56, 1, 100.00, 16, 11, 11, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (57, 1, 100.00, 16, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (58, 1, 100.00, 16, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (59, 1, 100.00, 16, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (60, 1, 100.00, 16, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (61, 1, 100.00, 24, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (62, 1, 100.00, 24, 28, 28, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (63, 1, 100.00, 24, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (64, 1, 100.00, 24, 21, 21, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (65, 1, 100.00, 24, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (66, 1, 100.00, 24, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (67, 1, 100.00, 24, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (68, 1, 100.00, 24, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (69, 1, 100.00, 24, 23, 23, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (70, 1, 100.00, 24, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (71, 1, 100.00, 25, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (72, 1, 100.00, 25, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (73, 1, 100.00, 25, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (74, 1, 100.00, 25, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (75, 1, 100.00, 25, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (76, 1, 100.00, 25, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (77, 1, 100.00, 25, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (78, 1, 100.00, 25, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (79, 1, 100.00, 25, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (80, 1, 100.00, 25, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (81, 1, 100.00, 26, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (82, 1, 100.00, 26, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (83, 1, 100.00, 26, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (84, 1, 100.00, 26, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (85, 1, 100.00, 26, 23, 23, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (86, 1, 100.00, 26, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (87, 1, 100.00, 26, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (88, 1, 100.00, 26, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (89, 1, 100.00, 26, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (90, 1, 100.00, 26, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (91, 1, 100.00, 27, 11, 11, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (92, 1, 100.00, 27, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (93, 1, 100.00, 27, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (94, 1, 100.00, 27, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (95, 1, 100.00, 27, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (96, 1, 100.00, 27, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (97, 1, 100.00, 27, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (98, 1, 100.00, 27, 21, 21, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (99, 1, 100.00, 27, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (100, 1, 100.00, 27, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (101, 1, 100.00, 28, 28, 28, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (102, 1, 100.00, 28, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (103, 1, 100.00, 28, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (104, 1, 100.00, 28, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (105, 1, 100.00, 28, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (106, 1, 100.00, 28, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (107, 1, 100.00, 28, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (108, 1, 100.00, 28, 29, 29, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (109, 1, 100.00, 28, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (110, 1, 100.00, 28, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (111, 1, 100.00, 29, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (112, 1, 100.00, 29, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (113, 1, 100.00, 29, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (114, 1, 100.00, 29, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (115, 1, 100.00, 29, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (116, 1, 100.00, 29, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (117, 1, 100.00, 29, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (118, 1, 100.00, 29, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (119, 1, 100.00, 29, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (120, 1, 100.00, 29, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (121, 1, 100.00, 30, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (122, 1, 100.00, 30, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (123, 1, 100.00, 30, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (124, 1, 100.00, 30, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (125, 1, 100.00, 30, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (126, 1, 100.00, 30, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (127, 1, 100.00, 30, 0, 0, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (128, 1, 100.00, 30, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (129, 1, 100.00, 30, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (130, 1, 100.00, 30, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (131, 1, 100.00, 32, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (132, 1, 100.00, 32, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (133, 1, 100.00, 32, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (134, 1, 100.00, 32, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (135, 1, 100.00, 32, 11, 11, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (136, 1, 100.00, 32, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (137, 1, 100.00, 32, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (138, 1, 100.00, 32, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (139, 1, 100.00, 32, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (140, 1, 100.00, 32, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (141, 1, 100.00, 33, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (142, 1, 100.00, 33, 29, 29, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (143, 1, 100.00, 33, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (144, 1, 100.00, 33, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (145, 1, 100.00, 33, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (146, 1, 100.00, 33, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (147, 1, 100.00, 33, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (148, 1, 100.00, 33, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (149, 1, 100.00, 33, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (150, 1, 100.00, 33, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (151, 1, 100.00, 35, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (152, 1, 100.00, 35, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (153, 1, 100.00, 35, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (154, 1, 100.00, 35, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (155, 1, 100.00, 35, 23, 23, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (156, 1, 100.00, 35, 0, 0, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (157, 1, 100.00, 35, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (158, 1, 100.00, 35, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (159, 1, 100.00, 35, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (160, 1, 100.00, 35, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (161, 1, 100.00, 36, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (162, 1, 100.00, 36, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (163, 1, 100.00, 36, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (164, 1, 100.00, 36, 1, 1, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (165, 1, 100.00, 36, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (166, 1, 100.00, 36, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (167, 1, 100.00, 36, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (168, 1, 100.00, 36, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (169, 1, 100.00, 36, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (170, 1, 100.00, 36, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (171, 1, 100.00, 37, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (172, 1, 100.00, 37, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (173, 1, 100.00, 37, 28, 28, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (174, 1, 100.00, 37, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (175, 1, 100.00, 37, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (176, 1, 100.00, 37, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (177, 1, 100.00, 37, 23, 23, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (178, 1, 100.00, 37, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (179, 1, 100.00, 37, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (180, 1, 100.00, 37, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (181, 1, 100.00, 38, 1, 1, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (182, 1, 100.00, 38, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (183, 1, 100.00, 38, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (184, 1, 100.00, 38, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (185, 1, 100.00, 38, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (186, 1, 100.00, 38, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (187, 1, 100.00, 38, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (188, 1, 100.00, 38, 11, 11, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (189, 1, 100.00, 38, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (190, 1, 100.00, 38, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (191, 1, 100.00, 52, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (192, 1, 100.00, 52, 0, 0, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (193, 1, 100.00, 52, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (194, 1, 100.00, 52, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (195, 1, 100.00, 52, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (196, 1, 100.00, 52, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (197, 1, 100.00, 52, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (198, 1, 100.00, 52, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (199, 1, 100.00, 52, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (200, 1, 100.00, 52, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (201, 1, 100.00, 53, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (202, 1, 100.00, 53, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (203, 1, 100.00, 53, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (204, 1, 100.00, 53, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (205, 1, 100.00, 53, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (206, 1, 100.00, 53, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (207, 1, 100.00, 53, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (208, 1, 100.00, 53, 29, 29, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (209, 1, 100.00, 53, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (210, 1, 100.00, 53, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (211, 1, 100.00, 56, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (212, 1, 100.00, 56, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (213, 1, 100.00, 56, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (214, 1, 100.00, 56, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (215, 1, 100.00, 56, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (216, 1, 100.00, 56, 1, 1, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (217, 1, 100.00, 56, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (218, 1, 100.00, 56, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (219, 1, 100.00, 56, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (220, 1, 100.00, 56, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (221, 1, 100.00, 60, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (222, 1, 100.00, 60, 11, 11, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (223, 1, 100.00, 60, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (224, 1, 100.00, 60, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (225, 1, 100.00, 60, 28, 28, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (226, 1, 100.00, 60, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (227, 1, 100.00, 60, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (228, 1, 100.00, 60, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (229, 1, 100.00, 60, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (230, 1, 100.00, 60, 29, 29, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (231, 1, 100.00, 74, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (232, 1, 100.00, 74, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (233, 1, 100.00, 74, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (234, 1, 100.00, 74, 11, 11, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (235, 1, 100.00, 74, 21, 21, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (236, 1, 100.00, 74, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (237, 1, 100.00, 74, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (238, 1, 100.00, 74, 28, 28, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (239, 1, 100.00, 74, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (240, 1, 100.00, 74, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (241, 1, 100.00, 79, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (242, 1, 100.00, 79, 11, 11, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (243, 1, 100.00, 79, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (244, 1, 100.00, 79, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (245, 1, 100.00, 79, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (246, 1, 100.00, 79, 23, 23, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (247, 1, 100.00, 79, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (248, 1, 100.00, 79, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (249, 1, 100.00, 79, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (250, 1, 100.00, 79, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (251, 1, 100.00, 80, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (252, 1, 100.00, 80, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (253, 1, 100.00, 80, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (254, 1, 100.00, 80, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (255, 1, 100.00, 80, 28, 28, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (256, 1, 100.00, 80, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (257, 1, 100.00, 80, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (258, 1, 100.00, 80, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (259, 1, 100.00, 80, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (260, 1, 100.00, 80, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (261, 1, 100.00, 84, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (262, 1, 100.00, 84, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (263, 1, 100.00, 84, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (264, 1, 100.00, 84, 28, 28, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (265, 1, 100.00, 84, 21, 21, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (266, 1, 100.00, 84, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (267, 1, 100.00, 84, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (268, 1, 100.00, 84, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (269, 1, 100.00, 84, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (270, 1, 100.00, 84, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (271, 1, 100.00, 85, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (272, 1, 100.00, 85, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (273, 1, 100.00, 85, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (274, 1, 100.00, 85, 1, 1, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (275, 1, 100.00, 85, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (276, 1, 100.00, 85, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (277, 1, 100.00, 85, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (278, 1, 100.00, 85, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (279, 1, 100.00, 85, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (280, 1, 100.00, 85, 21, 21, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (281, 1, 100.00, 91, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (282, 1, 100.00, 91, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (283, 1, 100.00, 91, 1, 1, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (284, 1, 100.00, 91, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (285, 1, 100.00, 91, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (286, 1, 100.00, 91, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (287, 1, 100.00, 91, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (288, 1, 100.00, 91, 21, 21, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (289, 1, 100.00, 91, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (290, 1, 100.00, 91, 11, 11, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (291, 1, 100.00, 95, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (292, 1, 100.00, 95, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (293, 1, 100.00, 95, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (294, 1, 100.00, 95, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (295, 1, 100.00, 95, 29, 29, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (296, 1, 100.00, 95, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (297, 1, 100.00, 95, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (298, 1, 100.00, 95, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (299, 1, 100.00, 95, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (300, 1, 100.00, 95, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (301, 1, 100.00, 98, 0, 0, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (302, 1, 100.00, 98, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (303, 1, 100.00, 98, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (304, 1, 100.00, 98, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (305, 1, 100.00, 98, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (306, 1, 100.00, 98, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (307, 1, 100.00, 98, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (308, 1, 100.00, 98, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (309, 1, 100.00, 98, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (310, 1, 100.00, 98, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (311, 1, 100.00, 99, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (312, 1, 100.00, 99, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (313, 1, 100.00, 99, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (314, 1, 100.00, 99, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (315, 1, 100.00, 99, 21, 21, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (316, 1, 100.00, 99, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (317, 1, 100.00, 99, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (318, 1, 100.00, 99, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (319, 1, 100.00, 99, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (320, 1, 100.00, 99, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (321, 1, 100.00, 100, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (322, 1, 100.00, 100, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (323, 1, 100.00, 100, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (324, 1, 100.00, 100, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (325, 1, 100.00, 100, 29, 29, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (326, 1, 100.00, 100, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (327, 1, 100.00, 100, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (328, 1, 100.00, 100, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (329, 1, 100.00, 100, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (330, 1, 100.00, 100, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (331, 1, 100.00, 104, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (332, 1, 100.00, 104, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (333, 1, 100.00, 104, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (334, 1, 100.00, 104, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (335, 1, 100.00, 104, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (336, 1, 100.00, 104, 11, 11, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (337, 1, 100.00, 104, 28, 28, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (338, 1, 100.00, 104, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (339, 1, 100.00, 104, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (340, 1, 100.00, 104, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (341, 1, 100.00, 105, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (342, 1, 100.00, 105, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (343, 1, 100.00, 105, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (344, 1, 100.00, 105, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (345, 1, 100.00, 105, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (346, 1, 100.00, 105, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (347, 1, 100.00, 105, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (348, 1, 100.00, 105, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (349, 1, 100.00, 105, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (350, 1, 100.00, 105, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (351, 1, 100.00, 106, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (352, 1, 100.00, 106, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (353, 1, 100.00, 106, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (354, 1, 100.00, 106, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (355, 1, 100.00, 106, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (356, 1, 100.00, 106, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (357, 1, 100.00, 106, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (358, 1, 100.00, 106, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (359, 1, 100.00, 106, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (360, 1, 100.00, 106, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (361, 1, 100.00, 110, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (362, 1, 100.00, 110, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (363, 1, 100.00, 110, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (364, 1, 100.00, 110, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (365, 1, 100.00, 110, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (366, 1, 100.00, 110, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (367, 1, 100.00, 110, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (368, 1, 100.00, 110, 29, 29, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (369, 1, 100.00, 110, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (370, 1, 100.00, 110, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (371, 1, 100.00, 111, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (372, 1, 100.00, 111, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (373, 1, 100.00, 111, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (374, 1, 100.00, 111, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (375, 1, 100.00, 111, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (376, 1, 100.00, 111, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (377, 1, 100.00, 111, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (378, 1, 100.00, 111, 23, 23, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (379, 1, 100.00, 111, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (380, 1, 100.00, 111, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (381, 1, 100.00, 112, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (382, 1, 100.00, 112, 23, 23, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (383, 1, 100.00, 112, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (384, 1, 100.00, 112, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (385, 1, 100.00, 112, 11, 11, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (386, 1, 100.00, 112, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (387, 1, 100.00, 112, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (388, 1, 100.00, 112, 29, 29, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (389, 1, 100.00, 112, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (390, 1, 100.00, 112, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (391, 1, 100.00, 113, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (392, 1, 100.00, 113, 1, 1, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (393, 1, 100.00, 113, 29, 29, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (394, 1, 100.00, 113, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (395, 1, 100.00, 113, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (396, 1, 100.00, 113, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (397, 1, 100.00, 113, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (398, 1, 100.00, 113, 21, 21, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (399, 1, 100.00, 113, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (400, 1, 100.00, 113, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (401, 1, 100.00, 114, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (402, 1, 100.00, 114, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (403, 1, 100.00, 114, 28, 28, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (404, 1, 100.00, 114, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (405, 1, 100.00, 114, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (406, 1, 100.00, 114, 29, 29, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (407, 1, 100.00, 114, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (408, 1, 100.00, 114, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (409, 1, 100.00, 114, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (410, 1, 100.00, 114, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (411, 1, 100.00, 115, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (412, 1, 100.00, 115, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (413, 1, 100.00, 115, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (414, 1, 100.00, 115, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (415, 1, 100.00, 115, 11, 11, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (416, 1, 100.00, 115, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (417, 1, 100.00, 115, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (418, 1, 100.00, 115, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (419, 1, 100.00, 115, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (420, 1, 100.00, 115, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (421, 1, 100.00, 116, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (422, 1, 100.00, 116, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (423, 1, 100.00, 116, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (424, 1, 100.00, 116, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (425, 1, 100.00, 116, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (426, 1, 100.00, 116, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (427, 1, 100.00, 116, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (428, 1, 100.00, 116, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (429, 1, 100.00, 116, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (430, 1, 100.00, 116, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (431, 1, 100.00, 119, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (432, 1, 100.00, 119, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (433, 1, 100.00, 119, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (434, 1, 100.00, 119, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (435, 1, 100.00, 119, 23, 23, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (436, 1, 100.00, 119, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (437, 1, 100.00, 119, 11, 11, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (438, 1, 100.00, 119, 28, 28, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (439, 1, 100.00, 119, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (440, 1, 100.00, 119, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (441, 1, 100.00, 120, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (442, 1, 100.00, 120, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (443, 1, 100.00, 120, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (444, 1, 100.00, 120, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (445, 1, 100.00, 120, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (446, 1, 100.00, 120, 29, 29, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (447, 1, 100.00, 120, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (448, 1, 100.00, 120, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (449, 1, 100.00, 120, 21, 21, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (450, 1, 100.00, 120, 1, 1, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (451, 1, 100.00, 123, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (452, 1, 100.00, 123, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (453, 1, 100.00, 123, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (454, 1, 100.00, 123, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (455, 1, 100.00, 123, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (456, 1, 100.00, 123, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (457, 1, 100.00, 123, 29, 29, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (458, 1, 100.00, 123, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (459, 1, 100.00, 123, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (460, 1, 100.00, 123, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (461, 1, 100.00, 124, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (462, 1, 100.00, 124, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (463, 1, 100.00, 124, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (464, 1, 100.00, 124, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (465, 1, 100.00, 124, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (466, 1, 100.00, 124, 29, 29, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (467, 1, 100.00, 124, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (468, 1, 100.00, 124, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (469, 1, 100.00, 124, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (470, 1, 100.00, 124, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (471, 1, 100.00, 126, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (472, 1, 100.00, 126, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (473, 1, 100.00, 126, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (474, 1, 100.00, 126, 1, 1, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (475, 1, 100.00, 126, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (476, 1, 100.00, 126, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (477, 1, 100.00, 126, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (478, 1, 100.00, 126, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (479, 1, 100.00, 126, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (480, 1, 100.00, 126, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (481, 1, 100.00, 128, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (482, 1, 100.00, 128, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (483, 1, 100.00, 128, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (484, 1, 100.00, 128, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (485, 1, 100.00, 128, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (486, 1, 100.00, 128, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (487, 1, 100.00, 128, 23, 23, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (488, 1, 100.00, 128, 28, 28, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (489, 1, 100.00, 128, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (490, 1, 100.00, 128, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (491, 1, 100.00, 129, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (492, 1, 100.00, 129, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (493, 1, 100.00, 129, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (494, 1, 100.00, 129, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (495, 1, 100.00, 129, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (496, 1, 100.00, 129, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (497, 1, 100.00, 129, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (498, 1, 100.00, 129, 21, 21, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (499, 1, 100.00, 129, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (500, 1, 100.00, 129, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (501, 1, 100.00, 137, 1, 1, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (502, 1, 100.00, 137, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (503, 1, 100.00, 137, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (504, 1, 100.00, 137, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (505, 1, 100.00, 137, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (506, 1, 100.00, 137, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (507, 1, 100.00, 137, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (508, 1, 100.00, 137, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (509, 1, 100.00, 137, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (510, 1, 100.00, 137, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (511, 1, 100.00, 140, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (512, 1, 100.00, 140, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (513, 1, 100.00, 140, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (514, 1, 100.00, 140, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (515, 1, 100.00, 140, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (516, 1, 100.00, 140, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (517, 1, 100.00, 140, 11, 11, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (518, 1, 100.00, 140, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (519, 1, 100.00, 140, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (520, 1, 100.00, 140, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (521, 1, 100.00, 142, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (522, 1, 100.00, 142, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (523, 1, 100.00, 142, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (524, 1, 100.00, 142, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (525, 1, 100.00, 142, 28, 28, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (526, 1, 100.00, 142, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (527, 1, 100.00, 142, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (528, 1, 100.00, 142, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (529, 1, 100.00, 142, 11, 11, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (530, 1, 100.00, 142, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (531, 1, 100.00, 143, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (532, 1, 100.00, 143, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (533, 1, 100.00, 143, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (534, 1, 100.00, 143, 28, 28, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (535, 1, 100.00, 143, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (536, 1, 100.00, 143, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (537, 1, 100.00, 143, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (538, 1, 100.00, 143, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (539, 1, 100.00, 143, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (540, 1, 100.00, 143, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (541, 1, 100.00, 144, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (542, 1, 100.00, 144, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (543, 1, 100.00, 144, 28, 28, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (544, 1, 100.00, 144, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (545, 1, 100.00, 144, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (546, 1, 100.00, 144, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (547, 1, 100.00, 144, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (548, 1, 100.00, 144, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (549, 1, 100.00, 144, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (550, 1, 100.00, 144, 29, 29, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (551, 1, 100.00, 145, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (552, 1, 100.00, 145, 29, 29, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (553, 1, 100.00, 145, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (554, 1, 100.00, 145, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (555, 1, 100.00, 145, 0, 0, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (556, 1, 100.00, 145, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (557, 1, 100.00, 145, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (558, 1, 100.00, 145, 28, 28, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (559, 1, 100.00, 145, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (560, 1, 100.00, 145, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (561, 1, 100.00, 148, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (562, 1, 100.00, 148, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (563, 1, 100.00, 148, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (564, 1, 100.00, 148, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (565, 1, 100.00, 148, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (566, 1, 100.00, 148, 0, 0, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (567, 1, 100.00, 148, 1, 1, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (568, 1, 100.00, 148, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (569, 1, 100.00, 148, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (570, 1, 100.00, 148, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (571, 1, 100.00, 152, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (572, 1, 100.00, 152, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (573, 1, 100.00, 152, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (574, 1, 100.00, 152, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (575, 1, 100.00, 152, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (576, 1, 100.00, 152, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (577, 1, 100.00, 152, 28, 28, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (578, 1, 100.00, 152, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (579, 1, 100.00, 152, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (580, 1, 100.00, 152, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (581, 1, 100.00, 154, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (582, 1, 100.00, 154, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (583, 1, 100.00, 154, 21, 21, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (584, 1, 100.00, 154, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (585, 1, 100.00, 154, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (586, 1, 100.00, 154, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (587, 1, 100.00, 154, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (588, 1, 100.00, 154, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (589, 1, 100.00, 154, 11, 11, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (590, 1, 100.00, 154, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (591, 1, 100.00, 156, 21, 21, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (592, 1, 100.00, 156, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (593, 1, 100.00, 156, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (594, 1, 100.00, 156, 28, 28, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (595, 1, 100.00, 156, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (596, 1, 100.00, 156, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (597, 1, 100.00, 156, 1, 1, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (598, 1, 100.00, 156, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (599, 1, 100.00, 156, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (600, 1, 100.00, 156, 23, 23, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (601, 1, 100.00, 160, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (602, 1, 100.00, 160, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (603, 1, 100.00, 160, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (604, 1, 100.00, 160, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (605, 1, 100.00, 160, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (606, 1, 100.00, 160, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (607, 1, 100.00, 160, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (608, 1, 100.00, 160, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (609, 1, 100.00, 160, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (610, 1, 100.00, 160, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (611, 1, 100.00, 162, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (612, 1, 100.00, 162, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (613, 1, 100.00, 162, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (614, 1, 100.00, 162, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (615, 1, 100.00, 162, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (616, 1, 100.00, 162, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (617, 1, 100.00, 162, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (618, 1, 100.00, 162, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (619, 1, 100.00, 162, 0, 0, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (620, 1, 100.00, 162, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (621, 1, 100.00, 164, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (622, 1, 100.00, 164, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (623, 1, 100.00, 164, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (624, 1, 100.00, 164, 28, 28, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (625, 1, 100.00, 164, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (626, 1, 100.00, 164, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (627, 1, 100.00, 164, 23, 23, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (628, 1, 100.00, 164, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (629, 1, 100.00, 164, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (630, 1, 100.00, 164, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (631, 1, 100.00, 169, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (632, 1, 100.00, 169, 1, 1, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (633, 1, 100.00, 169, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (634, 1, 100.00, 169, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (635, 1, 100.00, 169, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (636, 1, 100.00, 169, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (637, 1, 100.00, 169, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (638, 1, 100.00, 169, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (639, 1, 100.00, 169, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (640, 1, 100.00, 169, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (641, 1, 100.00, 178, 1, 1, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (642, 1, 100.00, 178, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (643, 1, 100.00, 178, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (644, 1, 100.00, 178, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (645, 1, 100.00, 178, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (646, 1, 100.00, 178, 0, 0, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (647, 1, 100.00, 178, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (648, 1, 100.00, 178, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (649, 1, 100.00, 178, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (650, 1, 100.00, 178, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (651, 1, 100.00, 183, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (652, 1, 100.00, 183, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (653, 1, 100.00, 183, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (654, 1, 100.00, 183, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (655, 1, 100.00, 183, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (656, 1, 100.00, 183, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (657, 1, 100.00, 183, 28, 28, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (658, 1, 100.00, 183, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (659, 1, 100.00, 183, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (660, 1, 100.00, 183, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (661, 1, 100.00, 194, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (662, 1, 100.00, 194, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (663, 1, 100.00, 194, 1, 1, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (664, 1, 100.00, 194, 11, 11, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (665, 1, 100.00, 194, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (666, 1, 100.00, 194, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (667, 1, 100.00, 194, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (668, 1, 100.00, 194, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (669, 1, 100.00, 194, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (670, 1, 100.00, 194, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (671, 1, 100.00, 200, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (672, 1, 100.00, 200, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (673, 1, 100.00, 200, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (674, 1, 100.00, 200, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (675, 1, 100.00, 200, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (676, 1, 100.00, 200, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (677, 1, 100.00, 200, 11, 11, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (678, 1, 100.00, 200, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (679, 1, 100.00, 200, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (680, 1, 100.00, 200, 21, 21, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (681, 1, 100.00, 203, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (682, 1, 100.00, 203, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (683, 1, 100.00, 203, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (684, 1, 100.00, 203, 29, 29, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (685, 1, 100.00, 203, 1, 1, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (686, 1, 100.00, 203, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (687, 1, 100.00, 203, 11, 11, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (688, 1, 100.00, 203, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (689, 1, 100.00, 203, 23, 23, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (690, 1, 100.00, 203, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (691, 1, 100.00, 204, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (692, 1, 100.00, 204, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (693, 1, 100.00, 204, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (694, 1, 100.00, 204, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (695, 1, 100.00, 204, 0, 0, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (696, 1, 100.00, 204, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (697, 1, 100.00, 204, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (698, 1, 100.00, 204, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (699, 1, 100.00, 204, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (700, 1, 100.00, 204, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (701, 1, 100.00, 208, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (702, 1, 100.00, 208, 0, 0, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (703, 1, 100.00, 208, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (704, 1, 100.00, 208, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (705, 1, 100.00, 208, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (706, 1, 100.00, 208, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (707, 1, 100.00, 208, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (708, 1, 100.00, 208, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (709, 1, 100.00, 208, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (710, 1, 100.00, 208, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (711, 1, 100.00, 211, 23, 23, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (712, 1, 100.00, 211, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (713, 1, 100.00, 211, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (714, 1, 100.00, 211, 29, 29, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (715, 1, 100.00, 211, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (716, 1, 100.00, 211, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (717, 1, 100.00, 211, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (718, 1, 100.00, 211, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (719, 1, 100.00, 211, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (720, 1, 100.00, 211, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (721, 1, 100.00, 215, 23, 23, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (722, 1, 100.00, 215, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (723, 1, 100.00, 215, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (724, 1, 100.00, 215, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (725, 1, 100.00, 215, 0, 0, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (726, 1, 100.00, 215, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (727, 1, 100.00, 215, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (728, 1, 100.00, 215, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (729, 1, 100.00, 215, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (730, 1, 100.00, 215, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (731, 1, 100.00, 226, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (732, 1, 100.00, 226, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (733, 1, 100.00, 226, 1, 1, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (734, 1, 100.00, 226, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (735, 1, 100.00, 226, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (736, 1, 100.00, 226, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (737, 1, 100.00, 226, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (738, 1, 100.00, 226, 0, 0, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (739, 1, 100.00, 226, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (740, 1, 100.00, 226, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (741, 1, 100.00, 227, 23, 23, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (742, 1, 100.00, 227, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (743, 1, 100.00, 227, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (744, 1, 100.00, 227, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (745, 1, 100.00, 227, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (746, 1, 100.00, 227, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (747, 1, 100.00, 227, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (748, 1, 100.00, 227, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (749, 1, 100.00, 227, 0, 0, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (750, 1, 100.00, 227, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (751, 1, 100.00, 230, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (752, 1, 100.00, 230, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (753, 1, 100.00, 230, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (754, 1, 100.00, 230, 29, 29, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (755, 1, 100.00, 230, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (756, 1, 100.00, 230, 28, 28, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (757, 1, 100.00, 230, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (758, 1, 100.00, 230, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (759, 1, 100.00, 230, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (760, 1, 100.00, 230, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (761, 1, 100.00, 231, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (762, 1, 100.00, 231, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (763, 1, 100.00, 231, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (764, 1, 100.00, 231, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (765, 1, 100.00, 231, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (766, 1, 100.00, 231, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (767, 1, 100.00, 231, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (768, 1, 100.00, 231, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (769, 1, 100.00, 231, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (770, 1, 100.00, 231, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (771, 1, 100.00, 232, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (772, 1, 100.00, 232, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (773, 1, 100.00, 232, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (774, 1, 100.00, 232, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (775, 1, 100.00, 232, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (776, 1, 100.00, 232, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (777, 1, 100.00, 232, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (778, 1, 100.00, 232, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (779, 1, 100.00, 232, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (780, 1, 100.00, 232, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (781, 1, 100.00, 233, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (782, 1, 100.00, 233, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (783, 1, 100.00, 233, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (784, 1, 100.00, 233, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (785, 1, 100.00, 233, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (786, 1, 100.00, 233, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (787, 1, 100.00, 233, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (788, 1, 100.00, 233, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (789, 1, 100.00, 233, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (790, 1, 100.00, 233, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (791, 1, 100.00, 234, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (792, 1, 100.00, 234, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (793, 1, 100.00, 234, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (794, 1, 100.00, 234, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (795, 1, 100.00, 234, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (796, 1, 100.00, 234, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (797, 1, 100.00, 234, 1, 1, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (798, 1, 100.00, 234, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (799, 1, 100.00, 234, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (800, 1, 100.00, 234, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (801, 1, 100.00, 235, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (802, 1, 100.00, 235, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (803, 1, 100.00, 235, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (804, 1, 100.00, 235, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (805, 1, 100.00, 235, 23, 23, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (806, 1, 100.00, 235, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (807, 1, 100.00, 235, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (808, 1, 100.00, 235, 1, 1, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (809, 1, 100.00, 235, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (810, 1, 100.00, 235, 0, 0, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (811, 1, 100.00, 236, 29, 29, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (812, 1, 100.00, 236, 1, 1, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (813, 1, 100.00, 236, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (814, 1, 100.00, 236, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (815, 1, 100.00, 236, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (816, 1, 100.00, 236, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (817, 1, 100.00, 236, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (818, 1, 100.00, 236, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (819, 1, 100.00, 236, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (820, 1, 100.00, 236, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (821, 1, 100.00, 237, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (822, 1, 100.00, 237, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (823, 1, 100.00, 237, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (824, 1, 100.00, 237, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (825, 1, 100.00, 237, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (826, 1, 100.00, 237, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (827, 1, 100.00, 237, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (828, 1, 100.00, 237, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (829, 1, 100.00, 237, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (830, 1, 100.00, 237, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (831, 1, 100.00, 238, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (832, 1, 100.00, 238, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (833, 1, 100.00, 238, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (834, 1, 100.00, 238, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (835, 1, 100.00, 238, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (836, 1, 100.00, 238, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (837, 1, 100.00, 238, 28, 28, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (838, 1, 100.00, 238, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (839, 1, 100.00, 238, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (840, 1, 100.00, 238, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (841, 1, 100.00, 240, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (842, 1, 100.00, 240, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (843, 1, 100.00, 240, 23, 23, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (844, 1, 100.00, 240, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (845, 1, 100.00, 240, 28, 28, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (846, 1, 100.00, 240, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (847, 1, 100.00, 240, 21, 21, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (848, 1, 100.00, 240, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (849, 1, 100.00, 240, 1, 1, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (850, 1, 100.00, 240, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (851, 1, 100.00, 242, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (852, 1, 100.00, 242, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (853, 1, 100.00, 242, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (854, 1, 100.00, 242, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (855, 1, 100.00, 242, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (856, 1, 100.00, 242, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (857, 1, 100.00, 242, 1, 1, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (858, 1, 100.00, 242, 29, 29, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (859, 1, 100.00, 242, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (860, 1, 100.00, 242, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (861, 1, 100.00, 243, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (862, 1, 100.00, 243, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (863, 1, 100.00, 243, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (864, 1, 100.00, 243, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (865, 1, 100.00, 243, 23, 23, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (866, 1, 100.00, 243, 28, 28, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (867, 1, 100.00, 243, 21, 21, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (868, 1, 100.00, 243, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (869, 1, 100.00, 243, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (870, 1, 100.00, 243, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (871, 1, 100.00, 244, 29, 29, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (872, 1, 100.00, 244, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (873, 1, 100.00, 244, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (874, 1, 100.00, 244, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (875, 1, 100.00, 244, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (876, 1, 100.00, 244, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (877, 1, 100.00, 244, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (878, 1, 100.00, 244, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (879, 1, 100.00, 244, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (880, 1, 100.00, 244, 0, 0, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (881, 1, 100.00, 245, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (882, 1, 100.00, 245, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (883, 1, 100.00, 245, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (884, 1, 100.00, 245, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (885, 1, 100.00, 245, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (886, 1, 100.00, 245, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (887, 1, 100.00, 245, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (888, 1, 100.00, 245, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (889, 1, 100.00, 245, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (890, 1, 100.00, 245, 11, 11, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (891, 1, 100.00, 246, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (892, 1, 100.00, 246, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (893, 1, 100.00, 246, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (894, 1, 100.00, 246, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (895, 1, 100.00, 246, 29, 29, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (896, 1, 100.00, 246, 28, 28, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (897, 1, 100.00, 246, 0, 0, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (898, 1, 100.00, 246, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (899, 1, 100.00, 246, 23, 23, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (900, 1, 100.00, 246, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (901, 1, 100.00, 251, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (902, 1, 100.00, 251, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (903, 1, 100.00, 251, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (904, 1, 100.00, 251, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (905, 1, 100.00, 251, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (906, 1, 100.00, 251, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (907, 1, 100.00, 251, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (908, 1, 100.00, 251, 21, 21, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (909, 1, 100.00, 251, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (910, 1, 100.00, 251, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (911, 1, 100.00, 252, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (912, 1, 100.00, 252, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (913, 1, 100.00, 252, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (914, 1, 100.00, 252, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (915, 1, 100.00, 252, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (916, 1, 100.00, 252, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (917, 1, 100.00, 252, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (918, 1, 100.00, 252, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (919, 1, 100.00, 252, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (920, 1, 100.00, 252, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (921, 1, 100.00, 253, 7, 7, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (922, 1, 100.00, 253, 21, 21, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (923, 1, 100.00, 253, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (924, 1, 100.00, 253, 0, 0, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (925, 1, 100.00, 253, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (926, 1, 100.00, 253, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (927, 1, 100.00, 253, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (928, 1, 100.00, 253, 28, 28, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (929, 1, 100.00, 253, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (930, 1, 100.00, 253, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (931, 1, 100.00, 254, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (932, 1, 100.00, 254, 21, 21, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (933, 1, 100.00, 254, 1, 1, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (934, 1, 100.00, 254, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (935, 1, 100.00, 254, 11, 11, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (936, 1, 100.00, 254, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (937, 1, 100.00, 254, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (938, 1, 100.00, 254, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (939, 1, 100.00, 254, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (940, 1, 100.00, 254, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (941, 1, 100.00, 255, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (942, 1, 100.00, 255, 21, 21, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (943, 1, 100.00, 255, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (944, 1, 100.00, 255, 1, 1, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (945, 1, 100.00, 255, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (946, 1, 100.00, 255, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (947, 1, 100.00, 255, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (948, 1, 100.00, 255, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (949, 1, 100.00, 255, 14, 14, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (950, 1, 100.00, 255, 13, 13, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (951, 1, 100.00, 256, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (952, 1, 100.00, 256, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (953, 1, 100.00, 256, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (954, 1, 100.00, 256, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (955, 1, 100.00, 256, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (956, 1, 100.00, 256, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (957, 1, 100.00, 256, 18, 18, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (958, 1, 100.00, 256, 32, 32, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (959, 1, 100.00, 256, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (960, 1, 100.00, 256, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (961, 1, 100.00, 257, 4, 4, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (962, 1, 100.00, 257, 12, 12, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (963, 1, 100.00, 257, 25, 25, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (964, 1, 100.00, 257, 0, 0, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (965, 1, 100.00, 257, 29, 29, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (966, 1, 100.00, 257, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (967, 1, 100.00, 257, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (968, 1, 100.00, 257, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (969, 1, 100.00, 257, 2, 2, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (970, 1, 100.00, 257, 20, 20, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (971, 1, 100.00, 258, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (972, 1, 100.00, 258, 6, 6, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (973, 1, 100.00, 258, 29, 29, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (974, 1, 100.00, 258, 26, 26, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (975, 1, 100.00, 258, 15, 15, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (976, 1, 100.00, 258, 31, 31, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (977, 1, 100.00, 258, 17, 17, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (978, 1, 100.00, 258, 23, 23, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (979, 1, 100.00, 258, 27, 27, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (980, 1, 100.00, 258, 24, 24, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (981, 1, 100.00, 300, 30, 30, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (982, 1, 100.00, 300, 5, 5, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (983, 1, 100.00, 300, 10, 10, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (984, 1, 100.00, 300, 9, 9, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (985, 1, 100.00, 300, 23, 23, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (986, 1, 100.00, 300, 8, 8, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (987, 1, 100.00, 300, 22, 22, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (988, 1, 100.00, 300, 16, 16, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (989, 1, 100.00, 300, 19, 19, '2024-09-15 22:06:05', '2024-09-15 22:06:05');
INSERT INTO `order_items` VALUES (990, 1, 100.00, 300, 3, 3, '2024-09-15 22:06:05', '2024-09-15 22:06:05');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `date_create` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_create` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orders_order_number_unique`(`order_number` ASC) USING BTREE,
  INDEX `orders_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 301 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '1726413909', 'user1', '012345678', 'VN', 1, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (6, '1726413910', 'user6', '012345678', 'VN', 6, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (8, '1726413911', 'user8', '012345678', 'VN', 8, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (10, '1726413912', 'user10', '012345678', 'VN', 10, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (12, '1726413913', 'user12', '012345678', 'VN', 12, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (16, '1726413914', 'user16', '012345678', 'VN', 16, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (24, '1726413915', 'user24', '012345678', 'VN', 24, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (25, '1726413916', 'user25', '012345678', 'VN', 25, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (26, '1726413917', 'user26', '012345678', 'VN', 26, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (27, '1726413918', 'user27', '012345678', 'VN', 27, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (28, '1726413919', 'user28', '012345678', 'VN', 28, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (29, '1726413920', 'user29', '012345678', 'VN', 29, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (30, '1726413921', 'user30', '012345678', 'VN', 30, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (32, '1726413922', 'user32', '012345678', 'VN', 32, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (33, '1726413923', 'user33', '012345678', 'VN', 33, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (35, '1726413924', 'user35', '012345678', 'VN', 35, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (36, '1726413925', 'user36', '012345678', 'VN', 36, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (37, '1726413926', 'user37', '012345678', 'VN', 37, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (38, '1726413927', 'user38', '012345678', 'VN', 38, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (52, '1726413928', 'user52', '012345678', 'VN', 52, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (53, '1726413929', 'user53', '012345678', 'VN', 53, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (56, '1726413930', 'user56', '012345678', 'VN', 56, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (60, '1726413931', 'user60', '012345678', 'VN', 60, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (74, '1726413932', 'user74', '012345678', 'VN', 74, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (79, '1726413933', 'user79', '012345678', 'VN', 79, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (80, '1726413934', 'user80', '012345678', 'VN', 80, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (84, '1726413935', 'user84', '012345678', 'VN', 84, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (85, '1726413936', 'user85', '012345678', 'VN', 85, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (91, '1726413937', 'user91', '012345678', 'VN', 91, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (95, '1726413938', 'user95', '012345678', 'VN', 95, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (98, '1726413939', 'user98', '012345678', 'VN', 98, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (99, '1726413940', 'user99', '012345678', 'VN', 99, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (100, '1726413941', 'user100', '012345678', 'VN', 100, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (104, '1726413942', 'user104', '012345678', 'VN', 104, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (105, '1726413943', 'user105', '012345678', 'VN', 105, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (106, '1726413944', 'user106', '012345678', 'VN', 106, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (110, '1726413945', 'user110', '012345678', 'VN', 110, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (111, '1726413946', 'user111', '012345678', 'VN', 111, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (112, '1726413947', 'user112', '012345678', 'VN', 112, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (113, '1726413948', 'user113', '012345678', 'VN', 113, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (114, '1726413949', 'user114', '012345678', 'VN', 114, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (115, '1726413950', 'user115', '012345678', 'VN', 115, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (116, '1726413951', 'user116', '012345678', 'VN', 116, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (119, '1726413952', 'user119', '012345678', 'VN', 119, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (120, '1726413953', 'user120', '012345678', 'VN', 120, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (123, '1726413954', 'user123', '012345678', 'VN', 123, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (124, '1726413955', 'user124', '012345678', 'VN', 124, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (126, '1726413956', 'user126', '012345678', 'VN', 126, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (128, '1726413957', 'user128', '012345678', 'VN', 128, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (129, '1726413958', 'user129', '012345678', 'VN', 129, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (137, '1726413959', 'user137', '012345678', 'VN', 137, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (140, '1726413960', 'user140', '012345678', 'VN', 140, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (142, '1726413961', 'user142', '012345678', 'VN', 142, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (143, '1726413962', 'user143', '012345678', 'VN', 143, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (144, '1726413963', 'user144', '012345678', 'VN', 144, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (145, '1726413964', 'user145', '012345678', 'VN', 145, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (148, '1726413965', 'user148', '012345678', 'VN', 148, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (152, '1726413966', 'user152', '012345678', 'VN', 152, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (154, '1726413967', 'user154', '012345678', 'VN', 154, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (156, '1726413968', 'user156', '012345678', 'VN', 156, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (160, '1726413969', 'user160', '012345678', 'VN', 160, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (162, '1726413970', 'user162', '012345678', 'VN', 162, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (164, '1726413971', 'user164', '012345678', 'VN', 164, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (169, '1726413972', 'user169', '012345678', 'VN', 169, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (178, '1726413973', 'user178', '012345678', 'VN', 178, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (183, '1726413974', 'user183', '012345678', 'VN', 183, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (194, '1726413975', 'user194', '012345678', 'VN', 194, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (200, '1726413976', 'user200', '012345678', 'VN', 200, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (203, '1726413977', 'user203', '012345678', 'VN', 203, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (204, '1726413978', 'user204', '012345678', 'VN', 204, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (208, '1726413979', 'user208', '012345678', 'VN', 208, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (211, '1726413980', 'user211', '012345678', 'VN', 211, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (215, '1726413981', 'user215', '012345678', 'VN', 215, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (226, '1726413982', 'user226', '012345678', 'VN', 226, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (227, '1726413983', 'user227', '012345678', 'VN', 227, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (230, '1726413984', 'user230', '012345678', 'VN', 230, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (231, '1726413985', 'user231', '012345678', 'VN', 231, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (232, '1726413986', 'user232', '012345678', 'VN', 232, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (233, '1726413987', 'user233', '012345678', 'VN', 233, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (234, '1726413988', 'user234', '012345678', 'VN', 234, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (235, '1726413989', 'user235', '012345678', 'VN', 235, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (236, '1726413990', 'user236', '012345678', 'VN', 236, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (237, '1726413991', 'user237', '012345678', 'VN', 237, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (238, '1726413992', 'user238', '012345678', 'VN', 238, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (240, '1726413993', 'user240', '012345678', 'VN', 240, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (242, '1726413994', 'user242', '012345678', 'VN', 242, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (243, '1726413995', 'user243', '012345678', 'VN', 243, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (244, '1726413996', 'user244', '012345678', 'VN', 244, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (245, '1726413997', 'user245', '012345678', 'VN', 245, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (246, '1726413998', 'user246', '012345678', 'VN', 246, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (251, '1726413999', 'user251', '012345678', 'VN', 251, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (252, '1726414000', 'user252', '012345678', 'VN', 252, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (253, '1726414001', 'user253', '012345678', 'VN', 253, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (254, '1726414002', 'user254', '012345678', 'VN', 254, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (255, '1726414003', 'user255', '012345678', 'VN', 255, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (256, '1726414004', 'user256', '012345678', 'VN', 256, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (257, '1726414005', 'user257', '012345678', 'VN', 257, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (258, '1726414006', 'user258', '012345678', 'VN', 258, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');
INSERT INTO `orders` VALUES (300, '1726413908', 'user300', '012345678', 'VN', 300, '2024-09-15', '22:04:21', '2024-09-15 22:04:21', NULL, 'pending');

-- ----------------------------
-- Table structure for product_variations
-- ----------------------------
DROP TABLE IF EXISTS `product_variations`;
CREATE TABLE `product_variations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `image_url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `color_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `price_sale` decimal(10, 2) NOT NULL,
  `quantity` int NOT NULL,
  `position` int NOT NULL DEFAULT 1,
  `show_hide` tinyint(1) NOT NULL DEFAULT 1,
  `quantity_available` int NOT NULL,
  `quantity_sold` int NOT NULL DEFAULT 0,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `product_id` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_variations_product_id_foreign`(`product_id` ASC) USING BTREE,
  CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_variations
-- ----------------------------
INSERT INTO `product_variations` VALUES (1, 'https://res.cloudinary.com/du06b9aap/image/upload/products/10t.png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (2, 'https://res.cloudinary.com/du06b9aap/image/upload/products/12-pro.png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 1, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (3, 'https://res.cloudinary.com/du06b9aap/image/upload/products/find-x5-pro.png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 2, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (4, 'https://res.cloudinary.com/du06b9aap/image/upload/products/galaxy-a13.jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 3, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (5, 'https://res.cloudinary.com/du06b9aap/image/upload/products/galaxy-a32.jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 4, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (6, 'https://res.cloudinary.com/du06b9aap/image/upload/products/galaxy-a53.jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 5, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (7, 'https://res.cloudinary.com/du06b9aap/image/upload/products/galaxy-s22-plus.jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 6, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (8, 'https://res.cloudinary.com/du06b9aap/image/upload/products/galaxy-s22-ultra.png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 7, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (9, 'https://res.cloudinary.com/du06b9aap/image/upload/products/galaxy-s22.jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 8, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (10, 'https://res.cloudinary.com/du06b9aap/image/upload/products/galaxy-z-flip-3.jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 9, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (11, 'https://res.cloudinary.com/du06b9aap/image/upload/products/galaxy-z-fold-3.jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 10, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (12, 'https://res.cloudinary.com/du06b9aap/image/upload/products/iphone-13-mini.jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 11, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (13, 'https://res.cloudinary.com/du06b9aap/image/upload/products/iphone-13-pro-max.png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 12, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (14, 'https://res.cloudinary.com/du06b9aap/image/upload/products/iphone-13-pro.png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 13, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (15, 'https://res.cloudinary.com/du06b9aap/image/upload/products/iphone-13.png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 14, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (16, 'https://res.cloudinary.com/du06b9aap/image/upload/products/iphone-se-(2022).jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 15, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (17, 'https://res.cloudinary.com/du06b9aap/image/upload/products/moto-g-play-(2021).png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 16, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (18, 'https://res.cloudinary.com/du06b9aap/image/upload/products/moto-g-power-(2022).jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 17, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (19, 'https://res.cloudinary.com/du06b9aap/image/upload/products/moto-g-pure.jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 18, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (20, 'https://res.cloudinary.com/du06b9aap/image/upload/products/moto-g-stylus-(2022).png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 19, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (21, 'https://res.cloudinary.com/du06b9aap/image/upload/products/nord-2t.png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 20, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (22, 'https://res.cloudinary.com/du06b9aap/image/upload/products/nord-n20.png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 21, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (23, 'https://res.cloudinary.com/du06b9aap/image/upload/products/pixel-6-pro.jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 22, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (24, 'https://res.cloudinary.com/du06b9aap/image/upload/products/pixel-6.jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 23, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (25, 'https://res.cloudinary.com/du06b9aap/image/upload/products/pixel-6a.jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 24, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (26, 'https://res.cloudinary.com/du06b9aap/image/upload/products/poco-f4.png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 25, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (27, 'https://res.cloudinary.com/du06b9aap/image/upload/products/redmi-note-11.png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 26, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (28, 'https://res.cloudinary.com/du06b9aap/image/upload/products/10-pro.png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 27, '2024-08-01 20:13:43', '2024-09-28 20:13:50');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_hide` tinyint(1) NOT NULL DEFAULT 1,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `categories_product_id` int UNSIGNED NOT NULL,
  `brand_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `products_name_unique`(`name` ASC) USING BTREE,
  UNIQUE INDEX `products_seo_keywords_unique`(`seo_keywords` ASC) USING BTREE,
  INDEX `products_categories_product_id_foreign`(`categories_product_id` ASC) USING BTREE,
  INDEX `products_brand_id_foreign`(`brand_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (0, 'iPhone SE (2022)', 'iPhone SE (2022)', 'iPhone SE (2022)', 'Phone', 'iPhone SE (2022) is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (1, 'iPhone 13 Mini', 'iPhone 13 Mini', 'iPhone 13 Mini', 'Phone', 'iPhone 13 Mini is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (2, 'iPhone 13', 'iPhone 13', 'iPhone 13', 'Phone', 'iPhone 13 is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (3, 'iPhone 13 Pro', 'iPhone 13 Pro', 'iPhone 13 Pro', 'Phone', 'iPhone 13 Pro is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (4, 'iPhone 13 Pro Max', 'iPhone 13 Pro Max', 'iPhone 13 Pro Max', 'Phone', 'iPhone 13 Pro Max is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (5, 'iPhone XR', 'iPhone XR', 'iPhone XR', 'Phone', 'iPhone XR is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (6, 'Zenfone 8', 'Zenfone 8', 'Zenfone 8', 'Phone', 'Zenfone 8 is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (7, 'Galaxy A13', 'Galaxy A13', 'Galaxy A13', 'Phone', 'Galaxy A13 is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (8, 'Galaxy A32', 'Galaxy A32', 'Galaxy A32', 'Phone', 'Galaxy A32 is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (9, 'Galaxy A53', 'Galaxy A53', 'Galaxy A53', 'Phone', 'Galaxy A53 is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (10, 'Galaxy S22', 'Galaxy S22', 'Galaxy S22', 'Phone', 'Galaxy S22 is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (11, 'Galaxy S22 Plus', 'Galaxy S22 Plus', 'Galaxy S22 Plus', 'Phone', 'Galaxy S22 Plus is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (12, 'Galaxy S22 Ultra', 'Galaxy S22 Ultra', 'Galaxy S22 Ultra', 'Phone', 'Galaxy S22 Ultra is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (13, 'Galaxy Z Flip 3', 'Galaxy Z Flip 3', 'Galaxy Z Flip 3', 'Phone', 'Galaxy Z Flip 3 is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (14, 'Galaxy Z Fold 3', 'Galaxy Z Fold 3', 'Galaxy Z Fold 3', 'Phone', 'Galaxy Z Fold 3 is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (15, 'Pixel 6', 'Pixel 6', 'Pixel 6', 'Phone', 'Pixel 6 is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (16, 'Pixel 6a', 'Pixel 6a', 'Pixel 6a', 'Phone', 'Pixel 6a is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (17, 'Pixel 6 Pro', 'Pixel 6 Pro', 'Pixel 6 Pro', 'Phone', 'Pixel 6 Pro is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (18, 'Nord N20', 'Nord N20', 'Nord N20', 'Phone', 'Nord N20 is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (19, 'Nord 2T', 'Nord 2T', 'Nord 2T', 'Phone', 'Nord 2T is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (20, '10 Pro', '10 Pro', '10 Pro', 'Phone', '10 Pro is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (21, '10T', '10T', '10T', 'Phone', '10T is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (22, 'Find X5 Pro', 'Find X5 Pro', 'Find X5 Pro', 'Phone', 'Find X5 Pro is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (23, 'X80 Pro', 'X80 Pro', 'X80 Pro', 'Phone', 'X80 Pro is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (24, 'Redmi Note 11', 'Redmi Note 11', 'Redmi Note 11', 'Phone', 'Redmi Note 11 is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (25, '11T Pro', '11T Pro', '11T Pro', 'Phone', '11T Pro is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (26, '12 Pro', '12 Pro', '12 Pro', 'Phone', '12 Pro is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (27, 'Poco F4', 'Poco F4', 'Poco F4', 'Phone', 'Poco F4 is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (28, 'Xperia Pro', 'Xperia Pro', 'Xperia Pro', 'Phone', 'Xperia Pro is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (29, 'Moto G Stylus (2022)', 'Moto G Stylus (2022)', 'Moto G Stylus (2022)', 'Phone', 'Moto G Stylus (2022) is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (30, 'Moto G Play (2021)', 'Moto G Play (2021)', 'Moto G Play (2021)', 'Phone', 'Moto G Play (2021) is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (31, 'Moto G Pure', 'Moto G Pure', 'Moto G Pure', 'Phone', 'Moto G Pure is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');
INSERT INTO `products` VALUES (32, 'Moto G Power (2022)', 'Moto G Power (2022)', 'Moto G Power (2022)', 'Phone', 'Moto G Power (2022) is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 00:00:00', '2024-09-09 00:00:00');

-- ----------------------------
-- Table structure for ratings
-- ----------------------------
DROP TABLE IF EXISTS `ratings`;
CREATE TABLE `ratings`  (
  `user_id` int NULL DEFAULT NULL,
  `cellphone_id` int NULL DEFAULT NULL,
  `rating` int NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ratings
-- ----------------------------
INSERT INTO `ratings` VALUES (1, 7, 8, NULL);
INSERT INTO `ratings` VALUES (1, 31, 7, NULL);
INSERT INTO `ratings` VALUES (1, 18, 5, NULL);
INSERT INTO `ratings` VALUES (1, 3, 10, NULL);
INSERT INTO `ratings` VALUES (1, 32, 6, NULL);
INSERT INTO `ratings` VALUES (1, 28, 8, NULL);
INSERT INTO `ratings` VALUES (1, 16, 7, NULL);
INSERT INTO `ratings` VALUES (1, 15, 8, NULL);
INSERT INTO `ratings` VALUES (1, 4, 7, NULL);
INSERT INTO `ratings` VALUES (1, 8, 8, NULL);
INSERT INTO `ratings` VALUES (6, 13, 5, NULL);
INSERT INTO `ratings` VALUES (6, 31, 6, NULL);
INSERT INTO `ratings` VALUES (6, 23, 8, NULL);
INSERT INTO `ratings` VALUES (6, 1, 2, NULL);
INSERT INTO `ratings` VALUES (6, 8, 7, NULL);
INSERT INTO `ratings` VALUES (6, 19, 1, NULL);
INSERT INTO `ratings` VALUES (6, 32, 10, NULL);
INSERT INTO `ratings` VALUES (6, 7, 9, NULL);
INSERT INTO `ratings` VALUES (6, 27, 4, NULL);
INSERT INTO `ratings` VALUES (6, 16, 3, NULL);
INSERT INTO `ratings` VALUES (8, 29, 6, NULL);
INSERT INTO `ratings` VALUES (8, 22, 9, NULL);
INSERT INTO `ratings` VALUES (8, 32, 9, NULL);
INSERT INTO `ratings` VALUES (8, 25, 8, NULL);
INSERT INTO `ratings` VALUES (8, 20, 7, NULL);
INSERT INTO `ratings` VALUES (8, 0, 5, NULL);
INSERT INTO `ratings` VALUES (8, 11, 6, NULL);
INSERT INTO `ratings` VALUES (8, 17, 8, NULL);
INSERT INTO `ratings` VALUES (8, 21, 5, NULL);
INSERT INTO `ratings` VALUES (8, 27, 8, NULL);
INSERT INTO `ratings` VALUES (10, 23, 9, NULL);
INSERT INTO `ratings` VALUES (10, 5, 3, NULL);
INSERT INTO `ratings` VALUES (10, 6, 7, NULL);
INSERT INTO `ratings` VALUES (10, 4, 9, NULL);
INSERT INTO `ratings` VALUES (10, 14, 10, NULL);
INSERT INTO `ratings` VALUES (10, 3, 9, NULL);
INSERT INTO `ratings` VALUES (10, 12, 8, NULL);
INSERT INTO `ratings` VALUES (10, 16, 8, NULL);
INSERT INTO `ratings` VALUES (10, 27, 8, NULL);
INSERT INTO `ratings` VALUES (10, 11, 8, NULL);
INSERT INTO `ratings` VALUES (12, 24, 4, NULL);
INSERT INTO `ratings` VALUES (12, 10, 9, NULL);
INSERT INTO `ratings` VALUES (12, 16, 7, NULL);
INSERT INTO `ratings` VALUES (12, 13, 6, NULL);
INSERT INTO `ratings` VALUES (12, 6, 6, NULL);
INSERT INTO `ratings` VALUES (12, 32, 5, NULL);
INSERT INTO `ratings` VALUES (12, 27, 4, NULL);
INSERT INTO `ratings` VALUES (12, 20, 7, NULL);
INSERT INTO `ratings` VALUES (12, 31, 3, NULL);
INSERT INTO `ratings` VALUES (12, 23, 6, NULL);
INSERT INTO `ratings` VALUES (16, 15, 10, NULL);
INSERT INTO `ratings` VALUES (16, 24, 3, NULL);
INSERT INTO `ratings` VALUES (16, 0, 1, NULL);
INSERT INTO `ratings` VALUES (16, 30, 2, NULL);
INSERT INTO `ratings` VALUES (16, 27, 4, NULL);
INSERT INTO `ratings` VALUES (16, 11, 8, NULL);
INSERT INTO `ratings` VALUES (16, 26, 5, NULL);
INSERT INTO `ratings` VALUES (16, 13, 7, NULL);
INSERT INTO `ratings` VALUES (16, 9, 6, NULL);
INSERT INTO `ratings` VALUES (16, 6, 2, NULL);
INSERT INTO `ratings` VALUES (24, 20, 9, NULL);
INSERT INTO `ratings` VALUES (24, 28, 8, NULL);
INSERT INTO `ratings` VALUES (24, 3, 10, NULL);
INSERT INTO `ratings` VALUES (24, 21, 8, NULL);
INSERT INTO `ratings` VALUES (24, 22, 7, NULL);
INSERT INTO `ratings` VALUES (24, 6, 7, NULL);
INSERT INTO `ratings` VALUES (24, 18, 8, NULL);
INSERT INTO `ratings` VALUES (24, 10, 9, NULL);
INSERT INTO `ratings` VALUES (24, 23, 7, NULL);
INSERT INTO `ratings` VALUES (24, 15, 10, NULL);
INSERT INTO `ratings` VALUES (25, 2, 9, NULL);
INSERT INTO `ratings` VALUES (25, 5, 6, NULL);
INSERT INTO `ratings` VALUES (25, 14, 2, NULL);
INSERT INTO `ratings` VALUES (25, 30, 5, NULL);
INSERT INTO `ratings` VALUES (25, 12, 3, NULL);
INSERT INTO `ratings` VALUES (25, 32, 9, NULL);
INSERT INTO `ratings` VALUES (25, 8, 10, NULL);
INSERT INTO `ratings` VALUES (25, 13, 1, NULL);
INSERT INTO `ratings` VALUES (25, 16, 9, NULL);
INSERT INTO `ratings` VALUES (25, 20, 5, NULL);
INSERT INTO `ratings` VALUES (26, 20, 6, NULL);
INSERT INTO `ratings` VALUES (26, 32, 9, NULL);
INSERT INTO `ratings` VALUES (26, 3, 10, NULL);
INSERT INTO `ratings` VALUES (26, 15, 7, NULL);
INSERT INTO `ratings` VALUES (26, 23, 6, NULL);
INSERT INTO `ratings` VALUES (26, 25, 9, NULL);
INSERT INTO `ratings` VALUES (26, 22, 10, NULL);
INSERT INTO `ratings` VALUES (26, 12, 8, NULL);
INSERT INTO `ratings` VALUES (26, 18, 5, NULL);
INSERT INTO `ratings` VALUES (26, 4, 9, NULL);
INSERT INTO `ratings` VALUES (27, 11, 8, NULL);
INSERT INTO `ratings` VALUES (27, 8, 8, NULL);
INSERT INTO `ratings` VALUES (27, 19, 6, NULL);
INSERT INTO `ratings` VALUES (27, 24, 7, NULL);
INSERT INTO `ratings` VALUES (27, 27, 7, NULL);
INSERT INTO `ratings` VALUES (27, 18, 6, NULL);
INSERT INTO `ratings` VALUES (27, 6, 8, NULL);
INSERT INTO `ratings` VALUES (27, 21, 9, NULL);
INSERT INTO `ratings` VALUES (27, 32, 8, NULL);
INSERT INTO `ratings` VALUES (27, 4, 10, NULL);
INSERT INTO `ratings` VALUES (28, 28, 1, NULL);
INSERT INTO `ratings` VALUES (28, 31, 1, NULL);
INSERT INTO `ratings` VALUES (28, 5, 10, NULL);
INSERT INTO `ratings` VALUES (28, 8, 1, NULL);
INSERT INTO `ratings` VALUES (28, 14, 1, NULL);
INSERT INTO `ratings` VALUES (28, 17, 1, NULL);
INSERT INTO `ratings` VALUES (28, 22, 1, NULL);
INSERT INTO `ratings` VALUES (28, 29, 1, NULL);
INSERT INTO `ratings` VALUES (28, 3, 10, NULL);
INSERT INTO `ratings` VALUES (28, 25, 1, NULL);
INSERT INTO `ratings` VALUES (29, 14, 5, NULL);
INSERT INTO `ratings` VALUES (29, 8, 7, NULL);
INSERT INTO `ratings` VALUES (29, 19, 5, NULL);
INSERT INTO `ratings` VALUES (29, 10, 9, NULL);
INSERT INTO `ratings` VALUES (29, 7, 6, NULL);
INSERT INTO `ratings` VALUES (29, 24, 8, NULL);
INSERT INTO `ratings` VALUES (29, 2, 6, NULL);
INSERT INTO `ratings` VALUES (29, 16, 7, NULL);
INSERT INTO `ratings` VALUES (29, 26, 5, NULL);
INSERT INTO `ratings` VALUES (29, 5, 4, NULL);
INSERT INTO `ratings` VALUES (30, 17, 8, NULL);
INSERT INTO `ratings` VALUES (30, 14, 6, NULL);
INSERT INTO `ratings` VALUES (30, 19, 7, NULL);
INSERT INTO `ratings` VALUES (30, 15, 6, NULL);
INSERT INTO `ratings` VALUES (30, 26, 9, NULL);
INSERT INTO `ratings` VALUES (30, 9, 4, NULL);
INSERT INTO `ratings` VALUES (30, 0, 4, NULL);
INSERT INTO `ratings` VALUES (30, 16, 8, NULL);
INSERT INTO `ratings` VALUES (30, 4, 7, NULL);
INSERT INTO `ratings` VALUES (30, 2, 5, NULL);
INSERT INTO `ratings` VALUES (32, 12, 1, NULL);
INSERT INTO `ratings` VALUES (32, 2, 9, NULL);
INSERT INTO `ratings` VALUES (32, 13, 1, NULL);
INSERT INTO `ratings` VALUES (32, 26, 9, NULL);
INSERT INTO `ratings` VALUES (32, 11, 1, NULL);
INSERT INTO `ratings` VALUES (32, 31, 3, NULL);
INSERT INTO `ratings` VALUES (32, 20, 2, NULL);
INSERT INTO `ratings` VALUES (32, 30, 1, NULL);
INSERT INTO `ratings` VALUES (32, 6, 2, NULL);
INSERT INTO `ratings` VALUES (32, 10, 8, NULL);
INSERT INTO `ratings` VALUES (33, 30, 10, NULL);
INSERT INTO `ratings` VALUES (33, 29, 9, NULL);
INSERT INTO `ratings` VALUES (33, 13, 8, NULL);
INSERT INTO `ratings` VALUES (33, 6, 8, NULL);
INSERT INTO `ratings` VALUES (33, 2, 10, NULL);
INSERT INTO `ratings` VALUES (33, 19, 10, NULL);
INSERT INTO `ratings` VALUES (33, 9, 10, NULL);
INSERT INTO `ratings` VALUES (33, 10, 10, NULL);
INSERT INTO `ratings` VALUES (33, 25, 10, NULL);
INSERT INTO `ratings` VALUES (33, 32, 8, NULL);
INSERT INTO `ratings` VALUES (35, 19, 7, NULL);
INSERT INTO `ratings` VALUES (35, 12, 2, NULL);
INSERT INTO `ratings` VALUES (35, 26, 2, NULL);
INSERT INTO `ratings` VALUES (35, 17, 3, NULL);
INSERT INTO `ratings` VALUES (35, 23, 2, NULL);
INSERT INTO `ratings` VALUES (35, 0, 6, NULL);
INSERT INTO `ratings` VALUES (35, 18, 9, NULL);
INSERT INTO `ratings` VALUES (35, 27, 7, NULL);
INSERT INTO `ratings` VALUES (35, 6, 5, NULL);
INSERT INTO `ratings` VALUES (35, 4, 1, NULL);
INSERT INTO `ratings` VALUES (36, 2, 10, NULL);
INSERT INTO `ratings` VALUES (36, 26, 1, NULL);
INSERT INTO `ratings` VALUES (36, 6, 1, NULL);
INSERT INTO `ratings` VALUES (36, 1, 6, NULL);
INSERT INTO `ratings` VALUES (36, 5, 6, NULL);
INSERT INTO `ratings` VALUES (36, 10, 4, NULL);
INSERT INTO `ratings` VALUES (36, 22, 4, NULL);
INSERT INTO `ratings` VALUES (36, 14, 1, NULL);
INSERT INTO `ratings` VALUES (36, 9, 4, NULL);
INSERT INTO `ratings` VALUES (36, 17, 2, NULL);
INSERT INTO `ratings` VALUES (37, 24, 6, NULL);
INSERT INTO `ratings` VALUES (37, 32, 5, NULL);
INSERT INTO `ratings` VALUES (37, 28, 10, NULL);
INSERT INTO `ratings` VALUES (37, 7, 1, NULL);
INSERT INTO `ratings` VALUES (37, 18, 5, NULL);
INSERT INTO `ratings` VALUES (37, 31, 2, NULL);
INSERT INTO `ratings` VALUES (37, 23, 9, NULL);
INSERT INTO `ratings` VALUES (37, 30, 1, NULL);
INSERT INTO `ratings` VALUES (37, 13, 5, NULL);
INSERT INTO `ratings` VALUES (37, 15, 5, NULL);
INSERT INTO `ratings` VALUES (38, 1, 7, NULL);
INSERT INTO `ratings` VALUES (38, 30, 4, NULL);
INSERT INTO `ratings` VALUES (38, 5, 8, NULL);
INSERT INTO `ratings` VALUES (38, 24, 7, NULL);
INSERT INTO `ratings` VALUES (38, 10, 7, NULL);
INSERT INTO `ratings` VALUES (38, 15, 2, NULL);
INSERT INTO `ratings` VALUES (38, 2, 8, NULL);
INSERT INTO `ratings` VALUES (38, 11, 7, NULL);
INSERT INTO `ratings` VALUES (38, 6, 5, NULL);
INSERT INTO `ratings` VALUES (38, 25, 6, NULL);
INSERT INTO `ratings` VALUES (52, 20, 10, NULL);
INSERT INTO `ratings` VALUES (52, 0, 5, NULL);
INSERT INTO `ratings` VALUES (52, 13, 4, NULL);
INSERT INTO `ratings` VALUES (52, 27, 6, NULL);
INSERT INTO `ratings` VALUES (52, 26, 8, NULL);
INSERT INTO `ratings` VALUES (52, 8, 1, NULL);
INSERT INTO `ratings` VALUES (52, 5, 2, NULL);
INSERT INTO `ratings` VALUES (52, 3, 2, NULL);
INSERT INTO `ratings` VALUES (52, 24, 5, NULL);
INSERT INTO `ratings` VALUES (52, 15, 5, NULL);
INSERT INTO `ratings` VALUES (53, 32, 9, NULL);
INSERT INTO `ratings` VALUES (53, 5, 8, NULL);
INSERT INTO `ratings` VALUES (53, 15, 10, NULL);
INSERT INTO `ratings` VALUES (53, 4, 9, NULL);
INSERT INTO `ratings` VALUES (53, 26, 9, NULL);
INSERT INTO `ratings` VALUES (53, 9, 8, NULL);
INSERT INTO `ratings` VALUES (53, 7, 8, NULL);
INSERT INTO `ratings` VALUES (53, 29, 8, NULL);
INSERT INTO `ratings` VALUES (53, 25, 9, NULL);
INSERT INTO `ratings` VALUES (53, 17, 8, NULL);
INSERT INTO `ratings` VALUES (56, 15, 5, NULL);
INSERT INTO `ratings` VALUES (56, 32, 3, NULL);
INSERT INTO `ratings` VALUES (56, 30, 2, NULL);
INSERT INTO `ratings` VALUES (56, 5, 9, NULL);
INSERT INTO `ratings` VALUES (56, 25, 3, NULL);
INSERT INTO `ratings` VALUES (56, 1, 9, NULL);
INSERT INTO `ratings` VALUES (56, 12, 5, NULL);
INSERT INTO `ratings` VALUES (56, 8, 10, NULL);
INSERT INTO `ratings` VALUES (56, 17, 6, NULL);
INSERT INTO `ratings` VALUES (56, 13, 9, NULL);
INSERT INTO `ratings` VALUES (60, 16, 6, NULL);
INSERT INTO `ratings` VALUES (60, 11, 3, NULL);
INSERT INTO `ratings` VALUES (60, 32, 8, NULL);
INSERT INTO `ratings` VALUES (60, 9, 5, NULL);
INSERT INTO `ratings` VALUES (60, 28, 1, NULL);
INSERT INTO `ratings` VALUES (60, 26, 9, NULL);
INSERT INTO `ratings` VALUES (60, 15, 4, NULL);
INSERT INTO `ratings` VALUES (60, 31, 10, NULL);
INSERT INTO `ratings` VALUES (60, 13, 2, NULL);
INSERT INTO `ratings` VALUES (60, 29, 7, NULL);
INSERT INTO `ratings` VALUES (74, 26, 8, NULL);
INSERT INTO `ratings` VALUES (74, 25, 7, NULL);
INSERT INTO `ratings` VALUES (74, 17, 7, NULL);
INSERT INTO `ratings` VALUES (74, 11, 8, NULL);
INSERT INTO `ratings` VALUES (74, 21, 7, NULL);
INSERT INTO `ratings` VALUES (74, 8, 6, NULL);
INSERT INTO `ratings` VALUES (74, 30, 6, NULL);
INSERT INTO `ratings` VALUES (74, 28, 7, NULL);
INSERT INTO `ratings` VALUES (74, 32, 7, NULL);
INSERT INTO `ratings` VALUES (74, 16, 6, NULL);
INSERT INTO `ratings` VALUES (79, 16, 8, NULL);
INSERT INTO `ratings` VALUES (79, 11, 8, NULL);
INSERT INTO `ratings` VALUES (79, 19, 7, NULL);
INSERT INTO `ratings` VALUES (79, 10, 8, NULL);
INSERT INTO `ratings` VALUES (79, 3, 9, NULL);
INSERT INTO `ratings` VALUES (79, 23, 8, NULL);
INSERT INTO `ratings` VALUES (79, 32, 7, NULL);
INSERT INTO `ratings` VALUES (79, 31, 5, NULL);
INSERT INTO `ratings` VALUES (79, 14, 7, NULL);
INSERT INTO `ratings` VALUES (79, 5, 6, NULL);
INSERT INTO `ratings` VALUES (80, 7, 8, NULL);
INSERT INTO `ratings` VALUES (80, 19, 7, NULL);
INSERT INTO `ratings` VALUES (80, 30, 8, NULL);
INSERT INTO `ratings` VALUES (80, 9, 9, NULL);
INSERT INTO `ratings` VALUES (80, 28, 9, NULL);
INSERT INTO `ratings` VALUES (80, 31, 8, NULL);
INSERT INTO `ratings` VALUES (80, 22, 10, NULL);
INSERT INTO `ratings` VALUES (80, 5, 7, NULL);
INSERT INTO `ratings` VALUES (80, 8, 8, NULL);
INSERT INTO `ratings` VALUES (80, 2, 9, NULL);
INSERT INTO `ratings` VALUES (84, 25, 1, NULL);
INSERT INTO `ratings` VALUES (84, 2, 10, NULL);
INSERT INTO `ratings` VALUES (84, 31, 9, NULL);
INSERT INTO `ratings` VALUES (84, 28, 10, NULL);
INSERT INTO `ratings` VALUES (84, 21, 1, NULL);
INSERT INTO `ratings` VALUES (84, 7, 10, NULL);
INSERT INTO `ratings` VALUES (84, 30, 9, NULL);
INSERT INTO `ratings` VALUES (84, 14, 10, NULL);
INSERT INTO `ratings` VALUES (84, 17, 9, NULL);
INSERT INTO `ratings` VALUES (84, 26, 1, NULL);
INSERT INTO `ratings` VALUES (85, 18, 1, NULL);
INSERT INTO `ratings` VALUES (85, 30, 1, NULL);
INSERT INTO `ratings` VALUES (85, 25, 1, NULL);
INSERT INTO `ratings` VALUES (85, 1, 10, NULL);
INSERT INTO `ratings` VALUES (85, 15, 1, NULL);
INSERT INTO `ratings` VALUES (85, 2, 10, NULL);
INSERT INTO `ratings` VALUES (85, 4, 10, NULL);
INSERT INTO `ratings` VALUES (85, 14, 1, NULL);
INSERT INTO `ratings` VALUES (85, 17, 1, NULL);
INSERT INTO `ratings` VALUES (85, 21, 1, NULL);
INSERT INTO `ratings` VALUES (91, 31, 8, NULL);
INSERT INTO `ratings` VALUES (91, 16, 7, NULL);
INSERT INTO `ratings` VALUES (91, 1, 9, NULL);
INSERT INTO `ratings` VALUES (91, 2, 9, NULL);
INSERT INTO `ratings` VALUES (91, 15, 6, NULL);
INSERT INTO `ratings` VALUES (91, 22, 5, NULL);
INSERT INTO `ratings` VALUES (91, 19, 8, NULL);
INSERT INTO `ratings` VALUES (91, 21, 8, NULL);
INSERT INTO `ratings` VALUES (91, 12, 9, NULL);
INSERT INTO `ratings` VALUES (91, 11, 7, NULL);
INSERT INTO `ratings` VALUES (95, 17, 9, NULL);
INSERT INTO `ratings` VALUES (95, 22, 10, NULL);
INSERT INTO `ratings` VALUES (95, 30, 5, NULL);
INSERT INTO `ratings` VALUES (95, 25, 9, NULL);
INSERT INTO `ratings` VALUES (95, 29, 6, NULL);
INSERT INTO `ratings` VALUES (95, 27, 7, NULL);
INSERT INTO `ratings` VALUES (95, 6, 7, NULL);
INSERT INTO `ratings` VALUES (95, 32, 4, NULL);
INSERT INTO `ratings` VALUES (95, 15, 5, NULL);
INSERT INTO `ratings` VALUES (95, 5, 5, NULL);
INSERT INTO `ratings` VALUES (98, 0, 10, NULL);
INSERT INTO `ratings` VALUES (98, 2, 9, NULL);
INSERT INTO `ratings` VALUES (98, 12, 9, NULL);
INSERT INTO `ratings` VALUES (98, 20, 7, NULL);
INSERT INTO `ratings` VALUES (98, 24, 8, NULL);
INSERT INTO `ratings` VALUES (98, 8, 9, NULL);
INSERT INTO `ratings` VALUES (98, 9, 8, NULL);
INSERT INTO `ratings` VALUES (98, 32, 6, NULL);
INSERT INTO `ratings` VALUES (98, 10, 9, NULL);
INSERT INTO `ratings` VALUES (98, 7, 8, NULL);
INSERT INTO `ratings` VALUES (99, 17, 10, NULL);
INSERT INTO `ratings` VALUES (99, 26, 9, NULL);
INSERT INTO `ratings` VALUES (99, 13, 10, NULL);
INSERT INTO `ratings` VALUES (99, 22, 10, NULL);
INSERT INTO `ratings` VALUES (99, 21, 9, NULL);
INSERT INTO `ratings` VALUES (99, 4, 10, NULL);
INSERT INTO `ratings` VALUES (99, 8, 9, NULL);
INSERT INTO `ratings` VALUES (99, 3, 10, NULL);
INSERT INTO `ratings` VALUES (99, 25, 10, NULL);
INSERT INTO `ratings` VALUES (99, 30, 10, NULL);
INSERT INTO `ratings` VALUES (100, 20, 10, NULL);
INSERT INTO `ratings` VALUES (100, 27, 9, NULL);
INSERT INTO `ratings` VALUES (100, 24, 8, NULL);
INSERT INTO `ratings` VALUES (100, 30, 8, NULL);
INSERT INTO `ratings` VALUES (100, 29, 8, NULL);
INSERT INTO `ratings` VALUES (100, 8, 10, NULL);
INSERT INTO `ratings` VALUES (100, 26, 8, NULL);
INSERT INTO `ratings` VALUES (100, 7, 9, NULL);
INSERT INTO `ratings` VALUES (100, 13, 10, NULL);
INSERT INTO `ratings` VALUES (100, 10, 9, NULL);
INSERT INTO `ratings` VALUES (104, 30, 6, NULL);
INSERT INTO `ratings` VALUES (104, 24, 7, NULL);
INSERT INTO `ratings` VALUES (104, 13, 8, NULL);
INSERT INTO `ratings` VALUES (104, 12, 9, NULL);
INSERT INTO `ratings` VALUES (104, 15, 8, NULL);
INSERT INTO `ratings` VALUES (104, 11, 10, NULL);
INSERT INTO `ratings` VALUES (104, 28, 10, NULL);
INSERT INTO `ratings` VALUES (104, 31, 10, NULL);
INSERT INTO `ratings` VALUES (104, 27, 8, NULL);
INSERT INTO `ratings` VALUES (104, 16, 10, NULL);
INSERT INTO `ratings` VALUES (105, 17, 8, NULL);
INSERT INTO `ratings` VALUES (105, 18, 7, NULL);
INSERT INTO `ratings` VALUES (105, 4, 10, NULL);
INSERT INTO `ratings` VALUES (105, 19, 6, NULL);
INSERT INTO `ratings` VALUES (105, 9, 8, NULL);
INSERT INTO `ratings` VALUES (105, 12, 9, NULL);
INSERT INTO `ratings` VALUES (105, 14, 9, NULL);
INSERT INTO `ratings` VALUES (105, 22, 8, NULL);
INSERT INTO `ratings` VALUES (105, 7, 9, NULL);
INSERT INTO `ratings` VALUES (105, 20, 10, NULL);
INSERT INTO `ratings` VALUES (106, 24, 7, NULL);
INSERT INTO `ratings` VALUES (106, 20, 6, NULL);
INSERT INTO `ratings` VALUES (106, 15, 7, NULL);
INSERT INTO `ratings` VALUES (106, 14, 8, NULL);
INSERT INTO `ratings` VALUES (106, 4, 6, NULL);
INSERT INTO `ratings` VALUES (106, 26, 7, NULL);
INSERT INTO `ratings` VALUES (106, 18, 5, NULL);
INSERT INTO `ratings` VALUES (106, 5, 6, NULL);
INSERT INTO `ratings` VALUES (106, 12, 8, NULL);
INSERT INTO `ratings` VALUES (106, 16, 7, NULL);
INSERT INTO `ratings` VALUES (110, 8, 2, NULL);
INSERT INTO `ratings` VALUES (110, 12, 6, NULL);
INSERT INTO `ratings` VALUES (110, 27, 1, NULL);
INSERT INTO `ratings` VALUES (110, 31, 2, NULL);
INSERT INTO `ratings` VALUES (110, 24, 1, NULL);
INSERT INTO `ratings` VALUES (110, 5, 2, NULL);
INSERT INTO `ratings` VALUES (110, 3, 3, NULL);
INSERT INTO `ratings` VALUES (110, 29, 6, NULL);
INSERT INTO `ratings` VALUES (110, 9, 7, NULL);
INSERT INTO `ratings` VALUES (110, 14, 1, NULL);
INSERT INTO `ratings` VALUES (111, 8, 4, NULL);
INSERT INTO `ratings` VALUES (111, 4, 1, NULL);
INSERT INTO `ratings` VALUES (111, 7, 3, NULL);
INSERT INTO `ratings` VALUES (111, 20, 10, NULL);
INSERT INTO `ratings` VALUES (111, 25, 5, NULL);
INSERT INTO `ratings` VALUES (111, 30, 9, NULL);
INSERT INTO `ratings` VALUES (111, 5, 2, NULL);
INSERT INTO `ratings` VALUES (111, 23, 7, NULL);
INSERT INTO `ratings` VALUES (111, 18, 6, NULL);
INSERT INTO `ratings` VALUES (111, 26, 8, NULL);
INSERT INTO `ratings` VALUES (112, 17, 10, NULL);
INSERT INTO `ratings` VALUES (112, 23, 10, NULL);
INSERT INTO `ratings` VALUES (112, 13, 8, NULL);
INSERT INTO `ratings` VALUES (112, 27, 9, NULL);
INSERT INTO `ratings` VALUES (112, 11, 1, NULL);
INSERT INTO `ratings` VALUES (112, 31, 2, NULL);
INSERT INTO `ratings` VALUES (112, 6, 4, NULL);
INSERT INTO `ratings` VALUES (112, 29, 3, NULL);
INSERT INTO `ratings` VALUES (112, 14, 2, NULL);
INSERT INTO `ratings` VALUES (112, 3, 8, NULL);
INSERT INTO `ratings` VALUES (113, 14, 5, NULL);
INSERT INTO `ratings` VALUES (113, 1, 5, NULL);
INSERT INTO `ratings` VALUES (113, 29, 2, NULL);
INSERT INTO `ratings` VALUES (113, 27, 1, NULL);
INSERT INTO `ratings` VALUES (113, 3, 10, NULL);
INSERT INTO `ratings` VALUES (113, 26, 1, NULL);
INSERT INTO `ratings` VALUES (113, 7, 10, NULL);
INSERT INTO `ratings` VALUES (113, 21, 1, NULL);
INSERT INTO `ratings` VALUES (113, 15, 6, NULL);
INSERT INTO `ratings` VALUES (113, 4, 10, NULL);
INSERT INTO `ratings` VALUES (114, 3, 7, NULL);
INSERT INTO `ratings` VALUES (114, 22, 8, NULL);
INSERT INTO `ratings` VALUES (114, 28, 7, NULL);
INSERT INTO `ratings` VALUES (114, 24, 6, NULL);
INSERT INTO `ratings` VALUES (114, 8, 6, NULL);
INSERT INTO `ratings` VALUES (114, 29, 6, NULL);
INSERT INTO `ratings` VALUES (114, 4, 7, NULL);
INSERT INTO `ratings` VALUES (114, 25, 8, NULL);
INSERT INTO `ratings` VALUES (114, 12, 9, NULL);
INSERT INTO `ratings` VALUES (114, 26, 8, NULL);
INSERT INTO `ratings` VALUES (115, 7, 1, NULL);
INSERT INTO `ratings` VALUES (115, 25, 10, NULL);
INSERT INTO `ratings` VALUES (115, 3, 7, NULL);
INSERT INTO `ratings` VALUES (115, 6, 7, NULL);
INSERT INTO `ratings` VALUES (115, 11, 9, NULL);
INSERT INTO `ratings` VALUES (115, 2, 6, NULL);
INSERT INTO `ratings` VALUES (115, 13, 4, NULL);
INSERT INTO `ratings` VALUES (115, 19, 7, NULL);
INSERT INTO `ratings` VALUES (115, 30, 5, NULL);
INSERT INTO `ratings` VALUES (115, 26, 10, NULL);
INSERT INTO `ratings` VALUES (116, 19, 1, NULL);
INSERT INTO `ratings` VALUES (116, 4, 10, NULL);
INSERT INTO `ratings` VALUES (116, 20, 1, NULL);
INSERT INTO `ratings` VALUES (116, 10, 1, NULL);
INSERT INTO `ratings` VALUES (116, 12, 1, NULL);
INSERT INTO `ratings` VALUES (116, 13, 1, NULL);
INSERT INTO `ratings` VALUES (116, 3, 10, NULL);
INSERT INTO `ratings` VALUES (116, 16, 1, NULL);
INSERT INTO `ratings` VALUES (116, 31, 1, NULL);
INSERT INTO `ratings` VALUES (116, 27, 1, NULL);
INSERT INTO `ratings` VALUES (119, 25, 8, NULL);
INSERT INTO `ratings` VALUES (119, 3, 1, NULL);
INSERT INTO `ratings` VALUES (119, 16, 4, NULL);
INSERT INTO `ratings` VALUES (119, 7, 5, NULL);
INSERT INTO `ratings` VALUES (119, 23, 9, NULL);
INSERT INTO `ratings` VALUES (119, 10, 3, NULL);
INSERT INTO `ratings` VALUES (119, 11, 2, NULL);
INSERT INTO `ratings` VALUES (119, 28, 10, NULL);
INSERT INTO `ratings` VALUES (119, 19, 7, NULL);
INSERT INTO `ratings` VALUES (119, 15, 6, NULL);
INSERT INTO `ratings` VALUES (120, 8, 10, NULL);
INSERT INTO `ratings` VALUES (120, 7, 8, NULL);
INSERT INTO `ratings` VALUES (120, 9, 6, NULL);
INSERT INTO `ratings` VALUES (120, 25, 5, NULL);
INSERT INTO `ratings` VALUES (120, 30, 6, NULL);
INSERT INTO `ratings` VALUES (120, 29, 10, NULL);
INSERT INTO `ratings` VALUES (120, 17, 8, NULL);
INSERT INTO `ratings` VALUES (120, 20, 8, NULL);
INSERT INTO `ratings` VALUES (120, 21, 7, NULL);
INSERT INTO `ratings` VALUES (120, 1, 7, NULL);
INSERT INTO `ratings` VALUES (123, 24, 8, NULL);
INSERT INTO `ratings` VALUES (123, 14, 7, NULL);
INSERT INTO `ratings` VALUES (123, 19, 7, NULL);
INSERT INTO `ratings` VALUES (123, 3, 8, NULL);
INSERT INTO `ratings` VALUES (123, 8, 7, NULL);
INSERT INTO `ratings` VALUES (123, 12, 8, NULL);
INSERT INTO `ratings` VALUES (123, 29, 7, NULL);
INSERT INTO `ratings` VALUES (123, 2, 6, NULL);
INSERT INTO `ratings` VALUES (123, 31, 7, NULL);
INSERT INTO `ratings` VALUES (123, 26, 7, NULL);
INSERT INTO `ratings` VALUES (124, 18, 6, NULL);
INSERT INTO `ratings` VALUES (124, 19, 9, NULL);
INSERT INTO `ratings` VALUES (124, 14, 8, NULL);
INSERT INTO `ratings` VALUES (124, 13, 6, NULL);
INSERT INTO `ratings` VALUES (124, 16, 6, NULL);
INSERT INTO `ratings` VALUES (124, 29, 8, NULL);
INSERT INTO `ratings` VALUES (124, 25, 9, NULL);
INSERT INTO `ratings` VALUES (124, 6, 8, NULL);
INSERT INTO `ratings` VALUES (124, 24, 7, NULL);
INSERT INTO `ratings` VALUES (124, 7, 9, NULL);
INSERT INTO `ratings` VALUES (126, 14, 9, NULL);
INSERT INTO `ratings` VALUES (126, 18, 7, NULL);
INSERT INTO `ratings` VALUES (126, 10, 8, NULL);
INSERT INTO `ratings` VALUES (126, 1, 7, NULL);
INSERT INTO `ratings` VALUES (126, 4, 9, NULL);
INSERT INTO `ratings` VALUES (126, 32, 6, NULL);
INSERT INTO `ratings` VALUES (126, 5, 10, NULL);
INSERT INTO `ratings` VALUES (126, 12, 10, NULL);
INSERT INTO `ratings` VALUES (126, 25, 8, NULL);
INSERT INTO `ratings` VALUES (126, 22, 8, NULL);
INSERT INTO `ratings` VALUES (128, 24, 5, NULL);
INSERT INTO `ratings` VALUES (128, 14, 6, NULL);
INSERT INTO `ratings` VALUES (128, 8, 8, NULL);
INSERT INTO `ratings` VALUES (128, 4, 6, NULL);
INSERT INTO `ratings` VALUES (128, 6, 5, NULL);
INSERT INTO `ratings` VALUES (128, 13, 4, NULL);
INSERT INTO `ratings` VALUES (128, 23, 8, NULL);
INSERT INTO `ratings` VALUES (128, 28, 5, NULL);
INSERT INTO `ratings` VALUES (128, 12, 5, NULL);
INSERT INTO `ratings` VALUES (128, 32, 2, NULL);
INSERT INTO `ratings` VALUES (129, 18, 6, NULL);
INSERT INTO `ratings` VALUES (129, 4, 8, NULL);
INSERT INTO `ratings` VALUES (129, 27, 9, NULL);
INSERT INTO `ratings` VALUES (129, 9, 10, NULL);
INSERT INTO `ratings` VALUES (129, 26, 7, NULL);
INSERT INTO `ratings` VALUES (129, 5, 9, NULL);
INSERT INTO `ratings` VALUES (129, 31, 7, NULL);
INSERT INTO `ratings` VALUES (129, 21, 7, NULL);
INSERT INTO `ratings` VALUES (129, 25, 9, NULL);
INSERT INTO `ratings` VALUES (129, 2, 10, NULL);
INSERT INTO `ratings` VALUES (137, 1, 7, NULL);
INSERT INTO `ratings` VALUES (137, 9, 9, NULL);
INSERT INTO `ratings` VALUES (137, 14, 9, NULL);
INSERT INTO `ratings` VALUES (137, 16, 7, NULL);
INSERT INTO `ratings` VALUES (137, 31, 10, NULL);
INSERT INTO `ratings` VALUES (137, 25, 8, NULL);
INSERT INTO `ratings` VALUES (137, 32, 10, NULL);
INSERT INTO `ratings` VALUES (137, 22, 9, NULL);
INSERT INTO `ratings` VALUES (137, 26, 6, NULL);
INSERT INTO `ratings` VALUES (137, 19, 6, NULL);
INSERT INTO `ratings` VALUES (140, 6, 7, NULL);
INSERT INTO `ratings` VALUES (140, 18, 7, NULL);
INSERT INTO `ratings` VALUES (140, 32, 9, NULL);
INSERT INTO `ratings` VALUES (140, 14, 8, NULL);
INSERT INTO `ratings` VALUES (140, 20, 10, NULL);
INSERT INTO `ratings` VALUES (140, 19, 9, NULL);
INSERT INTO `ratings` VALUES (140, 11, 9, NULL);
INSERT INTO `ratings` VALUES (140, 3, 8, NULL);
INSERT INTO `ratings` VALUES (140, 15, 8, NULL);
INSERT INTO `ratings` VALUES (140, 13, 10, NULL);
INSERT INTO `ratings` VALUES (142, 31, 7, NULL);
INSERT INTO `ratings` VALUES (142, 22, 8, NULL);
INSERT INTO `ratings` VALUES (142, 12, 8, NULL);
INSERT INTO `ratings` VALUES (142, 17, 8, NULL);
INSERT INTO `ratings` VALUES (142, 28, 7, NULL);
INSERT INTO `ratings` VALUES (142, 15, 7, NULL);
INSERT INTO `ratings` VALUES (142, 9, 7, NULL);
INSERT INTO `ratings` VALUES (142, 32, 8, NULL);
INSERT INTO `ratings` VALUES (142, 11, 6, NULL);
INSERT INTO `ratings` VALUES (142, 6, 7, NULL);
INSERT INTO `ratings` VALUES (143, 10, 8, NULL);
INSERT INTO `ratings` VALUES (143, 22, 8, NULL);
INSERT INTO `ratings` VALUES (143, 18, 7, NULL);
INSERT INTO `ratings` VALUES (143, 28, 7, NULL);
INSERT INTO `ratings` VALUES (143, 4, 8, NULL);
INSERT INTO `ratings` VALUES (143, 32, 6, NULL);
INSERT INTO `ratings` VALUES (143, 27, 6, NULL);
INSERT INTO `ratings` VALUES (143, 19, 7, NULL);
INSERT INTO `ratings` VALUES (143, 13, 7, NULL);
INSERT INTO `ratings` VALUES (143, 14, 8, NULL);
INSERT INTO `ratings` VALUES (144, 30, 7, NULL);
INSERT INTO `ratings` VALUES (144, 5, 10, NULL);
INSERT INTO `ratings` VALUES (144, 28, 9, NULL);
INSERT INTO `ratings` VALUES (144, 22, 7, NULL);
INSERT INTO `ratings` VALUES (144, 32, 7, NULL);
INSERT INTO `ratings` VALUES (144, 15, 9, NULL);
INSERT INTO `ratings` VALUES (144, 3, 10, NULL);
INSERT INTO `ratings` VALUES (144, 18, 8, NULL);
INSERT INTO `ratings` VALUES (144, 8, 8, NULL);
INSERT INTO `ratings` VALUES (144, 29, 7, NULL);
INSERT INTO `ratings` VALUES (145, 5, 8, NULL);
INSERT INTO `ratings` VALUES (145, 29, 7, NULL);
INSERT INTO `ratings` VALUES (145, 30, 7, NULL);
INSERT INTO `ratings` VALUES (145, 24, 7, NULL);
INSERT INTO `ratings` VALUES (145, 0, 8, NULL);
INSERT INTO `ratings` VALUES (145, 15, 8, NULL);
INSERT INTO `ratings` VALUES (145, 26, 7, NULL);
INSERT INTO `ratings` VALUES (145, 28, 6, NULL);
INSERT INTO `ratings` VALUES (145, 19, 7, NULL);
INSERT INTO `ratings` VALUES (145, 10, 8, NULL);
INSERT INTO `ratings` VALUES (148, 3, 10, NULL);
INSERT INTO `ratings` VALUES (148, 18, 2, NULL);
INSERT INTO `ratings` VALUES (148, 6, 4, NULL);
INSERT INTO `ratings` VALUES (148, 16, 2, NULL);
INSERT INTO `ratings` VALUES (148, 26, 5, NULL);
INSERT INTO `ratings` VALUES (148, 0, 10, NULL);
INSERT INTO `ratings` VALUES (148, 1, 10, NULL);
INSERT INTO `ratings` VALUES (148, 24, 5, NULL);
INSERT INTO `ratings` VALUES (148, 5, 4, NULL);
INSERT INTO `ratings` VALUES (148, 2, 10, NULL);
INSERT INTO `ratings` VALUES (152, 25, 9, NULL);
INSERT INTO `ratings` VALUES (152, 5, 9, NULL);
INSERT INTO `ratings` VALUES (152, 27, 7, NULL);
INSERT INTO `ratings` VALUES (152, 24, 5, NULL);
INSERT INTO `ratings` VALUES (152, 4, 8, NULL);
INSERT INTO `ratings` VALUES (152, 10, 2, NULL);
INSERT INTO `ratings` VALUES (152, 28, 2, NULL);
INSERT INTO `ratings` VALUES (152, 15, 1, NULL);
INSERT INTO `ratings` VALUES (152, 8, 2, NULL);
INSERT INTO `ratings` VALUES (152, 19, 8, NULL);
INSERT INTO `ratings` VALUES (154, 25, 7, NULL);
INSERT INTO `ratings` VALUES (154, 6, 9, NULL);
INSERT INTO `ratings` VALUES (154, 21, 6, NULL);
INSERT INTO `ratings` VALUES (154, 13, 6, NULL);
INSERT INTO `ratings` VALUES (154, 20, 6, NULL);
INSERT INTO `ratings` VALUES (154, 30, 6, NULL);
INSERT INTO `ratings` VALUES (154, 4, 10, NULL);
INSERT INTO `ratings` VALUES (154, 27, 9, NULL);
INSERT INTO `ratings` VALUES (154, 11, 8, NULL);
INSERT INTO `ratings` VALUES (154, 8, 9, NULL);
INSERT INTO `ratings` VALUES (156, 21, 8, NULL);
INSERT INTO `ratings` VALUES (156, 12, 9, NULL);
INSERT INTO `ratings` VALUES (156, 26, 8, NULL);
INSERT INTO `ratings` VALUES (156, 28, 8, NULL);
INSERT INTO `ratings` VALUES (156, 5, 10, NULL);
INSERT INTO `ratings` VALUES (156, 22, 8, NULL);
INSERT INTO `ratings` VALUES (156, 1, 10, NULL);
INSERT INTO `ratings` VALUES (156, 9, 8, NULL);
INSERT INTO `ratings` VALUES (156, 19, 9, NULL);
INSERT INTO `ratings` VALUES (156, 23, 6, NULL);
INSERT INTO `ratings` VALUES (160, 8, 1, NULL);
INSERT INTO `ratings` VALUES (160, 27, 3, NULL);
INSERT INTO `ratings` VALUES (160, 12, 10, NULL);
INSERT INTO `ratings` VALUES (160, 31, 1, NULL);
INSERT INTO `ratings` VALUES (160, 7, 1, NULL);
INSERT INTO `ratings` VALUES (160, 9, 6, NULL);
INSERT INTO `ratings` VALUES (160, 6, 4, NULL);
INSERT INTO `ratings` VALUES (160, 20, 7, NULL);
INSERT INTO `ratings` VALUES (160, 30, 1, NULL);
INSERT INTO `ratings` VALUES (160, 18, 1, NULL);
INSERT INTO `ratings` VALUES (162, 30, 9, NULL);
INSERT INTO `ratings` VALUES (162, 17, 8, NULL);
INSERT INTO `ratings` VALUES (162, 4, 6, NULL);
INSERT INTO `ratings` VALUES (162, 24, 8, NULL);
INSERT INTO `ratings` VALUES (162, 8, 9, NULL);
INSERT INTO `ratings` VALUES (162, 32, 7, NULL);
INSERT INTO `ratings` VALUES (162, 10, 6, NULL);
INSERT INTO `ratings` VALUES (162, 5, 8, NULL);
INSERT INTO `ratings` VALUES (162, 0, 7, NULL);
INSERT INTO `ratings` VALUES (162, 3, 8, NULL);
INSERT INTO `ratings` VALUES (164, 26, 8, NULL);
INSERT INTO `ratings` VALUES (164, 9, 6, NULL);
INSERT INTO `ratings` VALUES (164, 2, 7, NULL);
INSERT INTO `ratings` VALUES (164, 28, 8, NULL);
INSERT INTO `ratings` VALUES (164, 17, 6, NULL);
INSERT INTO `ratings` VALUES (164, 4, 4, NULL);
INSERT INTO `ratings` VALUES (164, 23, 6, NULL);
INSERT INTO `ratings` VALUES (164, 7, 8, NULL);
INSERT INTO `ratings` VALUES (164, 16, 5, NULL);
INSERT INTO `ratings` VALUES (164, 24, 7, NULL);
INSERT INTO `ratings` VALUES (169, 31, 1, NULL);
INSERT INTO `ratings` VALUES (169, 1, 5, NULL);
INSERT INTO `ratings` VALUES (169, 5, 7, NULL);
INSERT INTO `ratings` VALUES (169, 25, 9, NULL);
INSERT INTO `ratings` VALUES (169, 3, 10, NULL);
INSERT INTO `ratings` VALUES (169, 27, 7, NULL);
INSERT INTO `ratings` VALUES (169, 2, 10, NULL);
INSERT INTO `ratings` VALUES (169, 12, 10, NULL);
INSERT INTO `ratings` VALUES (169, 9, 8, NULL);
INSERT INTO `ratings` VALUES (169, 26, 8, NULL);
INSERT INTO `ratings` VALUES (178, 1, 10, NULL);
INSERT INTO `ratings` VALUES (178, 10, 9, NULL);
INSERT INTO `ratings` VALUES (178, 14, 5, NULL);
INSERT INTO `ratings` VALUES (178, 4, 10, NULL);
INSERT INTO `ratings` VALUES (178, 12, 8, NULL);
INSERT INTO `ratings` VALUES (178, 0, 9, NULL);
INSERT INTO `ratings` VALUES (178, 32, 6, NULL);
INSERT INTO `ratings` VALUES (178, 22, 9, NULL);
INSERT INTO `ratings` VALUES (178, 7, 10, NULL);
INSERT INTO `ratings` VALUES (178, 15, 10, NULL);
INSERT INTO `ratings` VALUES (183, 14, 7, NULL);
INSERT INTO `ratings` VALUES (183, 22, 6, NULL);
INSERT INTO `ratings` VALUES (183, 20, 8, NULL);
INSERT INTO `ratings` VALUES (183, 17, 5, NULL);
INSERT INTO `ratings` VALUES (183, 27, 5, NULL);
INSERT INTO `ratings` VALUES (183, 32, 7, NULL);
INSERT INTO `ratings` VALUES (183, 28, 7, NULL);
INSERT INTO `ratings` VALUES (183, 30, 6, NULL);
INSERT INTO `ratings` VALUES (183, 7, 6, NULL);
INSERT INTO `ratings` VALUES (183, 2, 8, NULL);
INSERT INTO `ratings` VALUES (194, 10, 7, NULL);
INSERT INTO `ratings` VALUES (194, 8, 8, NULL);
INSERT INTO `ratings` VALUES (194, 1, 9, NULL);
INSERT INTO `ratings` VALUES (194, 11, 5, NULL);
INSERT INTO `ratings` VALUES (194, 19, 4, NULL);
INSERT INTO `ratings` VALUES (194, 18, 2, NULL);
INSERT INTO `ratings` VALUES (194, 9, 3, NULL);
INSERT INTO `ratings` VALUES (194, 22, 8, NULL);
INSERT INTO `ratings` VALUES (194, 3, 6, NULL);
INSERT INTO `ratings` VALUES (194, 7, 8, NULL);
INSERT INTO `ratings` VALUES (200, 16, 3, NULL);
INSERT INTO `ratings` VALUES (200, 17, 4, NULL);
INSERT INTO `ratings` VALUES (200, 30, 9, NULL);
INSERT INTO `ratings` VALUES (200, 20, 7, NULL);
INSERT INTO `ratings` VALUES (200, 13, 2, NULL);
INSERT INTO `ratings` VALUES (200, 31, 10, NULL);
INSERT INTO `ratings` VALUES (200, 11, 1, NULL);
INSERT INTO `ratings` VALUES (200, 32, 8, NULL);
INSERT INTO `ratings` VALUES (200, 6, 5, NULL);
INSERT INTO `ratings` VALUES (200, 21, 6, NULL);
INSERT INTO `ratings` VALUES (203, 32, 7, NULL);
INSERT INTO `ratings` VALUES (203, 30, 9, NULL);
INSERT INTO `ratings` VALUES (203, 31, 10, NULL);
INSERT INTO `ratings` VALUES (203, 29, 5, NULL);
INSERT INTO `ratings` VALUES (203, 1, 4, NULL);
INSERT INTO `ratings` VALUES (203, 8, 8, NULL);
INSERT INTO `ratings` VALUES (203, 11, 1, NULL);
INSERT INTO `ratings` VALUES (203, 13, 2, NULL);
INSERT INTO `ratings` VALUES (203, 23, 3, NULL);
INSERT INTO `ratings` VALUES (203, 27, 6, NULL);
INSERT INTO `ratings` VALUES (204, 19, 6, NULL);
INSERT INTO `ratings` VALUES (204, 24, 5, NULL);
INSERT INTO `ratings` VALUES (204, 12, 8, NULL);
INSERT INTO `ratings` VALUES (204, 30, 3, NULL);
INSERT INTO `ratings` VALUES (204, 0, 9, NULL);
INSERT INTO `ratings` VALUES (204, 32, 3, NULL);
INSERT INTO `ratings` VALUES (204, 25, 9, NULL);
INSERT INTO `ratings` VALUES (204, 7, 7, NULL);
INSERT INTO `ratings` VALUES (204, 18, 8, NULL);
INSERT INTO `ratings` VALUES (204, 15, 6, NULL);
INSERT INTO `ratings` VALUES (208, 27, 7, NULL);
INSERT INTO `ratings` VALUES (208, 0, 7, NULL);
INSERT INTO `ratings` VALUES (208, 17, 8, NULL);
INSERT INTO `ratings` VALUES (208, 13, 10, NULL);
INSERT INTO `ratings` VALUES (208, 12, 8, NULL);
INSERT INTO `ratings` VALUES (208, 30, 8, NULL);
INSERT INTO `ratings` VALUES (208, 18, 10, NULL);
INSERT INTO `ratings` VALUES (208, 16, 8, NULL);
INSERT INTO `ratings` VALUES (208, 2, 8, NULL);
INSERT INTO `ratings` VALUES (208, 22, 7, NULL);
INSERT INTO `ratings` VALUES (211, 23, 8, NULL);
INSERT INTO `ratings` VALUES (211, 20, 7, NULL);
INSERT INTO `ratings` VALUES (211, 3, 8, NULL);
INSERT INTO `ratings` VALUES (211, 29, 9, NULL);
INSERT INTO `ratings` VALUES (211, 13, 7, NULL);
INSERT INTO `ratings` VALUES (211, 2, 8, NULL);
INSERT INTO `ratings` VALUES (211, 22, 6, NULL);
INSERT INTO `ratings` VALUES (211, 10, 7, NULL);
INSERT INTO `ratings` VALUES (211, 24, 8, NULL);
INSERT INTO `ratings` VALUES (211, 14, 8, NULL);
INSERT INTO `ratings` VALUES (215, 23, 8, NULL);
INSERT INTO `ratings` VALUES (215, 9, 7, NULL);
INSERT INTO `ratings` VALUES (215, 32, 6, NULL);
INSERT INTO `ratings` VALUES (215, 18, 7, NULL);
INSERT INTO `ratings` VALUES (215, 0, 9, NULL);
INSERT INTO `ratings` VALUES (215, 15, 7, NULL);
INSERT INTO `ratings` VALUES (215, 10, 7, NULL);
INSERT INTO `ratings` VALUES (215, 17, 8, NULL);
INSERT INTO `ratings` VALUES (215, 12, 8, NULL);
INSERT INTO `ratings` VALUES (215, 3, 7, NULL);
INSERT INTO `ratings` VALUES (226, 8, 7, NULL);
INSERT INTO `ratings` VALUES (226, 32, 7, NULL);
INSERT INTO `ratings` VALUES (226, 1, 9, NULL);
INSERT INTO `ratings` VALUES (226, 22, 10, NULL);
INSERT INTO `ratings` VALUES (226, 24, 8, NULL);
INSERT INTO `ratings` VALUES (226, 18, 10, NULL);
INSERT INTO `ratings` VALUES (226, 12, 8, NULL);
INSERT INTO `ratings` VALUES (226, 0, 10, NULL);
INSERT INTO `ratings` VALUES (226, 15, 9, NULL);
INSERT INTO `ratings` VALUES (226, 5, 9, NULL);
INSERT INTO `ratings` VALUES (227, 23, 7, NULL);
INSERT INTO `ratings` VALUES (227, 14, 7, NULL);
INSERT INTO `ratings` VALUES (227, 6, 8, NULL);
INSERT INTO `ratings` VALUES (227, 8, 7, NULL);
INSERT INTO `ratings` VALUES (227, 16, 6, NULL);
INSERT INTO `ratings` VALUES (227, 3, 10, NULL);
INSERT INTO `ratings` VALUES (227, 24, 10, NULL);
INSERT INTO `ratings` VALUES (227, 31, 9, NULL);
INSERT INTO `ratings` VALUES (227, 0, 8, NULL);
INSERT INTO `ratings` VALUES (227, 2, 7, NULL);
INSERT INTO `ratings` VALUES (230, 24, 8, NULL);
INSERT INTO `ratings` VALUES (230, 7, 8, NULL);
INSERT INTO `ratings` VALUES (230, 32, 7, NULL);
INSERT INTO `ratings` VALUES (230, 29, 8, NULL);
INSERT INTO `ratings` VALUES (230, 5, 10, NULL);
INSERT INTO `ratings` VALUES (230, 28, 9, NULL);
INSERT INTO `ratings` VALUES (230, 30, 8, NULL);
INSERT INTO `ratings` VALUES (230, 16, 8, NULL);
INSERT INTO `ratings` VALUES (230, 8, 7, NULL);
INSERT INTO `ratings` VALUES (230, 18, 7, NULL);
INSERT INTO `ratings` VALUES (231, 6, 10, NULL);
INSERT INTO `ratings` VALUES (231, 9, 7, NULL);
INSERT INTO `ratings` VALUES (231, 30, 4, NULL);
INSERT INTO `ratings` VALUES (231, 19, 8, NULL);
INSERT INTO `ratings` VALUES (231, 17, 10, NULL);
INSERT INTO `ratings` VALUES (231, 15, 10, NULL);
INSERT INTO `ratings` VALUES (231, 24, 5, NULL);
INSERT INTO `ratings` VALUES (231, 25, 7, NULL);
INSERT INTO `ratings` VALUES (231, 27, 9, NULL);
INSERT INTO `ratings` VALUES (231, 4, 6, NULL);
INSERT INTO `ratings` VALUES (232, 27, 4, NULL);
INSERT INTO `ratings` VALUES (232, 18, 6, NULL);
INSERT INTO `ratings` VALUES (232, 13, 6, NULL);
INSERT INTO `ratings` VALUES (232, 15, 4, NULL);
INSERT INTO `ratings` VALUES (232, 31, 4, NULL);
INSERT INTO `ratings` VALUES (232, 7, 4, NULL);
INSERT INTO `ratings` VALUES (232, 10, 7, NULL);
INSERT INTO `ratings` VALUES (232, 3, 7, NULL);
INSERT INTO `ratings` VALUES (232, 25, 8, NULL);
INSERT INTO `ratings` VALUES (232, 12, 3, NULL);
INSERT INTO `ratings` VALUES (233, 8, 1, NULL);
INSERT INTO `ratings` VALUES (233, 27, 3, NULL);
INSERT INTO `ratings` VALUES (233, 12, 10, NULL);
INSERT INTO `ratings` VALUES (233, 31, 1, NULL);
INSERT INTO `ratings` VALUES (233, 7, 1, NULL);
INSERT INTO `ratings` VALUES (233, 9, 6, NULL);
INSERT INTO `ratings` VALUES (233, 6, 4, NULL);
INSERT INTO `ratings` VALUES (233, 20, 7, NULL);
INSERT INTO `ratings` VALUES (233, 30, 1, NULL);
INSERT INTO `ratings` VALUES (233, 18, 1, NULL);
INSERT INTO `ratings` VALUES (234, 20, 4, NULL);
INSERT INTO `ratings` VALUES (234, 10, 8, NULL);
INSERT INTO `ratings` VALUES (234, 13, 7, NULL);
INSERT INTO `ratings` VALUES (234, 6, 1, NULL);
INSERT INTO `ratings` VALUES (234, 30, 1, NULL);
INSERT INTO `ratings` VALUES (234, 25, 6, NULL);
INSERT INTO `ratings` VALUES (234, 1, 10, NULL);
INSERT INTO `ratings` VALUES (234, 16, 5, NULL);
INSERT INTO `ratings` VALUES (234, 5, 9, NULL);
INSERT INTO `ratings` VALUES (234, 18, 3, NULL);
INSERT INTO `ratings` VALUES (235, 18, 10, NULL);
INSERT INTO `ratings` VALUES (235, 8, 8, NULL);
INSERT INTO `ratings` VALUES (235, 30, 6, NULL);
INSERT INTO `ratings` VALUES (235, 16, 7, NULL);
INSERT INTO `ratings` VALUES (235, 23, 8, NULL);
INSERT INTO `ratings` VALUES (235, 25, 9, NULL);
INSERT INTO `ratings` VALUES (235, 9, 8, NULL);
INSERT INTO `ratings` VALUES (235, 1, 10, NULL);
INSERT INTO `ratings` VALUES (235, 27, 10, NULL);
INSERT INTO `ratings` VALUES (235, 0, 10, NULL);
INSERT INTO `ratings` VALUES (236, 29, 10, NULL);
INSERT INTO `ratings` VALUES (236, 1, 10, NULL);
INSERT INTO `ratings` VALUES (236, 30, 1, NULL);
INSERT INTO `ratings` VALUES (236, 27, 1, NULL);
INSERT INTO `ratings` VALUES (236, 9, 10, NULL);
INSERT INTO `ratings` VALUES (236, 3, 10, NULL);
INSERT INTO `ratings` VALUES (236, 31, 2, NULL);
INSERT INTO `ratings` VALUES (236, 19, 8, NULL);
INSERT INTO `ratings` VALUES (236, 16, 10, NULL);
INSERT INTO `ratings` VALUES (236, 13, 10, NULL);
INSERT INTO `ratings` VALUES (237, 19, 9, NULL);
INSERT INTO `ratings` VALUES (237, 22, 6, NULL);
INSERT INTO `ratings` VALUES (237, 30, 5, NULL);
INSERT INTO `ratings` VALUES (237, 13, 3, NULL);
INSERT INTO `ratings` VALUES (237, 20, 6, NULL);
INSERT INTO `ratings` VALUES (237, 2, 6, NULL);
INSERT INTO `ratings` VALUES (237, 24, 5, NULL);
INSERT INTO `ratings` VALUES (237, 15, 4, NULL);
INSERT INTO `ratings` VALUES (237, 25, 8, NULL);
INSERT INTO `ratings` VALUES (237, 8, 3, NULL);
INSERT INTO `ratings` VALUES (238, 25, 9, NULL);
INSERT INTO `ratings` VALUES (238, 5, 9, NULL);
INSERT INTO `ratings` VALUES (238, 27, 7, NULL);
INSERT INTO `ratings` VALUES (238, 24, 5, NULL);
INSERT INTO `ratings` VALUES (238, 4, 8, NULL);
INSERT INTO `ratings` VALUES (238, 10, 2, NULL);
INSERT INTO `ratings` VALUES (238, 28, 2, NULL);
INSERT INTO `ratings` VALUES (238, 15, 1, NULL);
INSERT INTO `ratings` VALUES (238, 8, 2, NULL);
INSERT INTO `ratings` VALUES (238, 19, 8, NULL);
INSERT INTO `ratings` VALUES (240, 16, 7, NULL);
INSERT INTO `ratings` VALUES (240, 20, 8, NULL);
INSERT INTO `ratings` VALUES (240, 23, 7, NULL);
INSERT INTO `ratings` VALUES (240, 27, 6, NULL);
INSERT INTO `ratings` VALUES (240, 28, 5, NULL);
INSERT INTO `ratings` VALUES (240, 9, 7, NULL);
INSERT INTO `ratings` VALUES (240, 21, 8, NULL);
INSERT INTO `ratings` VALUES (240, 17, 7, NULL);
INSERT INTO `ratings` VALUES (240, 1, 8, NULL);
INSERT INTO `ratings` VALUES (240, 7, 7, NULL);
INSERT INTO `ratings` VALUES (242, 24, 4, NULL);
INSERT INTO `ratings` VALUES (242, 22, 7, NULL);
INSERT INTO `ratings` VALUES (242, 8, 5, NULL);
INSERT INTO `ratings` VALUES (242, 13, 6, NULL);
INSERT INTO `ratings` VALUES (242, 17, 7, NULL);
INSERT INTO `ratings` VALUES (242, 4, 8, NULL);
INSERT INTO `ratings` VALUES (242, 1, 7, NULL);
INSERT INTO `ratings` VALUES (242, 29, 2, NULL);
INSERT INTO `ratings` VALUES (242, 31, 2, NULL);
INSERT INTO `ratings` VALUES (242, 10, 8, NULL);
INSERT INTO `ratings` VALUES (243, 7, 8, NULL);
INSERT INTO `ratings` VALUES (243, 15, 8, NULL);
INSERT INTO `ratings` VALUES (243, 13, 7, NULL);
INSERT INTO `ratings` VALUES (243, 24, 6, NULL);
INSERT INTO `ratings` VALUES (243, 23, 10, NULL);
INSERT INTO `ratings` VALUES (243, 28, 8, NULL);
INSERT INTO `ratings` VALUES (243, 21, 6, NULL);
INSERT INTO `ratings` VALUES (243, 20, 9, NULL);
INSERT INTO `ratings` VALUES (243, 6, 8, NULL);
INSERT INTO `ratings` VALUES (243, 18, 9, NULL);
INSERT INTO `ratings` VALUES (244, 29, 8, NULL);
INSERT INTO `ratings` VALUES (244, 12, 9, NULL);
INSERT INTO `ratings` VALUES (244, 17, 8, NULL);
INSERT INTO `ratings` VALUES (244, 20, 9, NULL);
INSERT INTO `ratings` VALUES (244, 25, 9, NULL);
INSERT INTO `ratings` VALUES (244, 19, 9, NULL);
INSERT INTO `ratings` VALUES (244, 24, 9, NULL);
INSERT INTO `ratings` VALUES (244, 5, 8, NULL);
INSERT INTO `ratings` VALUES (244, 9, 9, NULL);
INSERT INTO `ratings` VALUES (244, 0, 9, NULL);
INSERT INTO `ratings` VALUES (245, 2, 6, NULL);
INSERT INTO `ratings` VALUES (245, 24, 3, NULL);
INSERT INTO `ratings` VALUES (245, 19, 7, NULL);
INSERT INTO `ratings` VALUES (245, 4, 8, NULL);
INSERT INTO `ratings` VALUES (245, 22, 10, NULL);
INSERT INTO `ratings` VALUES (245, 27, 7, NULL);
INSERT INTO `ratings` VALUES (245, 25, 7, NULL);
INSERT INTO `ratings` VALUES (245, 31, 2, NULL);
INSERT INTO `ratings` VALUES (245, 15, 5, NULL);
INSERT INTO `ratings` VALUES (245, 11, 7, NULL);
INSERT INTO `ratings` VALUES (246, 17, 7, NULL);
INSERT INTO `ratings` VALUES (246, 6, 6, NULL);
INSERT INTO `ratings` VALUES (246, 7, 2, NULL);
INSERT INTO `ratings` VALUES (246, 8, 3, NULL);
INSERT INTO `ratings` VALUES (246, 29, 3, NULL);
INSERT INTO `ratings` VALUES (246, 28, 6, NULL);
INSERT INTO `ratings` VALUES (246, 0, 8, NULL);
INSERT INTO `ratings` VALUES (246, 20, 8, NULL);
INSERT INTO `ratings` VALUES (246, 23, 9, NULL);
INSERT INTO `ratings` VALUES (246, 30, 1, NULL);
INSERT INTO `ratings` VALUES (251, 15, 7, NULL);
INSERT INTO `ratings` VALUES (251, 32, 6, NULL);
INSERT INTO `ratings` VALUES (251, 2, 7, NULL);
INSERT INTO `ratings` VALUES (251, 10, 7, NULL);
INSERT INTO `ratings` VALUES (251, 20, 8, NULL);
INSERT INTO `ratings` VALUES (251, 25, 7, NULL);
INSERT INTO `ratings` VALUES (251, 18, 6, NULL);
INSERT INTO `ratings` VALUES (251, 21, 8, NULL);
INSERT INTO `ratings` VALUES (251, 22, 7, NULL);
INSERT INTO `ratings` VALUES (251, 4, 8, NULL);
INSERT INTO `ratings` VALUES (252, 6, 10, NULL);
INSERT INTO `ratings` VALUES (252, 9, 7, NULL);
INSERT INTO `ratings` VALUES (252, 30, 4, NULL);
INSERT INTO `ratings` VALUES (252, 19, 8, NULL);
INSERT INTO `ratings` VALUES (252, 17, 10, NULL);
INSERT INTO `ratings` VALUES (252, 15, 10, NULL);
INSERT INTO `ratings` VALUES (252, 24, 5, NULL);
INSERT INTO `ratings` VALUES (252, 25, 7, NULL);
INSERT INTO `ratings` VALUES (252, 27, 9, NULL);
INSERT INTO `ratings` VALUES (252, 4, 6, NULL);
INSERT INTO `ratings` VALUES (253, 7, 8, NULL);
INSERT INTO `ratings` VALUES (253, 21, 7, NULL);
INSERT INTO `ratings` VALUES (253, 8, 6, NULL);
INSERT INTO `ratings` VALUES (253, 0, 8, NULL);
INSERT INTO `ratings` VALUES (253, 3, 4, NULL);
INSERT INTO `ratings` VALUES (253, 30, 6, NULL);
INSERT INTO `ratings` VALUES (253, 4, 8, NULL);
INSERT INTO `ratings` VALUES (253, 28, 7, NULL);
INSERT INTO `ratings` VALUES (253, 16, 9, NULL);
INSERT INTO `ratings` VALUES (253, 15, 9, NULL);
INSERT INTO `ratings` VALUES (254, 16, 6, NULL);
INSERT INTO `ratings` VALUES (254, 21, 4, NULL);
INSERT INTO `ratings` VALUES (254, 1, 5, NULL);
INSERT INTO `ratings` VALUES (254, 26, 18, NULL);
INSERT INTO `ratings` VALUES (254, 11, 4, NULL);
INSERT INTO `ratings` VALUES (254, 20, 8, NULL);
INSERT INTO `ratings` VALUES (254, 30, 5, NULL);
INSERT INTO `ratings` VALUES (254, 5, 10, NULL);
INSERT INTO `ratings` VALUES (254, 32, 8, NULL);
INSERT INTO `ratings` VALUES (254, 14, 7, NULL);
INSERT INTO `ratings` VALUES (255, 8, 10, NULL);
INSERT INTO `ratings` VALUES (255, 21, 10, NULL);
INSERT INTO `ratings` VALUES (255, 9, 10, NULL);
INSERT INTO `ratings` VALUES (255, 1, 10, NULL);
INSERT INTO `ratings` VALUES (255, 12, 10, NULL);
INSERT INTO `ratings` VALUES (255, 4, 10, NULL);
INSERT INTO `ratings` VALUES (255, 25, 10, NULL);
INSERT INTO `ratings` VALUES (255, 6, 10, NULL);
INSERT INTO `ratings` VALUES (255, 14, 10, NULL);
INSERT INTO `ratings` VALUES (255, 13, 10, NULL);
INSERT INTO `ratings` VALUES (256, 2, 7, NULL);
INSERT INTO `ratings` VALUES (256, 25, 8, NULL);
INSERT INTO `ratings` VALUES (256, 4, 5, NULL);
INSERT INTO `ratings` VALUES (256, 12, 7, NULL);
INSERT INTO `ratings` VALUES (256, 31, 7, NULL);
INSERT INTO `ratings` VALUES (256, 22, 6, NULL);
INSERT INTO `ratings` VALUES (256, 18, 8, NULL);
INSERT INTO `ratings` VALUES (256, 32, 9, NULL);
INSERT INTO `ratings` VALUES (256, 16, 7, NULL);
INSERT INTO `ratings` VALUES (256, 15, 9, NULL);
INSERT INTO `ratings` VALUES (257, 4, 8, NULL);
INSERT INTO `ratings` VALUES (257, 12, 7, NULL);
INSERT INTO `ratings` VALUES (257, 25, 8, NULL);
INSERT INTO `ratings` VALUES (257, 0, 7, NULL);
INSERT INTO `ratings` VALUES (257, 29, 7, NULL);
INSERT INTO `ratings` VALUES (257, 8, 5, NULL);
INSERT INTO `ratings` VALUES (257, 17, 9, NULL);
INSERT INTO `ratings` VALUES (257, 30, 5, NULL);
INSERT INTO `ratings` VALUES (257, 2, 6, NULL);
INSERT INTO `ratings` VALUES (257, 20, 8, NULL);
INSERT INTO `ratings` VALUES (258, 22, 9, NULL);
INSERT INTO `ratings` VALUES (258, 6, 7, NULL);
INSERT INTO `ratings` VALUES (258, 29, 6, NULL);
INSERT INTO `ratings` VALUES (258, 26, 7, NULL);
INSERT INTO `ratings` VALUES (258, 15, 6, NULL);
INSERT INTO `ratings` VALUES (258, 31, 5, NULL);
INSERT INTO `ratings` VALUES (258, 17, 8, NULL);
INSERT INTO `ratings` VALUES (258, 23, 9, NULL);
INSERT INTO `ratings` VALUES (258, 27, 8, NULL);
INSERT INTO `ratings` VALUES (258, 24, 6, NULL);
INSERT INTO `ratings` VALUES (300, 30, 1, NULL);
INSERT INTO `ratings` VALUES (300, 5, 3, NULL);
INSERT INTO `ratings` VALUES (300, 10, 9, NULL);
INSERT INTO `ratings` VALUES (300, 9, 3, NULL);
INSERT INTO `ratings` VALUES (300, 23, 2, NULL);
INSERT INTO `ratings` VALUES (300, 8, 2, NULL);
INSERT INTO `ratings` VALUES (300, 22, 1, NULL);
INSERT INTO `ratings` VALUES (300, 16, 2, NULL);
INSERT INTO `ratings` VALUES (300, 19, 1, NULL);
INSERT INTO `ratings` VALUES (300, 3, 10, NULL);

-- ----------------------------
-- Table structure for specification
-- ----------------------------
DROP TABLE IF EXISTS `specification`;
CREATE TABLE `specification`  (
  `cellphone_id` int NULL DEFAULT NULL,
  `brand` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `operating_system` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `internal_memory` int NULL DEFAULT NULL,
  `RAM` int NULL DEFAULT NULL,
  `performance` int NULL DEFAULT NULL,
  `main_camera` int NULL DEFAULT NULL,
  `selfie_camera` int NULL DEFAULT NULL,
  `battery_size` int NULL DEFAULT NULL,
  `screen_size` int NULL DEFAULT NULL,
  `weight` int NULL DEFAULT NULL,
  `price` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of specification
-- ----------------------------
INSERT INTO `specification` VALUES (0, 'Apple', 'iPhone SE (2022)', 'iOS', 128, 4, 7, 12, 7, 2018, 5, 144, 429);
INSERT INTO `specification` VALUES (1, 'Apple', 'iPhone 13 Mini', 'iOS', 128, 4, 8, 12, 12, 2438, 5, 141, 699);
INSERT INTO `specification` VALUES (2, 'Apple', 'iPhone 13', 'iOS', 128, 4, 8, 12, 12, 3240, 6, 174, 699);
INSERT INTO `specification` VALUES (3, 'Apple', 'iPhone 13 Pro', 'iOS', 256, 6, 8, 12, 12, 3065, 6, 204, 999);
INSERT INTO `specification` VALUES (4, 'Apple', 'iPhone 13 Pro Max', 'iOS', 256, 6, 8, 12, 12, 4352, 7, 240, 1199);
INSERT INTO `specification` VALUES (5, 'Apple', 'iPhone XR', 'iOS', 64, 3, 4, 12, 7, 2942, 6, 194, 236);
INSERT INTO `specification` VALUES (6, 'Asus', 'Zenfone 8', 'Android', 128, 8, 7, 64, 12, 4000, 6, 169, 599);
INSERT INTO `specification` VALUES (7, 'Samsung', 'Galaxy A13', 'Android', 32, 3, 1, 50, 8, 5000, 7, 196, 154);
INSERT INTO `specification` VALUES (8, 'Samsung', 'Galaxy A32', 'Android', 64, 4, 2, 48, 13, 5000, 7, 205, 199);
INSERT INTO `specification` VALUES (9, 'Samsung', 'Galaxy A53', 'Android', 128, 6, 4, 64, 32, 5000, 7, 189, 312);
INSERT INTO `specification` VALUES (10, 'Samsung', 'Galaxy S22', 'Android', 128, 8, 9, 50, 10, 3700, 6, 167, 528);
INSERT INTO `specification` VALUES (11, 'Samsung', 'Galaxy S22 Plus', 'Android', 128, 8, 7, 50, 10, 4500, 7, 195, 899);
INSERT INTO `specification` VALUES (12, 'Samsung', 'Galaxy S22 Ultra', 'Android', 128, 8, 10, 108, 40, 5000, 7, 228, 840);
INSERT INTO `specification` VALUES (13, 'Samsung', 'Galaxy Z Flip 3', 'Android', 128, 8, 6, 12, 10, 3300, 7, 183, 899);
INSERT INTO `specification` VALUES (14, 'Samsung', 'Galaxy Z Fold 3', 'Android', 256, 12, 6, 12, 4, 4400, 8, 271, 1799);
INSERT INTO `specification` VALUES (15, 'Google', 'Pixel 6', 'Android', 128, 8, 7, 50, 8, 4614, 6, 207, 499);
INSERT INTO `specification` VALUES (16, 'Google', 'Pixel 6a', 'Android', 128, 6, 7, 12, 8, 4410, 6, 178, 449);
INSERT INTO `specification` VALUES (17, 'Google', 'Pixel 6 Pro ', 'Android', 128, 12, 7, 50, 11, 5003, 7, 210, 699);
INSERT INTO `specification` VALUES (18, 'OnePlus', 'Nord N20', 'Android', 128, 6, 4, 64, 16, 4500, 6, 173, 299);
INSERT INTO `specification` VALUES (19, 'OnePlus', 'Nord 2T', 'Android', 128, 8, 6, 50, 32, 4500, 6, 190, 379);
INSERT INTO `specification` VALUES (20, 'OnePlus', '10 Pro', 'Android', 128, 8, 9, 48, 32, 5000, 7, 201, 780);
INSERT INTO `specification` VALUES (21, 'OnePlus', '10T', 'Android', 128, 8, 11, 50, 16, 4800, 7, 204, 649);
INSERT INTO `specification` VALUES (22, 'Oppo', 'Find X5 Pro', 'Android', 256, 12, 10, 50, 32, 5000, 7, 218, 987);
INSERT INTO `specification` VALUES (23, 'Vivo', 'X80 Pro', 'Android', 256, 8, 10, 50, 32, 4700, 7, 215, 872);
INSERT INTO `specification` VALUES (24, 'Xiaomi', 'Redmi Note 11', 'Android', 128, 4, 2, 50, 13, 5000, 6, 179, 174);
INSERT INTO `specification` VALUES (25, 'Xiaomi', '11T Pro', 'Android', 256, 8, 8, 108, 16, 5000, 7, 204, 435);
INSERT INTO `specification` VALUES (26, 'Xiaomi', '12 Pro', 'Android', 128, 8, 10, 50, 32, 4600, 7, 204, 618);
INSERT INTO `specification` VALUES (27, 'Xiaomi', 'Poco F4', 'Android', 128, 8, 7, 64, 20, 4500, 7, 195, 428);
INSERT INTO `specification` VALUES (28, 'Sony', 'Xperia Pro', 'Android', 512, 12, 7, 12, 8, 4000, 7, 225, 1998);
INSERT INTO `specification` VALUES (29, 'Motorola', 'Moto G Stylus (2022)', 'Android', 128, 6, 2, 50, 16, 5000, 7, 215, 500);
INSERT INTO `specification` VALUES (30, 'Motorola', 'Moto G Play (2021)', 'Android', 32, 3, 1, 13, 5, 5000, 7, 204, 159);
INSERT INTO `specification` VALUES (31, 'Motorola', 'Moto G Pure', 'Android', 32, 3, 1, 13, 5, 4000, 7, 188, 129);
INSERT INTO `specification` VALUES (32, 'Motorola', 'Moto G Power (2022)', 'Android', 64, 4, 1, 50, 8, 5000, 7, 203, 189);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reset_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `google_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `google_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `google_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `google_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'online',
  `role` tinyint NOT NULL DEFAULT 1,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_name_unique`(`name` ASC) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10001 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'name1', 'user1@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (6, 'name6', 'user6@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (8, 'name8', 'user8@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (10, 'name10', 'user10@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (12, 'name12', 'user12@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (16, 'name16', 'user16@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (24, 'name24', 'user24@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (25, 'name25', 'user25@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (26, 'name26', 'user26@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (27, 'name27', 'user27@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (28, 'name28', 'user28@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (29, 'name29', 'user29@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (30, 'name30', 'user30@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (32, 'name32', 'user32@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (33, 'name33', 'user33@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (35, 'name35', 'user35@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (36, 'name36', 'user36@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (37, 'name37', 'user37@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (38, 'name38', 'user38@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (52, 'name52', 'user52@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (53, 'name53', 'user53@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (56, 'name56', 'user56@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (60, 'name60', 'user60@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (74, 'name74', 'user74@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (79, 'name79', 'user79@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (80, 'name80', 'user80@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (84, 'name84', 'user84@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (85, 'name85', 'user85@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (91, 'name91', 'user91@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (95, 'name95', 'user95@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (98, 'name98', 'user98@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (99, 'name99', 'user99@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (100, 'name100', 'user100@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (104, 'name104', 'user104@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (105, 'name105', 'user105@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (106, 'name106', 'user106@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (110, 'name110', 'user110@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (111, 'name111', 'user111@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (112, 'name112', 'user112@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (113, 'name113', 'user113@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (114, 'name114', 'user114@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (115, 'name115', 'user115@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (116, 'name116', 'user116@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (119, 'name119', 'user119@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (120, 'name120', 'user120@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (123, 'name123', 'user123@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (124, 'name124', 'user124@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (126, 'name126', 'user126@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (128, 'name128', 'user128@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (129, 'name129', 'user129@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (137, 'name137', 'user137@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (140, 'name140', 'user140@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (142, 'name142', 'user142@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (143, 'name143', 'user143@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (144, 'name144', 'user144@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (145, 'name145', 'user145@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (148, 'name148', 'user148@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (152, 'name152', 'user152@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (154, 'name154', 'user154@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (156, 'name156', 'user156@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (160, 'name160', 'user160@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (162, 'name162', 'user162@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (164, 'name164', 'user164@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (169, 'name169', 'user169@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (178, 'name178', 'user178@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (183, 'name183', 'user183@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (194, 'name194', 'user194@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (200, 'name200', 'user200@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (203, 'name203', 'user203@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (204, 'name204', 'user204@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (208, 'name208', 'user208@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (211, 'name211', 'user211@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (215, 'name215', 'user215@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (226, 'name226', 'user226@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (227, 'name227', 'user227@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (230, 'name230', 'user230@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (231, 'name231', 'user231@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (232, 'name232', 'user232@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (233, 'name233', 'user233@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (234, 'name234', 'user234@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (235, 'name235', 'user235@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (236, 'name236', 'user236@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (237, 'name237', 'user237@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (238, 'name238', 'user238@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (240, 'name240', 'user240@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (242, 'name242', 'user242@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (243, 'name243', 'user243@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (244, 'name244', 'user244@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (245, 'name245', 'user245@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (246, 'name246', 'user246@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (251, 'name251', 'user251@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (252, 'name252', 'user252@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (253, 'name253', 'user253@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (254, 'name254', 'user254@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (255, 'name255', 'user255@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (256, 'name256', 'user256@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (257, 'name257', 'user257@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (258, 'name258', 'user258@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (300, 'name300', 'user300@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (9999, 'owner', 'owner@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 1, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');

SET FOREIGN_KEY_CHECKS = 1;
