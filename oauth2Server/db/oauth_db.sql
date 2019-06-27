/*
 Navicat Premium Data Transfer

 Source Server         : ylsm_aliyun
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : rm-uf6m89g4jeob19s2mo.mysql.rds.aliyuncs.com:3306
 Source Schema         : oauth_db

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 21/09/2018 16:54:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oauth2_access_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth2_access_token`;
CREATE TABLE `oauth2_access_token`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `token_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `app_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'key',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名',
  `expires` datetime(0) NOT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `access_token`(`access_token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 254 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth2_access_token
-- ----------------------------
INSERT INTO `oauth2_access_token` VALUES (190, 'UQIT6bnEJKBhZsgMZFu7zFVEuIzGfZgX', 'nomal', 'wwwthings', 'luoke-chengdu', '2018-09-21 13:52:43');
INSERT INTO `oauth2_access_token` VALUES (191, 'E9pbdHHNVcsc6EJA0PFTRiqcSg9ExInD', 'nomal', 'wwwthings', 'admin', '2018-09-22 00:47:56');
INSERT INTO `oauth2_access_token` VALUES (192, 'ZeiXAcwGYG49tIuOGmSj9EpY96PuAMsW', 'nomal', 'wwwthings', 'luoke-chengdu', '2018-09-22 14:33:19');
INSERT INTO `oauth2_access_token` VALUES (193, 'ZRSeowbEIZPZxpuLLJqF7ofF4TAxMI6M', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 15:06:08');
INSERT INTO `oauth2_access_token` VALUES (194, '2OPn9XF88JIjwkDHLUTNxk7j7h4OHhs0', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 15:06:45');
INSERT INTO `oauth2_access_token` VALUES (195, 'Maq60zsAapTOrHYNBP5uFAlkCUUTWWkD', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 15:08:35');
INSERT INTO `oauth2_access_token` VALUES (196, '34TFplJb9RXwYLI1jjxry0kGT2TGHJIR', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 15:10:00');
INSERT INTO `oauth2_access_token` VALUES (197, 'Cw9257EQkSIigJgXvZwA8XVG3tMAsz8p', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 15:10:31');
INSERT INTO `oauth2_access_token` VALUES (198, 'yzh2XJQmsoZp3sEkF2AEOmU60z9RV7Pf', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 15:11:05');
INSERT INTO `oauth2_access_token` VALUES (199, 'VoShnb02tjG7K8sbDtavoM9DZGpehxBS', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 15:11:58');
INSERT INTO `oauth2_access_token` VALUES (200, 'qHcrfJqoFLhVN295zhO6teF2hcWarztl', 'nomal', 'wwwthings', 'ticket_005', '2018-09-22 15:12:31');
INSERT INTO `oauth2_access_token` VALUES (201, 'I6IjRtxhgdvkydQlJo2WtdEtCanq2I1g', 'nomal', 'wwwthings', 'ticket_005', '2018-09-22 15:12:40');
INSERT INTO `oauth2_access_token` VALUES (202, 'mt1MNz4nVkIryG0WZzToEuw2njrNwXND', 'nomal', 'wwwthings', 'ticket_004', '2018-09-22 15:13:19');
INSERT INTO `oauth2_access_token` VALUES (203, 'PW5sV2yTYkPXHG01CT2TzlWmxKsLRA4v', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 15:13:22');
INSERT INTO `oauth2_access_token` VALUES (204, '8t1nm2WDRtLfJpvVYIITvZddaQNPccuT', 'nomal', 'wwwthings', 'ticket_004', '2018-09-22 15:13:53');
INSERT INTO `oauth2_access_token` VALUES (205, 'eJHW9iSGXlznLwvAWNs8VcKjE7emHuvS', 'nomal', 'wwwthings', 'ticket_005', '2018-09-22 15:13:57');
INSERT INTO `oauth2_access_token` VALUES (206, 'UchOOKTmPnbyIYaNXXNIjYOlGuUxUnxD', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 15:14:22');
INSERT INTO `oauth2_access_token` VALUES (207, '7FzMMikd8eLJux2iwYO4oPyspr9uTbUx', 'nomal', 'wwwthings', 'ticket_002', '2018-09-22 15:14:37');
INSERT INTO `oauth2_access_token` VALUES (208, 'grS7m5rl0CO1VArnoXAWrqTDh93AHnbp', 'nomal', 'wwwthings', 'ticket_005', '2018-09-22 15:14:43');
INSERT INTO `oauth2_access_token` VALUES (209, 'kQrP7xvABgGxkDVlTSnzQF93KbpzgC5V', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 15:14:48');
INSERT INTO `oauth2_access_token` VALUES (210, '10sjGUgbO5b6KdEqzRtafYbnUzdPwPaS', 'nomal', 'wwwthings', 'ticket_004', '2018-09-22 15:15:02');
INSERT INTO `oauth2_access_token` VALUES (211, '1uMO0sUY8I4ESydwhUvMmI1pq4sGHOgo', 'nomal', 'wwwthings', 'ticket_004', '2018-09-22 15:15:16');
INSERT INTO `oauth2_access_token` VALUES (212, 'cMteDAWcGk7KgTX7LLfBr8L0XdFa8J5g', 'nomal', 'wwwthings', 'ticket_005', '2018-09-22 15:15:43');
INSERT INTO `oauth2_access_token` VALUES (213, 'xbCSMv1QstKU66R1qm2VAqPPGB4PhvL2', 'nomal', 'wwwthings', 'ticket_004', '2018-09-22 15:16:36');
INSERT INTO `oauth2_access_token` VALUES (214, '4t2jsqGDPVCAvgGc5a8KKdimZZe6KN3T', 'nomal', 'wwwthings', 'ticket_004', '2018-09-22 15:17:08');
INSERT INTO `oauth2_access_token` VALUES (215, 'Q4RgeAV4sDCEn3OwPcXSTkVMaVZ1ADG7', 'nomal', 'wwwthings', 'ticket_004', '2018-09-22 15:17:45');
INSERT INTO `oauth2_access_token` VALUES (216, 'YEqOMHVi9jMNnmdFKj9jggC132hm83x3', 'nomal', 'wwwthings', 'ticket_005', '2018-09-22 15:17:54');
INSERT INTO `oauth2_access_token` VALUES (217, 'GafhR5nx2ypMeYIERCPeeVpPiXlKefR5', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 15:18:03');
INSERT INTO `oauth2_access_token` VALUES (218, 'Qy249FH0A8nGSyU45ybD5Xb9rb9v1MdY', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 15:18:08');
INSERT INTO `oauth2_access_token` VALUES (219, 'cN5CunjaLdLUktjIjxBu6rfSjaJvhnTN', 'nomal', 'wwwthings', 'ticket_004', '2018-09-22 15:18:19');
INSERT INTO `oauth2_access_token` VALUES (220, 'Pz8lPJrj0H9jtLVwYZIBWuCUxBV8jmsf', 'nomal', 'wwwthings', 'ticket_003', '2018-09-22 15:18:24');
INSERT INTO `oauth2_access_token` VALUES (221, '5TG5ctWcMaMIQ1ZhmWGDoh93DlbRJhZT', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 15:18:40');
INSERT INTO `oauth2_access_token` VALUES (222, 'AmTMFrklGcjkKRUp7w3q2Xb6WbTsHZTs', 'nomal', 'wwwthings', 'ticket_004', '2018-09-22 15:27:31');
INSERT INTO `oauth2_access_token` VALUES (223, 'OXfooAyBRIg0T3quEcuJF06w0urVJ1cm', 'nomal', 'wwwthings', 'ticket_004', '2018-09-22 15:27:39');
INSERT INTO `oauth2_access_token` VALUES (224, 'qMMa2VQjtgSJ9kOkSBHWdXzC4wb5w2RL', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 15:29:37');
INSERT INTO `oauth2_access_token` VALUES (225, 'lCAC7OGRlANXvw6PghUcvZhQSkUPpmvW', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 15:42:56');
INSERT INTO `oauth2_access_token` VALUES (226, 'WnHNBPCdlXajRI88h38ah66CrdbfsVLy', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 15:55:58');
INSERT INTO `oauth2_access_token` VALUES (227, 'SMoqzoTrW3DUtUCImBDoRN9F9UML6ZRe', 'nomal', 'wwwthings', 'ticket_004', '2018-09-22 16:02:17');
INSERT INTO `oauth2_access_token` VALUES (228, 'sXSgqBV54bFarDbRJdo3Ibj8qupo62ZZ', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 16:04:25');
INSERT INTO `oauth2_access_token` VALUES (229, 'xUGa6VqQJDqkvQKom2zTiIM2NLIHIc0V', 'nomal', 'wwwthings', 'ticket_004', '2018-09-22 16:06:02');
INSERT INTO `oauth2_access_token` VALUES (230, 'chHogT8TcLAD98U7o1grIGAzSIB5entd', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 16:09:28');
INSERT INTO `oauth2_access_token` VALUES (231, '3RsHKXy3ueyuqO2LVLGT9z3VtyKkqr4c', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 16:11:31');
INSERT INTO `oauth2_access_token` VALUES (232, 'Xik21KEvzfaZDJyfzQvwlp3nJyWIE8zY', 'nomal', 'wwwthings', 'ticket_002', '2018-09-22 16:14:20');
INSERT INTO `oauth2_access_token` VALUES (233, 'q69b4lsuMXrnrdZRXx4ueBm8WaoWzC09', 'nomal', 'wwwthings', 'ticket_004', '2018-09-22 16:17:38');
INSERT INTO `oauth2_access_token` VALUES (234, 'g5wtwtZFd7yGuKUB9Ae96egJBk1maAld', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 16:17:49');
INSERT INTO `oauth2_access_token` VALUES (235, 'QeHgrJWMwCnoBi6tCFX76V2Esd39BEUW', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 16:20:18');
INSERT INTO `oauth2_access_token` VALUES (236, 'euYBH4J5eLDgfW48jRUaxVOcsrvBoxXq', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 16:20:50');
INSERT INTO `oauth2_access_token` VALUES (237, 'iqe1b90BuXxaNx02em16eZOEpcJpjlKs', 'nomal', 'wwwthings', 'ticket_003', '2018-09-22 16:21:39');
INSERT INTO `oauth2_access_token` VALUES (238, 'MHeyjMOk6f9BZ7ylvxoRRdkcTRBaIo6s', 'nomal', 'wwwthings', 'ticket_004', '2018-09-22 16:21:39');
INSERT INTO `oauth2_access_token` VALUES (239, '35F3xwbx8P1ABdcgJ7TCbBNO130h1Mmj', 'nomal', 'wwwthings', 'ticket_004', '2018-09-22 16:22:50');
INSERT INTO `oauth2_access_token` VALUES (240, 'flsZPGKxKV1S4Es1aaC7g9beRqp0EwW7', 'nomal', 'wwwthings', 'ticket_004', '2018-09-22 16:23:27');
INSERT INTO `oauth2_access_token` VALUES (241, '6VI9AFAKkc40zFbtynIOzB3O8jOPwSPW', 'nomal', 'wwwthings', 'fengsheng_test', '2018-09-22 16:29:13');
INSERT INTO `oauth2_access_token` VALUES (242, 'FWiK8tc677Xs3mDGhpwoUgSzxOoDm80Z', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 16:33:02');
INSERT INTO `oauth2_access_token` VALUES (243, 'KnQC36bHX6GmRMtIDmTkw1QZcdZn0Fyr', 'nomal', 'wwwthings', 'fengsheng_test', '2018-09-22 16:33:03');
INSERT INTO `oauth2_access_token` VALUES (244, 'gzJfAsbpiKxjoa9bwnXJRRQVbJclDpKi', 'nomal', 'wwwthings', 'ticket_005', '2018-09-22 16:33:31');
INSERT INTO `oauth2_access_token` VALUES (245, 'sHTwaql2VlLIooZF1vz62nezLYOvn5zq', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 16:38:22');
INSERT INTO `oauth2_access_token` VALUES (246, 'ivmbnI3WJrDQhM0fF1nPu0lbGwGdHNST', 'nomal', 'wwwthings', 'ylsm_2398', '2018-09-22 17:00:21');
INSERT INTO `oauth2_access_token` VALUES (247, 'PNYl4zQWwuzsWBVpCSeyGlwSmXEznlte', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 19:05:33');
INSERT INTO `oauth2_access_token` VALUES (248, 'hDisDseimaVzSIfWJ6tLd1JQgC4MUBJd', 'nomal', 'wwwthings', 'ticket_003', '2018-09-22 19:06:36');
INSERT INTO `oauth2_access_token` VALUES (249, 'ON7QQkm8riBn2iDgNsVPNr4rtCoJa4We', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 19:21:20');
INSERT INTO `oauth2_access_token` VALUES (250, 'SkTM0TTrSKgyUcUof8T09w0z5qhswJE6', 'nomal', 'wwwthings', 'ticket_001', '2018-09-22 19:42:00');
INSERT INTO `oauth2_access_token` VALUES (251, 'JIuvMRlMDodRmVsoj9VRrAVNaMuwxBRA', 'nomal', 'wwwthings', 'fengsheng_test', '2018-09-22 19:42:50');
INSERT INTO `oauth2_access_token` VALUES (252, 'FH9gIjtvu5v4878mixycShpp3hk3JVNZ', 'nomal', 'wwwthings', 'fengsheng_test', '2018-09-22 19:56:59');
INSERT INTO `oauth2_access_token` VALUES (253, 'I0ywLTFRrumwH64XCeWu6METvPhkWJKR', 'nomal', 'wwwthings', 'luoke-chengdu', '2018-09-22 20:18:41');

-- ----------------------------
-- Table structure for oauth2_client_tbl
-- ----------------------------
DROP TABLE IF EXISTS `oauth2_client_tbl`;
CREATE TABLE `oauth2_client_tbl`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `app_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `expire_time` datetime(0) NOT NULL COMMENT '超时时间',
  `strict_sign` int(255) NULL DEFAULT NULL COMMENT '是否强制验签:0：用户自定义，1：强制',
  `strict_verify` int(11) NOT NULL DEFAULT 1 COMMENT '是否强制验证码:0：用户自定义，1：强制',
  `token_expire_time` int(11) NOT NULL COMMENT 'token过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth2_client_tbl
-- ----------------------------
INSERT INTO `oauth2_client_tbl` VALUES (1, 'wwwthings', '4EE0A9A43B9B911C067BEE5CC50A9972', '2025-01-01 00:00:00', NULL, 1, 100000);
INSERT INTO `oauth2_client_tbl` VALUES (2, 'apiserver', '98D93FEB1370D9F35DA3FFFE6083F906\r\n', '2025-01-01 00:00:00', NULL, 0, 100000);

-- ----------------------------
-- Table structure for oauth2_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth2_refresh_token`;
CREATE TABLE `oauth2_refresh_token`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refresh_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `token_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `app_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `expires` datetime(0) NOT NULL,
  `token_expire_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `refresh_token`(`refresh_token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 254 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth2_refresh_token
-- ----------------------------
INSERT INTO `oauth2_refresh_token` VALUES (189, 'ljksZnuUiZwUYHAdMaH25kMzdqy0kv6T', 'nomal', 'wwwthings', 'luoke-chengdu', '2018-09-21 22:58:22', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (190, 'FTdtmTjM3nZU4ObM9hdMfQPmi525fWDH', 'nomal', 'wwwthings', 'luoke-chengdu', '2018-09-22 17:39:23', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (191, 'cvFwIvKZ82WdLXpnwTNvMs7wRNSxKJsh', 'nomal', 'wwwthings', 'admin', '2018-09-23 04:34:36', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (192, 'zq10CVC5tqscYG35sN3m8CwNc2R2P7Vn', 'nomal', 'wwwthings', 'luoke-chengdu', '2018-09-23 18:19:59', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (193, '5aKOBO7uP7CcF7TxoTZG1h0Koxh84JQW', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 18:52:48', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (194, 'oOd0KI949ZiH2DrE3ph1H6JvMOa3zhrt', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 18:53:25', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (195, 'Ax6fZTptwyQ1CVTxuK5oqEljNpS0SmVj', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 18:55:15', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (196, 'M5tD1Zxhq8iWCu3cteBlIzbehjyAOsQQ', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 18:56:40', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (197, 'NvIAeZz0ptF9xr9Ws0bRZYUvTvtRFXtd', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 18:57:11', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (198, 'zSIp4aBH2GiI15rEegQ6V35SIEkCPtDL', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 18:57:45', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (199, 'BhIcG1e43baUkdJji3FFUUwRa4d50TRy', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 18:58:38', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (200, '9IuK7gOdTlcZlrhJFrYiVqbqvzMQDX6d', 'nomal', 'wwwthings', 'ticket_005', '2018-09-23 18:59:11', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (201, 'cLU7KDCSl8DfgVlPJEPRcCXI6fYeWZmI', 'nomal', 'wwwthings', 'ticket_005', '2018-09-23 18:59:20', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (202, 'avgW900D4NwHenRBZ0xNLkOFzDe3o8Qx', 'nomal', 'wwwthings', 'ticket_004', '2018-09-23 18:59:59', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (203, 'YrQhq4VgkGYWwSdnLt4dwLikj6ZQbMb8', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 19:00:03', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (204, 'dZlPEVNOq8YnSpn2afb8isyq6Oc9WD4Q', 'nomal', 'wwwthings', 'ticket_004', '2018-09-23 19:00:33', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (205, 'nB4pfcpNkzGlcIIixJcs64jvUeNjXXK8', 'nomal', 'wwwthings', 'ticket_005', '2018-09-23 19:00:37', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (206, 'r6AZvgjOS5CFxLVgAG6nS4E17QnZenND', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 19:01:02', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (207, 'yUTXCnIpJx9ubtTHxw4DCl8TNsvU2m8N', 'nomal', 'wwwthings', 'ticket_002', '2018-09-23 19:01:17', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (208, 'hOX45tZGvRVyXFo6mmtKCLxLuNneTtgW', 'nomal', 'wwwthings', 'ticket_005', '2018-09-23 19:01:23', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (209, 'h8cIQmzq4V2ZoPx59cHyCSdGYgJ6VD2Q', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 19:01:28', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (210, 'TFeC9Od3ycNtIJIg0r03baKVYguEmwZ7', 'nomal', 'wwwthings', 'ticket_004', '2018-09-23 19:01:42', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (211, 'KvIBBsarM5RIbT5R6qixp7p5G8iErZ43', 'nomal', 'wwwthings', 'ticket_004', '2018-09-23 19:01:56', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (212, 'irnvZ0jRW65LhFmLgjGwpZQxoVAL618k', 'nomal', 'wwwthings', 'ticket_005', '2018-09-23 19:02:23', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (213, 'PSfKCLjZuup9ZKy1BY1GF3xKfRLfcQJJ', 'nomal', 'wwwthings', 'ticket_004', '2018-09-23 19:03:17', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (214, '9eNDs7E9HtWWj1p4DmMaNS7RaLyuYeB6', 'nomal', 'wwwthings', 'ticket_004', '2018-09-23 19:03:48', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (215, 'HyJkwg5OMCD9CRBbkvb0xqMQUHAL3Gvw', 'nomal', 'wwwthings', 'ticket_004', '2018-09-23 19:04:25', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (216, 'Nlw2UJmSdGW8Ga1Bd7tLivsGj6zYXadV', 'nomal', 'wwwthings', 'ticket_005', '2018-09-23 19:04:34', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (217, 'thtm11JQpsBZqJR8ZpPH8vpz7y54u88P', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 19:04:43', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (218, '1vZggdNSBDuyKG9VJxOEjA9ni72axpUF', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 19:04:48', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (219, 'whuBM8vKSm2Kef4dY8JWiIBZlXpaWKJv', 'nomal', 'wwwthings', 'ticket_004', '2018-09-23 19:04:59', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (220, '9u69MbeII7FaUlxMVi7SJU7KXFmDXWxK', 'nomal', 'wwwthings', 'ticket_003', '2018-09-23 19:05:04', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (221, 'qkOqP9539qGBCakDRHTTvK2H13DJJwXa', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 19:05:21', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (222, 'eHrY76NBC93ezRMBk1pAE51trFtM2vIW', 'nomal', 'wwwthings', 'ticket_004', '2018-09-23 19:14:11', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (223, '9jP1SL32NVKdLWyXYD2cP5usI6sKwg9b', 'nomal', 'wwwthings', 'ticket_004', '2018-09-23 19:14:20', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (224, 'yOdUaQx4v9fha6Rhp4nZsHYpDI7fMyrd', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 19:16:17', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (225, 'WKLtkjyilq6ycXWIazE5Hpb66rKPC7d8', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 19:29:36', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (226, 'zkLVwpudDlV6qoEK31TDRuV4xWSgtpWd', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 19:42:38', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (227, '1GgDol0EEobkuE3hTlVUY4VsdVpMZWUz', 'nomal', 'wwwthings', 'ticket_004', '2018-09-23 19:48:58', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (228, '8Vbchu7lNNruyQL9h8iikpIQefDvE3Tl', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 19:51:05', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (229, 'moCJVUgivZElzkQsTDjFVWc6SgwqVFb4', 'nomal', 'wwwthings', 'ticket_004', '2018-09-23 19:52:42', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (230, '2V9jBcjQKdU2eqd7ufY9bFr8xObFnqi2', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 19:56:08', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (231, '2eoiNa8NRrdvB0oWJ27jBxsUPwRRil7i', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 19:58:11', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (232, 'MXANCgK8QHsisxwDbCFPamY8NfHbtLbS', 'nomal', 'wwwthings', 'ticket_002', '2018-09-23 20:01:00', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (233, 'a6azM82dhDtS2xxQv4iOGuwjPF4bor5n', 'nomal', 'wwwthings', 'ticket_004', '2018-09-23 20:04:18', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (234, 'KZDldpyV8EE4ClcHsW8CgT19bF1jmKm8', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 20:04:29', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (235, '9BxfILNpTDSC3wzle9oFpTMy11EEqnyW', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 20:06:58', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (236, '2Yf5TfPXqmspAhOUzqlsyMUU1BryghKv', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 20:07:30', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (237, 'NPNt59FqizlOxJuKmx8TI3hsHG2xS1wG', 'nomal', 'wwwthings', 'ticket_003', '2018-09-23 20:08:19', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (238, 'tNLl3x40n2DwbTYFfhQU4ZqjFQmmhCfz', 'nomal', 'wwwthings', 'ticket_004', '2018-09-23 20:08:19', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (239, 'Ii4b1eNep2PahvKjXn2dWhjD6sJ4ZuIA', 'nomal', 'wwwthings', 'ticket_004', '2018-09-23 20:09:30', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (240, 'YLyF55YhqYWVqojRaGPoFX9iv9GROFrR', 'nomal', 'wwwthings', 'ticket_004', '2018-09-23 20:10:07', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (241, 'lwo1OStoTx9k9Pzkgjk9S8xoZeg0X5Hh', 'nomal', 'wwwthings', 'fengsheng_test', '2018-09-23 20:15:54', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (242, 'sCJsdhH59le2nHe10vhXWpDYbKWc9c27', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 20:19:42', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (243, 'kfBq6ah1UxKu2WltUXr8pgWmxonZJBJu', 'nomal', 'wwwthings', 'fengsheng_test', '2018-09-23 20:19:43', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (244, 'fRr3PbTIQfM0gLXwLVRDy7Irts7wyjkr', 'nomal', 'wwwthings', 'ticket_005', '2018-09-23 20:20:11', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (245, 'VwYpRhGiyLx1JA09LeGWWB3VOm9vS4ez', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 20:25:02', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (246, '6urFvTRmw5Yb8lbcltGVqZV5fSKwm871', 'nomal', 'wwwthings', 'ylsm_2398', '2018-09-23 20:47:01', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (247, 'nPVb6imUekOWuw04ZI5rDom9TvItT6oO', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 22:52:13', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (248, 'eapsg3oYJakOwNEso9sCDDXTJRwLMB3G', 'nomal', 'wwwthings', 'ticket_003', '2018-09-23 22:53:16', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (249, '0stpMKTWvKRR7O7JBxBdw2wxGVKcwGFZ', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 23:08:01', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (250, 'boaYv5KGmLxfQSeqhPiZgzG0GkSs4Yhv', 'nomal', 'wwwthings', 'ticket_001', '2018-09-23 23:28:40', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (251, 'mVBm2QpC0jpHWZ0IDUcOrYSUHBW95vvs', 'nomal', 'wwwthings', 'fengsheng_test', '2018-09-23 23:29:30', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (252, 'kzHwQoGGXVYTzmknA6vWu40zaIyir5fY', 'nomal', 'wwwthings', 'fengsheng_test', '2018-09-23 23:43:39', 100000);
INSERT INTO `oauth2_refresh_token` VALUES (253, 'PuFugZRkaYUMTjftCWbkgCG4FG6ugR5n', 'nomal', 'wwwthings', 'luoke-chengdu', '2018-09-24 00:05:21', 100000);

-- ----------------------------
-- Table structure for sign_client_tbl
-- ----------------------------
DROP TABLE IF EXISTS `sign_client_tbl`;
CREATE TABLE `sign_client_tbl`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `app_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `expire_time` datetime(0) NOT NULL COMMENT '超时时间',
  `strict_sign` int(255) NULL DEFAULT NULL COMMENT '是否强制验签:0：用户自定义，1：强制',
  `strict_verify` int(11) NOT NULL DEFAULT 1 COMMENT '是否强制验证码:0：用户自定义，1：强制',
  `token_expire_time` int(11) NOT NULL COMMENT 'token过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sign_client_tbl
-- ----------------------------
INSERT INTO `sign_client_tbl` VALUES (1, 'wwwthings', '4EE0A9A43B9B911C067BEE5CC50A9972', '2025-01-01 00:00:00', 1, 1, 100000);
INSERT INTO `sign_client_tbl` VALUES (2, 'apiserver', '98D93FEB1370D9F35DA3FFFE6083F906\r\n', '2025-01-01 00:00:00', 1, 0, 100000);

-- ----------------------------
-- Table structure for user_account_tbl
-- ----------------------------
DROP TABLE IF EXISTS `user_account_tbl`;
CREATE TABLE `user_account_tbl`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account_type` int(11) NOT NULL DEFAULT 0 COMMENT '帐号类型:0手机号，1邮件',
  `app_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'authbucket_oauth2_client表的id',
  `user_info_id` int(11) NOT NULL,
  `reg_time` datetime(0) NULL DEFAULT NULL,
  `reg_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bundle_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `describ` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UNIQ_5696AD037D3656A4`(`account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_account_tbl
-- ----------------------------
INSERT INTO `user_account_tbl` VALUES (1, 'admin', 'CF08A5402C5CAE463619A9060482B2E2', 0, '2', 11, '2017-08-16 15:50:59', NULL, 'nomal', 'admin123456!');
INSERT INTO `user_account_tbl` VALUES (2, 'chengdu', 'C542CD823E13EDFD8B18C0691AB3A15D', 0, '0', 0, NULL, NULL, NULL, 'chengdu123456!');
INSERT INTO `user_account_tbl` VALUES (3, 'jiangli_chengdu', '90A55FF499797663A1A0B39CEC18EA9F', 0, '0', 0, '2017-09-28 13:07:53', NULL, 'nomal', 'ylsmqwer');
INSERT INTO `user_account_tbl` VALUES (4, 'gongmin_chengdu', '90A55FF499797663A1A0B39CEC18EA9F', 0, '0', 0, '2017-09-28 13:07:53', NULL, 'nomal', 'ylsmqwer');
INSERT INTO `user_account_tbl` VALUES (5, 'wanka', '19BBA147C8580E875158E0B651303362', 0, '0', 0, '2017-12-28 21:05:48', NULL, 'nomal', 'wanka123456!');
INSERT INTO `user_account_tbl` VALUES (6, 'finance', 'CF08A5402C5CAE463619A9060482B2E2', 0, '0', 0, '2018-01-29 10:39:44', NULL, 'nomal', 'admin123456!');
INSERT INTO `user_account_tbl` VALUES (7, 'credit_card', 'CF08A5402C5CAE463619A9060482B2E2', 0, '0', 0, '2018-02-07 17:20:58', NULL, 'nomal', 'admin123456!');
INSERT INTO `user_account_tbl` VALUES (8, 'dianzhang', 'e10adc3949ba59abbe56e057f20f883e', 1, 'apiserver', 1, '2018-05-03 19:25:16', '127.0.0.1', 'apiserver auto', NULL);
INSERT INTO `user_account_tbl` VALUES (9, 'hotel_admin', 'CF08A5402C5CAE463619A9060482B2E2', 1, 'apiserver', 2, '2018-05-03 19:46:23', '127.0.0.1', 'apiserver auto', NULL);
INSERT INTO `user_account_tbl` VALUES (10, 'hotel_no_bundle', 'E10ADC3949BA59ABBE56E057F20F883E', 1, 'apiserver', 3, '2018-05-03 20:33:18', '127.0.0.1', 'apiserver auto', NULL);
INSERT INTO `user_account_tbl` VALUES (11, 'luoke-chengdu', '948E17EEAA14F01F23417E9897945C71', 1, 'apiserver', 4, '2018-05-22 13:47:37', '127.0.0.1', 'apiserver auto', NULL);
INSERT INTO `user_account_tbl` VALUES (12, 'qiantai', 'E10ADC3949BA59ABBE56E057F20F883E', 1, 'apiserver', 5, '2018-05-29 15:17:16', '127.0.0.1', 'apiserver auto', NULL);
INSERT INTO `user_account_tbl` VALUES (14, 'Grace', '014FE502524F47E2C1C52CC113EC2253', 1, 'apiserver', 7, '2018-09-03 14:04:48', '127.0.0.1', 'apiserver auto', NULL);
INSERT INTO `user_account_tbl` VALUES (18, 't_dianzhang', 'E10ADC3949BA59ABBE56E057F20F883E', 1, 'apiserver', 11, '2018-09-14 09:45:25', '127.0.0.1', 'apiserver auto', NULL);
INSERT INTO `user_account_tbl` VALUES (19, 'ticket_001', 'E10ADC3949BA59ABBE56E057F20F883E', 1, '', 12, '2018-09-21 11:01:32', NULL, NULL, '123456');
INSERT INTO `user_account_tbl` VALUES (21, 'ticket_002', 'E10ADC3949BA59ABBE56E057F20F883E', 1, '', 13, '2018-09-21 11:01:33', NULL, NULL, '123456');
INSERT INTO `user_account_tbl` VALUES (22, 'ticket_003', 'E10ADC3949BA59ABBE56E057F20F883E', 1, '', 14, '2018-09-21 11:23:51', NULL, NULL, '123456');
INSERT INTO `user_account_tbl` VALUES (23, 'ticket_004', 'E10ADC3949BA59ABBE56E057F20F883E', 1, '', 15, '2018-09-21 11:24:09', NULL, NULL, '123456');
INSERT INTO `user_account_tbl` VALUES (24, 'ticket_005', 'E10ADC3949BA59ABBE56E057F20F883E', 1, '', 16, '2018-09-21 11:24:29', NULL, NULL, '123456');
INSERT INTO `user_account_tbl` VALUES (25, 'fengsheng_test', 'E10ADC3949BA59ABBE56E057F20F883E', 1, '', 17, '2018-09-21 12:42:10', NULL, NULL, '123456');
INSERT INTO `user_account_tbl` VALUES (26, 'ylsm_2398', 'E10ADC3949BA59ABBE56E057F20F883E', 1, '', 18, '2018-09-21 12:44:00', NULL, NULL, '123456');

-- ----------------------------
-- Table structure for user_info_tbl
-- ----------------------------
DROP TABLE IF EXISTS `user_info_tbl`;
CREATE TABLE `user_info_tbl`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `headurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info_tbl
-- ----------------------------
INSERT INTO `user_info_tbl` VALUES (1, 'dianzhang', '');
INSERT INTO `user_info_tbl` VALUES (2, 'hotel_admin', '');
INSERT INTO `user_info_tbl` VALUES (3, 'hotel_no_bundle', '');
INSERT INTO `user_info_tbl` VALUES (4, 'luoke-chengdu', '');
INSERT INTO `user_info_tbl` VALUES (5, 'qiantai', '');
INSERT INTO `user_info_tbl` VALUES (6, 'test_dianzhang', '');
INSERT INTO `user_info_tbl` VALUES (7, 'Grace', '');
INSERT INTO `user_info_tbl` VALUES (8, 'yangqing', '');
INSERT INTO `user_info_tbl` VALUES (9, 'fanying', '');
INSERT INTO `user_info_tbl` VALUES (10, 'baojie', '');
INSERT INTO `user_info_tbl` VALUES (11, 't_dianzhang', '');
INSERT INTO `user_info_tbl` VALUES (12, 'ticket_001', NULL);
INSERT INTO `user_info_tbl` VALUES (13, 'ticket_002', NULL);
INSERT INTO `user_info_tbl` VALUES (14, 'ticket_003', NULL);
INSERT INTO `user_info_tbl` VALUES (15, 'ticket_004', NULL);
INSERT INTO `user_info_tbl` VALUES (16, 'ticket_005', NULL);
INSERT INTO `user_info_tbl` VALUES (17, 'fengsheng_test', NULL);
INSERT INTO `user_info_tbl` VALUES (18, 'ylsm_2398', NULL);

SET FOREIGN_KEY_CHECKS = 1;
