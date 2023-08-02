/*
 Navicat Premium Data Transfer

 Source Server         : local no pw
 Source Server Type    : MySQL
 Source Server Version : 100428
 Source Host           : localhost:3306
 Source Schema         : kasir

 Target Server Type    : MySQL
 Target Server Version : 100428
 File Encoding         : 65001

 Date: 02/08/2023 21:20:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bayars
-- ----------------------------
DROP TABLE IF EXISTS `bayars`;
CREATE TABLE `bayars`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaksi_id` bigint UNSIGNED NOT NULL,
  `harga_total` decimal(15, 0) NOT NULL,
  `bayar` decimal(15, 0) NOT NULL,
  `kembalian` decimal(15, 0) NOT NULL,
  `hutang` decimal(15, 0) NOT NULL,
  `is_refund` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bayars_transaksi_id_foreign`(`transaksi_id` ASC) USING BTREE,
  CONSTRAINT `bayars_transaksi_id_foreign` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksis` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bayars
-- ----------------------------
INSERT INTO `bayars` VALUES (1, 1, 3000, 10000, 7000, 0, 0, '2023-08-02 12:16:25', '2023-08-02 12:16:25', NULL);
INSERT INTO `bayars` VALUES (2, 2, 15000, 20000, 5000, 0, 0, '2023-08-02 12:17:04', '2023-08-02 12:17:04', NULL);
INSERT INTO `bayars` VALUES (3, 3, 24000, 25000, 1000, 0, 0, '2023-08-02 12:19:54', '2023-08-02 12:19:54', NULL);

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for inventaris
-- ----------------------------
DROP TABLE IF EXISTS `inventaris`;
CREATE TABLE `inventaris`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `produk_id` bigint UNSIGNED NULL DEFAULT NULL,
  `transaksi_id` bigint UNSIGNED NULL DEFAULT NULL,
  `stok` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `inventaris_produk_id_foreign`(`produk_id` ASC) USING BTREE,
  INDEX `inventaris_transaksi_id_foreign`(`transaksi_id` ASC) USING BTREE,
  CONSTRAINT `inventaris_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produks` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `inventaris_transaksi_id_foreign` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksis` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inventaris
-- ----------------------------
INSERT INTO `inventaris` VALUES (1, 1, NULL, 20, '2023-08-02 12:14:54', '2023-08-02 12:14:54', NULL);
INSERT INTO `inventaris` VALUES (2, 1, 1, -2, '2023-08-02 12:16:25', '2023-08-02 12:16:25', NULL);
INSERT INTO `inventaris` VALUES (3, 1, 2, -10, '2023-08-02 12:17:04', '2023-08-02 12:17:04', NULL);
INSERT INTO `inventaris` VALUES (4, 1, NULL, 12, '2023-08-02 12:17:57', '2023-08-02 12:17:57', NULL);
INSERT INTO `inventaris` VALUES (5, 1, 3, -16, '2023-08-02 12:19:54', '2023-08-02 12:19:54', NULL);
INSERT INTO `inventaris` VALUES (6, 2, NULL, 30, '2023-08-02 12:28:10', '2023-08-02 12:28:10', NULL);
INSERT INTO `inventaris` VALUES (7, 3, NULL, 30, '2023-08-02 12:32:36', '2023-08-02 12:32:36', NULL);

-- ----------------------------
-- Table structure for kas
-- ----------------------------
DROP TABLE IF EXISTS `kas`;
CREATE TABLE `kas`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `nama_transaksi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominal` decimal(15, 0) NOT NULL,
  `jenis` enum('masuk','keluar') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `catatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `kas_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `kas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kas
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_reset_tokens_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2023_06_20_144000_create_sesis_table', 1);
INSERT INTO `migrations` VALUES (6, '2023_06_20_170355_create_kas_table', 1);
INSERT INTO `migrations` VALUES (7, '2023_06_20_170837_create_produk_kategoris_table', 1);
INSERT INTO `migrations` VALUES (8, '2023_06_20_171021_create_produks_table', 1);
INSERT INTO `migrations` VALUES (9, '2023_06_20_173342_create_produk_grosirs_table', 1);
INSERT INTO `migrations` VALUES (10, '2023_06_20_173343_create_pelanggans_table', 1);
INSERT INTO `migrations` VALUES (11, '2023_06_20_173559_create_transaksis_table', 1);
INSERT INTO `migrations` VALUES (12, '2023_06_20_174949_create_transaksi_details_table', 1);
INSERT INTO `migrations` VALUES (13, '2023_06_20_174950_create_inventaris_table', 1);
INSERT INTO `migrations` VALUES (14, '2023_06_20_175217_create_bayars_table', 1);

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for pelanggans
-- ----------------------------
DROP TABLE IF EXISTS `pelanggans`;
CREATE TABLE `pelanggans`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pelanggans
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for produk_grosirs
-- ----------------------------
DROP TABLE IF EXISTS `produk_grosirs`;
CREATE TABLE `produk_grosirs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `produk_id` bigint UNSIGNED NOT NULL,
  `minimal` int NOT NULL,
  `harga_grosir` decimal(15, 0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `produk_grosirs_produk_id_foreign`(`produk_id` ASC) USING BTREE,
  CONSTRAINT `produk_grosirs_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produks` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of produk_grosirs
-- ----------------------------
INSERT INTO `produk_grosirs` VALUES (1, 1, 1, 1500, '2023-08-02 12:14:54', '2023-08-02 12:14:54', NULL);
INSERT INTO `produk_grosirs` VALUES (2, 2, 1, 3500, '2023-08-02 12:28:10', '2023-08-02 12:28:10', NULL);
INSERT INTO `produk_grosirs` VALUES (3, 3, 1, 2500, '2023-08-02 12:32:36', '2023-08-02 12:32:36', NULL);

-- ----------------------------
-- Table structure for produk_kategoris
-- ----------------------------
DROP TABLE IF EXISTS `produk_kategoris`;
CREATE TABLE `produk_kategoris`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `urutan` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `produk_kategoris_nama_unique`(`nama` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of produk_kategoris
-- ----------------------------
INSERT INTO `produk_kategoris` VALUES (1, 'makanan', 1, '2023-08-02 12:14:11', '2023-08-02 12:14:11', NULL);

-- ----------------------------
-- Table structure for produks
-- ----------------------------
DROP TABLE IF EXISTS `produks`;
CREATE TABLE `produks`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `produk_kategori_id` bigint UNSIGNED NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_beli` decimal(15, 0) NOT NULL,
  `harga_jual` decimal(15, 0) NOT NULL,
  `harga_pelanggan` decimal(15, 0) NULL DEFAULT NULL,
  `satuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `limit_stok` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `produks_nama_unique`(`nama` ASC) USING BTREE,
  UNIQUE INDEX `produks_sku_unique`(`sku` ASC) USING BTREE,
  INDEX `produks_produk_kategori_id_foreign`(`produk_kategori_id` ASC) USING BTREE,
  CONSTRAINT `produks_produk_kategori_id_foreign` FOREIGN KEY (`produk_kategori_id`) REFERENCES `produk_kategoris` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of produks
-- ----------------------------
INSERT INTO `produks` VALUES (1, 1, 'mie sedap', '123', 1000, 2000, 1500, 'pcs', 10, '2023-08-02 12:14:54', '2023-08-02 12:14:54', NULL);
INSERT INTO `produks` VALUES (2, 1, 'Mie Indomie', '12231', 3000, 4000, 3500, 'pcs', 10, '2023-08-02 12:28:10', '2023-08-02 12:28:10', NULL);
INSERT INTO `produks` VALUES (3, 1, 'mie abc', '1331', 1500, 3000, 2500, 'pcs', 15, '2023-08-02 12:32:36', '2023-08-02 12:32:36', NULL);

-- ----------------------------
-- Table structure for sesis
-- ----------------------------
DROP TABLE IF EXISTS `sesis`;
CREATE TABLE `sesis`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `status` enum('mulai','selesai') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'mulai',
  `waktu_mulai` datetime NOT NULL,
  `waktu_selesai` datetime NOT NULL,
  `saldo_awal` decimal(15, 0) NULL DEFAULT NULL,
  `saldo_akhir` decimal(15, 0) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sesis_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `sesis_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sesis
-- ----------------------------
INSERT INTO `sesis` VALUES (1, 1, 'mulai', '2023-08-02 12:15:54', '2023-08-02 23:59:59', 10000, NULL, '2023-08-02 12:15:54', '2023-08-02 12:15:54', NULL);

-- ----------------------------
-- Table structure for transaksi_details
-- ----------------------------
DROP TABLE IF EXISTS `transaksi_details`;
CREATE TABLE `transaksi_details`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaksi_id` bigint UNSIGNED NOT NULL,
  `produk_id` bigint UNSIGNED NULL DEFAULT NULL,
  `jumlah_beli` int NOT NULL,
  `harga_satuan` decimal(15, 0) NULL DEFAULT NULL,
  `harga_total` decimal(15, 0) NULL DEFAULT NULL,
  `jumlah_refund` int NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `transaksi_details_transaksi_id_foreign`(`transaksi_id` ASC) USING BTREE,
  INDEX `transaksi_details_produk_id_foreign`(`produk_id` ASC) USING BTREE,
  CONSTRAINT `transaksi_details_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produks` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `transaksi_details_transaksi_id_foreign` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksis` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transaksi_details
-- ----------------------------
INSERT INTO `transaksi_details` VALUES (1, 1, 1, 2, 1500, 3000, 0, '2023-08-02 12:16:06', '2023-08-02 12:16:09', NULL);
INSERT INTO `transaksi_details` VALUES (2, 2, 1, 10, 1500, 15000, 0, '2023-08-02 12:16:48', '2023-08-02 12:16:53', NULL);
INSERT INTO `transaksi_details` VALUES (3, 3, 1, 16, 1500, 24000, 0, '2023-08-02 12:18:49', '2023-08-02 12:19:33', NULL);

-- ----------------------------
-- Table structure for transaksis
-- ----------------------------
DROP TABLE IF EXISTS `transaksis`;
CREATE TABLE `transaksis`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` bigint UNSIGNED NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `pelanggan_id` bigint UNSIGNED NULL DEFAULT NULL,
  `kode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('proses','selesai','pending') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'proses',
  `nama_pembeli` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_counted` tinyint(1) NOT NULL DEFAULT 0,
  `is_lunas` tinyint(1) NOT NULL DEFAULT 0,
  `is_hutang` tinyint(1) NOT NULL DEFAULT 0,
  `is_refund` tinyint(1) NOT NULL DEFAULT 0,
  `alasan_refund` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `waktu_transaksi` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `transaksis_parent_id_foreign`(`parent_id` ASC) USING BTREE,
  INDEX `transaksis_user_id_foreign`(`user_id` ASC) USING BTREE,
  INDEX `transaksis_pelanggan_id_foreign`(`pelanggan_id` ASC) USING BTREE,
  CONSTRAINT `transaksis_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `transaksis` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `transaksis_pelanggan_id_foreign` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggans` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `transaksis_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transaksis
-- ----------------------------
INSERT INTO `transaksis` VALUES (1, NULL, 1, NULL, 'TRX2308020001', 'selesai', 'hasan', 1, 1, 0, 0, NULL, '2023-08-02 12:16:25', '2023-08-02 12:15:57', '2023-08-02 12:16:25', NULL);
INSERT INTO `transaksis` VALUES (2, NULL, 1, NULL, 'TRX2308020002', 'selesai', 'ardan', 1, 1, 0, 0, NULL, '2023-08-02 12:17:04', '2023-08-02 12:16:25', '2023-08-02 12:17:04', NULL);
INSERT INTO `transaksis` VALUES (3, NULL, 1, NULL, 'TRX2308020003', 'selesai', 'luthfi', 1, 1, 0, 0, NULL, '2023-08-02 12:19:54', '2023-08-02 12:17:04', '2023-08-02 12:19:54', NULL);
INSERT INTO `transaksis` VALUES (4, NULL, 1, NULL, 'TRX2308020004', 'proses', NULL, 0, 0, 0, 0, NULL, NULL, '2023-08-02 12:19:54', '2023-08-02 12:19:54', NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `telepon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','kasir') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'kasir',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_username_unique`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Test Admin', 'Jr. Baabur Royan No. 261, Tegal 51457, Malut', '(+62) 961 5204 2407', 'admin', '$2y$10$gFs/nwE8qvG4pFOT3HCO8usr3Z1wd21wXzB.T4mEC53wMD4O.WO3u', 'admin', '2023-08-02 12:09:40', '2023-08-02 12:09:40', NULL);
INSERT INTO `users` VALUES (2, 'Faizah Safitri', 'Jln. Baya Kali Bungur No. 812, Jayapura 23397, Sumbar', '(+62) 924 7803 846', 'emas63', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'kasir', '2023-08-02 12:09:40', '2023-08-02 12:09:40', NULL);
INSERT INTO `users` VALUES (3, 'Joko Prasetyo', 'Ki. Gajah No. 31, Magelang 31789, Banten', '0401 0594 5828', 'jefri.narpati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'kasir', '2023-08-02 12:09:40', '2023-08-02 12:09:40', NULL);
INSERT INTO `users` VALUES (4, 'Irwan Situmorang', 'Ds. Suprapto No. 474, Banjarmasin 69528, Lampung', '(+62) 831 058 860', 'maryadi.yulianti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'kasir', '2023-08-02 12:09:40', '2023-08-02 12:09:40', NULL);
INSERT INTO `users` VALUES (5, 'Yance Nuraini', 'Ki. Ikan No. 292, Singkawang 94820, Kepri', '(+62) 949 9593 6203', 'oskar.gunarto', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'kasir', '2023-08-02 12:09:40', '2023-08-02 12:09:40', NULL);
INSERT INTO `users` VALUES (6, 'Putri Mila Rahayu', 'Kpg. Sumpah Pemuda No. 356, Kotamobagu 63657, NTT', '0456 4613 603', 'qsuryatmi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'kasir', '2023-08-02 12:09:40', '2023-08-02 12:09:40', NULL);
INSERT INTO `users` VALUES (7, 'Elvina Lintang Purwanti S.IP', 'Jln. Batako No. 289, Administrasi Jakarta Utara 50668, Jabar', '(+62) 793 7343 2667', 'oyuniar', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'kasir', '2023-08-02 12:09:40', '2023-08-02 12:09:40', NULL);
INSERT INTO `users` VALUES (8, 'Bella Nilam Aryani', 'Dk. Gambang No. 294, Probolinggo 94928, Sulteng', '(+62) 395 6080 202', 'saragih.hendri', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'kasir', '2023-08-02 12:09:40', '2023-08-02 12:09:40', NULL);
INSERT INTO `users` VALUES (9, 'Atma Maulana', 'Kpg. Urip Sumoharjo No. 628, Administrasi Jakarta Timur 83072, Papua', '(+62) 378 2047 6411', 'jamalia32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'kasir', '2023-08-02 12:09:40', '2023-08-02 12:09:40', NULL);
INSERT INTO `users` VALUES (10, 'Cakrabirawa Jumadi Sinaga M.M.', 'Jr. Kebangkitan Nasional No. 992, Pasuruan 45335, Lampung', '0949 3889 5182', 'naradi36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'kasir', '2023-08-02 12:09:40', '2023-08-02 12:09:40', NULL);

-- ----------------------------
-- View structure for v_limit
-- ----------------------------
DROP VIEW IF EXISTS `v_limit`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_limit` AS SELECT produks.id,produks.nama,produks.limit_stok, sum(inventaris.stok) as stok  FROM `produks` LEFT JOIN inventaris on inventaris.produk_id = produks.id GROUP BY produks.nama,produks.limit_stok, produks.id ;

-- ----------------------------
-- View structure for v_limitfornotication
-- ----------------------------
DROP VIEW IF EXISTS `v_limitfornotication`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_limitfornotication` AS SELECT * FROM `v_limit` WHERE `limit_stok` >= `stok` limit 3 ;

SET FOREIGN_KEY_CHECKS = 1;
