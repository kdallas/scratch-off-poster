/*
Sample Data v02 - multiple lists
Date: 2019-07-14 19:34:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for list_links
-- ----------------------------
DROP TABLE IF EXISTS `list_links`;
CREATE TABLE `list_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `movie_id` smallint(5) unsigned NOT NULL,
  `pos_no` varchar(10) DEFAULT NULL,
  `list_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of list_links
-- ----------------------------
INSERT INTO `list_links` VALUES ('1', '1', '1', '1');
INSERT INTO `list_links` VALUES ('2', '2', '2', '1');
INSERT INTO `list_links` VALUES ('3', '3', '3', '1');
INSERT INTO `list_links` VALUES ('4', '4', '4', '1');
INSERT INTO `list_links` VALUES ('5', '5', '5', '1');
INSERT INTO `list_links` VALUES ('6', '6', '6', '1');
INSERT INTO `list_links` VALUES ('7', '7', '7', '1');
INSERT INTO `list_links` VALUES ('8', '8', '8', '1');
INSERT INTO `list_links` VALUES ('9', '9', '9', '1');
INSERT INTO `list_links` VALUES ('10', '10', '10', '1');
INSERT INTO `list_links` VALUES ('11', '11', '11', '1');
INSERT INTO `list_links` VALUES ('12', '12', '12', '1');
INSERT INTO `list_links` VALUES ('13', '13', '13', '1');
INSERT INTO `list_links` VALUES ('14', '14', '14', '1');
INSERT INTO `list_links` VALUES ('15', '15', '15', '1');
INSERT INTO `list_links` VALUES ('16', '16', '16', '1');
INSERT INTO `list_links` VALUES ('17', '17', '17', '1');
INSERT INTO `list_links` VALUES ('18', '18', '18', '1');
INSERT INTO `list_links` VALUES ('19', '19', '19', '1');
INSERT INTO `list_links` VALUES ('20', '20', '20', '1');
INSERT INTO `list_links` VALUES ('21', '21', '21', '1');
INSERT INTO `list_links` VALUES ('22', '22', '22.1', '1');
INSERT INTO `list_links` VALUES ('23', '23', '22.2', '1');
INSERT INTO `list_links` VALUES ('24', '24', '22.3', '1');
INSERT INTO `list_links` VALUES ('25', '25', '23', '1');
INSERT INTO `list_links` VALUES ('26', '26', '24', '1');
INSERT INTO `list_links` VALUES ('27', '27', '25', '1');
INSERT INTO `list_links` VALUES ('28', '28', '26', '1');
INSERT INTO `list_links` VALUES ('29', '29', '27', '1');
INSERT INTO `list_links` VALUES ('30', '30', '28', '1');
INSERT INTO `list_links` VALUES ('31', '31', '29', '1');
INSERT INTO `list_links` VALUES ('32', '32', '30', '1');
INSERT INTO `list_links` VALUES ('33', '33', '31', '1');
INSERT INTO `list_links` VALUES ('34', '34', '32', '1');
INSERT INTO `list_links` VALUES ('35', '35', '33', '1');
INSERT INTO `list_links` VALUES ('36', '36', '34', '1');
INSERT INTO `list_links` VALUES ('37', '37', '35', '1');
INSERT INTO `list_links` VALUES ('38', '38', '36', '1');
INSERT INTO `list_links` VALUES ('39', '39', '37', '1');
INSERT INTO `list_links` VALUES ('40', '104', '100', '1');
INSERT INTO `list_links` VALUES ('41', '103', '99', '1');
INSERT INTO `list_links` VALUES ('42', '102', '98', '1');
INSERT INTO `list_links` VALUES ('43', '101', '97', '1');
INSERT INTO `list_links` VALUES ('44', '100', '96', '1');
INSERT INTO `list_links` VALUES ('45', '99', '95', '1');
INSERT INTO `list_links` VALUES ('46', '98', '94', '1');
INSERT INTO `list_links` VALUES ('47', '97', '93', '1');
INSERT INTO `list_links` VALUES ('48', '96', '92', '1');
INSERT INTO `list_links` VALUES ('49', '95', '91', '1');
INSERT INTO `list_links` VALUES ('50', '94', '90', '1');
INSERT INTO `list_links` VALUES ('51', '93', '89', '1');
INSERT INTO `list_links` VALUES ('52', '92', '88', '1');
INSERT INTO `list_links` VALUES ('53', '91', '87', '1');
INSERT INTO `list_links` VALUES ('54', '90', '86', '1');
INSERT INTO `list_links` VALUES ('55', '89', '85', '1');
INSERT INTO `list_links` VALUES ('56', '88', '84', '1');
INSERT INTO `list_links` VALUES ('57', '87', '83', '1');
INSERT INTO `list_links` VALUES ('58', '86', '82', '1');
INSERT INTO `list_links` VALUES ('59', '85', '81', '1');
INSERT INTO `list_links` VALUES ('60', '84', '80', '1');
INSERT INTO `list_links` VALUES ('61', '83', '79', '1');
INSERT INTO `list_links` VALUES ('62', '82', '78', '1');
INSERT INTO `list_links` VALUES ('63', '81', '77', '1');
INSERT INTO `list_links` VALUES ('64', '80', '76', '1');
INSERT INTO `list_links` VALUES ('65', '79', '75', '1');
INSERT INTO `list_links` VALUES ('66', '78', '74', '1');
INSERT INTO `list_links` VALUES ('67', '77', '73', '1');
INSERT INTO `list_links` VALUES ('68', '76', '72', '1');
INSERT INTO `list_links` VALUES ('69', '75', '71', '1');
INSERT INTO `list_links` VALUES ('70', '74', '70', '1');
INSERT INTO `list_links` VALUES ('71', '73', '69', '1');
INSERT INTO `list_links` VALUES ('72', '72', '68', '1');
INSERT INTO `list_links` VALUES ('73', '71', '67', '1');
INSERT INTO `list_links` VALUES ('74', '70', '66', '1');
INSERT INTO `list_links` VALUES ('75', '69', '65', '1');
INSERT INTO `list_links` VALUES ('76', '68', '64', '1');
INSERT INTO `list_links` VALUES ('77', '67', '63', '1');
INSERT INTO `list_links` VALUES ('78', '66', '62', '1');
INSERT INTO `list_links` VALUES ('79', '65', '61', '1');
INSERT INTO `list_links` VALUES ('80', '64', '60', '1');
INSERT INTO `list_links` VALUES ('81', '63', '59', '1');
INSERT INTO `list_links` VALUES ('82', '62', '58', '1');
INSERT INTO `list_links` VALUES ('83', '61', '57', '1');
INSERT INTO `list_links` VALUES ('84', '60', '56', '1');
INSERT INTO `list_links` VALUES ('85', '59', '55', '1');
INSERT INTO `list_links` VALUES ('86', '58', '54', '1');
INSERT INTO `list_links` VALUES ('87', '57', '53', '1');
INSERT INTO `list_links` VALUES ('88', '56', '52', '1');
INSERT INTO `list_links` VALUES ('89', '55', '51', '1');
INSERT INTO `list_links` VALUES ('90', '54', '50', '1');
INSERT INTO `list_links` VALUES ('91', '53', '49', '1');
INSERT INTO `list_links` VALUES ('92', '51', '47', '1');
INSERT INTO `list_links` VALUES ('93', '50', '46', '1');
INSERT INTO `list_links` VALUES ('94', '52', '48', '1');
INSERT INTO `list_links` VALUES ('95', '49', '45', '1');
INSERT INTO `list_links` VALUES ('96', '48', '44', '1');
INSERT INTO `list_links` VALUES ('97', '47', '43', '1');
INSERT INTO `list_links` VALUES ('98', '46', '42', '1');
INSERT INTO `list_links` VALUES ('99', '45', '41', '1');
INSERT INTO `list_links` VALUES ('100', '44', '40.3', '1');
INSERT INTO `list_links` VALUES ('101', '43', '40.2', '1');
INSERT INTO `list_links` VALUES ('102', '42', '40.1', '1');
INSERT INTO `list_links` VALUES ('103', '41', '39', '1');
INSERT INTO `list_links` VALUES ('104', '40', '38', '1');
INSERT INTO `list_links` VALUES ('105', '4', '3', '2');
INSERT INTO `list_links` VALUES ('106', '7', '2', '2');
INSERT INTO `list_links` VALUES ('107', '15', '1', '2');
INSERT INTO `list_links` VALUES ('108', '17', '4', '2');

-- ----------------------------
-- Table structure for lists
-- ----------------------------
DROP TABLE IF EXISTS `lists`;
CREATE TABLE `lists` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `listName` varchar(255) DEFAULT NULL,
  `listDesc` varchar(255) DEFAULT NULL,
  `tabLabel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lists
-- ----------------------------
INSERT INTO `lists` VALUES ('1', 'Bucket List', '100 Movies Bucket List Scratch off Poster', 'bucket');
INSERT INTO `lists` VALUES ('2', 'Voted by Public', '100 Top Movies as Voted by the Public', 'public');

-- ----------------------------
-- Table structure for movie_list
-- ----------------------------
DROP TABLE IF EXISTS `movie_list`;
CREATE TABLE `movie_list` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `poster_path` varchar(255) DEFAULT NULL,
  `tmdb_id` int(10) unsigned DEFAULT NULL,
  `imdb_id` varchar(255) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `split` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of movie_list
-- ----------------------------
INSERT INTO `movie_list` VALUES ('1', 'The Shawshank Redemption', '/9O7gLzmreU0nGkIB6K3BsJbzvNv.jpg', '278', 'tt0111161', '1994-09-23', '0');
INSERT INTO `movie_list` VALUES ('2', 'The Dark Knight', '/1hRoyzDtpgMU7Dz4JF22RANzQO7.jpg', '155', 'tt0468569', '2008-07-16', '0');
INSERT INTO `movie_list` VALUES ('3', 'City of God', '/gCqnQaq8T4CfioP9uETLx9iMJF4.jpg', '598', 'tt0317248', '2002-02-05', '0');
INSERT INTO `movie_list` VALUES ('4', 'Pulp Fiction', '/dM2w364MScsjFf8pfMbaWUcWrR.jpg', '680', 'tt0110912', '1994-09-10', '0');
INSERT INTO `movie_list` VALUES ('5', 'Amélie', '/f0uorE7K7ggHfr8r7pUTOHWkOlE.jpg', '194', 'tt0211915', '2001-04-25', '0');
INSERT INTO `movie_list` VALUES ('6', '12 Angry Men', '/3W0v956XxSG5xgm7LB6qu8ExYJ2.jpg', '389', 'tt0050083', '1957-03-25', '0');
INSERT INTO `movie_list` VALUES ('7', 'Blade Runner', '/vfzE3pjE5G7G7kcZWrA3fnbZo7V.jpg', '78', 'tt0083658', '1982-06-25', '0');
INSERT INTO `movie_list` VALUES ('8', 'A Clockwork Orange', '/4sHeTAp65WrSSuc05nRBKddhBxO.jpg', '185', 'tt0066921', '1971-12-18', '0');
INSERT INTO `movie_list` VALUES ('9', 'The Deer Hunter', '/slNJESItHPqp1CENEJQUPw8d7WE.jpg', '11778', 'tt0077416', '1978-12-08', '0');
INSERT INTO `movie_list` VALUES ('10', 'Casablanca', '/wOBKAoUJZb5qTsWv5XXvVV2vUzz.jpg', '289', 'tt0034583', '1942-11-26', '0');
INSERT INTO `movie_list` VALUES ('11', 'E.T. the Extra-Terrestrial', '/8htLKK03TJjKZOXJgihZCu8v0P.jpg', '601', 'tt0083866', '1982-06-11', '0');
INSERT INTO `movie_list` VALUES ('12', 'Up', '/nk11pvocdb5zbFhX5oq5YiLPYMo.jpg', '14160', 'tt1049413', '2009-05-28', '0');
INSERT INTO `movie_list` VALUES ('13', 'The Rocky Horror Picture Show', '/v2NC7o8f7AZvQbOAwrfRbe5Z106.jpg', '36685', 'tt0073629', '1975-08-14', '0');
INSERT INTO `movie_list` VALUES ('14', 'The Big Lebowski', '/qiE3ovg9TPylHReZjizQ40LsKZV.jpg', '115', 'tt0118715', '1998-03-06', '0');
INSERT INTO `movie_list` VALUES ('15', 'Office Space', '/iO9aZzrfmMvm3IqkFiQyuuUMLh2.jpg', '1542', 'tt0151804', '1999-02-19', '0');
INSERT INTO `movie_list` VALUES ('16', 'Fight Club', '/adw6Lq9FiC9zjYEpOqfq03ituwp.jpg', '550', 'tt0137523', '1999-10-15', '0');
INSERT INTO `movie_list` VALUES ('17', 'Snatch', '/on9JlbGEccLsYkjeEph2Whm1DIp.jpg', '107', 'tt0208092', '2000-09-01', '0');
INSERT INTO `movie_list` VALUES ('18', 'Oldboy', '/rIZX6X0MIHYEebk6W4LABT9VP2c.jpg', '670', 'tt0364569', '2003-09-28', '0');
INSERT INTO `movie_list` VALUES ('19', 'Léon: The Professional', '/gE8S02QUOhVnAmYu4tcrBlMTujz.jpg', '101', 'tt0110413', '1994-09-14', '0');
INSERT INTO `movie_list` VALUES ('20', 'Scarface', '/zr2p353wrd6j3wjLgDT4TcaestB.jpg', '111', 'tt0086250', '1983-12-08', '0');
INSERT INTO `movie_list` VALUES ('21', 'Raiders of the Lost Ark', '/44sKJOGP3fTm4QXBcIuqu0RkdP7.jpg', '85', 'tt0082971', '1981-06-12', '0');
INSERT INTO `movie_list` VALUES ('22', 'The Fellowship of the Ring', '/56zTpe2xvaA4alU51sRWPoKPYZy.jpg', '120', 'tt0120737', '2001-12-18', '1');
INSERT INTO `movie_list` VALUES ('23', 'The Two Towers', '/5VTN0pR8gcqV3EPUHHfMGnJYN9L.jpg', '121', 'tt0167261', '2002-12-18', '1');
INSERT INTO `movie_list` VALUES ('24', 'The Return of the King', '/rCzpDGLbOoPwLjy3OAm5NUPOTrC.jpg', '122', 'tt0167260', '2003-12-01', '1');
INSERT INTO `movie_list` VALUES ('25', 'Moonlight', '/qAwFbszz0kRyTuXmMeKQZCX3Q2O.jpg', '376867', 'tt4975722', '2016-10-21', '0');
INSERT INTO `movie_list` VALUES ('26', 'The Matrix', '/hEpWvX6Bp79eLxY1kX5ZZJcme5U.jpg', '603', 'tt0133093', '1999-03-30', '0');
INSERT INTO `movie_list` VALUES ('27', 'Apocalypse Now', '/jcvJ2xcVWU9Wh0hZAxcs103s8nN.jpg', '28', 'tt0078788', '1979-08-15', '0');
INSERT INTO `movie_list` VALUES ('28', 'The Grand Budapest Hotel', '/nX5XotM9yprCKarRH4fzOq1VM1J.jpg', '120467', 'tt2278388', '2014-02-26', '0');
INSERT INTO `movie_list` VALUES ('29', 'Life of Brian', '/cKpJnXJ6DzAGafAjUWB5PjT904O.jpg', '583', 'tt0079470', '1979-08-17', '0');
INSERT INTO `movie_list` VALUES ('30', 'In Bruges', '/kBABboeLU2HsKWSG7DwiF9saHl5.jpg', '8321', 'tt0780536', '2008-02-08', '0');
INSERT INTO `movie_list` VALUES ('31', '3 Idiots', '/66A9MqXOyVFCssoloscw79z8Tew.jpg', '20453', 'tt1187043', '2009-12-23', '0');
INSERT INTO `movie_list` VALUES ('32', 'The Godfather', '/rPdtLWNsZmAtoZl9PK7S2wE3qiS.jpg', '238', 'tt0068646', '1972-03-14', '0');
INSERT INTO `movie_list` VALUES ('33', 'The Notebook', '/gMfstesBXKdsHToAUXVPHujUDfb.jpg', '11036', 'tt0332280', '2004-06-25', '0');
INSERT INTO `movie_list` VALUES ('34', 'The Lion King', '/bKPtXn9n4M4s8vvZrbw40mYsefB.jpg', '8587', 'tt0110357', '1994-05-07', '0');
INSERT INTO `movie_list` VALUES ('35', 'Stand by Me', '/7QbJa6syM4ZYxtey0d7qB7bmhzb.jpg', '235', 'tt0092005', '1986-08-08', '0');
INSERT INTO `movie_list` VALUES ('36', 'Dirty Dancing', '/jFoktPxTtabZfh9JeDy3F78g9w7.jpg', '88', 'tt0092890', '1987-08-21', '0');
INSERT INTO `movie_list` VALUES ('37', 'Jurassic Park', '/c414cDeQ9b6qLPLeKmiJuLDUREJ.jpg', '329', 'tt0107290', '1993-06-11', '0');
INSERT INTO `movie_list` VALUES ('38', '2001: A Space Odyssey', '/90T7b2LIrL07ndYQBmSm09yqVEH.jpg', '62', 'tt0062622', '1968-04-09', '0');
INSERT INTO `movie_list` VALUES ('39', 'The Goonies', '/bZUbpjwnarSHJK40W9sGpyedWhx.jpg', '9340', 'tt0089218', '1985-06-07', '0');
INSERT INTO `movie_list` VALUES ('40', 'WALL·E', '/9cJETuLMc6R0bTWRA5i7ctY9bxk.jpg', '10681', 'tt0910970', '2008-06-22', '0');
INSERT INTO `movie_list` VALUES ('41', 'Groundhog Day', '/vXjVd0Vu0MXRZnga7wEnHIIhO5B.jpg', '137', 'tt0107048', '1993-02-11', '0');
INSERT INTO `movie_list` VALUES ('42', 'Star Wars', '/btTdmkgIvOi0FFip1sPuZI2oQG6.jpg', '11', 'tt0076759', '1977-05-25', '1');
INSERT INTO `movie_list` VALUES ('43', 'The Empire Strikes Back', '/9SKDSFbaM6LuGqG1aPWN3wYGEyD.jpg', '1891', 'tt0080684', '1980-05-20', '1');
INSERT INTO `movie_list` VALUES ('44', 'Return of the Jedi', '/lrJWyjOVjPhghl4KyAMtOepAxs.jpg', '1892', 'tt0086190', '1983-05-23', '1');
INSERT INTO `movie_list` VALUES ('45', 'Schindler\'s List', '/yPisjyLweCl1tbgwgtzBCNCBle.jpg', '424', 'tt0108052', '1993-12-15', '0');
INSERT INTO `movie_list` VALUES ('46', 'Breakfast at Tiffany\'s', '/c95lbDwL5WT8PV9DZsdSvRtXKNA.jpg', '164', 'tt0054698', '1961-10-05', '0');
INSERT INTO `movie_list` VALUES ('47', 'Shaun of the Dead', '/2evlcGnsfdFWLb7geNlIjIewc0Q.jpg', '747', 'tt0365748', '2004-04-09', '0');
INSERT INTO `movie_list` VALUES ('48', 'Back to the Future', '/pTpxQB1N0waaSc3OSn0e9oc8kx9.jpg', '105', 'tt0088763', '1985-07-03', '0');
INSERT INTO `movie_list` VALUES ('49', 'Forrest Gump', '/yE5d3BUhE8hCnkMUJOo1QDoOGNz.jpg', '13', 'tt0109830', '1994-07-06', '0');
INSERT INTO `movie_list` VALUES ('50', 'The Silence of the Lambs', '/qjAyTj2BSth1EQ89vNfo0JYVPFN.jpg', '274', 'tt0102926', '1991-02-01', '0');
INSERT INTO `movie_list` VALUES ('51', 'The Shining', '/9fgh3Ns1iRzlQNYuJyK0ARQZU7w.jpg', '694', 'tt0081505', '1980-05-22', '0');
INSERT INTO `movie_list` VALUES ('52', 'Alien', '/2h00HrZs89SL3tXB4nbkiM7BKHs.jpg', '348', 'tt0078748', '1979-05-25', '0');
INSERT INTO `movie_list` VALUES ('53', 'Memento', '/fQMSaP88cf1nz4qwuNEEFtazuDM.jpg', '77', 'tt0209144', '2000-10-11', '0');
INSERT INTO `movie_list` VALUES ('54', 'Se7en', '/8zw8IL4zEPjkh8Aysdcd0FwGMb0.jpg', '807', 'tt0114369', '1995-09-22', '0');
INSERT INTO `movie_list` VALUES ('55', 'Halloween', '/vjoOFOTBJcJvA1weJejlZ92LZD4.jpg', '948', 'tt0077651', '1978-10-24', '0');
INSERT INTO `movie_list` VALUES ('56', 'Jaws', '/l1yltvzILaZcx2jYvc5sEMkM7Eh.jpg', '578', 'tt0073195', '1975-06-18', '0');
INSERT INTO `movie_list` VALUES ('57', 'The Evil Dead', '/7cpSdCrBY7UhiygkcP57dpixXsW.jpg', '764', 'tt0083907', '1981-10-15', '0');
INSERT INTO `movie_list` VALUES ('58', 'Airplane!', '/b4sAWNIbfXw4WTdc1wiVRBk2Vko.jpg', '813', 'tt0080339', '1980-07-02', '0');
INSERT INTO `movie_list` VALUES ('59', 'Mean Girls', '/lDlGPZS0UJYKxVlpyff3BMyPc2H.jpg', '10625', 'tt0377092', '2004-04-30', '0');
INSERT INTO `movie_list` VALUES ('60', 'Lawrence of Arabia', '/j21UXCOq0EbV8EPTtmPn1CGePfB.jpg', '947', 'tt0056172', '1962-12-10', '0');
INSERT INTO `movie_list` VALUES ('61', 'Drive', '/nu7XIa67cXc2t7frXCE5voXUJcN.jpg', '64690', 'tt0780504', '2011-08-06', '0');
INSERT INTO `movie_list` VALUES ('62', 'Casino Royale', '/zlWBxz2pTA9p45kUTrI8AQiKrHm.jpg', '36557', 'tt0381061', '2006-11-14', '0');
INSERT INTO `movie_list` VALUES ('63', 'Ghostbusters', '/3FS3oBdorgczgfCkFi2u8ZTFfpS.jpg', '620', 'tt0087332', '1984-06-07', '0');
INSERT INTO `movie_list` VALUES ('64', 'Rosemary\'s Baby', '/kqA1pt9ovovArgJZi2Lu4Unf6He.jpg', '805', 'tt0063522', '1968-06-12', '0');
INSERT INTO `movie_list` VALUES ('65', 'Mary and Max', '/k0lQISUC4NuvKYasJn59JHc2rla.jpg', '24238', 'tt0978762', '2009-02-09', '0');
INSERT INTO `movie_list` VALUES ('66', 'The Terminator', '/q8ffBuxQlYOHrvPniLgCbmKK4Lv.jpg', '218', 'tt0088247', '1984-10-26', '0');
INSERT INTO `movie_list` VALUES ('67', 'The Green Mile', '/sOHqdY1RnSn6kcfAHKu28jvTebE.jpg', '497', 'tt0120689', '1999-12-10', '0');
INSERT INTO `movie_list` VALUES ('68', 'Rocky', '/9TUR3s1PMJHwDRbpm7PWQ0S7IRy.jpg', '1366', 'tt0075148', '1976-11-21', '0');
INSERT INTO `movie_list` VALUES ('69', 'This Is Spinal Tap', '/2VDPeoPJ2bKdmfuJxxCktx1hr5g.jpg', '11031', 'tt0088258', '1984-05-04', '0');
INSERT INTO `movie_list` VALUES ('70', 'American Psycho', '/qXsylPM4Lr5397R3eHrfqHhTUNc.jpg', '1359', 'tt0144084', '2000-04-13', '0');
INSERT INTO `movie_list` VALUES ('71', 'Citizen Kane', '/sav0jxhqiH0bPr2vZFU0Kjt2nZL.jpg', '15', 'tt0033467', '1941-04-30', '0');
INSERT INTO `movie_list` VALUES ('72', 'The Intouchables', '/4mFsNQwbD0F237Tx7gAPotd0nbJ.jpg', '77338', 'tt1675434', '2011-11-02', '0');
INSERT INTO `movie_list` VALUES ('73', 'American History X', '/fXepRAYOx1qC3wju7XdDGx60775.jpg', '73', 'tt0120586', '1998-10-30', '0');
INSERT INTO `movie_list` VALUES ('74', 'Seven Samurai', '/v6xrz4fr92KY1oNC3HsEvrsvR1n.jpg', '346', 'tt0047478', '1954-04-26', '0');
INSERT INTO `movie_list` VALUES ('75', 'Gladiator', '/6WBIzCgmDCYrqh64yDREGeDk9d3.jpg', '98', 'tt0172495', '2000-05-01', '0');
INSERT INTO `movie_list` VALUES ('76', 'The Good, the Bad and the Ugly', '/wfPHdfofBD5PN96dV96a51B3Ja2.jpg', '429', 'tt0060196', '1966-12-23', '0');
INSERT INTO `movie_list` VALUES ('77', 'Brokeback Mountain', '/z2DqVxj17aW6xpimRlCLfhKSfUm.jpg', '142', 'tt0388795', '2005-09-10', '0');
INSERT INTO `movie_list` VALUES ('78', 'The Great Dictator', '/hK2KsU0lNiYRqIrYJcC3x63dPnH.jpg', '914', 'tt0032553', '1940-10-15', '0');
INSERT INTO `movie_list` VALUES ('79', 'Toy Story', '/rhIRbceoE9lR4veEXuwCC2wARtG.jpg', '862', 'tt0114709', '1995-10-30', '0');
INSERT INTO `movie_list` VALUES ('80', 'The Prestige', '/5MXyQfz8xUP3dIFPTubhTsbFY6N.jpg', '1124', 'tt0482571', '2006-10-19', '0');
INSERT INTO `movie_list` VALUES ('81', 'Titanic', '/kHXEpyfl6zqn8a6YuozZUujufXf.jpg', '597', 'tt0120338', '1997-11-18', '0');
INSERT INTO `movie_list` VALUES ('82', 'Her', '/fsoTLnUXEUTNuVCBxAJMY0HPPd.jpg', '152601', 'tt1798709', '2013-12-18', '0');
INSERT INTO `movie_list` VALUES ('83', 'Boyz n the Hood', '/9qQdpidN33pTEaxAP5gaTmCPGFq.jpg', '650', 'tt0101507', '1991-07-12', '0');
INSERT INTO `movie_list` VALUES ('84', 'Four Weddings and a Funeral', '/md9kMKnLG8LG4pMDM98gy5x4K5L.jpg', '712', 'tt0109831', '1994-03-09', '0');
INSERT INTO `movie_list` VALUES ('85', 'Little Miss Sunshine', '/5ZuviyEOkelod8x5j5CWa45jsw2.jpg', '773', 'tt0449059', '2006-07-26', '0');
INSERT INTO `movie_list` VALUES ('86', 'Trainspotting', '/p1O3eFsdb0GEIYu87xlwV7P4jM1.jpg', '627', 'tt0117951', '1996-02-23', '0');
INSERT INTO `movie_list` VALUES ('87', 'The Departed', '/tGLO9zw5ZtCeyyEWgbYGgsFxC6i.jpg', '1422', 'tt0407887', '2006-10-05', '0');
INSERT INTO `movie_list` VALUES ('88', 'Saving Private Ryan', '/miDoEMlYDJhOCvxlzI0wZqBs9Yt.jpg', '857', 'tt0120815', '1998-07-24', '0');
INSERT INTO `movie_list` VALUES ('89', 'No Country for Old Men', '/nBaqryObPuxmuAndWUjDE5rriTd.jpg', '6977', 'tt0477348', '2007-11-08', '0');
INSERT INTO `movie_list` VALUES ('90', 'The Pianist', '/hfMeo073RxKKjZZV4gSGema1yog.jpg', '423', 'tt0253474', '2002-09-17', '0');
INSERT INTO `movie_list` VALUES ('91', 'Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb', '/tviJ68Wj4glQk3CPMvdvExYHxX.jpg', '935', 'tt0057012', '1964-01-29', '0');
INSERT INTO `movie_list` VALUES ('92', 'Lagaan: Once Upon a Time in India', '/yNX9lFRAFeNLNRIXdqZK9gYrYKa.jpg', '19666', 'tt0169102', '2001-06-15', '0');
INSERT INTO `movie_list` VALUES ('93', 'Bahubali: The Beginning', '/5uurRfH9KdMiecCNTzO1MSi9Tqw.jpg', '256040', 'tt2631186', '2015-07-10', '0');
INSERT INTO `movie_list` VALUES ('94', 'Psycho', '/81d8oyEFgj7FlxJqSDXWr8JH8kV.jpg', '539', 'tt0054215', '1960-06-16', '0');
INSERT INTO `movie_list` VALUES ('95', 'Vertigo', '/obhM86qyv8RsE69XSMTtT9FdE0b.jpg', '426', 'tt0052357', '1958-05-09', '0');
INSERT INTO `movie_list` VALUES ('96', 'The Truman Show', '/EelZzudHRvJmjWccWscN1S5vmI.jpg', '37165', 'tt0120382', '1998-06-04', '0');
INSERT INTO `movie_list` VALUES ('97', 'Reservoir Dogs', '/jX94vnfcuJ8rTnFbsoriY6dlHrC.jpg', '500', 'tt0105236', '1992-09-02', '0');
INSERT INTO `movie_list` VALUES ('98', 'Amadeus', '/flnoqdC38mbaulAeptjynOFO7yi.jpg', '279', 'tt0086879', '1984-10-11', '0');
INSERT INTO `movie_list` VALUES ('99', 'Enter the Dragon', '/6C006cxfwjWYkBW4fM3xCMyr7Yg.jpg', '9461', 'tt0070034', '1973-08-17', '0');
INSERT INTO `movie_list` VALUES ('100', 'The Wizard of Oz', '/tKEHoKPZv3af0Pn3poaOLHOJ6NM.jpg', '630', 'tt0032138', '1939-08-15', '0');
INSERT INTO `movie_list` VALUES ('101', 'Gangs of New York', '/lemqKtcCuAano5aqrzxYiKC8kkn.jpg', '3131', 'tt0217505', '2002-12-14', '0');
INSERT INTO `movie_list` VALUES ('102', 'The Usual Suspects', '/jgJoRWltoS17nD5MAQ1yK2Ztefw.jpg', '629', 'tt0114814', '1995-07-19', '0');
INSERT INTO `movie_list` VALUES ('103', 'Spirited Away', '/oRvMaJOmapypFUcQqpgHMZA6qL9.jpg', '129', 'tt0245429', '2001-07-20', '0');
INSERT INTO `movie_list` VALUES ('104', 'Good Will Hunting', '/jq8LjngZ7XZEQge5JFTdOGMrHyZ.jpg', '489', 'tt0119217', '1997-12-05', '0');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `userID` smallint(5) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `list_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `watched_list` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '3574', null, '1', '[1,2,4,7,11,12,14,15,16,21,\"22.1\",\"22.2\",\"22.3\",24,25,26,27,30,32,33,34,35,36,37,38,39,\"40.1\",\"40.2\",\"40.3\",41,43,44,45,46,48,50,51,52,54,57,58,59,62,64,65,66,71,75,77,80,82,84,86,90,92,93,96,100]');
INSERT INTO `users` VALUES ('6', '1317', null, '1', '[\"12\"]');
INSERT INTO `users` VALUES ('7', '1105', null, '1', '[\"92\"]');
INSERT INTO `users` VALUES ('8', '1734', null, '1', '[\"21\",\"22.1\",\"22.2\",\"22.3\",\"24\",\"40.1\",\"40.2\",\"40.3\"]');
INSERT INTO `users` VALUES ('9', '3291', null, '1', '[2,3,6,8,\"22.2\"]');
INSERT INTO `users` VALUES ('19', '3741', null, '2', '[2,15]');
