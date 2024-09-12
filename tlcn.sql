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

 Date: 12/09/2024 20:59:44
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
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_items
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------

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
INSERT INTO `product_variations` VALUES (2, 'https://res.cloudinary.com/du06b9aap/image/upload/products/12-pro.png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (3, 'https://res.cloudinary.com/du06b9aap/image/upload/products/find-x5-pro.png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (4, 'https://res.cloudinary.com/du06b9aap/image/upload/products/galaxy-a13.jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (5, 'https://res.cloudinary.com/du06b9aap/image/upload/products/galaxy-a32.jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (6, 'https://res.cloudinary.com/du06b9aap/image/upload/products/galaxy-a53.jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (7, 'https://res.cloudinary.com/du06b9aap/image/upload/products/galaxy-s22-plus.jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (8, 'https://res.cloudinary.com/du06b9aap/image/upload/products/galaxy-s22-ultra.png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (9, 'https://res.cloudinary.com/du06b9aap/image/upload/products/galaxy-s22.jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (10, 'https://res.cloudinary.com/du06b9aap/image/upload/products/galaxy-z-flip-3.jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (11, 'https://res.cloudinary.com/du06b9aap/image/upload/products/galaxy-z-fold-3.jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (12, 'https://res.cloudinary.com/du06b9aap/image/upload/products/iphone-13-mini.jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (13, 'https://res.cloudinary.com/du06b9aap/image/upload/products/iphone-13-pro-max.png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (14, 'https://res.cloudinary.com/du06b9aap/image/upload/products/iphone-13-pro.png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (15, 'https://res.cloudinary.com/du06b9aap/image/upload/products/iphone-13.png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (16, 'https://res.cloudinary.com/du06b9aap/image/upload/products/iphone-se-(2022).jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (17, 'https://res.cloudinary.com/du06b9aap/image/upload/products/moto-g-play-(2021).png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (18, 'https://res.cloudinary.com/du06b9aap/image/upload/products/moto-g-power-(2022).jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (19, 'https://res.cloudinary.com/du06b9aap/image/upload/products/moto-g-pure.jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (20, 'https://res.cloudinary.com/du06b9aap/image/upload/products/moto-g-stylus-(2022).png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (21, 'https://res.cloudinary.com/du06b9aap/image/upload/products/nord-2t.png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (22, 'https://res.cloudinary.com/du06b9aap/image/upload/products/nord-n20.png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (23, 'https://res.cloudinary.com/du06b9aap/image/upload/products/pixel-6-pro.jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (24, 'https://res.cloudinary.com/du06b9aap/image/upload/products/pixel-6.jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (25, 'https://res.cloudinary.com/du06b9aap/image/upload/products/pixel-6a.jpg', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (26, 'https://res.cloudinary.com/du06b9aap/image/upload/products/poco-f4.png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (27, 'https://res.cloudinary.com/du06b9aap/image/upload/products/redmi-note-11.png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');
INSERT INTO `product_variations` VALUES (28, 'https://res.cloudinary.com/du06b9aap/image/upload/products/10-pro.png', NULL, 'black', 100.00, 10.00, 100, 1, 1, 90, 10, 'none', 0, '2024-08-01 20:13:43', '2024-09-28 20:13:50');

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
  `ratings` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ratings
-- ----------------------------
INSERT INTO `ratings` VALUES (300, 30, 1);
INSERT INTO `ratings` VALUES (300, 5, 3);
INSERT INTO `ratings` VALUES (300, 10, 9);
INSERT INTO `ratings` VALUES (300, 9, 3);
INSERT INTO `ratings` VALUES (300, 23, 2);
INSERT INTO `ratings` VALUES (300, 8, 2);
INSERT INTO `ratings` VALUES (300, 22, 1);
INSERT INTO `ratings` VALUES (300, 16, 2);
INSERT INTO `ratings` VALUES (300, 19, 1);
INSERT INTO `ratings` VALUES (300, 3, 10);
INSERT INTO `ratings` VALUES (1, 7, 8);
INSERT INTO `ratings` VALUES (1, 31, 7);
INSERT INTO `ratings` VALUES (1, 18, 5);
INSERT INTO `ratings` VALUES (1, 3, 10);
INSERT INTO `ratings` VALUES (1, 32, 6);
INSERT INTO `ratings` VALUES (1, 28, 8);
INSERT INTO `ratings` VALUES (1, 16, 7);
INSERT INTO `ratings` VALUES (1, 15, 8);
INSERT INTO `ratings` VALUES (1, 4, 7);
INSERT INTO `ratings` VALUES (1, 8, 8);
INSERT INTO `ratings` VALUES (6, 13, 5);
INSERT INTO `ratings` VALUES (6, 31, 6);
INSERT INTO `ratings` VALUES (6, 23, 8);
INSERT INTO `ratings` VALUES (6, 1, 2);
INSERT INTO `ratings` VALUES (6, 8, 7);
INSERT INTO `ratings` VALUES (6, 19, 1);
INSERT INTO `ratings` VALUES (6, 32, 10);
INSERT INTO `ratings` VALUES (6, 7, 9);
INSERT INTO `ratings` VALUES (6, 27, 4);
INSERT INTO `ratings` VALUES (6, 16, 3);
INSERT INTO `ratings` VALUES (8, 29, 6);
INSERT INTO `ratings` VALUES (8, 22, 9);
INSERT INTO `ratings` VALUES (8, 32, 9);
INSERT INTO `ratings` VALUES (8, 25, 8);
INSERT INTO `ratings` VALUES (8, 20, 7);
INSERT INTO `ratings` VALUES (8, 0, 5);
INSERT INTO `ratings` VALUES (8, 11, 6);
INSERT INTO `ratings` VALUES (8, 17, 8);
INSERT INTO `ratings` VALUES (8, 21, 5);
INSERT INTO `ratings` VALUES (8, 27, 8);
INSERT INTO `ratings` VALUES (10, 23, 9);
INSERT INTO `ratings` VALUES (10, 5, 3);
INSERT INTO `ratings` VALUES (10, 6, 7);
INSERT INTO `ratings` VALUES (10, 4, 9);
INSERT INTO `ratings` VALUES (10, 14, 10);
INSERT INTO `ratings` VALUES (10, 3, 9);
INSERT INTO `ratings` VALUES (10, 12, 8);
INSERT INTO `ratings` VALUES (10, 16, 8);
INSERT INTO `ratings` VALUES (10, 27, 8);
INSERT INTO `ratings` VALUES (10, 11, 8);
INSERT INTO `ratings` VALUES (12, 24, 4);
INSERT INTO `ratings` VALUES (12, 10, 9);
INSERT INTO `ratings` VALUES (12, 16, 7);
INSERT INTO `ratings` VALUES (12, 13, 6);
INSERT INTO `ratings` VALUES (12, 6, 6);
INSERT INTO `ratings` VALUES (12, 32, 5);
INSERT INTO `ratings` VALUES (12, 27, 4);
INSERT INTO `ratings` VALUES (12, 20, 7);
INSERT INTO `ratings` VALUES (12, 31, 3);
INSERT INTO `ratings` VALUES (12, 23, 6);
INSERT INTO `ratings` VALUES (16, 15, 10);
INSERT INTO `ratings` VALUES (16, 24, 3);
INSERT INTO `ratings` VALUES (16, 0, 1);
INSERT INTO `ratings` VALUES (16, 30, 2);
INSERT INTO `ratings` VALUES (16, 27, 4);
INSERT INTO `ratings` VALUES (16, 11, 8);
INSERT INTO `ratings` VALUES (16, 26, 5);
INSERT INTO `ratings` VALUES (16, 13, 7);
INSERT INTO `ratings` VALUES (16, 9, 6);
INSERT INTO `ratings` VALUES (16, 6, 2);
INSERT INTO `ratings` VALUES (24, 20, 9);
INSERT INTO `ratings` VALUES (24, 28, 8);
INSERT INTO `ratings` VALUES (24, 3, 10);
INSERT INTO `ratings` VALUES (24, 21, 8);
INSERT INTO `ratings` VALUES (24, 22, 7);
INSERT INTO `ratings` VALUES (24, 6, 7);
INSERT INTO `ratings` VALUES (24, 18, 8);
INSERT INTO `ratings` VALUES (24, 10, 9);
INSERT INTO `ratings` VALUES (24, 23, 7);
INSERT INTO `ratings` VALUES (24, 15, 10);
INSERT INTO `ratings` VALUES (25, 2, 9);
INSERT INTO `ratings` VALUES (25, 5, 6);
INSERT INTO `ratings` VALUES (25, 14, 2);
INSERT INTO `ratings` VALUES (25, 30, 5);
INSERT INTO `ratings` VALUES (25, 12, 3);
INSERT INTO `ratings` VALUES (25, 32, 9);
INSERT INTO `ratings` VALUES (25, 8, 10);
INSERT INTO `ratings` VALUES (25, 13, 1);
INSERT INTO `ratings` VALUES (25, 16, 9);
INSERT INTO `ratings` VALUES (25, 20, 5);
INSERT INTO `ratings` VALUES (26, 20, 6);
INSERT INTO `ratings` VALUES (26, 32, 9);
INSERT INTO `ratings` VALUES (26, 3, 10);
INSERT INTO `ratings` VALUES (26, 15, 7);
INSERT INTO `ratings` VALUES (26, 23, 6);
INSERT INTO `ratings` VALUES (26, 25, 9);
INSERT INTO `ratings` VALUES (26, 22, 10);
INSERT INTO `ratings` VALUES (26, 12, 8);
INSERT INTO `ratings` VALUES (26, 18, 5);
INSERT INTO `ratings` VALUES (26, 4, 9);
INSERT INTO `ratings` VALUES (27, 11, 8);
INSERT INTO `ratings` VALUES (27, 8, 8);
INSERT INTO `ratings` VALUES (27, 19, 6);
INSERT INTO `ratings` VALUES (27, 24, 7);
INSERT INTO `ratings` VALUES (27, 27, 7);
INSERT INTO `ratings` VALUES (27, 18, 6);
INSERT INTO `ratings` VALUES (27, 6, 8);
INSERT INTO `ratings` VALUES (27, 21, 9);
INSERT INTO `ratings` VALUES (27, 32, 8);
INSERT INTO `ratings` VALUES (27, 4, 10);
INSERT INTO `ratings` VALUES (28, 28, 1);
INSERT INTO `ratings` VALUES (28, 31, 1);
INSERT INTO `ratings` VALUES (28, 5, 10);
INSERT INTO `ratings` VALUES (28, 8, 1);
INSERT INTO `ratings` VALUES (28, 14, 1);
INSERT INTO `ratings` VALUES (28, 17, 1);
INSERT INTO `ratings` VALUES (28, 22, 1);
INSERT INTO `ratings` VALUES (28, 29, 1);
INSERT INTO `ratings` VALUES (28, 3, 10);
INSERT INTO `ratings` VALUES (28, 25, 1);
INSERT INTO `ratings` VALUES (29, 14, 5);
INSERT INTO `ratings` VALUES (29, 8, 7);
INSERT INTO `ratings` VALUES (29, 19, 5);
INSERT INTO `ratings` VALUES (29, 10, 9);
INSERT INTO `ratings` VALUES (29, 7, 6);
INSERT INTO `ratings` VALUES (29, 24, 8);
INSERT INTO `ratings` VALUES (29, 2, 6);
INSERT INTO `ratings` VALUES (29, 16, 7);
INSERT INTO `ratings` VALUES (29, 26, 5);
INSERT INTO `ratings` VALUES (29, 5, 4);
INSERT INTO `ratings` VALUES (30, 17, 8);
INSERT INTO `ratings` VALUES (30, 14, 6);
INSERT INTO `ratings` VALUES (30, 19, 7);
INSERT INTO `ratings` VALUES (30, 15, 6);
INSERT INTO `ratings` VALUES (30, 26, 9);
INSERT INTO `ratings` VALUES (30, 9, 4);
INSERT INTO `ratings` VALUES (30, 0, 4);
INSERT INTO `ratings` VALUES (30, 16, 8);
INSERT INTO `ratings` VALUES (30, 4, 7);
INSERT INTO `ratings` VALUES (30, 2, 5);
INSERT INTO `ratings` VALUES (32, 12, 1);
INSERT INTO `ratings` VALUES (32, 2, 9);
INSERT INTO `ratings` VALUES (32, 13, 1);
INSERT INTO `ratings` VALUES (32, 26, 9);
INSERT INTO `ratings` VALUES (32, 11, 1);
INSERT INTO `ratings` VALUES (32, 31, 3);
INSERT INTO `ratings` VALUES (32, 20, 2);
INSERT INTO `ratings` VALUES (32, 30, 1);
INSERT INTO `ratings` VALUES (32, 6, 2);
INSERT INTO `ratings` VALUES (32, 10, 8);
INSERT INTO `ratings` VALUES (33, 30, 10);
INSERT INTO `ratings` VALUES (33, 29, 9);
INSERT INTO `ratings` VALUES (33, 13, 8);
INSERT INTO `ratings` VALUES (33, 6, 8);
INSERT INTO `ratings` VALUES (33, 2, 10);
INSERT INTO `ratings` VALUES (33, 19, 10);
INSERT INTO `ratings` VALUES (33, 9, 10);
INSERT INTO `ratings` VALUES (33, 10, 10);
INSERT INTO `ratings` VALUES (33, 25, 10);
INSERT INTO `ratings` VALUES (33, 32, 8);
INSERT INTO `ratings` VALUES (35, 19, 7);
INSERT INTO `ratings` VALUES (35, 12, 2);
INSERT INTO `ratings` VALUES (35, 26, 2);
INSERT INTO `ratings` VALUES (35, 17, 3);
INSERT INTO `ratings` VALUES (35, 23, 2);
INSERT INTO `ratings` VALUES (35, 0, 6);
INSERT INTO `ratings` VALUES (35, 18, 9);
INSERT INTO `ratings` VALUES (35, 27, 7);
INSERT INTO `ratings` VALUES (35, 6, 5);
INSERT INTO `ratings` VALUES (35, 4, 1);
INSERT INTO `ratings` VALUES (36, 2, 10);
INSERT INTO `ratings` VALUES (36, 26, 1);
INSERT INTO `ratings` VALUES (36, 6, 1);
INSERT INTO `ratings` VALUES (36, 1, 6);
INSERT INTO `ratings` VALUES (36, 5, 6);
INSERT INTO `ratings` VALUES (36, 10, 4);
INSERT INTO `ratings` VALUES (36, 22, 4);
INSERT INTO `ratings` VALUES (36, 14, 1);
INSERT INTO `ratings` VALUES (36, 9, 4);
INSERT INTO `ratings` VALUES (36, 17, 2);
INSERT INTO `ratings` VALUES (37, 24, 6);
INSERT INTO `ratings` VALUES (37, 32, 5);
INSERT INTO `ratings` VALUES (37, 28, 10);
INSERT INTO `ratings` VALUES (37, 7, 1);
INSERT INTO `ratings` VALUES (37, 18, 5);
INSERT INTO `ratings` VALUES (37, 31, 2);
INSERT INTO `ratings` VALUES (37, 23, 9);
INSERT INTO `ratings` VALUES (37, 30, 1);
INSERT INTO `ratings` VALUES (37, 13, 5);
INSERT INTO `ratings` VALUES (37, 15, 5);
INSERT INTO `ratings` VALUES (38, 1, 7);
INSERT INTO `ratings` VALUES (38, 30, 4);
INSERT INTO `ratings` VALUES (38, 5, 8);
INSERT INTO `ratings` VALUES (38, 24, 7);
INSERT INTO `ratings` VALUES (38, 10, 7);
INSERT INTO `ratings` VALUES (38, 15, 2);
INSERT INTO `ratings` VALUES (38, 2, 8);
INSERT INTO `ratings` VALUES (38, 11, 7);
INSERT INTO `ratings` VALUES (38, 6, 5);
INSERT INTO `ratings` VALUES (38, 25, 6);
INSERT INTO `ratings` VALUES (52, 20, 10);
INSERT INTO `ratings` VALUES (52, 0, 5);
INSERT INTO `ratings` VALUES (52, 13, 4);
INSERT INTO `ratings` VALUES (52, 27, 6);
INSERT INTO `ratings` VALUES (52, 26, 8);
INSERT INTO `ratings` VALUES (52, 8, 1);
INSERT INTO `ratings` VALUES (52, 5, 2);
INSERT INTO `ratings` VALUES (52, 3, 2);
INSERT INTO `ratings` VALUES (52, 24, 5);
INSERT INTO `ratings` VALUES (52, 15, 5);
INSERT INTO `ratings` VALUES (53, 32, 9);
INSERT INTO `ratings` VALUES (53, 5, 8);
INSERT INTO `ratings` VALUES (53, 15, 10);
INSERT INTO `ratings` VALUES (53, 4, 9);
INSERT INTO `ratings` VALUES (53, 26, 9);
INSERT INTO `ratings` VALUES (53, 9, 8);
INSERT INTO `ratings` VALUES (53, 7, 8);
INSERT INTO `ratings` VALUES (53, 29, 8);
INSERT INTO `ratings` VALUES (53, 25, 9);
INSERT INTO `ratings` VALUES (53, 17, 8);
INSERT INTO `ratings` VALUES (56, 15, 5);
INSERT INTO `ratings` VALUES (56, 32, 3);
INSERT INTO `ratings` VALUES (56, 30, 2);
INSERT INTO `ratings` VALUES (56, 5, 9);
INSERT INTO `ratings` VALUES (56, 25, 3);
INSERT INTO `ratings` VALUES (56, 1, 9);
INSERT INTO `ratings` VALUES (56, 12, 5);
INSERT INTO `ratings` VALUES (56, 8, 10);
INSERT INTO `ratings` VALUES (56, 17, 6);
INSERT INTO `ratings` VALUES (56, 13, 9);
INSERT INTO `ratings` VALUES (60, 16, 6);
INSERT INTO `ratings` VALUES (60, 11, 3);
INSERT INTO `ratings` VALUES (60, 32, 8);
INSERT INTO `ratings` VALUES (60, 9, 5);
INSERT INTO `ratings` VALUES (60, 28, 1);
INSERT INTO `ratings` VALUES (60, 26, 9);
INSERT INTO `ratings` VALUES (60, 15, 4);
INSERT INTO `ratings` VALUES (60, 31, 10);
INSERT INTO `ratings` VALUES (60, 13, 2);
INSERT INTO `ratings` VALUES (60, 29, 7);
INSERT INTO `ratings` VALUES (74, 26, 8);
INSERT INTO `ratings` VALUES (74, 25, 7);
INSERT INTO `ratings` VALUES (74, 17, 7);
INSERT INTO `ratings` VALUES (74, 11, 8);
INSERT INTO `ratings` VALUES (74, 21, 7);
INSERT INTO `ratings` VALUES (74, 8, 6);
INSERT INTO `ratings` VALUES (74, 30, 6);
INSERT INTO `ratings` VALUES (74, 28, 7);
INSERT INTO `ratings` VALUES (74, 32, 7);
INSERT INTO `ratings` VALUES (74, 16, 6);
INSERT INTO `ratings` VALUES (79, 16, 8);
INSERT INTO `ratings` VALUES (79, 11, 8);
INSERT INTO `ratings` VALUES (79, 19, 7);
INSERT INTO `ratings` VALUES (79, 10, 8);
INSERT INTO `ratings` VALUES (79, 3, 9);
INSERT INTO `ratings` VALUES (79, 23, 8);
INSERT INTO `ratings` VALUES (79, 32, 7);
INSERT INTO `ratings` VALUES (79, 31, 5);
INSERT INTO `ratings` VALUES (79, 14, 7);
INSERT INTO `ratings` VALUES (79, 5, 6);
INSERT INTO `ratings` VALUES (80, 7, 8);
INSERT INTO `ratings` VALUES (80, 19, 7);
INSERT INTO `ratings` VALUES (80, 30, 8);
INSERT INTO `ratings` VALUES (80, 9, 9);
INSERT INTO `ratings` VALUES (80, 28, 9);
INSERT INTO `ratings` VALUES (80, 31, 8);
INSERT INTO `ratings` VALUES (80, 22, 10);
INSERT INTO `ratings` VALUES (80, 5, 7);
INSERT INTO `ratings` VALUES (80, 8, 8);
INSERT INTO `ratings` VALUES (80, 2, 9);
INSERT INTO `ratings` VALUES (84, 25, 1);
INSERT INTO `ratings` VALUES (84, 2, 10);
INSERT INTO `ratings` VALUES (84, 31, 9);
INSERT INTO `ratings` VALUES (84, 28, 10);
INSERT INTO `ratings` VALUES (84, 21, 1);
INSERT INTO `ratings` VALUES (84, 7, 10);
INSERT INTO `ratings` VALUES (84, 30, 9);
INSERT INTO `ratings` VALUES (84, 14, 10);
INSERT INTO `ratings` VALUES (84, 17, 9);
INSERT INTO `ratings` VALUES (84, 26, 1);
INSERT INTO `ratings` VALUES (85, 18, 1);
INSERT INTO `ratings` VALUES (85, 30, 1);
INSERT INTO `ratings` VALUES (85, 25, 1);
INSERT INTO `ratings` VALUES (85, 1, 10);
INSERT INTO `ratings` VALUES (85, 15, 1);
INSERT INTO `ratings` VALUES (85, 2, 10);
INSERT INTO `ratings` VALUES (85, 4, 10);
INSERT INTO `ratings` VALUES (85, 14, 1);
INSERT INTO `ratings` VALUES (85, 17, 1);
INSERT INTO `ratings` VALUES (85, 21, 1);
INSERT INTO `ratings` VALUES (91, 31, 8);
INSERT INTO `ratings` VALUES (91, 16, 7);
INSERT INTO `ratings` VALUES (91, 1, 9);
INSERT INTO `ratings` VALUES (91, 2, 9);
INSERT INTO `ratings` VALUES (91, 15, 6);
INSERT INTO `ratings` VALUES (91, 22, 5);
INSERT INTO `ratings` VALUES (91, 19, 8);
INSERT INTO `ratings` VALUES (91, 21, 8);
INSERT INTO `ratings` VALUES (91, 12, 9);
INSERT INTO `ratings` VALUES (91, 11, 7);
INSERT INTO `ratings` VALUES (95, 17, 9);
INSERT INTO `ratings` VALUES (95, 22, 10);
INSERT INTO `ratings` VALUES (95, 30, 5);
INSERT INTO `ratings` VALUES (95, 25, 9);
INSERT INTO `ratings` VALUES (95, 29, 6);
INSERT INTO `ratings` VALUES (95, 27, 7);
INSERT INTO `ratings` VALUES (95, 6, 7);
INSERT INTO `ratings` VALUES (95, 32, 4);
INSERT INTO `ratings` VALUES (95, 15, 5);
INSERT INTO `ratings` VALUES (95, 5, 5);
INSERT INTO `ratings` VALUES (98, 0, 10);
INSERT INTO `ratings` VALUES (98, 2, 9);
INSERT INTO `ratings` VALUES (98, 12, 9);
INSERT INTO `ratings` VALUES (98, 20, 7);
INSERT INTO `ratings` VALUES (98, 24, 8);
INSERT INTO `ratings` VALUES (98, 8, 9);
INSERT INTO `ratings` VALUES (98, 9, 8);
INSERT INTO `ratings` VALUES (98, 32, 6);
INSERT INTO `ratings` VALUES (98, 10, 9);
INSERT INTO `ratings` VALUES (98, 7, 8);
INSERT INTO `ratings` VALUES (99, 17, 10);
INSERT INTO `ratings` VALUES (99, 26, 9);
INSERT INTO `ratings` VALUES (99, 13, 10);
INSERT INTO `ratings` VALUES (99, 22, 10);
INSERT INTO `ratings` VALUES (99, 21, 9);
INSERT INTO `ratings` VALUES (99, 4, 10);
INSERT INTO `ratings` VALUES (99, 8, 9);
INSERT INTO `ratings` VALUES (99, 3, 10);
INSERT INTO `ratings` VALUES (99, 25, 10);
INSERT INTO `ratings` VALUES (99, 30, 10);
INSERT INTO `ratings` VALUES (100, 20, 10);
INSERT INTO `ratings` VALUES (100, 27, 9);
INSERT INTO `ratings` VALUES (100, 24, 8);
INSERT INTO `ratings` VALUES (100, 30, 8);
INSERT INTO `ratings` VALUES (100, 29, 8);
INSERT INTO `ratings` VALUES (100, 8, 10);
INSERT INTO `ratings` VALUES (100, 26, 8);
INSERT INTO `ratings` VALUES (100, 7, 9);
INSERT INTO `ratings` VALUES (100, 13, 10);
INSERT INTO `ratings` VALUES (100, 10, 9);
INSERT INTO `ratings` VALUES (104, 30, 6);
INSERT INTO `ratings` VALUES (104, 24, 7);
INSERT INTO `ratings` VALUES (104, 13, 8);
INSERT INTO `ratings` VALUES (104, 12, 9);
INSERT INTO `ratings` VALUES (104, 15, 8);
INSERT INTO `ratings` VALUES (104, 11, 10);
INSERT INTO `ratings` VALUES (104, 28, 10);
INSERT INTO `ratings` VALUES (104, 31, 10);
INSERT INTO `ratings` VALUES (104, 27, 8);
INSERT INTO `ratings` VALUES (104, 16, 10);
INSERT INTO `ratings` VALUES (105, 17, 8);
INSERT INTO `ratings` VALUES (105, 18, 7);
INSERT INTO `ratings` VALUES (105, 4, 10);
INSERT INTO `ratings` VALUES (105, 19, 6);
INSERT INTO `ratings` VALUES (105, 9, 8);
INSERT INTO `ratings` VALUES (105, 12, 9);
INSERT INTO `ratings` VALUES (105, 14, 9);
INSERT INTO `ratings` VALUES (105, 22, 8);
INSERT INTO `ratings` VALUES (105, 7, 9);
INSERT INTO `ratings` VALUES (105, 20, 10);
INSERT INTO `ratings` VALUES (106, 24, 7);
INSERT INTO `ratings` VALUES (106, 20, 6);
INSERT INTO `ratings` VALUES (106, 15, 7);
INSERT INTO `ratings` VALUES (106, 14, 8);
INSERT INTO `ratings` VALUES (106, 4, 6);
INSERT INTO `ratings` VALUES (106, 26, 7);
INSERT INTO `ratings` VALUES (106, 18, 5);
INSERT INTO `ratings` VALUES (106, 5, 6);
INSERT INTO `ratings` VALUES (106, 12, 8);
INSERT INTO `ratings` VALUES (106, 16, 7);
INSERT INTO `ratings` VALUES (110, 8, 2);
INSERT INTO `ratings` VALUES (110, 12, 6);
INSERT INTO `ratings` VALUES (110, 27, 1);
INSERT INTO `ratings` VALUES (110, 31, 2);
INSERT INTO `ratings` VALUES (110, 24, 1);
INSERT INTO `ratings` VALUES (110, 5, 2);
INSERT INTO `ratings` VALUES (110, 3, 3);
INSERT INTO `ratings` VALUES (110, 29, 6);
INSERT INTO `ratings` VALUES (110, 9, 7);
INSERT INTO `ratings` VALUES (110, 14, 1);
INSERT INTO `ratings` VALUES (111, 8, 4);
INSERT INTO `ratings` VALUES (111, 4, 1);
INSERT INTO `ratings` VALUES (111, 7, 3);
INSERT INTO `ratings` VALUES (111, 20, 10);
INSERT INTO `ratings` VALUES (111, 25, 5);
INSERT INTO `ratings` VALUES (111, 30, 9);
INSERT INTO `ratings` VALUES (111, 5, 2);
INSERT INTO `ratings` VALUES (111, 23, 7);
INSERT INTO `ratings` VALUES (111, 18, 6);
INSERT INTO `ratings` VALUES (111, 26, 8);
INSERT INTO `ratings` VALUES (112, 17, 10);
INSERT INTO `ratings` VALUES (112, 23, 10);
INSERT INTO `ratings` VALUES (112, 13, 8);
INSERT INTO `ratings` VALUES (112, 27, 9);
INSERT INTO `ratings` VALUES (112, 11, 1);
INSERT INTO `ratings` VALUES (112, 31, 2);
INSERT INTO `ratings` VALUES (112, 6, 4);
INSERT INTO `ratings` VALUES (112, 29, 3);
INSERT INTO `ratings` VALUES (112, 14, 2);
INSERT INTO `ratings` VALUES (112, 3, 8);
INSERT INTO `ratings` VALUES (113, 14, 5);
INSERT INTO `ratings` VALUES (113, 1, 5);
INSERT INTO `ratings` VALUES (113, 29, 2);
INSERT INTO `ratings` VALUES (113, 27, 1);
INSERT INTO `ratings` VALUES (113, 3, 10);
INSERT INTO `ratings` VALUES (113, 26, 1);
INSERT INTO `ratings` VALUES (113, 7, 10);
INSERT INTO `ratings` VALUES (113, 21, 1);
INSERT INTO `ratings` VALUES (113, 15, 6);
INSERT INTO `ratings` VALUES (113, 4, 10);
INSERT INTO `ratings` VALUES (114, 3, 7);
INSERT INTO `ratings` VALUES (114, 22, 8);
INSERT INTO `ratings` VALUES (114, 28, 7);
INSERT INTO `ratings` VALUES (114, 24, 6);
INSERT INTO `ratings` VALUES (114, 8, 6);
INSERT INTO `ratings` VALUES (114, 29, 6);
INSERT INTO `ratings` VALUES (114, 4, 7);
INSERT INTO `ratings` VALUES (114, 25, 8);
INSERT INTO `ratings` VALUES (114, 12, 9);
INSERT INTO `ratings` VALUES (114, 26, 8);
INSERT INTO `ratings` VALUES (115, 7, 1);
INSERT INTO `ratings` VALUES (115, 25, 10);
INSERT INTO `ratings` VALUES (115, 3, 7);
INSERT INTO `ratings` VALUES (115, 6, 7);
INSERT INTO `ratings` VALUES (115, 11, 9);
INSERT INTO `ratings` VALUES (115, 2, 6);
INSERT INTO `ratings` VALUES (115, 13, 4);
INSERT INTO `ratings` VALUES (115, 19, 7);
INSERT INTO `ratings` VALUES (115, 30, 5);
INSERT INTO `ratings` VALUES (115, 26, 10);
INSERT INTO `ratings` VALUES (116, 19, 1);
INSERT INTO `ratings` VALUES (116, 4, 10);
INSERT INTO `ratings` VALUES (116, 20, 1);
INSERT INTO `ratings` VALUES (116, 10, 1);
INSERT INTO `ratings` VALUES (116, 12, 1);
INSERT INTO `ratings` VALUES (116, 13, 1);
INSERT INTO `ratings` VALUES (116, 3, 10);
INSERT INTO `ratings` VALUES (116, 16, 1);
INSERT INTO `ratings` VALUES (116, 31, 1);
INSERT INTO `ratings` VALUES (116, 27, 1);
INSERT INTO `ratings` VALUES (119, 25, 8);
INSERT INTO `ratings` VALUES (119, 3, 1);
INSERT INTO `ratings` VALUES (119, 16, 4);
INSERT INTO `ratings` VALUES (119, 7, 5);
INSERT INTO `ratings` VALUES (119, 23, 9);
INSERT INTO `ratings` VALUES (119, 10, 3);
INSERT INTO `ratings` VALUES (119, 11, 2);
INSERT INTO `ratings` VALUES (119, 28, 10);
INSERT INTO `ratings` VALUES (119, 19, 7);
INSERT INTO `ratings` VALUES (119, 15, 6);
INSERT INTO `ratings` VALUES (120, 8, 10);
INSERT INTO `ratings` VALUES (120, 7, 8);
INSERT INTO `ratings` VALUES (120, 9, 6);
INSERT INTO `ratings` VALUES (120, 25, 5);
INSERT INTO `ratings` VALUES (120, 30, 6);
INSERT INTO `ratings` VALUES (120, 29, 10);
INSERT INTO `ratings` VALUES (120, 17, 8);
INSERT INTO `ratings` VALUES (120, 20, 8);
INSERT INTO `ratings` VALUES (120, 21, 7);
INSERT INTO `ratings` VALUES (120, 1, 7);
INSERT INTO `ratings` VALUES (123, 24, 8);
INSERT INTO `ratings` VALUES (123, 14, 7);
INSERT INTO `ratings` VALUES (123, 19, 7);
INSERT INTO `ratings` VALUES (123, 3, 8);
INSERT INTO `ratings` VALUES (123, 8, 7);
INSERT INTO `ratings` VALUES (123, 12, 8);
INSERT INTO `ratings` VALUES (123, 29, 7);
INSERT INTO `ratings` VALUES (123, 2, 6);
INSERT INTO `ratings` VALUES (123, 31, 7);
INSERT INTO `ratings` VALUES (123, 26, 7);
INSERT INTO `ratings` VALUES (124, 18, 6);
INSERT INTO `ratings` VALUES (124, 19, 9);
INSERT INTO `ratings` VALUES (124, 14, 8);
INSERT INTO `ratings` VALUES (124, 13, 6);
INSERT INTO `ratings` VALUES (124, 16, 6);
INSERT INTO `ratings` VALUES (124, 29, 8);
INSERT INTO `ratings` VALUES (124, 25, 9);
INSERT INTO `ratings` VALUES (124, 6, 8);
INSERT INTO `ratings` VALUES (124, 24, 7);
INSERT INTO `ratings` VALUES (124, 7, 9);
INSERT INTO `ratings` VALUES (126, 14, 9);
INSERT INTO `ratings` VALUES (126, 18, 7);
INSERT INTO `ratings` VALUES (126, 10, 8);
INSERT INTO `ratings` VALUES (126, 1, 7);
INSERT INTO `ratings` VALUES (126, 4, 9);
INSERT INTO `ratings` VALUES (126, 32, 6);
INSERT INTO `ratings` VALUES (126, 5, 10);
INSERT INTO `ratings` VALUES (126, 12, 10);
INSERT INTO `ratings` VALUES (126, 25, 8);
INSERT INTO `ratings` VALUES (126, 22, 8);
INSERT INTO `ratings` VALUES (128, 24, 5);
INSERT INTO `ratings` VALUES (128, 14, 6);
INSERT INTO `ratings` VALUES (128, 8, 8);
INSERT INTO `ratings` VALUES (128, 4, 6);
INSERT INTO `ratings` VALUES (128, 6, 5);
INSERT INTO `ratings` VALUES (128, 13, 4);
INSERT INTO `ratings` VALUES (128, 23, 8);
INSERT INTO `ratings` VALUES (128, 28, 5);
INSERT INTO `ratings` VALUES (128, 12, 5);
INSERT INTO `ratings` VALUES (128, 32, 2);
INSERT INTO `ratings` VALUES (129, 18, 6);
INSERT INTO `ratings` VALUES (129, 4, 8);
INSERT INTO `ratings` VALUES (129, 27, 9);
INSERT INTO `ratings` VALUES (129, 9, 10);
INSERT INTO `ratings` VALUES (129, 26, 7);
INSERT INTO `ratings` VALUES (129, 5, 9);
INSERT INTO `ratings` VALUES (129, 31, 7);
INSERT INTO `ratings` VALUES (129, 21, 7);
INSERT INTO `ratings` VALUES (129, 25, 9);
INSERT INTO `ratings` VALUES (129, 2, 10);
INSERT INTO `ratings` VALUES (137, 1, 7);
INSERT INTO `ratings` VALUES (137, 9, 9);
INSERT INTO `ratings` VALUES (137, 14, 9);
INSERT INTO `ratings` VALUES (137, 16, 7);
INSERT INTO `ratings` VALUES (137, 31, 10);
INSERT INTO `ratings` VALUES (137, 25, 8);
INSERT INTO `ratings` VALUES (137, 32, 10);
INSERT INTO `ratings` VALUES (137, 22, 9);
INSERT INTO `ratings` VALUES (137, 26, 6);
INSERT INTO `ratings` VALUES (137, 19, 6);
INSERT INTO `ratings` VALUES (140, 6, 7);
INSERT INTO `ratings` VALUES (140, 18, 7);
INSERT INTO `ratings` VALUES (140, 32, 9);
INSERT INTO `ratings` VALUES (140, 14, 8);
INSERT INTO `ratings` VALUES (140, 20, 10);
INSERT INTO `ratings` VALUES (140, 19, 9);
INSERT INTO `ratings` VALUES (140, 11, 9);
INSERT INTO `ratings` VALUES (140, 3, 8);
INSERT INTO `ratings` VALUES (140, 15, 8);
INSERT INTO `ratings` VALUES (140, 13, 10);
INSERT INTO `ratings` VALUES (142, 31, 7);
INSERT INTO `ratings` VALUES (142, 22, 8);
INSERT INTO `ratings` VALUES (142, 12, 8);
INSERT INTO `ratings` VALUES (142, 17, 8);
INSERT INTO `ratings` VALUES (142, 28, 7);
INSERT INTO `ratings` VALUES (142, 15, 7);
INSERT INTO `ratings` VALUES (142, 9, 7);
INSERT INTO `ratings` VALUES (142, 32, 8);
INSERT INTO `ratings` VALUES (142, 11, 6);
INSERT INTO `ratings` VALUES (142, 6, 7);
INSERT INTO `ratings` VALUES (143, 10, 8);
INSERT INTO `ratings` VALUES (143, 22, 8);
INSERT INTO `ratings` VALUES (143, 18, 7);
INSERT INTO `ratings` VALUES (143, 28, 7);
INSERT INTO `ratings` VALUES (143, 4, 8);
INSERT INTO `ratings` VALUES (143, 32, 6);
INSERT INTO `ratings` VALUES (143, 27, 6);
INSERT INTO `ratings` VALUES (143, 19, 7);
INSERT INTO `ratings` VALUES (143, 13, 7);
INSERT INTO `ratings` VALUES (143, 14, 8);
INSERT INTO `ratings` VALUES (144, 30, 7);
INSERT INTO `ratings` VALUES (144, 5, 10);
INSERT INTO `ratings` VALUES (144, 28, 9);
INSERT INTO `ratings` VALUES (144, 22, 7);
INSERT INTO `ratings` VALUES (144, 32, 7);
INSERT INTO `ratings` VALUES (144, 15, 9);
INSERT INTO `ratings` VALUES (144, 3, 10);
INSERT INTO `ratings` VALUES (144, 18, 8);
INSERT INTO `ratings` VALUES (144, 8, 8);
INSERT INTO `ratings` VALUES (144, 29, 7);
INSERT INTO `ratings` VALUES (145, 5, 8);
INSERT INTO `ratings` VALUES (145, 29, 7);
INSERT INTO `ratings` VALUES (145, 30, 7);
INSERT INTO `ratings` VALUES (145, 24, 7);
INSERT INTO `ratings` VALUES (145, 0, 8);
INSERT INTO `ratings` VALUES (145, 15, 8);
INSERT INTO `ratings` VALUES (145, 26, 7);
INSERT INTO `ratings` VALUES (145, 28, 6);
INSERT INTO `ratings` VALUES (145, 19, 7);
INSERT INTO `ratings` VALUES (145, 10, 8);
INSERT INTO `ratings` VALUES (148, 3, 10);
INSERT INTO `ratings` VALUES (148, 18, 2);
INSERT INTO `ratings` VALUES (148, 6, 4);
INSERT INTO `ratings` VALUES (148, 16, 2);
INSERT INTO `ratings` VALUES (148, 26, 5);
INSERT INTO `ratings` VALUES (148, 0, 10);
INSERT INTO `ratings` VALUES (148, 1, 10);
INSERT INTO `ratings` VALUES (148, 24, 5);
INSERT INTO `ratings` VALUES (148, 5, 4);
INSERT INTO `ratings` VALUES (148, 2, 10);
INSERT INTO `ratings` VALUES (152, 25, 9);
INSERT INTO `ratings` VALUES (152, 5, 9);
INSERT INTO `ratings` VALUES (152, 27, 7);
INSERT INTO `ratings` VALUES (152, 24, 5);
INSERT INTO `ratings` VALUES (152, 4, 8);
INSERT INTO `ratings` VALUES (152, 10, 2);
INSERT INTO `ratings` VALUES (152, 28, 2);
INSERT INTO `ratings` VALUES (152, 15, 1);
INSERT INTO `ratings` VALUES (152, 8, 2);
INSERT INTO `ratings` VALUES (152, 19, 8);
INSERT INTO `ratings` VALUES (154, 25, 7);
INSERT INTO `ratings` VALUES (154, 6, 9);
INSERT INTO `ratings` VALUES (154, 21, 6);
INSERT INTO `ratings` VALUES (154, 13, 6);
INSERT INTO `ratings` VALUES (154, 20, 6);
INSERT INTO `ratings` VALUES (154, 30, 6);
INSERT INTO `ratings` VALUES (154, 4, 10);
INSERT INTO `ratings` VALUES (154, 27, 9);
INSERT INTO `ratings` VALUES (154, 11, 8);
INSERT INTO `ratings` VALUES (154, 8, 9);
INSERT INTO `ratings` VALUES (156, 21, 8);
INSERT INTO `ratings` VALUES (156, 12, 9);
INSERT INTO `ratings` VALUES (156, 26, 8);
INSERT INTO `ratings` VALUES (156, 28, 8);
INSERT INTO `ratings` VALUES (156, 5, 10);
INSERT INTO `ratings` VALUES (156, 22, 8);
INSERT INTO `ratings` VALUES (156, 1, 10);
INSERT INTO `ratings` VALUES (156, 9, 8);
INSERT INTO `ratings` VALUES (156, 19, 9);
INSERT INTO `ratings` VALUES (156, 23, 6);
INSERT INTO `ratings` VALUES (160, 8, 1);
INSERT INTO `ratings` VALUES (160, 27, 3);
INSERT INTO `ratings` VALUES (160, 12, 10);
INSERT INTO `ratings` VALUES (160, 31, 1);
INSERT INTO `ratings` VALUES (160, 7, 1);
INSERT INTO `ratings` VALUES (160, 9, 6);
INSERT INTO `ratings` VALUES (160, 6, 4);
INSERT INTO `ratings` VALUES (160, 20, 7);
INSERT INTO `ratings` VALUES (160, 30, 1);
INSERT INTO `ratings` VALUES (160, 18, 1);
INSERT INTO `ratings` VALUES (162, 30, 9);
INSERT INTO `ratings` VALUES (162, 17, 8);
INSERT INTO `ratings` VALUES (162, 4, 6);
INSERT INTO `ratings` VALUES (162, 24, 8);
INSERT INTO `ratings` VALUES (162, 8, 9);
INSERT INTO `ratings` VALUES (162, 32, 7);
INSERT INTO `ratings` VALUES (162, 10, 6);
INSERT INTO `ratings` VALUES (162, 5, 8);
INSERT INTO `ratings` VALUES (162, 0, 7);
INSERT INTO `ratings` VALUES (162, 3, 8);
INSERT INTO `ratings` VALUES (164, 26, 8);
INSERT INTO `ratings` VALUES (164, 9, 6);
INSERT INTO `ratings` VALUES (164, 2, 7);
INSERT INTO `ratings` VALUES (164, 28, 8);
INSERT INTO `ratings` VALUES (164, 17, 6);
INSERT INTO `ratings` VALUES (164, 4, 4);
INSERT INTO `ratings` VALUES (164, 23, 6);
INSERT INTO `ratings` VALUES (164, 7, 8);
INSERT INTO `ratings` VALUES (164, 16, 5);
INSERT INTO `ratings` VALUES (164, 24, 7);
INSERT INTO `ratings` VALUES (169, 31, 1);
INSERT INTO `ratings` VALUES (169, 1, 5);
INSERT INTO `ratings` VALUES (169, 5, 7);
INSERT INTO `ratings` VALUES (169, 25, 9);
INSERT INTO `ratings` VALUES (169, 3, 10);
INSERT INTO `ratings` VALUES (169, 27, 7);
INSERT INTO `ratings` VALUES (169, 2, 10);
INSERT INTO `ratings` VALUES (169, 12, 10);
INSERT INTO `ratings` VALUES (169, 9, 8);
INSERT INTO `ratings` VALUES (169, 26, 8);
INSERT INTO `ratings` VALUES (178, 1, 10);
INSERT INTO `ratings` VALUES (178, 10, 9);
INSERT INTO `ratings` VALUES (178, 14, 5);
INSERT INTO `ratings` VALUES (178, 4, 10);
INSERT INTO `ratings` VALUES (178, 12, 8);
INSERT INTO `ratings` VALUES (178, 0, 9);
INSERT INTO `ratings` VALUES (178, 32, 6);
INSERT INTO `ratings` VALUES (178, 22, 9);
INSERT INTO `ratings` VALUES (178, 7, 10);
INSERT INTO `ratings` VALUES (178, 15, 10);
INSERT INTO `ratings` VALUES (183, 14, 7);
INSERT INTO `ratings` VALUES (183, 22, 6);
INSERT INTO `ratings` VALUES (183, 20, 8);
INSERT INTO `ratings` VALUES (183, 17, 5);
INSERT INTO `ratings` VALUES (183, 27, 5);
INSERT INTO `ratings` VALUES (183, 32, 7);
INSERT INTO `ratings` VALUES (183, 28, 7);
INSERT INTO `ratings` VALUES (183, 30, 6);
INSERT INTO `ratings` VALUES (183, 7, 6);
INSERT INTO `ratings` VALUES (183, 2, 8);
INSERT INTO `ratings` VALUES (194, 10, 7);
INSERT INTO `ratings` VALUES (194, 8, 8);
INSERT INTO `ratings` VALUES (194, 1, 9);
INSERT INTO `ratings` VALUES (194, 11, 5);
INSERT INTO `ratings` VALUES (194, 19, 4);
INSERT INTO `ratings` VALUES (194, 18, 2);
INSERT INTO `ratings` VALUES (194, 9, 3);
INSERT INTO `ratings` VALUES (194, 22, 8);
INSERT INTO `ratings` VALUES (194, 3, 6);
INSERT INTO `ratings` VALUES (194, 7, 8);
INSERT INTO `ratings` VALUES (200, 16, 3);
INSERT INTO `ratings` VALUES (200, 17, 4);
INSERT INTO `ratings` VALUES (200, 30, 9);
INSERT INTO `ratings` VALUES (200, 20, 7);
INSERT INTO `ratings` VALUES (200, 13, 2);
INSERT INTO `ratings` VALUES (200, 31, 10);
INSERT INTO `ratings` VALUES (200, 11, 1);
INSERT INTO `ratings` VALUES (200, 32, 8);
INSERT INTO `ratings` VALUES (200, 6, 5);
INSERT INTO `ratings` VALUES (200, 21, 6);
INSERT INTO `ratings` VALUES (203, 32, 7);
INSERT INTO `ratings` VALUES (203, 30, 9);
INSERT INTO `ratings` VALUES (203, 31, 10);
INSERT INTO `ratings` VALUES (203, 29, 5);
INSERT INTO `ratings` VALUES (203, 1, 4);
INSERT INTO `ratings` VALUES (203, 8, 8);
INSERT INTO `ratings` VALUES (203, 11, 1);
INSERT INTO `ratings` VALUES (203, 13, 2);
INSERT INTO `ratings` VALUES (203, 23, 3);
INSERT INTO `ratings` VALUES (203, 27, 6);
INSERT INTO `ratings` VALUES (204, 19, 6);
INSERT INTO `ratings` VALUES (204, 24, 5);
INSERT INTO `ratings` VALUES (204, 12, 8);
INSERT INTO `ratings` VALUES (204, 30, 3);
INSERT INTO `ratings` VALUES (204, 0, 9);
INSERT INTO `ratings` VALUES (204, 32, 3);
INSERT INTO `ratings` VALUES (204, 25, 9);
INSERT INTO `ratings` VALUES (204, 7, 7);
INSERT INTO `ratings` VALUES (204, 18, 8);
INSERT INTO `ratings` VALUES (204, 15, 6);
INSERT INTO `ratings` VALUES (208, 27, 7);
INSERT INTO `ratings` VALUES (208, 0, 7);
INSERT INTO `ratings` VALUES (208, 17, 8);
INSERT INTO `ratings` VALUES (208, 13, 10);
INSERT INTO `ratings` VALUES (208, 12, 8);
INSERT INTO `ratings` VALUES (208, 30, 8);
INSERT INTO `ratings` VALUES (208, 18, 10);
INSERT INTO `ratings` VALUES (208, 16, 8);
INSERT INTO `ratings` VALUES (208, 2, 8);
INSERT INTO `ratings` VALUES (208, 22, 7);
INSERT INTO `ratings` VALUES (211, 23, 8);
INSERT INTO `ratings` VALUES (211, 20, 7);
INSERT INTO `ratings` VALUES (211, 3, 8);
INSERT INTO `ratings` VALUES (211, 29, 9);
INSERT INTO `ratings` VALUES (211, 13, 7);
INSERT INTO `ratings` VALUES (211, 2, 8);
INSERT INTO `ratings` VALUES (211, 22, 6);
INSERT INTO `ratings` VALUES (211, 10, 7);
INSERT INTO `ratings` VALUES (211, 24, 8);
INSERT INTO `ratings` VALUES (211, 14, 8);
INSERT INTO `ratings` VALUES (215, 23, 8);
INSERT INTO `ratings` VALUES (215, 9, 7);
INSERT INTO `ratings` VALUES (215, 32, 6);
INSERT INTO `ratings` VALUES (215, 18, 7);
INSERT INTO `ratings` VALUES (215, 0, 9);
INSERT INTO `ratings` VALUES (215, 15, 7);
INSERT INTO `ratings` VALUES (215, 10, 7);
INSERT INTO `ratings` VALUES (215, 17, 8);
INSERT INTO `ratings` VALUES (215, 12, 8);
INSERT INTO `ratings` VALUES (215, 3, 7);
INSERT INTO `ratings` VALUES (226, 8, 7);
INSERT INTO `ratings` VALUES (226, 32, 7);
INSERT INTO `ratings` VALUES (226, 1, 9);
INSERT INTO `ratings` VALUES (226, 22, 10);
INSERT INTO `ratings` VALUES (226, 24, 8);
INSERT INTO `ratings` VALUES (226, 18, 10);
INSERT INTO `ratings` VALUES (226, 12, 8);
INSERT INTO `ratings` VALUES (226, 0, 10);
INSERT INTO `ratings` VALUES (226, 15, 9);
INSERT INTO `ratings` VALUES (226, 5, 9);
INSERT INTO `ratings` VALUES (227, 23, 7);
INSERT INTO `ratings` VALUES (227, 14, 7);
INSERT INTO `ratings` VALUES (227, 6, 8);
INSERT INTO `ratings` VALUES (227, 8, 7);
INSERT INTO `ratings` VALUES (227, 16, 6);
INSERT INTO `ratings` VALUES (227, 3, 10);
INSERT INTO `ratings` VALUES (227, 24, 10);
INSERT INTO `ratings` VALUES (227, 31, 9);
INSERT INTO `ratings` VALUES (227, 0, 8);
INSERT INTO `ratings` VALUES (227, 2, 7);
INSERT INTO `ratings` VALUES (230, 24, 8);
INSERT INTO `ratings` VALUES (230, 7, 8);
INSERT INTO `ratings` VALUES (230, 32, 7);
INSERT INTO `ratings` VALUES (230, 29, 8);
INSERT INTO `ratings` VALUES (230, 5, 10);
INSERT INTO `ratings` VALUES (230, 28, 9);
INSERT INTO `ratings` VALUES (230, 30, 8);
INSERT INTO `ratings` VALUES (230, 16, 8);
INSERT INTO `ratings` VALUES (230, 8, 7);
INSERT INTO `ratings` VALUES (230, 18, 7);
INSERT INTO `ratings` VALUES (231, 6, 10);
INSERT INTO `ratings` VALUES (231, 9, 7);
INSERT INTO `ratings` VALUES (231, 30, 4);
INSERT INTO `ratings` VALUES (231, 19, 8);
INSERT INTO `ratings` VALUES (231, 17, 10);
INSERT INTO `ratings` VALUES (231, 15, 10);
INSERT INTO `ratings` VALUES (231, 24, 5);
INSERT INTO `ratings` VALUES (231, 25, 7);
INSERT INTO `ratings` VALUES (231, 27, 9);
INSERT INTO `ratings` VALUES (231, 4, 6);
INSERT INTO `ratings` VALUES (232, 27, 4);
INSERT INTO `ratings` VALUES (232, 18, 6);
INSERT INTO `ratings` VALUES (232, 13, 6);
INSERT INTO `ratings` VALUES (232, 15, 4);
INSERT INTO `ratings` VALUES (232, 31, 4);
INSERT INTO `ratings` VALUES (232, 7, 4);
INSERT INTO `ratings` VALUES (232, 10, 7);
INSERT INTO `ratings` VALUES (232, 3, 7);
INSERT INTO `ratings` VALUES (232, 25, 8);
INSERT INTO `ratings` VALUES (232, 12, 3);
INSERT INTO `ratings` VALUES (233, 8, 1);
INSERT INTO `ratings` VALUES (233, 27, 3);
INSERT INTO `ratings` VALUES (233, 12, 10);
INSERT INTO `ratings` VALUES (233, 31, 1);
INSERT INTO `ratings` VALUES (233, 7, 1);
INSERT INTO `ratings` VALUES (233, 9, 6);
INSERT INTO `ratings` VALUES (233, 6, 4);
INSERT INTO `ratings` VALUES (233, 20, 7);
INSERT INTO `ratings` VALUES (233, 30, 1);
INSERT INTO `ratings` VALUES (233, 18, 1);
INSERT INTO `ratings` VALUES (234, 20, 4);
INSERT INTO `ratings` VALUES (234, 10, 8);
INSERT INTO `ratings` VALUES (234, 13, 7);
INSERT INTO `ratings` VALUES (234, 6, 1);
INSERT INTO `ratings` VALUES (234, 30, 1);
INSERT INTO `ratings` VALUES (234, 25, 6);
INSERT INTO `ratings` VALUES (234, 1, 10);
INSERT INTO `ratings` VALUES (234, 16, 5);
INSERT INTO `ratings` VALUES (234, 5, 9);
INSERT INTO `ratings` VALUES (234, 18, 3);
INSERT INTO `ratings` VALUES (235, 18, 10);
INSERT INTO `ratings` VALUES (235, 8, 8);
INSERT INTO `ratings` VALUES (235, 30, 6);
INSERT INTO `ratings` VALUES (235, 16, 7);
INSERT INTO `ratings` VALUES (235, 23, 8);
INSERT INTO `ratings` VALUES (235, 25, 9);
INSERT INTO `ratings` VALUES (235, 9, 8);
INSERT INTO `ratings` VALUES (235, 1, 10);
INSERT INTO `ratings` VALUES (235, 27, 10);
INSERT INTO `ratings` VALUES (235, 0, 10);
INSERT INTO `ratings` VALUES (236, 29, 10);
INSERT INTO `ratings` VALUES (236, 1, 10);
INSERT INTO `ratings` VALUES (236, 30, 1);
INSERT INTO `ratings` VALUES (236, 27, 1);
INSERT INTO `ratings` VALUES (236, 9, 10);
INSERT INTO `ratings` VALUES (236, 3, 10);
INSERT INTO `ratings` VALUES (236, 31, 2);
INSERT INTO `ratings` VALUES (236, 19, 8);
INSERT INTO `ratings` VALUES (236, 16, 10);
INSERT INTO `ratings` VALUES (236, 13, 10);
INSERT INTO `ratings` VALUES (237, 19, 9);
INSERT INTO `ratings` VALUES (237, 22, 6);
INSERT INTO `ratings` VALUES (237, 30, 5);
INSERT INTO `ratings` VALUES (237, 13, 3);
INSERT INTO `ratings` VALUES (237, 20, 6);
INSERT INTO `ratings` VALUES (237, 2, 6);
INSERT INTO `ratings` VALUES (237, 24, 5);
INSERT INTO `ratings` VALUES (237, 15, 4);
INSERT INTO `ratings` VALUES (237, 25, 8);
INSERT INTO `ratings` VALUES (237, 8, 3);
INSERT INTO `ratings` VALUES (238, 25, 9);
INSERT INTO `ratings` VALUES (238, 5, 9);
INSERT INTO `ratings` VALUES (238, 27, 7);
INSERT INTO `ratings` VALUES (238, 24, 5);
INSERT INTO `ratings` VALUES (238, 4, 8);
INSERT INTO `ratings` VALUES (238, 10, 2);
INSERT INTO `ratings` VALUES (238, 28, 2);
INSERT INTO `ratings` VALUES (238, 15, 1);
INSERT INTO `ratings` VALUES (238, 8, 2);
INSERT INTO `ratings` VALUES (238, 19, 8);
INSERT INTO `ratings` VALUES (240, 16, 7);
INSERT INTO `ratings` VALUES (240, 20, 8);
INSERT INTO `ratings` VALUES (240, 23, 7);
INSERT INTO `ratings` VALUES (240, 27, 6);
INSERT INTO `ratings` VALUES (240, 28, 5);
INSERT INTO `ratings` VALUES (240, 9, 7);
INSERT INTO `ratings` VALUES (240, 21, 8);
INSERT INTO `ratings` VALUES (240, 17, 7);
INSERT INTO `ratings` VALUES (240, 1, 8);
INSERT INTO `ratings` VALUES (240, 7, 7);
INSERT INTO `ratings` VALUES (242, 24, 4);
INSERT INTO `ratings` VALUES (242, 22, 7);
INSERT INTO `ratings` VALUES (242, 8, 5);
INSERT INTO `ratings` VALUES (242, 13, 6);
INSERT INTO `ratings` VALUES (242, 17, 7);
INSERT INTO `ratings` VALUES (242, 4, 8);
INSERT INTO `ratings` VALUES (242, 1, 7);
INSERT INTO `ratings` VALUES (242, 29, 2);
INSERT INTO `ratings` VALUES (242, 31, 2);
INSERT INTO `ratings` VALUES (242, 10, 8);
INSERT INTO `ratings` VALUES (243, 7, 8);
INSERT INTO `ratings` VALUES (243, 15, 8);
INSERT INTO `ratings` VALUES (243, 13, 7);
INSERT INTO `ratings` VALUES (243, 24, 6);
INSERT INTO `ratings` VALUES (243, 23, 10);
INSERT INTO `ratings` VALUES (243, 28, 8);
INSERT INTO `ratings` VALUES (243, 21, 6);
INSERT INTO `ratings` VALUES (243, 20, 9);
INSERT INTO `ratings` VALUES (243, 6, 8);
INSERT INTO `ratings` VALUES (243, 18, 9);
INSERT INTO `ratings` VALUES (244, 29, 8);
INSERT INTO `ratings` VALUES (244, 12, 9);
INSERT INTO `ratings` VALUES (244, 17, 8);
INSERT INTO `ratings` VALUES (244, 20, 9);
INSERT INTO `ratings` VALUES (244, 25, 9);
INSERT INTO `ratings` VALUES (244, 19, 9);
INSERT INTO `ratings` VALUES (244, 24, 9);
INSERT INTO `ratings` VALUES (244, 5, 8);
INSERT INTO `ratings` VALUES (244, 9, 9);
INSERT INTO `ratings` VALUES (244, 0, 9);
INSERT INTO `ratings` VALUES (245, 2, 6);
INSERT INTO `ratings` VALUES (245, 24, 3);
INSERT INTO `ratings` VALUES (245, 19, 7);
INSERT INTO `ratings` VALUES (245, 4, 8);
INSERT INTO `ratings` VALUES (245, 22, 10);
INSERT INTO `ratings` VALUES (245, 27, 7);
INSERT INTO `ratings` VALUES (245, 25, 7);
INSERT INTO `ratings` VALUES (245, 31, 2);
INSERT INTO `ratings` VALUES (245, 15, 5);
INSERT INTO `ratings` VALUES (245, 11, 7);
INSERT INTO `ratings` VALUES (246, 17, 7);
INSERT INTO `ratings` VALUES (246, 6, 6);
INSERT INTO `ratings` VALUES (246, 7, 2);
INSERT INTO `ratings` VALUES (246, 8, 3);
INSERT INTO `ratings` VALUES (246, 29, 3);
INSERT INTO `ratings` VALUES (246, 28, 6);
INSERT INTO `ratings` VALUES (246, 0, 8);
INSERT INTO `ratings` VALUES (246, 20, 8);
INSERT INTO `ratings` VALUES (246, 23, 9);
INSERT INTO `ratings` VALUES (246, 30, 1);
INSERT INTO `ratings` VALUES (251, 15, 7);
INSERT INTO `ratings` VALUES (251, 32, 6);
INSERT INTO `ratings` VALUES (251, 2, 7);
INSERT INTO `ratings` VALUES (251, 10, 7);
INSERT INTO `ratings` VALUES (251, 20, 8);
INSERT INTO `ratings` VALUES (251, 25, 7);
INSERT INTO `ratings` VALUES (251, 18, 6);
INSERT INTO `ratings` VALUES (251, 21, 8);
INSERT INTO `ratings` VALUES (251, 22, 7);
INSERT INTO `ratings` VALUES (251, 4, 8);
INSERT INTO `ratings` VALUES (252, 6, 10);
INSERT INTO `ratings` VALUES (252, 9, 7);
INSERT INTO `ratings` VALUES (252, 30, 4);
INSERT INTO `ratings` VALUES (252, 19, 8);
INSERT INTO `ratings` VALUES (252, 17, 10);
INSERT INTO `ratings` VALUES (252, 15, 10);
INSERT INTO `ratings` VALUES (252, 24, 5);
INSERT INTO `ratings` VALUES (252, 25, 7);
INSERT INTO `ratings` VALUES (252, 27, 9);
INSERT INTO `ratings` VALUES (252, 4, 6);
INSERT INTO `ratings` VALUES (253, 7, 8);
INSERT INTO `ratings` VALUES (253, 21, 7);
INSERT INTO `ratings` VALUES (253, 8, 6);
INSERT INTO `ratings` VALUES (253, 0, 8);
INSERT INTO `ratings` VALUES (253, 3, 4);
INSERT INTO `ratings` VALUES (253, 30, 6);
INSERT INTO `ratings` VALUES (253, 4, 8);
INSERT INTO `ratings` VALUES (253, 28, 7);
INSERT INTO `ratings` VALUES (253, 16, 9);
INSERT INTO `ratings` VALUES (253, 15, 9);
INSERT INTO `ratings` VALUES (254, 16, 6);
INSERT INTO `ratings` VALUES (254, 21, 4);
INSERT INTO `ratings` VALUES (254, 1, 5);
INSERT INTO `ratings` VALUES (254, 26, 18);
INSERT INTO `ratings` VALUES (254, 11, 4);
INSERT INTO `ratings` VALUES (254, 20, 8);
INSERT INTO `ratings` VALUES (254, 30, 5);
INSERT INTO `ratings` VALUES (254, 5, 10);
INSERT INTO `ratings` VALUES (254, 32, 8);
INSERT INTO `ratings` VALUES (254, 14, 7);
INSERT INTO `ratings` VALUES (255, 8, 10);
INSERT INTO `ratings` VALUES (255, 21, 10);
INSERT INTO `ratings` VALUES (255, 9, 10);
INSERT INTO `ratings` VALUES (255, 1, 10);
INSERT INTO `ratings` VALUES (255, 12, 10);
INSERT INTO `ratings` VALUES (255, 4, 10);
INSERT INTO `ratings` VALUES (255, 25, 10);
INSERT INTO `ratings` VALUES (255, 6, 10);
INSERT INTO `ratings` VALUES (255, 14, 10);
INSERT INTO `ratings` VALUES (255, 13, 10);
INSERT INTO `ratings` VALUES (256, 2, 7);
INSERT INTO `ratings` VALUES (256, 25, 8);
INSERT INTO `ratings` VALUES (256, 4, 5);
INSERT INTO `ratings` VALUES (256, 12, 7);
INSERT INTO `ratings` VALUES (256, 31, 7);
INSERT INTO `ratings` VALUES (256, 22, 6);
INSERT INTO `ratings` VALUES (256, 18, 8);
INSERT INTO `ratings` VALUES (256, 32, 9);
INSERT INTO `ratings` VALUES (256, 16, 7);
INSERT INTO `ratings` VALUES (256, 15, 9);
INSERT INTO `ratings` VALUES (257, 4, 8);
INSERT INTO `ratings` VALUES (257, 12, 7);
INSERT INTO `ratings` VALUES (257, 25, 8);
INSERT INTO `ratings` VALUES (257, 0, 7);
INSERT INTO `ratings` VALUES (257, 29, 7);
INSERT INTO `ratings` VALUES (257, 8, 5);
INSERT INTO `ratings` VALUES (257, 17, 9);
INSERT INTO `ratings` VALUES (257, 30, 5);
INSERT INTO `ratings` VALUES (257, 2, 6);
INSERT INTO `ratings` VALUES (257, 20, 8);
INSERT INTO `ratings` VALUES (258, 22, 9);
INSERT INTO `ratings` VALUES (258, 6, 7);
INSERT INTO `ratings` VALUES (258, 29, 6);
INSERT INTO `ratings` VALUES (258, 26, 7);
INSERT INTO `ratings` VALUES (258, 15, 6);
INSERT INTO `ratings` VALUES (258, 31, 5);
INSERT INTO `ratings` VALUES (258, 17, 8);
INSERT INTO `ratings` VALUES (258, 23, 9);
INSERT INTO `ratings` VALUES (258, 27, 8);
INSERT INTO `ratings` VALUES (258, 24, 6);

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
