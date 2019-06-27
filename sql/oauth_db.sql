/*
Navicat MySQL Data Transfer

Source Server         : 192.168.0.99
Source Server Version : 50719
Source Host           : 192.168.0.99:3306
Source Database       : oauth_db

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-09-27 21:16:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for oauth2_access_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth2_access_token`;
CREATE TABLE `oauth2_access_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `app_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'key',
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名',
  `expires` datetime NOT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token` (`access_token`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of oauth2_access_token
-- ----------------------------
INSERT INTO `oauth2_access_token` VALUES ('116', 'BgAZSUdi85EaROJ0JajWoyUsQTd8CB3m', 'nomal', 'wwwthings', '1111', '2017-09-27 06:47:07');
INSERT INTO `oauth2_access_token` VALUES ('117', 'KQj4iEzayYK5MsXdiZCBxqqN47j0pwEL', 'nomal', 'wwwthings', '1111', '2017-09-27 06:58:17');
INSERT INTO `oauth2_access_token` VALUES ('118', 'K6El0Y25dzVVF5551M2x9EPvZFffB5g8', 'nomal', 'wwwthings', '1111', '2017-09-27 07:15:37');
INSERT INTO `oauth2_access_token` VALUES ('119', 'MztwyPkhFqhU4Ztjng0ekqhxYI4Wmwsu', 'nomal', 'wwwthings', '1111', '2017-09-27 08:45:53');
INSERT INTO `oauth2_access_token` VALUES ('120', 'Cd7ffh84K0fV9qc5m6xpBOMzyYzIoDUz', 'nomal', 'wwwthings', '1111', '2017-09-27 08:54:38');
INSERT INTO `oauth2_access_token` VALUES ('121', 'HiD253FssmkrQcRm46upWMI6z53E4qZP', 'nomal', 'wwwthings', '1111', '2017-09-27 08:56:34');
INSERT INTO `oauth2_access_token` VALUES ('122', 'CUzGYjnu2oUMhREbMLilA5rYDBQgN3Fo', 'nomal', 'wwwthings', '1111', '2017-09-27 08:58:22');
INSERT INTO `oauth2_access_token` VALUES ('123', 'ORB4RYli4QcImvlwvtxESWx1Z4zSdszj', 'nomal', 'wwwthings', '1111', '2017-09-27 09:45:26');
INSERT INTO `oauth2_access_token` VALUES ('124', 'oNNcDhcYjFzNKqCcCip8AP8WABYTqkht', 'nomal', 'wwwthings', '1111', '2017-09-27 09:51:23');
INSERT INTO `oauth2_access_token` VALUES ('125', 'n3NR95pH1bpIRcrrl3p6rMBlYMTJqh0f', 'nomal', 'wwwthings', '1111', '2017-09-27 10:11:24');
INSERT INTO `oauth2_access_token` VALUES ('126', 'x2nbvuS7RbfeRlLd7kR6GHRkzonHP2Pu', 'nomal', 'wwwthings', '1111', '2017-09-27 10:18:51');
INSERT INTO `oauth2_access_token` VALUES ('127', 'Po536HFphpJFVqW434bSty7rj8ipc6cU', 'nomal', 'wwwthings', '1111', '2017-09-27 10:21:06');
INSERT INTO `oauth2_access_token` VALUES ('128', 'etPQ7PaDViNUCYR8yeJjWS001T8QtyKH', 'nomal', 'wwwthings', '1111', '2017-09-27 10:32:15');
INSERT INTO `oauth2_access_token` VALUES ('129', 'gfO27LZhmRPiUULK4GzFEjfM9AOoAYJG', 'nomal', 'wwwthings', '1111', '2017-09-27 10:48:23');
INSERT INTO `oauth2_access_token` VALUES ('130', '8Le7MfNSx0D6uoYRuhBHlwlPnLIyxeYZ', 'nomal', 'wwwthings', '1111', '2017-09-27 11:30:07');
INSERT INTO `oauth2_access_token` VALUES ('131', '3iJgnPF0TFTpU0GEwjXrkej0FHTSNwv0', 'nomal', 'wwwthings', '1111', '2017-09-27 11:43:11');
INSERT INTO `oauth2_access_token` VALUES ('132', 'rcb69fmDhI5zXlylXq2ImduOZEC9l7Gg', 'nomal', 'wwwthings', '1111', '2017-09-27 12:01:46');
INSERT INTO `oauth2_access_token` VALUES ('133', 'gUs1E75JULoqmlmTuekwfqcUOyn0FEGo', 'nomal', 'wwwthings', '1111', '2017-09-27 12:03:49');
INSERT INTO `oauth2_access_token` VALUES ('134', 'XxsOsswDj4ah46q5QKbhpRPCI74zIMFc', 'nomal', 'wwwthings', '1111', '2017-09-27 12:11:10');
INSERT INTO `oauth2_access_token` VALUES ('135', 'bfRyniDE89y7IXvJq86fLpm33r9zPhFC', 'nomal', 'wwwthings', '1111', '2017-09-27 12:16:12');
INSERT INTO `oauth2_access_token` VALUES ('136', 'WZEh1jnPlrJDrmekK221kSxdmRYaBgsz', 'nomal', 'wwwthings', '1111', '2017-09-27 12:21:44');
INSERT INTO `oauth2_access_token` VALUES ('137', '19hgUTQjGr3sYC8Rxb9o2fCG3FQ3rLt9', 'nomal', 'wwwthings', '1111', '2017-09-27 12:24:42');
INSERT INTO `oauth2_access_token` VALUES ('138', 'Bpqydbv6dnmPs5XplO8mrp9lznTU9HnP', 'nomal', 'wwwthings', '1111', '2017-09-27 12:33:34');
INSERT INTO `oauth2_access_token` VALUES ('139', 'nzgQ5fgCs4ZDiY884Hqn7M4GH8B3dEcn', 'nomal', 'wwwthings', '1111', '2017-09-27 12:59:05');
INSERT INTO `oauth2_access_token` VALUES ('140', 'sxLhiiFalOeos4G49uTV6mNWjg2hsz2Q', 'nomal', 'wwwthings', '1111', '2017-09-27 14:00:57');
INSERT INTO `oauth2_access_token` VALUES ('141', 'uwOFG9WEyHwoYvKIA8rgiTy3MDC2y439', 'nomal', 'wwwthings', '1111', '2017-09-27 14:53:48');
INSERT INTO `oauth2_access_token` VALUES ('142', 'kA4Yf3JzOljiSCiLlFTvnT3LBztjOqth', 'nomal', 'wwwthings', '1111', '2017-09-27 14:58:12');
INSERT INTO `oauth2_access_token` VALUES ('143', '6jPVi3SK9Ik1JuDD24cxAgVwLSXi91TB', 'nomal', 'wwwthings', '1111', '2017-09-27 14:59:14');
INSERT INTO `oauth2_access_token` VALUES ('144', 'k63JG8U6ZgBXkfWdG7lSkhSJb881TvMN', 'nomal', 'wwwthings', '1111', '2017-09-28 04:52:29');
INSERT INTO `oauth2_access_token` VALUES ('145', 'OivSf7pdY6oWxhbp2reLuLvTiZkzGMue', 'nomal', 'wwwthings', '1111', '2017-09-28 04:59:59');
INSERT INTO `oauth2_access_token` VALUES ('146', 'PDGJoXpLzOyMaQtVrC0MGrrf53FgXA78', 'nomal', 'wwwthings', '1111', '2017-09-28 05:23:05');
INSERT INTO `oauth2_access_token` VALUES ('147', 'KXBmgqbvmxGMf9bXZU3ojT53RKyWj0kE', 'nomal', 'wwwthings', '1111', '2017-09-28 05:23:17');
INSERT INTO `oauth2_access_token` VALUES ('148', 'i2fMueRm0dQhMU4wLJry8ivLJafKilOS', 'nomal', 'wwwthings', '1111', '2017-09-28 05:24:10');
INSERT INTO `oauth2_access_token` VALUES ('149', 'tfSISCc2LZnD6tBAbeWf4c7Y9xDAOqcP', 'nomal', 'wwwthings', '1111', '2017-09-28 05:30:35');
INSERT INTO `oauth2_access_token` VALUES ('150', 'CDeuFDpushnMy1DuB9akcU6aoge3Dyc5', 'nomal', 'wwwthings', '1111', '2017-09-28 05:38:02');
INSERT INTO `oauth2_access_token` VALUES ('151', 'U6Em9DId35ogdBFewFeXzkY7FlV1DNIR', 'nomal', 'wwwthings', '1111', '2017-09-28 05:38:20');
INSERT INTO `oauth2_access_token` VALUES ('152', 'ejApvFakZjCjlPxxrUqLqmqYr1vOXlnP', 'nomal', 'wwwthings', '1111', '2017-09-28 06:30:02');
INSERT INTO `oauth2_access_token` VALUES ('153', 'tR1P4utIWClVpTy6FRAcJ1G9JLVcdTeD', 'nomal', 'wwwthings', '1111', '2017-09-28 06:30:27');
INSERT INTO `oauth2_access_token` VALUES ('154', 'F9GHKzuyBXvgKAkTUl6OrtA9T89DFEDt', 'nomal', 'wwwthings', '1111', '2017-09-28 06:42:02');
INSERT INTO `oauth2_access_token` VALUES ('155', 'FHkQEI3JGlhmUAAzaoVExnlCdH303VsN', 'nomal', 'wwwthings', '1111', '2017-09-28 06:49:06');
INSERT INTO `oauth2_access_token` VALUES ('156', 'vkkLRnwKgKp4LGdHuNRtKirPMud8fff6', 'nomal', 'wwwthings', '1111', '2017-09-28 07:12:17');
INSERT INTO `oauth2_access_token` VALUES ('157', '2IcTc19XcRiXlq1HqHU17jgoZzrCtgbF', 'nomal', 'wwwthings', '1111', '2017-09-28 07:13:01');
INSERT INTO `oauth2_access_token` VALUES ('158', 'UdrGDhsGSR6lS58ie1x5ZX3fv6N1Uf5p', 'nomal', 'wwwthings', '1111', '2017-09-28 09:54:15');
INSERT INTO `oauth2_access_token` VALUES ('159', 'U061FaXO7w3es8vAbZq5WPbn4XLRlMoz', 'nomal', 'wwwthings', '1111', '2017-09-28 10:00:24');
INSERT INTO `oauth2_access_token` VALUES ('160', 'wWOqhCEurOQhVRQVkVPziyGVLzDpQn2R', 'nomal', 'wwwthings', '1111', '2017-09-28 10:00:53');
INSERT INTO `oauth2_access_token` VALUES ('161', 'FgjxPgOQP3n3NMBLj3gNjy9Iiy5A5ud6', 'nomal', 'wwwthings', '1111', '2017-09-28 10:04:14');
INSERT INTO `oauth2_access_token` VALUES ('162', 'wTYpfz4eiwaqEz4TAwAGMbZDXSK9Mwf1', 'nomal', 'wwwthings', '1111', '2017-09-28 10:06:25');
INSERT INTO `oauth2_access_token` VALUES ('163', 'pRs0mErrbO01kw7GPqdSsQFyFphX9B7S', 'nomal', 'wwwthings', '1111', '2017-09-28 10:11:15');
INSERT INTO `oauth2_access_token` VALUES ('164', 'OedVUDOVCoZS9TRsbwj3cCvCmRyK6s7I', 'nomal', 'wwwthings', '1111', '2017-09-28 10:11:44');
INSERT INTO `oauth2_access_token` VALUES ('165', 'hW2j8Ij5f8vCX5A226g9UsLjfCGrqaLc', 'nomal', 'wwwthings', '1111', '2017-09-28 10:19:54');
INSERT INTO `oauth2_access_token` VALUES ('166', 'DB0uaVMvjvHLP1Gl9UP95hGjP7GKiztl', 'nomal', 'wwwthings', '1111', '2017-09-28 10:53:37');
INSERT INTO `oauth2_access_token` VALUES ('167', 'Y7pkIy6VrWvJ2Sqr3gJTFM6cJUIWV2DA', 'nomal', 'wwwthings', '1111', '2017-09-28 11:04:32');
INSERT INTO `oauth2_access_token` VALUES ('168', '8muNsh6EBIOdiwWAUwjN7PTdl9HrfB6E', 'nomal', 'wwwthings', '1111', '2017-09-28 11:23:40');
INSERT INTO `oauth2_access_token` VALUES ('169', 'T2hQSnDxfGt4Bvbru3xdScbEoLnzNvow', 'nomal', 'wwwthings', '1111', '2017-09-28 11:33:45');
INSERT INTO `oauth2_access_token` VALUES ('170', 'fzqd3EIPpTIwYooSrE7o4vVxEFfGwn1L', 'nomal', 'wwwthings', '346944475@qq.com', '2017-09-28 11:35:28');
INSERT INTO `oauth2_access_token` VALUES ('171', 'jvkBUbYcH0kg2Sp2McNKv1yuzGzeD44d', 'nomal', 'wwwthings', '346944475@qq.com', '2017-09-28 11:35:43');
INSERT INTO `oauth2_access_token` VALUES ('172', 'opFgeL6NFxQoERAtgKrV411N9Ja8SgoR', 'nomal', 'wwwthings', '346944475@qq.com', '2017-09-28 11:51:25');
INSERT INTO `oauth2_access_token` VALUES ('173', '5PJwkbObbMjFEFZLRkyRliYo2BodqQFX', 'nomal', 'wwwthings', '1111', '2017-09-28 12:03:41');
INSERT INTO `oauth2_access_token` VALUES ('174', 'nV8B2t6ILHaMb2b0IUHvIPl2iOQF7sd8', 'nomal', 'wwwthings', '1111', '2017-09-28 12:14:48');
INSERT INTO `oauth2_access_token` VALUES ('175', 'zPby83EfUXWsUkloJMe6pnwmnliFJqK7', 'nomal', 'wwwthings', '1111', '2017-09-28 12:17:42');
INSERT INTO `oauth2_access_token` VALUES ('176', '9w8uawkyUBEgmwOwdrwlUK5Bq0tle9cE', 'nomal', 'wwwthings', '1111', '2017-09-28 13:54:03');
INSERT INTO `oauth2_access_token` VALUES ('177', 'eujutzIo8WQtoFUc14HIQAf9YtnBrgmY', 'nomal', 'wwwthings', '1111', '2017-09-28 14:42:55');
INSERT INTO `oauth2_access_token` VALUES ('178', 'yY4uGsVf6FIO8Fw0WwTsKHGhFEbq0kLM', 'nomal', 'wwwthings', '1111', '2017-09-28 14:43:35');
INSERT INTO `oauth2_access_token` VALUES ('179', 'p1ALtmEUyAW7DfwJTCHd5oXUCkbdtj0U', 'nomal', 'wwwthings', '1111', '2017-09-28 14:44:55');
INSERT INTO `oauth2_access_token` VALUES ('180', 'OoVZPmUCcJ10bSp232lNo2CQP7NmI0V9', 'nomal', 'wwwthings', '1111', '2017-09-28 14:52:09');
INSERT INTO `oauth2_access_token` VALUES ('181', '3gmfBh50HzkCf2RstVTbrW2OfnDdJSpE', 'nomal', 'wwwthings', '1111', '2017-09-28 14:52:33');
INSERT INTO `oauth2_access_token` VALUES ('182', 'KoiCgGfO2VFlFsuS8rAf5VwOlpcXApbG', 'nomal', 'wwwthings', '1111', '2017-09-28 14:52:53');
INSERT INTO `oauth2_access_token` VALUES ('183', 'QQ2GSQsllHExzh48PFthx0HM9GnkrHQ9', 'nomal', 'wwwthings', '1111', '2017-09-28 14:52:55');
INSERT INTO `oauth2_access_token` VALUES ('184', 'TkpehgkARsX6kJi4V56c655dzxahDm4Z', 'nomal', 'wwwthings', '1111', '2017-09-28 14:52:59');
INSERT INTO `oauth2_access_token` VALUES ('185', '6gnEjwYngnpqs6pL1qJ2cG3v8dA2zoUl', 'nomal', 'wwwthings', '1111', '2017-09-28 14:53:01');
INSERT INTO `oauth2_access_token` VALUES ('186', 'zwIIORBnqLHOrKcGqCS7Vii5icaqp9jA', 'nomal', 'wwwthings', '1111', '2017-09-28 14:53:02');
INSERT INTO `oauth2_access_token` VALUES ('187', 'Vy1fAto77tNWEE4gJTdMOLbCdaZ6kDFa', 'nomal', 'wwwthings', '1111', '2017-09-28 14:54:12');
INSERT INTO `oauth2_access_token` VALUES ('188', 'OFPsGB1sk2T4JARgGGr2Vpw0Nr57NnlH', 'nomal', 'wwwthings', '1111', '2017-09-28 14:54:19');
INSERT INTO `oauth2_access_token` VALUES ('189', 'knhsNZ5YsDbBzcOaIUTfQ0p4SVDk1PnC', 'nomal', 'wwwthings', '1111', '2017-09-28 14:54:29');
INSERT INTO `oauth2_access_token` VALUES ('190', 'TByt89lFEGA9JJNftlJZiN9sxVoA926Q', 'nomal', 'wwwthings', '1111', '2017-09-28 14:54:35');
INSERT INTO `oauth2_access_token` VALUES ('191', 'jxotXDvw7Pxo8Xk1tNVod7uxuaE7lLjP', 'nomal', 'wwwthings', '1111', '2017-09-28 14:56:43');
INSERT INTO `oauth2_access_token` VALUES ('192', 'rqZGpP1PwTzng3OOAq09n1xOIOXR7e4M', 'nomal', 'wwwthings', '1111', '2017-09-28 14:56:46');
INSERT INTO `oauth2_access_token` VALUES ('193', 'itMegn9uK4E3lMkjH3K5fLtkUCFWW29V', 'nomal', 'wwwthings', '1111', '2017-09-28 14:56:49');
INSERT INTO `oauth2_access_token` VALUES ('194', 'veYLPkxG9u32plkdEztwed3Msb7F6kBv', 'nomal', 'wwwthings', '1111', '2017-09-28 14:56:55');
INSERT INTO `oauth2_access_token` VALUES ('195', 'MZq1bKlqxyyG3w6vNJdhiWrwRQPIP9mL', 'nomal', 'wwwthings', '1111', '2017-09-28 14:57:03');
INSERT INTO `oauth2_access_token` VALUES ('196', 'zBHauXr3otHm9Gae8IEffdas2ZOETwhv', 'nomal', 'wwwthings', '1111', '2017-09-28 14:57:06');
INSERT INTO `oauth2_access_token` VALUES ('197', 'OQUlp0oRtSjiVC2fVDdVnIddbHMQOFrr', 'nomal', 'wwwthings', '1111', '2017-09-28 14:58:47');
INSERT INTO `oauth2_access_token` VALUES ('198', 'yJtBaTwVgUYI497TsCtTDBg7V9SccCem', 'nomal', 'wwwthings', '1111', '2017-09-28 14:58:49');
INSERT INTO `oauth2_access_token` VALUES ('199', 'mTUI1W2ZFcMWZKPszeh2yDlwpR4hxE7g', 'nomal', 'wwwthings', '1111', '2017-09-28 14:58:58');
INSERT INTO `oauth2_access_token` VALUES ('200', 'DFAFfHGSEM9uPZIvqnQ7sXsBRRlm4kWI', 'nomal', 'wwwthings', '1111', '2017-09-28 14:59:17');
INSERT INTO `oauth2_access_token` VALUES ('201', 'gRgR8Ir7MNBNCSre5YRSahdSREn6lsCe', 'nomal', 'wwwthings', '1111', '2017-09-28 14:59:21');
INSERT INTO `oauth2_access_token` VALUES ('202', 'jWMejYGEy3X5amtZmTLvWT368b2wbZ83', 'nomal', 'wwwthings', '1111', '2017-09-28 15:00:26');
INSERT INTO `oauth2_access_token` VALUES ('203', 'hQg790PiqGPGPzjZDDh5lsC9Luf8ws4g', 'nomal', 'wwwthings', '1111', '2017-09-28 15:00:30');
INSERT INTO `oauth2_access_token` VALUES ('204', 'hxviuUmnkSUCe2wyaunNfNjux09HV5Ca', 'nomal', 'wwwthings', '1111', '2017-09-28 15:00:33');
INSERT INTO `oauth2_access_token` VALUES ('205', 'y0y9tRQZS9YLBWEQpv2W26QQuTIntp1r', 'nomal', 'wwwthings', '1111', '2017-09-28 15:01:31');
INSERT INTO `oauth2_access_token` VALUES ('206', '6ibrnSJzk6uoglpJf55jRSbkUsVJJK7n', 'nomal', 'wwwthings', '1111', '2017-09-28 15:04:46');
INSERT INTO `oauth2_access_token` VALUES ('207', 'KyADSLj8CkpYn3eICNOCstou4LWzoU7z', 'nomal', 'wwwthings', '1111', '2017-09-28 15:06:40');
INSERT INTO `oauth2_access_token` VALUES ('208', 'JxLlqBTnnyJo1JEttTUAKHDZMC94nOaL', 'nomal', 'wwwthings', '1111', '2017-09-28 15:13:24');
INSERT INTO `oauth2_access_token` VALUES ('209', '3qfYZ8az9dEDiJts0oG0LzLSjZfqGDbW', 'nomal', 'wwwthings', '1111', '2017-09-28 15:13:35');
INSERT INTO `oauth2_access_token` VALUES ('210', 'w3ZuYNUXonINu8s5ZcPOSKlMM7WC31NV', 'nomal', 'wwwthings', '1111', '2017-09-28 15:15:20');
INSERT INTO `oauth2_access_token` VALUES ('211', '6o7inDu7NWLbb7n4DhdaozG52lK1ezpY', 'nomal', 'wwwthings', '1111', '2017-09-28 15:16:26');
INSERT INTO `oauth2_access_token` VALUES ('212', 'EY2PMwDBJUyFlEDYXekg4OsfSOAxdx9D', 'nomal', 'wwwthings', '1111', '2017-09-28 15:17:25');
INSERT INTO `oauth2_access_token` VALUES ('213', '9JMYHrJKYZJH0Hs9ZhZnr2It3f2aXhuO', 'nomal', 'wwwthings', '1111', '2017-09-28 15:18:34');
INSERT INTO `oauth2_access_token` VALUES ('214', 'KLsUKVNCZ67I9ZPIGFTeIBQbkdhTZTGt', 'nomal', 'wwwthings', '1111', '2017-09-28 15:19:03');
INSERT INTO `oauth2_access_token` VALUES ('215', 'pSgB7VRRBRojzTPbO3maVBoNBd5rFbch', 'nomal', 'wwwthings', '1111', '2017-09-28 15:21:15');
INSERT INTO `oauth2_access_token` VALUES ('216', '5jFxc7Gut8kpAoVZJbBDz71QcJX3AKfm', 'nomal', 'wwwthings', '1111', '2017-09-28 15:25:09');
INSERT INTO `oauth2_access_token` VALUES ('217', 'jrtEv66Kph8ZFJjdLKo0CzezL3zK8VRr', 'nomal', 'wwwthings', '1111', '2017-09-28 15:27:18');
INSERT INTO `oauth2_access_token` VALUES ('218', 'PZDZdJvlBaRoNGVsqLtMaSsg6GJYuM9i', 'nomal', 'wwwthings', '1111', '2017-09-28 15:32:40');
INSERT INTO `oauth2_access_token` VALUES ('219', 'Y5hROzzw67OiTwCFuVsiVv6yVRKeTxEg', 'nomal', 'wwwthings', '1111', '2017-09-28 15:59:33');
INSERT INTO `oauth2_access_token` VALUES ('220', 'sSZNvWUgpK8cJ4cdOrh81e5LdEPXBr6X', 'nomal', 'wwwthings', '1111', '2017-09-28 16:03:09');
INSERT INTO `oauth2_access_token` VALUES ('221', 'BdHxp9peDuQiQP8nDsmdgqQivmFaekgr', 'nomal', 'wwwthings', '1111', '2017-09-28 16:03:16');
INSERT INTO `oauth2_access_token` VALUES ('222', '4gIkQDAryasRSg75RIh3rCC8kwuyvuJA', 'nomal', 'wwwthings', '1111', '2017-09-28 16:03:50');
INSERT INTO `oauth2_access_token` VALUES ('223', '4ySvj5wg5ohybCWhtGKrRA1RKtorMMN3', 'nomal', 'wwwthings', '1111', '2017-09-28 16:09:04');
INSERT INTO `oauth2_access_token` VALUES ('224', '719wQtQlnBXC9ntVyLfrDMVGYd09IumS', 'nomal', 'wwwthings', '1111', '2017-09-28 16:09:10');
INSERT INTO `oauth2_access_token` VALUES ('225', 'B1xWKafI8EPmxyYLiSwHCBt9WfExuOpT', 'nomal', 'wwwthings', '1111', '2017-09-28 16:09:28');
INSERT INTO `oauth2_access_token` VALUES ('226', 'KjD1NQjC1fgIrFjlKFdpCqsG8SMEA9xW', 'nomal', 'wwwthings', '1111', '2017-09-28 16:16:38');
INSERT INTO `oauth2_access_token` VALUES ('227', '8aHcxuhU91DlarqPTlNah2eIwH78GKiZ', 'nomal', 'wwwthings', '1111', '2017-09-28 16:21:27');
INSERT INTO `oauth2_access_token` VALUES ('228', 'kztufQ2MT9rcEvL57bMGlFTaYTIi0c2d', 'nomal', 'wwwthings', '1111', '2017-09-28 16:28:50');
INSERT INTO `oauth2_access_token` VALUES ('229', 'XpE0siLMpCjjsCCH4gJ19gPhz3EVX6Ea', 'nomal', 'wwwthings', '1111', '2017-09-28 16:29:00');
INSERT INTO `oauth2_access_token` VALUES ('230', 'oEJAw0XforLXzVrikqI71OvPKxpDjJ8t', 'nomal', 'wwwthings', '1111', '2017-09-28 16:29:15');
INSERT INTO `oauth2_access_token` VALUES ('231', '4oZhktcw9wIa7ylRkVOCh9qym0kc3NTD', 'nomal', 'wwwthings', '1111', '2017-09-28 16:39:26');
INSERT INTO `oauth2_access_token` VALUES ('232', 'sEPcrMpNUsBTwlaZKQSFaDwuUkczR2wH', 'nomal', 'wwwthings', '1111', '2017-09-28 16:39:42');
INSERT INTO `oauth2_access_token` VALUES ('233', 'tx8jrHEPLDnbqDq7o32vHYyAs1B8peCK', 'nomal', 'wwwthings', '1111', '2017-09-28 16:45:00');
INSERT INTO `oauth2_access_token` VALUES ('234', 'HuTyl0jb9WeOxjAGiSxisKQPUDHUR62I', 'nomal', 'wwwthings', '1111', '2017-09-28 16:45:47');
INSERT INTO `oauth2_access_token` VALUES ('235', '6MSyt8EJfa97E0yXDcUQ5X3OjNh01U8V', 'nomal', 'wwwthings', '1111', '2017-09-28 16:46:40');
INSERT INTO `oauth2_access_token` VALUES ('236', 'NhKT6aSUgtQ73ZMnQjn8LwXoQj4dP89l', 'nomal', 'wwwthings', '1111', '2017-09-28 16:46:46');
INSERT INTO `oauth2_access_token` VALUES ('237', 'VyHE0IkRrT9dDvXkaCdIg6eHI4oOvOmj', 'nomal', 'wwwthings', '1111', '2017-09-28 16:46:50');
INSERT INTO `oauth2_access_token` VALUES ('238', 'scHw9ioxq0vyHwOlRQ9AKjHZIq3QCrZu', 'nomal', 'wwwthings', '1111', '2017-09-28 16:50:49');
INSERT INTO `oauth2_access_token` VALUES ('239', 'ZSX5oG4B1Aln8Xy799capeT5eL5PGbyB', 'nomal', 'wwwthings', '1111', '2017-09-28 16:51:04');
INSERT INTO `oauth2_access_token` VALUES ('240', 'Sts2LxtbnzxYZb59fn3g5O5bhtc2Pc40', 'nomal', 'wwwthings', '1111', '2017-09-28 16:51:11');

-- ----------------------------
-- Table structure for oauth2_client_tbl
-- ----------------------------
DROP TABLE IF EXISTS `oauth2_client_tbl`;
CREATE TABLE `oauth2_client_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `app_secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expire_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '超时时间',
  `strict_verify` int(11) NOT NULL DEFAULT '1' COMMENT '是否强制验证码:1：强制，2：忽略',
  `token_expire_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of oauth2_client_tbl
-- ----------------------------
INSERT INTO `oauth2_client_tbl` VALUES ('1', 'wwwthings', '4EE0A9A43B9B911C067BEE5CC50A9972', '2025-01-01 00:00:00', '1', '100000');
INSERT INTO `oauth2_client_tbl` VALUES ('2', 'wwwthings2', '4EE0A9A43B9B911C067BEE5CC50A9972', '2018-04-26 10:11:08', '2', '100000');

-- ----------------------------
-- Table structure for oauth2_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth2_refresh_token`;
CREATE TABLE `oauth2_refresh_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refresh_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `app_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires` datetime NOT NULL,
  `token_expire_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refresh_token` (`refresh_token`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of oauth2_refresh_token
-- ----------------------------
INSERT INTO `oauth2_refresh_token` VALUES ('108', 'SbjINtgVeXInVDVZbLPLFh2y2WvKywZC', 'nomal', 'wwwthings', '1111', '2017-09-28 09:08:56', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('109', 'MMZYT4Hj3u3oflaMHQknZnj5RMJUd3kb', 'nomal', 'wwwthings', '1111', '2017-09-28 09:16:41', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('110', 'fm7as5FoNkb6wYziYrmYJyxuxT6YytuP', 'nomal', 'wwwthings', '1111', '2017-09-28 09:16:50', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('111', 'PwlMD6Df634l9NMYj17SXtieGIkoDMs1', 'nomal', 'wwwthings', '1111', '2017-09-28 09:33:18', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('112', 'Yd42eSDEHf9c9EiXXfj21AjFXmLvHi5U', 'nomal', 'wwwthings', '1111', '2017-09-28 09:35:19', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('113', 'Yzoswka2OO2s2FyM7Jo2BvTqZpgI6rol', 'nomal', 'wwwthings', '1111', '2017-09-28 09:56:38', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('114', 'O4FU1hbKwZAeNCejwhl9qwRMFbMTR9b5', 'nomal', 'wwwthings', '1111', '2017-09-28 10:03:43', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('115', 'Eg98ORQAPLMN9bOZiVwki0cjk4Pzrusc', 'nomal', 'wwwthings', '1111', '2017-09-28 10:18:43', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('116', 'WieHdoi6uZl9v8mZPaiK0HUiEviPHQyr', 'nomal', 'wwwthings', '1111', '2017-09-28 10:33:47', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('117', '3h0RChFRtdXFQWsOrMj1i3d8vKFjMdzL', 'nomal', 'wwwthings', '1111', '2017-09-28 10:44:58', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('118', 'RZ5Ha2mutXco8x2NFLJDNk3a1tMaKAPj', 'nomal', 'wwwthings', '1111', '2017-09-28 11:02:17', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('119', 'S1sDM3rMizLEjF22as5SyF6Y0m6WF4yg', 'nomal', 'wwwthings', '1111', '2017-09-28 12:32:33', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('120', 'giydkvCyJ1uFXSlSn0bxz1cEBMBIV9AF', 'nomal', 'wwwthings', '1111', '2017-09-28 12:41:18', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('121', 'vsaJCmUVCPNBopVXGMeBhMnZW2i654ZQ', 'nomal', 'wwwthings', '1111', '2017-09-28 12:43:14', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('122', 'mRQtluHayXSUjf8VvxhSr0qVBjWfPZWV', 'nomal', 'wwwthings', '1111', '2017-09-28 12:45:02', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('123', 'xFxqABSfbJiBzaiconCOqGNNHhH1C2oh', 'nomal', 'wwwthings', '1111', '2017-09-28 13:32:06', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('124', 'BjxDmQovmWMcK9lzC25XdtTCENTtUu07', 'nomal', 'wwwthings', '1111', '2017-09-28 13:38:03', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('125', '5vIK3XKBnrzQ6AJWqD048ryCgmpP2rsD', 'nomal', 'wwwthings', '1111', '2017-09-28 13:58:04', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('126', 'jLHXq3UEp2VRJglcaNn4GijN8SHkSyZZ', 'nomal', 'wwwthings', '1111', '2017-09-28 14:05:32', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('127', 'Rx77SqpFt4dZwsB9aDa8awgBJz4gzAsp', 'nomal', 'wwwthings', '1111', '2017-09-28 14:07:47', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('128', 'c3L8JZD89NMiKUChhNoGtN7ilICCIQaj', 'nomal', 'wwwthings', '1111', '2017-09-28 14:18:55', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('129', 'MgrMLyfuPyCENeZ5Vkk5Hpde2uHZXlRb', 'nomal', 'wwwthings', '1111', '2017-09-28 14:35:03', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('130', 'TGOOcLirlsHjhUY4E5BRlWYaJe9H7HEf', 'nomal', 'wwwthings', '1111', '2017-09-28 15:16:47', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('131', 'eTr2YOcszW1q3gRTNmvvSDtqGSLNXJSq', 'nomal', 'wwwthings', '1111', '2017-09-28 15:29:51', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('132', 'mUrAzJhEdQflKcnFhum0O6Enqm8lqYhV', 'nomal', 'wwwthings', '1111', '2017-09-28 15:48:26', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('133', 'SCNqpME6QP9LRpZrFK3W0aadSq7uYbHk', 'nomal', 'wwwthings', '1111', '2017-09-28 15:50:29', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('134', '2dP45lu4W8V7EI71t6X1B9IxW0tC2mZL', 'nomal', 'wwwthings', '1111', '2017-09-28 15:57:50', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('135', 'Th2NZ2xvNSwEG5i8R3VAVoETgaIdXZYr', 'nomal', 'wwwthings', '1111', '2017-09-28 16:02:52', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('136', 'PuRYH9PUJeV5TuJvJQHizdBCI0hPRhTb', 'nomal', 'wwwthings', '1111', '2017-09-28 16:08:24', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('137', 'lZjJir2Ujr1dA0m2o1SiJzCpk36E9V8B', 'nomal', 'wwwthings', '1111', '2017-09-28 16:11:22', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('138', 'KtvB9kYLuICHWNefumcznErBykHCR6F9', 'nomal', 'wwwthings', '1111', '2017-09-28 16:20:14', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('139', 'zDmdHHxsyamiy1lV4O2QLTvQPzdVAQX5', 'nomal', 'wwwthings', '1111', '2017-09-28 16:45:45', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('140', 'WyMMgrEhK7GPYNXsFsO02E1CxiestMbJ', 'nomal', 'wwwthings', '1111', '2017-09-28 17:47:38', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('141', 'sMVZY2mJD1kTpXAUpITdo62MuEuPdH3I', 'nomal', 'wwwthings', '1111', '2017-09-28 18:40:28', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('142', 'M0sr4B6NU1hJ96BqAYcqP6xPIYuMGJxf', 'nomal', 'wwwthings', '1111', '2017-09-28 18:44:52', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('143', 'tE3lDYHYFoPAtMJbBtQvG8fIsfhBe7Xs', 'nomal', 'wwwthings', '1111', '2017-09-28 18:45:54', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('144', 'kRPieVVOibMzioZllsx5LyPYXZejgnf7', 'nomal', 'wwwthings', '1111', '2017-09-29 08:39:09', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('145', 'w05dTJMHpkkIcXc0xoiRaqO454PBdPOa', 'nomal', 'wwwthings', '1111', '2017-09-29 08:46:40', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('146', '78b9H8Ruu2dnfXAApnkuCtgZ5ninHI49', 'nomal', 'wwwthings', '1111', '2017-09-29 09:09:46', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('147', 'dMRaRhbFDQ4kWpiaZfX2U0T0AFYdYx3H', 'nomal', 'wwwthings', '1111', '2017-09-29 09:09:57', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('148', 'lt1VU0Kzcz0ZeORCWmxQrPGmk8VS44G7', 'nomal', 'wwwthings', '1111', '2017-09-29 09:10:50', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('149', 'Csfa3d96mKvuQnY1WQapL0IHeZdl8dlS', 'nomal', 'wwwthings', '1111', '2017-09-29 09:17:15', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('150', '5B2LgxEpJAsEQAzLX4xJrHfknBM4OTPW', 'nomal', 'wwwthings', '1111', '2017-09-29 09:24:42', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('151', 'ZvEJOo9gmd19gE3wRpFi6sop5HKkshVB', 'nomal', 'wwwthings', '1111', '2017-09-29 09:25:01', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('152', 'n8RP0SFfjoBxUOAPJaE8VavBorIkdmov', 'nomal', 'wwwthings', '1111', '2017-09-29 10:16:42', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('153', 'APT4nBYfgDQYTiDC4Ocu5tfxxyoxvt8M', 'nomal', 'wwwthings', '1111', '2017-09-29 10:17:07', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('154', 'afAQhO71dkdqrbTIbaIJLJwDtBT2MQuw', 'nomal', 'wwwthings', '1111', '2017-09-29 10:28:42', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('155', 'LfwiyDTwFCD8Tg88bNjJelmF89fyA6rN', 'nomal', 'wwwthings', '1111', '2017-09-29 10:35:46', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('156', 'gNHgtOUVkzGPROsEGvHLXwsNu1B9p1YC', 'nomal', 'wwwthings', '1111', '2017-09-29 10:58:58', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('157', 'xa1TLR6mxYy46tltxwRcCFwUtAc4fviF', 'nomal', 'wwwthings', '1111', '2017-09-29 10:59:41', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('158', 'A37UAzsieOofKe7jkETonKrROhDF2g8K', 'nomal', 'wwwthings', '1111', '2017-09-29 13:40:55', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('159', '10XBSCucpxXZ4f38OCWk81LhWG2FAwtp', 'nomal', 'wwwthings', '1111', '2017-09-29 13:47:04', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('160', '7C4Q8SAE9pD306RwJdDDox8RaB56cwPP', 'nomal', 'wwwthings', '1111', '2017-09-29 13:47:33', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('161', 'hiJrV42RLdY94C0hystWO3caH7QrZRvo', 'nomal', 'wwwthings', '1111', '2017-09-29 13:50:54', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('162', 'wwotsb7tpFVXlx82cKKKi1hR3mm02CZC', 'nomal', 'wwwthings', '1111', '2017-09-29 13:53:05', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('163', 'KJ04aBjTzul2k96zUF8J1jSprirXvv1v', 'nomal', 'wwwthings', '1111', '2017-09-29 13:57:55', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('164', 'y5EwQ9nRysPqF5UUyK2nkBMmDLJ43kJw', 'nomal', 'wwwthings', '1111', '2017-09-29 13:58:24', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('165', 'WGFzjPnTg8FKdRhDFfZrJSLxZGsFQTvB', 'nomal', 'wwwthings', '1111', '2017-09-29 14:06:34', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('166', 'UmRNG1jiAfCBIZIM23675rkadnUB4y3f', 'nomal', 'wwwthings', '1111', '2017-09-29 14:40:17', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('167', '87KF00bM3pGdRaymN1msKiy3mhlSwe9A', 'nomal', 'wwwthings', '1111', '2017-09-29 14:51:12', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('168', 'gNfkCyeRO8CvJjGQqmbDJyd4TOnW5hD8', 'nomal', 'wwwthings', '1111', '2017-09-29 15:10:20', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('169', 'S23q7VoAmw5NHuA5aPXq3EpO4XS865FP', 'nomal', 'wwwthings', '1111', '2017-09-29 15:20:25', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('170', 'E84KnzelFqwK5n0RkNDC7oMuQNrCeQTU', 'nomal', 'wwwthings', '346944475@qq.com', '2017-09-29 15:22:08', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('171', 'LuJpee3WyOqzoInP1M4qdE9O00HfXvjv', 'nomal', 'wwwthings', '346944475@qq.com', '2017-09-27 08:04:45', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('172', 'wBEBVg5PkCPG135grRU71uBTrBVSaJbm', 'nomal', 'wwwthings', '346944475@qq.com', '2017-09-29 15:38:05', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('173', '10HpOW7f3hZvpK0yBIDCPshm8PHlq1Fq', 'nomal', 'wwwthings', '1111', '2017-09-29 15:50:21', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('174', 'BuQNfwYECLsIOiYBOIITB5qvC7VZYt97', 'nomal', 'wwwthings', '1111', '2017-09-29 16:01:28', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('175', '75QGc1GfivA8cOTZfyns45A2AjfQ8dC0', 'nomal', 'wwwthings', '1111', '2017-09-29 16:04:22', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('176', '7ZYr7M43ZFSsyV8k4458XFYSPl5DDbTB', 'nomal', 'wwwthings', '1111', '2017-09-29 17:40:43', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('177', 'gQPatsDB0cKObeJvULXAPvSP00ghrLHq', 'nomal', 'wwwthings', '1111', '2017-09-29 18:29:35', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('178', 'o9PRoKFIW1dfLCDttlhqxixqcjEf2RIG', 'nomal', 'wwwthings', '1111', '2017-09-29 18:30:15', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('179', 'wwYm8DAqKVdRoOa1pQeBXzO3fRKFwRoJ', 'nomal', 'wwwthings', '1111', '2017-09-29 18:31:35', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('180', 'Guzl1xMrpCFhYlEN4rm12RYawSLxV7u0', 'nomal', 'wwwthings', '1111', '2017-09-29 18:38:49', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('181', 'U8sf7RDjpUQy46EbGblAfJhzxAUKnDik', 'nomal', 'wwwthings', '1111', '2017-09-29 18:39:13', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('182', 'CkR3WtmNUdkS2eiIjiLTb45UnHsYnabU', 'nomal', 'wwwthings', '1111', '2017-09-29 18:39:33', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('183', 'dgF00HcEUQIgF0vqTnrrPAYJg2ETkTJT', 'nomal', 'wwwthings', '1111', '2017-09-29 18:39:35', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('184', 'NSASK466ms5JbddnFMmtzu9zSShcvCZ8', 'nomal', 'wwwthings', '1111', '2017-09-29 18:39:39', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('185', 'yi7cXQiC8RsqgkMzIWBXCpVLIQrrHmwI', 'nomal', 'wwwthings', '1111', '2017-09-29 18:39:41', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('186', 'btaBkDjWtif0WayiQoyGQB2m5W9JO3Ra', 'nomal', 'wwwthings', '1111', '2017-09-29 18:39:43', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('187', 'MLzbjH0fllbM17jzEmzmTC89voCnBYi4', 'nomal', 'wwwthings', '1111', '2017-09-29 18:40:52', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('188', 'OSqfMrI6b4zhN438MMWv39zWSCGSd0Xz', 'nomal', 'wwwthings', '1111', '2017-09-29 18:40:59', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('189', 'yoXfQYEMQWWjoNiHWQA7ue1JhYaYILv6', 'nomal', 'wwwthings', '1111', '2017-09-29 18:41:09', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('190', 'tY5eYG6sfargJzwSWKThmxqXTr6huItI', 'nomal', 'wwwthings', '1111', '2017-09-29 18:41:15', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('191', 'oqPCvQsnaYXmT2bKnsqFYw2xpEkCiTyl', 'nomal', 'wwwthings', '1111', '2017-09-29 18:43:23', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('192', 'mprJ2ooS2ZS9TDPi6QRwNN2Spe1f4DTH', 'nomal', 'wwwthings', '1111', '2017-09-29 18:43:26', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('193', 'OJGbRFqBZmi5advwhv7WlEgeFDPMlg7O', 'nomal', 'wwwthings', '1111', '2017-09-29 18:43:29', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('194', 'SWVOFQAwVslz7BPpHhLSOebBD9CGk5pR', 'nomal', 'wwwthings', '1111', '2017-09-29 18:43:35', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('195', 'JA6KetxflaCCY614kCnnMEGlu4PCguP0', 'nomal', 'wwwthings', '1111', '2017-09-29 18:43:43', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('196', 'dGlV31TkgHHlvROdg7mXaYC8yee9red8', 'nomal', 'wwwthings', '1111', '2017-09-29 18:43:46', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('197', 'dR2Zgu4IKCRCD4oa1rORJIoW8KRZgnU2', 'nomal', 'wwwthings', '1111', '2017-09-29 18:45:27', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('198', 'ZFjsmDRjbLXtgLOHmaoPXbAX0vwryc5i', 'nomal', 'wwwthings', '1111', '2017-09-29 18:45:29', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('199', 'RvovUcUM5D5klbWyGb8e4GjCuSwhedMI', 'nomal', 'wwwthings', '1111', '2017-09-29 18:45:38', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('200', 'oypW0CC2T9lth75Z0AZ7FnS1ox7BGBMQ', 'nomal', 'wwwthings', '1111', '2017-09-29 18:45:57', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('201', 'STo4T4RPiFfRoHmwSculg8qhA1fu5pGa', 'nomal', 'wwwthings', '1111', '2017-09-29 18:46:01', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('202', 'ZtbEnxXOrkGfE0Q9rq4wzgn264nxC3Bb', 'nomal', 'wwwthings', '1111', '2017-09-29 18:47:06', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('203', 'xlDuJalilIavLR3cgFvDHp8DFBUOD2HG', 'nomal', 'wwwthings', '1111', '2017-09-29 18:47:10', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('204', 'YPLR0tl7lpP0Jx2qGya2QgjdHjao4E3K', 'nomal', 'wwwthings', '1111', '2017-09-29 18:47:13', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('205', 'wOsuCS81iXAWynbb2JYxeYmpdANemsTJ', 'nomal', 'wwwthings', '1111', '2017-09-29 18:48:11', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('206', 'FkcFa9428sG4cVTvP00xFsYRoURai2hg', 'nomal', 'wwwthings', '1111', '2017-09-29 18:51:26', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('207', 'Nm1afe2cNH77aMLnsIDRdpgs15Xw1jpM', 'nomal', 'wwwthings', '1111', '2017-09-29 18:53:20', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('208', '0x9gGIH7vPU441EVPRDK9CahZN1cAx22', 'nomal', 'wwwthings', '1111', '2017-09-29 19:00:04', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('209', 'Sy5vAI5nmXwqTJdqhAEHiANadlAx4qgr', 'nomal', 'wwwthings', '1111', '2017-09-29 19:00:15', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('210', 'NbvjlNBVxPqdBSO67pImdsjxwATB4OSK', 'nomal', 'wwwthings', '1111', '2017-09-29 19:02:00', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('211', '1dV5iBEbCotLT6UF8zJcEK1NA2MBm5or', 'nomal', 'wwwthings', '1111', '2017-09-29 19:03:06', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('212', 'hcg4RD4cYd3jBi3iygq2CBgiXq09RSUd', 'nomal', 'wwwthings', '1111', '2017-09-29 19:04:05', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('213', 'GMSKM1qQWeEfujKHzfEONKAMiBpHVd91', 'nomal', 'wwwthings', '1111', '2017-09-29 19:05:14', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('214', 'GqT03ZOqyJEZM3zrpBVvA7tqUmpdIXtN', 'nomal', 'wwwthings', '1111', '2017-09-29 19:05:43', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('215', 'Ywec2UwYhg7E1w2E3Lqu6tqvGea23aKe', 'nomal', 'wwwthings', '1111', '2017-09-29 19:07:55', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('216', 'LkcBY1SqjpslJccoRcawbmnZDD8erliK', 'nomal', 'wwwthings', '1111', '2017-09-29 19:11:49', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('217', 'EEIRZTlVVMGUx3teNHVEHjcJGnkKtDEN', 'nomal', 'wwwthings', '1111', '2017-09-29 19:13:58', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('218', 'kmY32Ra5eA7mcqOPvdogKxcKONRCb1WN', 'nomal', 'wwwthings', '1111', '2017-09-29 19:19:20', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('219', 'd5tQec99lYL3pJGEiXy5iZwIxeRxIpwT', 'nomal', 'wwwthings', '1111', '2017-09-29 19:46:13', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('220', '7K9E3UM8rnHxC5tSjskBR9RiDXosMp6q', 'nomal', 'wwwthings', '1111', '2017-09-29 19:49:49', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('221', '3YiDphn5OnDaT2CxxYmPjsSy9n1FGnif', 'nomal', 'wwwthings', '1111', '2017-09-29 19:49:56', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('222', 'WC0GpDZl2cmtAR90gQtTVOGonSYYyIsd', 'nomal', 'wwwthings', '1111', '2017-09-29 19:50:30', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('223', 'xlq4A17gZVRMvl0juqmAg62Cg1wGIDSC', 'nomal', 'wwwthings', '1111', '2017-09-29 19:55:44', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('224', 'cfvjgPEljMm5WRTNHhDmGcCzwkevIDek', 'nomal', 'wwwthings', '1111', '2017-09-29 19:55:50', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('225', '1KlgR6wUwJtvgMKVl4nlhSaLZDGVkGQF', 'nomal', 'wwwthings', '1111', '2017-09-29 19:56:08', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('226', 'k6TGmZfgs41NxGW257002NluJ4yNUKcB', 'nomal', 'wwwthings', '1111', '2017-09-29 20:03:19', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('227', 'y77NvmyrFRG73tnkFz5HWjrusH10YFIl', 'nomal', 'wwwthings', '1111', '2017-09-29 20:08:07', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('228', 'Up0Ize4a5zy4N2jAU52rdxejX97cIym5', 'nomal', 'wwwthings', '1111', '2017-09-29 20:15:30', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('229', '1bdXJigEy7ClR1OTd2OtOjAXuoWF1bH1', 'nomal', 'wwwthings', '1111', '2017-09-29 20:15:40', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('230', 'fOHhUTAWbkXEnkQ5sHTluNv4TcJstJqI', 'nomal', 'wwwthings', '1111', '2017-09-29 20:15:55', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('231', '796eOXl0WQI3zJGsMk69D3aasrxxkgBV', 'nomal', 'wwwthings', '1111', '2017-09-29 20:26:06', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('232', 'Ox8H2KcVzCb26tnyVfiBrE98Q831bl6v', 'nomal', 'wwwthings', '1111', '2017-09-29 20:26:23', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('233', 'xaMzscBriuwfP9cLHoAr7RTViIzleFTY', 'nomal', 'wwwthings', '1111', '2017-09-29 20:31:40', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('234', 'bsNuCLB1b0RMYXzncuTYHu72R5NO6DTH', 'nomal', 'wwwthings', '1111', '2017-09-29 20:32:27', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('235', 'DuvOXExFqsPIUcAxmYwQNVNbq8eg3qrj', 'nomal', 'wwwthings', '1111', '2017-09-29 20:33:20', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('236', 'SQRIPey0j7Ujuk5K6u5vUdspBvMS0cef', 'nomal', 'wwwthings', '1111', '2017-09-29 20:33:27', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('237', 'a9cFfVAWTa6tGY9LLW00lrxGGjM4jYJn', 'nomal', 'wwwthings', '1111', '2017-09-29 20:33:30', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('238', 'o0upvgCGlVhaHNvMAUKXb91D3okJmAGi', 'nomal', 'wwwthings', '1111', '2017-09-29 20:37:29', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('239', 'gOIgpvAq0dR5bXOw5anbUQFVZF3yqNGS', 'nomal', 'wwwthings', '1111', '2017-09-29 20:37:44', '100000');
INSERT INTO `oauth2_refresh_token` VALUES ('240', 'GWBDLLwCY8uGKTVyPb2BYdqALBc9xzpx', 'nomal', 'wwwthings', '1111', '2017-09-29 20:37:51', '100000');

-- ----------------------------
-- Table structure for user_account_tbl
-- ----------------------------
DROP TABLE IF EXISTS `user_account_tbl`;
CREATE TABLE `user_account_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(64) CHARACTER SET utf8 NOT NULL,
  `password` varchar(64) CHARACTER SET utf8 NOT NULL,
  `account_type` int(11) NOT NULL DEFAULT '0' COMMENT '帐号类型:1手机号，2邮件',
  `app_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'authbucket_oauth2_client表的id',
  `user_info_id` int(11) NOT NULL,
  `reg_time` datetime DEFAULT NULL,
  `reg_ip` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `bundle_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5696AD037D3656A4` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_account_tbl
-- ----------------------------
INSERT INTO `user_account_tbl` VALUES ('1', '1111', '698D51A19D8A121CE581499D7B701668', '1', 'zaaaaaa', '1', '2025-01-01 00:00:00', null, 'nomal');
INSERT INTO `user_account_tbl` VALUES ('4', '17640426225', '11111', '1', 'wwwthings', '9', '2017-09-26 16:45:26', '127.0.0.1', 'nomal');
INSERT INTO `user_account_tbl` VALUES ('5', '741377031@qq.com', '220891', '2', 'wwwthings', '10', '2017-09-26 17:40:49', '192.168.0.195', 'nomal');
INSERT INTO `user_account_tbl` VALUES ('6', '346944475@qq.com', 'bbbbb', '2', 'wwwthings', '11', '2017-09-27 15:12:15', '192.168.0.179', 'yueke');

-- ----------------------------
-- Table structure for user_info_tbl
-- ----------------------------
DROP TABLE IF EXISTS `user_info_tbl`;
CREATE TABLE `user_info_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(32) CHARACTER SET utf8 NOT NULL,
  `headurl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_info_tbl
-- ----------------------------
INSERT INTO `user_info_tbl` VALUES ('1', 'test', 'http://www.baidu.com');
INSERT INTO `user_info_tbl` VALUES ('9', '17640426225', '');
INSERT INTO `user_info_tbl` VALUES ('10', '741377031@qq.com', '');
INSERT INTO `user_info_tbl` VALUES ('11', '346944475@qq.com', '');

-- ----------------------------
-- View structure for v_user_coin
-- ----------------------------
DROP VIEW IF EXISTS `v_user_coin`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_user_coin` AS select `t1`.`id` AS `id`,`t1`.`account` AS `account`,`t2`.`neocoin` AS `neocoin`,`t2`.`paypassword` AS `paypassword`,`t2`.`headurl` AS `headurl`,`t2`.`nickname` AS `nickname` from (`user_account_tbl` `t1` join `user_info_tbl` `t2`) where (`t1`.`userid` = `t2`.`id`) ;

-- ----------------------------
-- Procedure structure for OnNeoCoin
-- ----------------------------
DROP PROCEDURE IF EXISTS `OnNeoCoin`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OnNeoCoin`(IN `p_account` varchar(64),IN `p_orderid` varchar(255),IN `p_neocoin` int)
BEGIN
	#Routine body goes here...
  #第一步：查询有没有操作过这个订单
  DECLARE r_result bigint;
  DECLARE t_id int;
  DECLARE t_u_id int;

	IF p_neocoin > 0 THEN
		SELECT id INTO t_id FROM neocoin_consume_log WHERE orderid = p_orderid;
		IF t_id IS NULL THEN#没有此订单增加操作
			#查询用户名是否存在
			SELECT id INTO t_u_id FROM v_user_coin WHERE account = p_account;
			IF t_u_id IS NULL THEN#没有此用户名
				INSERT INTO neocoin_error_log(error_code,deal_time) VALUES(concat("add neocoin:cannot find account:",p_account,",orderid:",p_orderid,"neocoin:",p_neocoin),now());
				SET r_result = 10004;
			ELSE
					#增加
					#UPDATE v_user_coin SET neocoin = neocoin + p_neocoin WHERE id = t_u_id;
					INSERT INTO neocoin_recharge_log(orderid,account,neocoin,deal_time)	VALUES(p_orderid,p_account,p_neocoin,now());
					#---end
					#消费
					#UPDATE v_user_coin SET neocoin = neocoin - p_neocoin WHERE id = t_u_id;
					INSERT INTO neocoin_consume_log(orderid,account,neocoin,deal_time)	VALUES(p_orderid,p_account,p_neocoin,now());
					#---end
					SET r_result = 0;
			END IF;
			#---------------------END
		ELSE
			SET r_result = 10014;#已经操作过
		END IF;
	ELSE
		INSERT INTO neocoin_error_log(error_code,deal_time) VALUES(concat("add neocoin:neocoin error account:",p_account,",orderid:",p_orderid,"neocoin:",p_neocoin),now());
		SET r_result = 10008; 
	END IF;

	SELECT r_result;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for OnNeoCoinAdd
-- ----------------------------
DROP PROCEDURE IF EXISTS `OnNeoCoinAdd`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OnNeoCoinAdd`(IN `p_account` varchar(64),IN `p_orderid` varchar(255),IN `p_neocoin` int)
BEGIN
	#Routine body goes here...
  #第一步：查询有没有操作过这个订单
  DECLARE r_result bigint;
  DECLARE t_id int;
  DECLARE t_u_id int;

	IF p_neocoin > 0 THEN
		SELECT id INTO t_id FROM neocoin_recharge_log WHERE orderid = p_orderid;
		IF t_id IS NULL THEN#没有此订单增加操作
			#查询用户名是否存在
			SELECT id INTO t_u_id FROM v_user_coin WHERE account = p_account;
			IF t_u_id IS NULL THEN#没有此用户名
				INSERT INTO neocoin_error_log(error_code,deal_time) VALUES(concat("add neocoin:cannot find account:",p_account,",orderid:",p_orderid,"neocoin:",p_neocoin),now());
				SET r_result = 10004;
			ELSE
					#增加
					UPDATE v_user_coin SET neocoin = neocoin + p_neocoin WHERE id = t_u_id;
					INSERT INTO neocoin_recharge_log(orderid,account,neocoin,deal_time)	VALUES(p_orderid,p_account,p_neocoin,now());
					#---end
					SET r_result = 0;
			END IF;
			#---------------------END
		ELSE
			SET r_result = 10014;#已经操作过
		END IF;
	ELSE
		INSERT INTO neocoin_error_log(error_code,deal_time) VALUES(concat("add neocoin:neocoin error account:",p_account,",orderid:",p_orderid,"neocoin:",p_neocoin),now());
		SET r_result = 10008; 
	END IF;

	SELECT r_result;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for OnNeoCoinSub
-- ----------------------------
DROP PROCEDURE IF EXISTS `OnNeoCoinSub`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OnNeoCoinSub`(IN `p_account` varchar(64),IN `p_orderid` varchar(255),IN `p_neocoin` int)
BEGIN
	#Routine body goes here...
  #第一步：查询有没有操作过这个订单
  DECLARE r_result bigint;
  DECLARE t_id int;
  DECLARE t_u_id int;
	DECLARE t_coin bigint;

	IF p_neocoin > 0 THEN
		SELECT id INTO t_id FROM neocoin_consume_log WHERE orderid = p_orderid;
		IF t_id IS NULL THEN#没有此订单增加操作
			#查询用户名是否存在
			SELECT id INTO t_u_id FROM v_user_coin WHERE account = p_account;
			IF t_u_id IS NULL THEN#没有此用户名
				INSERT INTO neocoin_error_log(error_code,deal_time) VALUES(concat("add neocoin:cannot find account:",p_account,",orderid:",p_orderid,"neocoin:",p_neocoin),now());
				SET r_result = 10004;
			ELSE
					SELECT neocoin INTO t_coin FROM v_user_coin WHERE id = t_u_id;
					IF t_coin < p_neocoin THEN#neo币不足
						INSERT INTO neocoin_error_log(error_code,deal_time) VALUES(concat("consume neocoin:not enough neocoin account:",p_account,",orderid:",p_orderid,"neocoin:",p_neocoin),now());
						SET r_result = 10009;
					ELSE
						#消费
						UPDATE v_user_coin SET neocoin = t_coin - p_neocoin WHERE id = t_u_id;
						INSERT INTO neocoin_consume_log(orderid,account,neocoin,deal_time)	VALUES(p_orderid,p_account,p_neocoin,now());
						#---end
						SET r_result = 0;
					END IF;
			END IF;
			#---------------------END
		ELSE
			SET r_result = 10014;#已经操作过
		END IF;
	ELSE
		INSERT INTO neocoin_error_log(error_code,deal_time) VALUES(concat("add neocoin:neocoin error account:",p_account,",orderid:",p_orderid,"neocoin:",p_neocoin),now());
		SET r_result = 10008; 
	END IF;

	SELECT r_result;
END
;;
DELIMITER ;
