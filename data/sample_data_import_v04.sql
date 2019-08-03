/*
Sample Data v04 - Adds support for book lists
Date: 2019-08-03 15:46:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book_list
-- ----------------------------
DROP TABLE IF EXISTS `book_list`;
CREATE TABLE `book_list` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `published_date` date DEFAULT NULL,
  `volume_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of book_list
-- ----------------------------
INSERT INTO `book_list` VALUES ('1', 'American Gods', 'Neil Gaiman', '2011-11-10', 'fXfJCKXp5-kC');
INSERT INTO `book_list` VALUES ('2', 'Siddhartha', 'Hermann Hesse', '2008-08-07', 'TrJIUZ1ezNkC');
INSERT INTO `book_list` VALUES ('3', 'Sophie\'s World', 'Jostein Gaarder', '2010-07-15', 'J8nE3B5lD9AC');
INSERT INTO `book_list` VALUES ('4', 'The Great Gatsby', 'F. Scott Fitzgerald', '2003-05-27', 'iXn5U2IzVH0C');
INSERT INTO `book_list` VALUES ('5', 'To Kill a Mockingbird', 'Harper Lee', '2014-04-28', 'i5PsAwAAQBAJ');
INSERT INTO `book_list` VALUES ('6', 'Matilda (Colour Edition)', 'Roald Dahl', '2016-09-13', 'P6D7DAAAQBAJ');
INSERT INTO `book_list` VALUES ('7', 'The Art of War', 'Sun Tzu', '2012-03-07', 'V-7DAgAAQBAJ');
INSERT INTO `book_list` VALUES ('8', 'Long Walk To Freedom', 'Nelson Mandela', '2013-04-25', '_ewvL93kFx4C');
INSERT INTO `book_list` VALUES ('9', 'The Man Who Mistook His Wife for a Hat', 'Oliver Sacks', '2009-04-01', 'OmSV5tKzvboC');
INSERT INTO `book_list` VALUES ('10', 'Noughts & Crosses', 'Malorie Blackman', '2006-01-01', 'XM81F4Z2yXsC');
INSERT INTO `book_list` VALUES ('11', 'Lord of the Flies', 'William Golding', '2003-01-01', '3KRdJZbAN_sC');
INSERT INTO `book_list` VALUES ('12', 'A Brief History of Time', 'Stephen W. Hawking', '1998-01-01', 'E7mEnx3zE4AC');
INSERT INTO `book_list` VALUES ('13', 'Do Androids Dream Of Electric Sheep?', 'Philip K. Dick', '2010-04-01', 'MoEO9onVftUC');
INSERT INTO `book_list` VALUES ('14', 'Murder on the Orient Express', 'Agatha Christie', '2004-01-01', 'DZ47PgAACAAJ');
INSERT INTO `book_list` VALUES ('15', 'In Cold Blood', 'Truman Capote', '1980-01-01', 'dRkzaee6Fv0C');
INSERT INTO `book_list` VALUES ('16', 'Frankenstein, or, The Modern Prometheus', 'Mary Wollstonecraft Shelley', '1869-01-01', '2Zc3AAAAYAAJ');
INSERT INTO `book_list` VALUES ('17', 'Alice\'s Adventures in Wonderland & Through the Looking-glass', 'Lewis Carroll', '1993-01-01', '_-DjX7W_xJoC');
INSERT INTO `book_list` VALUES ('18', 'The Secret History', 'Donna Tartt', '2013-05-02', 'S4_PyiyJixQC');
INSERT INTO `book_list` VALUES ('19', 'Wuthering Heights', 'Emily Brontë', '1995-03-09', 'wjlOO_Q-f0kC');
INSERT INTO `book_list` VALUES ('20', 'The Grapes of Wrath', 'John Steinbeck', '1972-01-01', 'riYjBwAAQBAJ');
INSERT INTO `book_list` VALUES ('21', 'Norwegian Wood', 'Haruki Murakami', '2011-10-10', 'kd1XlWVAIWQC');
INSERT INTO `book_list` VALUES ('22', 'One flew over the cuckoo\'s nest', 'Ken Kesey', '1973-01-01', 'BwcPAQAAMAAJ');
INSERT INTO `book_list` VALUES ('23', 'The Man in the Iron Mask', 'Alexandre Dumas, Pere', '2014-02-06', 'NBbNAgAAQBAJ');
INSERT INTO `book_list` VALUES ('24', 'The Color Purple', 'Alice Walker', '1982-01-01', 'CX6m7scQ4wcC');
INSERT INTO `book_list` VALUES ('25', 'The Girl With the Dragon Tattoo', 'Stieg Larsson', '2010-01-01', '0zlhBQAAQBAJ');
INSERT INTO `book_list` VALUES ('26', 'Lolita', 'Vladimir Nabokov', '2012-07-27', 'S0lVyYcw8tsC');
INSERT INTO `book_list` VALUES ('27', 'Harry Potter Series', 'JK Rowling', '2007-11-19', 'YvQ_AhkJpBUC');
INSERT INTO `book_list` VALUES ('28', 'His Dark Materials: The Complete Trilogy', 'Philip Pullman', '2015-11-20', 'WCjnCgAAQBAJ');
INSERT INTO `book_list` VALUES ('30', 'The Picture of Dorian Gray', 'Oscar Wilde', '1908-01-01', 'w9A98UIGNMAC');
INSERT INTO `book_list` VALUES ('31', 'The Road', 'Cormac McCarthy', '2006-10-01', 'fwMuvZo1HEAC');
INSERT INTO `book_list` VALUES ('32', 'ULYSSES', 'James Joyce', '2017-07-06', 'o3RODwAAQBAJ');
INSERT INTO `book_list` VALUES ('33', 'Bad Science', 'Ben Goldacre', '2008-12-07', 'Gv1NQubrGNIC');
INSERT INTO `book_list` VALUES ('34', 'I Capture the Castle', 'Dodie Smith', '2013-01-01', 'zXg8AQAAQBAJ');
INSERT INTO `book_list` VALUES ('35', 'Fear and Loathing in Las Vegas', 'Hunter S. Thompson', '2010-09-29', 'R11qaqN4jzQC');
INSERT INTO `book_list` VALUES ('36', 'Les Miserables', 'Victor Hugo', '1862-01-01', 'E18Bom4aEnIC');
INSERT INTO `book_list` VALUES ('37', 'The Catcher in the Rye', 'J.D. Salinger', '2001-01-30', 'iQDWg8mBz-0C');
INSERT INTO `book_list` VALUES ('38', 'The Wind in the Willows', 'Kenneth Grahame', '1908-01-01', 'bqhaAAAAMAAJ');
INSERT INTO `book_list` VALUES ('39', 'Wild Swans', 'Jung Chang', '2008-06-20', '0sBu1Fj4Ed0C');
INSERT INTO `book_list` VALUES ('40', 'The Ultimate Hitchhiker\'s Guide to the Galaxy', 'Douglas Adams', '2010-09-29', 'mO-62VxpLe0C');
INSERT INTO `book_list` VALUES ('41', 'Tinker Tailor Soldier Spy', 'John le Carré', '2018-09-27', '4G9ODwAAQBAJ');
INSERT INTO `book_list` VALUES ('42', 'Crime and Punishment', 'Fyodor Dostoyevsky', '2008-01-01', '0HZrq-4zA5QC');
INSERT INTO `book_list` VALUES ('43', 'The Poisonwood Bible', 'Barbara Kingsolver', '2008-09-04', 'QJ0JmYmeHFAC');
INSERT INTO `book_list` VALUES ('44', 'Gulliver\'s Travels', 'Jonathan Swift', '1992-01-01', 'nEaXR-eNwOYC');
INSERT INTO `book_list` VALUES ('45', 'The War of the Worlds', 'H. G. Wells', '1898-01-01', '1HoBYmku9uQC');
INSERT INTO `book_list` VALUES ('46', 'Anna Karenina', 'Leo Tolstoy', '2012-03-05', 'dm8fqg9B8DEC');
INSERT INTO `book_list` VALUES ('47', 'A Game of Thrones (A Song of Ice and Fire, Book 1)', 'George R.R. Martin', '2010-12-23', 'JPDOSzE7Bo0C');
INSERT INTO `book_list` VALUES ('48', 'The Help', 'Kathryn Stockett', '2011-09-29', 'wsEXhw17prsC');
INSERT INTO `book_list` VALUES ('49', 'Flowers for Algernon', 'David Rogers', '1969-01-01', 'gK98gXR8onwC');
INSERT INTO `book_list` VALUES ('50', 'Maya Angelou\'s I Know why the Caged Bird Sings', 'Joanne M. Braxton', '1999-01-01', 'pCNi3A6GPm8C');
INSERT INTO `book_list` VALUES ('51', 'American Psycho', 'Bret Easton Ellis', '2010-06-09', 'Gd_mGRCwW1QC');
INSERT INTO `book_list` VALUES ('52', 'Notes from a Small Island', 'Bill Bryson', '2015-01-01', 'yGFFCgAAQBAJ');
INSERT INTO `book_list` VALUES ('53', 'Macbeth', 'William Shakespeare', '1876-01-01', 'OmtFGmhd0g0C');
INSERT INTO `book_list` VALUES ('54', 'The Fellowship of the Ring', 'J.R.R. Tolkien', '2012-02-15', 'aWZzLPhY4o0C');
INSERT INTO `book_list` VALUES ('55', 'A History of Venice', 'John Julius Norwich', '2003-07-03', '1RLm2eHVNDsC');
INSERT INTO `book_list` VALUES ('56', 'Great Expectations', 'Charles Dickens', '1881-01-01', 'fhUXAAAAYAAJ');
INSERT INTO `book_list` VALUES ('57', 'The Selfish Gene', 'Richard Dawkins', '2006-03-16', 'koaD_Aod_V0C');
INSERT INTO `book_list` VALUES ('58', 'A Wild Sheep Chase', 'Haruki Murakami', '2011-10-10', 'CMV-gKPeJtcC');
INSERT INTO `book_list` VALUES ('59', 'Schindler\'s List', 'Thomas Keneally', '2013-08-06', 'ARBAxc4SWFgC');
INSERT INTO `book_list` VALUES ('60', 'London Fields', 'Martin Amis', '2010-09-07', 'PPPA0PPJALUC');
INSERT INTO `book_list` VALUES ('61', 'The Hound of the Baskervilles', 'Sir Arthur Conan Doyle', '1987-05-12', 'SkrrOPAoD7EC');
INSERT INTO `book_list` VALUES ('62', 'My Man Jeeves', 'P. G. Wodehouse', '2018-03-10', 'BPN4DwAAQBAJ');
INSERT INTO `book_list` VALUES ('63', 'The English Patient', 'Michael Ondaatje', '2018-05-26', 'IA9KtwEACAAJ');
INSERT INTO `book_list` VALUES ('64', 'The Mill on the Floss', 'George Eliot', '2015-07-30', 'MOQmCwAAQBAJ');
INSERT INTO `book_list` VALUES ('65', 'The Count of Monte-Cristo', 'Alexandre Dumas', '1846-01-01', 'RyEEAAAAQAAJ');
INSERT INTO `book_list` VALUES ('66', 'The Commitments', 'Roddy Doyle', '2013-01-01', 'WcSRAQAAQBAJ');
INSERT INTO `book_list` VALUES ('67', 'Gladys Aylward', 'Gladys Aylward', '1970-06-01', 'r0Eipr3ZhHsC');
INSERT INTO `book_list` VALUES ('68', 'Midnight\'s Children', 'Salman Rushdie', '2011-01-01', 'S2u3hqmYCvkC');
INSERT INTO `book_list` VALUES ('69', 'Tess of the D\'urbervilles', 'Thomas Hardy', '2006-09-05', '6nVLgrfzWjAC');
INSERT INTO `book_list` VALUES ('70', 'The Boy in the Striped Pyjamas', 'John Boyne', '2012-08-02', 'yNMdhHubFK0C');
INSERT INTO `book_list` VALUES ('71', 'Hamlet', 'William Shakespeare', '2005-12-01', 'webh0KkT9o8C');
INSERT INTO `book_list` VALUES ('72', 'Goodnight Mister Tom', 'Michelle Magorian', '2010-06-03', '1mUR9HyEQbEC');
INSERT INTO `book_list` VALUES ('73', 'Dissolution: A Shardlake Novel 1', 'C. J. Sansom', '2003-05-01', 'hWF5bUuMJUsC');
INSERT INTO `book_list` VALUES ('74', 'The Time Machine', 'H. G. Wells', '2009-01-01', 'f3H6SMzlQQwC');
INSERT INTO `book_list` VALUES ('75', 'Winnie-the-Pooh the Collection Collection', 'A. A. Milne', '2016-02-22', 'EOGDQAAACAAJ');
INSERT INTO `book_list` VALUES ('76', 'Animal Farm', 'George Orwell', '1993-01-01', 'RJcBeywz9uMC');
INSERT INTO `book_list` VALUES ('77', 'The Diary of a Young Girl', 'Anne Frank', '1997-01-01', 'M0I2QwAACAAJ');
INSERT INTO `book_list` VALUES ('78', 'The Enchanted Wood', 'Enid Blyton', '2015-07-02', '70uNBQAAQBAJ');
INSERT INTO `book_list` VALUES ('79', 'Dracula', 'Bram Stoker', '2014-05-06', 'sTUoAwAAQBAJ');
INSERT INTO `book_list` VALUES ('80', 'All Quiet on the Western Front', 'Erich Maria Remarque', '1997-01-01', 'fNSXhRuvn_MC');
INSERT INTO `book_list` VALUES ('81', 'Bridget Jones\'s Diary', 'Helen Fielding', '1997-09-01', '3CCqfZoQLjgC');
INSERT INTO `book_list` VALUES ('82', 'The Kite Runner', 'Khaled Hosseini', '2017-03-01', 'IdfWDQAAQBAJ');
INSERT INTO `book_list` VALUES ('83', 'To the Lighthouse', 'Virginia Woolf', '2004-01-01', 'S_qN7V5CB6QC');
INSERT INTO `book_list` VALUES ('84', 'The Chronicles of Narnia', 'C. S. Lewis', '2006-10-17', 'J_htPwAACAAJ');
INSERT INTO `book_list` VALUES ('85', 'Watership Down', 'Richard Adams', '2018-12-18', '7pd5DwAAQBAJ');
INSERT INTO `book_list` VALUES ('86', 'The Odyssey', 'Homer', '2011-03-01', 'qhQAywOYz10C');
INSERT INTO `book_list` VALUES ('87', 'War and Peace', 'Leo Tolstoy', '2019-06-28', '5lpoAwAAQBAJ');
INSERT INTO `book_list` VALUES ('88', 'Moby-Dick', 'Herman Melville', '2004-01-01', 'cyrMu-gkGQQC');
INSERT INTO `book_list` VALUES ('89', 'A Tale of Two Cities', 'Charles Dickens', '1868-01-01', 'YqfPAAAAMAAJ');
INSERT INTO `book_list` VALUES ('90', 'Middlemarch', 'George Eliot', '1994-01-01', 'iPLjUhiXAhYC');
INSERT INTO `book_list` VALUES ('91', 'Jane Eyre', 'Charlotte Brontë', '1864-01-01', 'lSMGAAAAQAAJ');
INSERT INTO `book_list` VALUES ('92', 'Pride and Prejudice', 'Jane Austen', '1918-01-01', 's1gVAAAAYAAJ');
INSERT INTO `book_list` VALUES ('93', 'Memoirs of a Geisha', 'Arthur Golden', '2011-08-01', 'zXUmUO_OQr8C');
INSERT INTO `book_list` VALUES ('94', 'Misery', 'Stephen King', '2016-01-05', 'cc5NCwAAQBAJ');
INSERT INTO `book_list` VALUES ('95', 'Birdsong', 'Sebastian Faulks', '2014-04-01', 'e19hAwAAQBAJ');
INSERT INTO `book_list` VALUES ('96', 'Tell No One', 'Harlan Coben', '2010-08-26', 'cQijlbopEzoC');
INSERT INTO `book_list` VALUES ('97', 'The Adventures of Huckleberry Finn and Zombie Jim', 'Mark Twain', '2011-04-12', 'ees5mRMzg1kC');
INSERT INTO `book_list` VALUES ('98', 'Freakonomics', 'Steven D. Levitt', '2009-09-01', '2pphyRUF3eoC');
INSERT INTO `book_list` VALUES ('99', 'The Handmaid\'s Tale', 'Margaret Atwood', '1996-01-01', 'mKOjMctROckC');
INSERT INTO `book_list` VALUES ('100', '1984', 'George Orwell', '1949-06-08', '8WdODwAAQBAJ');
INSERT INTO `book_list` VALUES ('101', 'The old man and the sea', 'Ernest Hemingway', '1995-01-01', 'K1cIZmFe7KoC');

-- ----------------------------
-- Table structure for list_links
-- ----------------------------
DROP TABLE IF EXISTS `list_links`;
CREATE TABLE `list_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `movie_id` smallint(5) unsigned DEFAULT NULL,
  `book_id` smallint(5) unsigned DEFAULT NULL,
  `pos_no` varchar(10) DEFAULT NULL,
  `list_id` tinyint(3) unsigned NOT NULL,
  `split` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=504 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of list_links
-- ----------------------------
INSERT INTO `list_links` VALUES ('1', '1', null, '1', '1', '0');
INSERT INTO `list_links` VALUES ('2', '2', null, '2', '1', '0');
INSERT INTO `list_links` VALUES ('3', '3', null, '3', '1', '0');
INSERT INTO `list_links` VALUES ('4', '4', null, '4', '1', '0');
INSERT INTO `list_links` VALUES ('5', '5', null, '5', '1', '0');
INSERT INTO `list_links` VALUES ('6', '6', null, '6', '1', '0');
INSERT INTO `list_links` VALUES ('7', '7', null, '7', '1', '0');
INSERT INTO `list_links` VALUES ('8', '8', null, '8', '1', '0');
INSERT INTO `list_links` VALUES ('9', '9', null, '9', '1', '0');
INSERT INTO `list_links` VALUES ('10', '10', null, '10', '1', '0');
INSERT INTO `list_links` VALUES ('11', '11', null, '11', '1', '0');
INSERT INTO `list_links` VALUES ('12', '12', null, '12', '1', '0');
INSERT INTO `list_links` VALUES ('13', '13', null, '13', '1', '0');
INSERT INTO `list_links` VALUES ('14', '14', null, '14', '1', '0');
INSERT INTO `list_links` VALUES ('15', '15', null, '15', '1', '0');
INSERT INTO `list_links` VALUES ('16', '16', null, '16', '1', '0');
INSERT INTO `list_links` VALUES ('17', '17', null, '17', '1', '0');
INSERT INTO `list_links` VALUES ('18', '18', null, '18', '1', '0');
INSERT INTO `list_links` VALUES ('19', '19', null, '19', '1', '0');
INSERT INTO `list_links` VALUES ('20', '20', null, '20', '1', '0');
INSERT INTO `list_links` VALUES ('21', '21', null, '21', '1', '0');
INSERT INTO `list_links` VALUES ('22', '22', null, '22.1', '1', '1');
INSERT INTO `list_links` VALUES ('23', '23', null, '22.2', '1', '1');
INSERT INTO `list_links` VALUES ('24', '24', null, '22.3', '1', '1');
INSERT INTO `list_links` VALUES ('25', '25', null, '23', '1', '0');
INSERT INTO `list_links` VALUES ('26', '26', null, '24', '1', '0');
INSERT INTO `list_links` VALUES ('27', '27', null, '25', '1', '0');
INSERT INTO `list_links` VALUES ('28', '28', null, '26', '1', '0');
INSERT INTO `list_links` VALUES ('29', '29', null, '27', '1', '0');
INSERT INTO `list_links` VALUES ('30', '30', null, '28', '1', '0');
INSERT INTO `list_links` VALUES ('31', '31', null, '29', '1', '0');
INSERT INTO `list_links` VALUES ('32', '32', null, '30', '1', '0');
INSERT INTO `list_links` VALUES ('33', '33', null, '31', '1', '0');
INSERT INTO `list_links` VALUES ('34', '34', null, '32', '1', '0');
INSERT INTO `list_links` VALUES ('35', '35', null, '33', '1', '0');
INSERT INTO `list_links` VALUES ('36', '36', null, '34', '1', '0');
INSERT INTO `list_links` VALUES ('37', '37', null, '35', '1', '0');
INSERT INTO `list_links` VALUES ('38', '38', null, '36', '1', '0');
INSERT INTO `list_links` VALUES ('39', '39', null, '37', '1', '0');
INSERT INTO `list_links` VALUES ('40', '104', null, '100', '1', '0');
INSERT INTO `list_links` VALUES ('41', '103', null, '99', '1', '0');
INSERT INTO `list_links` VALUES ('42', '102', null, '98', '1', '0');
INSERT INTO `list_links` VALUES ('43', '101', null, '97', '1', '0');
INSERT INTO `list_links` VALUES ('44', '100', null, '96', '1', '0');
INSERT INTO `list_links` VALUES ('45', '99', null, '95', '1', '0');
INSERT INTO `list_links` VALUES ('46', '98', null, '94', '1', '0');
INSERT INTO `list_links` VALUES ('47', '97', null, '93', '1', '0');
INSERT INTO `list_links` VALUES ('48', '96', null, '92', '1', '0');
INSERT INTO `list_links` VALUES ('49', '95', null, '91', '1', '0');
INSERT INTO `list_links` VALUES ('50', '94', null, '90', '1', '0');
INSERT INTO `list_links` VALUES ('51', '93', null, '89', '1', '0');
INSERT INTO `list_links` VALUES ('52', '92', null, '88', '1', '0');
INSERT INTO `list_links` VALUES ('53', '91', null, '87', '1', '0');
INSERT INTO `list_links` VALUES ('54', '90', null, '86', '1', '0');
INSERT INTO `list_links` VALUES ('55', '89', null, '85', '1', '0');
INSERT INTO `list_links` VALUES ('56', '88', null, '84', '1', '0');
INSERT INTO `list_links` VALUES ('57', '87', null, '83', '1', '0');
INSERT INTO `list_links` VALUES ('58', '86', null, '82', '1', '0');
INSERT INTO `list_links` VALUES ('59', '85', null, '81', '1', '0');
INSERT INTO `list_links` VALUES ('60', '84', null, '80', '1', '0');
INSERT INTO `list_links` VALUES ('61', '83', null, '79', '1', '0');
INSERT INTO `list_links` VALUES ('62', '82', null, '78', '1', '0');
INSERT INTO `list_links` VALUES ('63', '81', null, '77', '1', '0');
INSERT INTO `list_links` VALUES ('64', '80', null, '76', '1', '0');
INSERT INTO `list_links` VALUES ('65', '79', null, '75', '1', '0');
INSERT INTO `list_links` VALUES ('66', '78', null, '74', '1', '0');
INSERT INTO `list_links` VALUES ('67', '77', null, '73', '1', '0');
INSERT INTO `list_links` VALUES ('68', '76', null, '72', '1', '0');
INSERT INTO `list_links` VALUES ('69', '75', null, '71', '1', '0');
INSERT INTO `list_links` VALUES ('70', '74', null, '70', '1', '0');
INSERT INTO `list_links` VALUES ('71', '73', null, '69', '1', '0');
INSERT INTO `list_links` VALUES ('72', '72', null, '68', '1', '0');
INSERT INTO `list_links` VALUES ('73', '71', null, '67', '1', '0');
INSERT INTO `list_links` VALUES ('74', '70', null, '66', '1', '0');
INSERT INTO `list_links` VALUES ('75', '69', null, '65', '1', '0');
INSERT INTO `list_links` VALUES ('76', '68', null, '64', '1', '0');
INSERT INTO `list_links` VALUES ('77', '67', null, '63', '1', '0');
INSERT INTO `list_links` VALUES ('78', '66', null, '62', '1', '0');
INSERT INTO `list_links` VALUES ('79', '65', null, '61', '1', '0');
INSERT INTO `list_links` VALUES ('80', '64', null, '60', '1', '0');
INSERT INTO `list_links` VALUES ('81', '63', null, '59', '1', '0');
INSERT INTO `list_links` VALUES ('82', '62', null, '58', '1', '0');
INSERT INTO `list_links` VALUES ('83', '61', null, '57', '1', '0');
INSERT INTO `list_links` VALUES ('84', '60', null, '56', '1', '0');
INSERT INTO `list_links` VALUES ('85', '59', null, '55', '1', '0');
INSERT INTO `list_links` VALUES ('86', '58', null, '54', '1', '0');
INSERT INTO `list_links` VALUES ('87', '57', null, '53', '1', '0');
INSERT INTO `list_links` VALUES ('88', '56', null, '52', '1', '0');
INSERT INTO `list_links` VALUES ('89', '55', null, '51', '1', '0');
INSERT INTO `list_links` VALUES ('90', '54', null, '50', '1', '0');
INSERT INTO `list_links` VALUES ('91', '53', null, '49', '1', '0');
INSERT INTO `list_links` VALUES ('92', '51', null, '47', '1', '0');
INSERT INTO `list_links` VALUES ('93', '50', null, '46', '1', '0');
INSERT INTO `list_links` VALUES ('94', '52', null, '48', '1', '0');
INSERT INTO `list_links` VALUES ('95', '49', null, '45', '1', '0');
INSERT INTO `list_links` VALUES ('96', '48', null, '44', '1', '0');
INSERT INTO `list_links` VALUES ('97', '47', null, '43', '1', '0');
INSERT INTO `list_links` VALUES ('98', '46', null, '42', '1', '0');
INSERT INTO `list_links` VALUES ('99', '45', null, '41', '1', '0');
INSERT INTO `list_links` VALUES ('100', '44', null, '40.3', '1', '1');
INSERT INTO `list_links` VALUES ('101', '43', null, '40.2', '1', '1');
INSERT INTO `list_links` VALUES ('102', '42', null, '40.1', '1', '1');
INSERT INTO `list_links` VALUES ('103', '41', null, '39', '1', '0');
INSERT INTO `list_links` VALUES ('104', '40', null, '38', '1', '0');
INSERT INTO `list_links` VALUES ('110', '1', null, '1', '2', '0');
INSERT INTO `list_links` VALUES ('111', '32', null, '2', '2', '0');
INSERT INTO `list_links` VALUES ('112', '45', null, '3', '2', '0');
INSERT INTO `list_links` VALUES ('113', '67', null, '4', '2', '0');
INSERT INTO `list_links` VALUES ('114', '4', null, '5', '2', '0');
INSERT INTO `list_links` VALUES ('115', '2', null, '6', '2', '0');
INSERT INTO `list_links` VALUES ('116', '49', null, '7', '2', '0');
INSERT INTO `list_links` VALUES ('117', '16', null, '8', '2', '0');
INSERT INTO `list_links` VALUES ('118', '24', null, '9', '2', '0');
INSERT INTO `list_links` VALUES ('119', '106', null, '10', '2', '0');
INSERT INTO `list_links` VALUES ('120', '107', null, '11', '2', '0');
INSERT INTO `list_links` VALUES ('121', '43', null, '12', '2', '0');
INSERT INTO `list_links` VALUES ('122', '54', null, '13', '2', '0');
INSERT INTO `list_links` VALUES ('123', '22', null, '14', '2', '0');
INSERT INTO `list_links` VALUES ('124', '108', null, '15', '2', '0');
INSERT INTO `list_links` VALUES ('125', '109', null, '16', '2', '0');
INSERT INTO `list_links` VALUES ('126', '50', null, '17', '2', '0');
INSERT INTO `list_links` VALUES ('127', '23', null, '18', '2', '0');
INSERT INTO `list_links` VALUES ('128', '110', null, '19', '2', '0');
INSERT INTO `list_links` VALUES ('129', '48', null, '20', '2', '0');
INSERT INTO `list_links` VALUES ('130', '34', null, '21', '2', '0');
INSERT INTO `list_links` VALUES ('131', '42', null, '22', '2', '0');
INSERT INTO `list_links` VALUES ('132', '51', null, '23', '2', '0');
INSERT INTO `list_links` VALUES ('133', '53', null, '24', '2', '0');
INSERT INTO `list_links` VALUES ('134', '111', null, '25', '2', '0');
INSERT INTO `list_links` VALUES ('135', '97', null, '26', '2', '0');
INSERT INTO `list_links` VALUES ('136', '80', null, '27', '2', '0');
INSERT INTO `list_links` VALUES ('137', '112', null, '28', '2', '0');
INSERT INTO `list_links` VALUES ('138', '87', null, '29', '2', '0');
INSERT INTO `list_links` VALUES ('139', '75', null, '30', '2', '0');
INSERT INTO `list_links` VALUES ('140', '113', null, '31', '2', '0');
INSERT INTO `list_links` VALUES ('141', '88', null, '32', '2', '0');
INSERT INTO `list_links` VALUES ('142', '114', null, '33', '2', '0');
INSERT INTO `list_links` VALUES ('143', '26', null, '34', '2', '0');
INSERT INTO `list_links` VALUES ('144', '115', null, '35', '2', '0');
INSERT INTO `list_links` VALUES ('145', '52', null, '36', '2', '0');
INSERT INTO `list_links` VALUES ('146', '116', null, '37', '2', '0');
INSERT INTO `list_links` VALUES ('147', '117', null, '38', '2', '0');
INSERT INTO `list_links` VALUES ('148', '96', null, '39', '2', '0');
INSERT INTO `list_links` VALUES ('149', '28', null, '40', '2', '0');
INSERT INTO `list_links` VALUES ('150', '118', null, '41', '2', '0');
INSERT INTO `list_links` VALUES ('151', '44', null, '42', '2', '0');
INSERT INTO `list_links` VALUES ('152', '40', null, '43', '2', '0');
INSERT INTO `list_links` VALUES ('153', '119', null, '44', '2', '0');
INSERT INTO `list_links` VALUES ('154', '120', null, '45', '2', '0');
INSERT INTO `list_links` VALUES ('155', '121', null, '46', '2', '0');
INSERT INTO `list_links` VALUES ('156', '122', null, '47', '2', '0');
INSERT INTO `list_links` VALUES ('157', '7', null, '48', '2', '0');
INSERT INTO `list_links` VALUES ('158', '79', null, '49', '2', '0');
INSERT INTO `list_links` VALUES ('159', '123', null, '50', '2', '0');
INSERT INTO `list_links` VALUES ('160', '124', null, '51', '2', '0');
INSERT INTO `list_links` VALUES ('161', '12', null, '52', '2', '0');
INSERT INTO `list_links` VALUES ('162', '125', null, '53', '2', '0');
INSERT INTO `list_links` VALUES ('163', '126', null, '54', '2', '0');
INSERT INTO `list_links` VALUES ('164', '127', null, '55', '2', '0');
INSERT INTO `list_links` VALUES ('165', '37', null, '56', '2', '0');
INSERT INTO `list_links` VALUES ('166', '82', null, '57', '2', '0');
INSERT INTO `list_links` VALUES ('167', '128', null, '59', '2', '0');
INSERT INTO `list_links` VALUES ('168', '129', null, '60', '2', '0');
INSERT INTO `list_links` VALUES ('169', '81', null, '61', '2', '0');
INSERT INTO `list_links` VALUES ('170', '130', null, '62', '2', '0');
INSERT INTO `list_links` VALUES ('171', '131', null, '63', '2', '0');
INSERT INTO `list_links` VALUES ('172', '132', null, '64', '2', '0');
INSERT INTO `list_links` VALUES ('173', '133', null, '65', '2', '0');
INSERT INTO `list_links` VALUES ('174', '134', null, '66', '2', '0');
INSERT INTO `list_links` VALUES ('175', '135', null, '67', '2', '0');
INSERT INTO `list_links` VALUES ('176', '136', null, '68', '2', '0');
INSERT INTO `list_links` VALUES ('177', '137', null, '69', '2', '0');
INSERT INTO `list_links` VALUES ('178', '138', null, '70', '2', '0');
INSERT INTO `list_links` VALUES ('179', '139', null, '71', '2', '0');
INSERT INTO `list_links` VALUES ('180', '140', null, '72', '2', '0');
INSERT INTO `list_links` VALUES ('181', '141', null, '73', '2', '0');
INSERT INTO `list_links` VALUES ('182', '142', null, '74', '2', '0');
INSERT INTO `list_links` VALUES ('183', '143', null, '75', '2', '0');
INSERT INTO `list_links` VALUES ('184', '144', null, '76', '2', '0');
INSERT INTO `list_links` VALUES ('185', '145', null, '77', '2', '0');
INSERT INTO `list_links` VALUES ('186', '146', null, '78', '2', '0');
INSERT INTO `list_links` VALUES ('187', '147', null, '79', '2', '0');
INSERT INTO `list_links` VALUES ('188', '148', null, '80', '2', '0');
INSERT INTO `list_links` VALUES ('189', '149', null, '81', '2', '0');
INSERT INTO `list_links` VALUES ('190', '150', null, '82', '2', '0');
INSERT INTO `list_links` VALUES ('191', '151', null, '83', '2', '0');
INSERT INTO `list_links` VALUES ('192', '152', null, '84', '2', '0');
INSERT INTO `list_links` VALUES ('193', '153', null, '85', '2', '0');
INSERT INTO `list_links` VALUES ('194', '154', null, '86', '2', '0');
INSERT INTO `list_links` VALUES ('195', '155', null, '87', '2', '0');
INSERT INTO `list_links` VALUES ('196', '156', null, '88', '2', '0');
INSERT INTO `list_links` VALUES ('197', '157', null, '89', '2', '0');
INSERT INTO `list_links` VALUES ('198', '158', null, '90', '2', '0');
INSERT INTO `list_links` VALUES ('199', '159', null, '91', '2', '0');
INSERT INTO `list_links` VALUES ('200', '160', null, '92', '2', '0');
INSERT INTO `list_links` VALUES ('201', '161', null, '93', '2', '0');
INSERT INTO `list_links` VALUES ('202', '162', null, '94', '2', '0');
INSERT INTO `list_links` VALUES ('203', '163', null, '95', '2', '0');
INSERT INTO `list_links` VALUES ('204', '164', null, '96', '2', '0');
INSERT INTO `list_links` VALUES ('205', '165', null, '97', '2', '0');
INSERT INTO `list_links` VALUES ('206', '166', null, '98', '2', '0');
INSERT INTO `list_links` VALUES ('207', '167', null, '99', '2', '0');
INSERT INTO `list_links` VALUES ('208', '168', null, '100', '2', '0');
INSERT INTO `list_links` VALUES ('209', '169', null, '58', '2', '0');
INSERT INTO `list_links` VALUES ('404', null, '1', '1', '3', '0');
INSERT INTO `list_links` VALUES ('405', null, '11', '2', '3', '0');
INSERT INTO `list_links` VALUES ('406', null, '2', '3', '3', '0');
INSERT INTO `list_links` VALUES ('407', null, '3', '4', '3', '0');
INSERT INTO `list_links` VALUES ('408', null, '12', '5', '3', '0');
INSERT INTO `list_links` VALUES ('409', null, '4', '6', '3', '0');
INSERT INTO `list_links` VALUES ('410', null, '5', '7', '3', '0');
INSERT INTO `list_links` VALUES ('411', null, '6', '8', '3', '0');
INSERT INTO `list_links` VALUES ('412', null, '7', '9', '3', '0');
INSERT INTO `list_links` VALUES ('413', null, '13', '10', '3', '0');
INSERT INTO `list_links` VALUES ('414', null, '8', '11', '3', '0');
INSERT INTO `list_links` VALUES ('415', null, '14', '12', '3', '0');
INSERT INTO `list_links` VALUES ('416', null, '9', '13', '3', '0');
INSERT INTO `list_links` VALUES ('417', null, '10', '14', '3', '0');
INSERT INTO `list_links` VALUES ('418', null, '15', '15', '3', '0');
INSERT INTO `list_links` VALUES ('419', null, '16', '16', '3', '0');
INSERT INTO `list_links` VALUES ('420', null, '17', '17', '3', '0');
INSERT INTO `list_links` VALUES ('421', null, '18', '18', '3', '0');
INSERT INTO `list_links` VALUES ('422', null, '19', '19', '3', '0');
INSERT INTO `list_links` VALUES ('423', null, '100', '20', '3', '0');
INSERT INTO `list_links` VALUES ('424', null, '20', '21', '3', '0');
INSERT INTO `list_links` VALUES ('425', null, '21', '22', '3', '0');
INSERT INTO `list_links` VALUES ('426', null, '22', '23', '3', '0');
INSERT INTO `list_links` VALUES ('427', null, '23', '24', '3', '0');
INSERT INTO `list_links` VALUES ('428', null, '24', '25', '3', '0');
INSERT INTO `list_links` VALUES ('429', null, '25', '26', '3', '0');
INSERT INTO `list_links` VALUES ('430', null, '26', '27', '3', '0');
INSERT INTO `list_links` VALUES ('431', null, '56', '28', '3', '0');
INSERT INTO `list_links` VALUES ('432', null, '27', '29', '3', '0');
INSERT INTO `list_links` VALUES ('433', null, '28', '30', '3', '0');
INSERT INTO `list_links` VALUES ('434', null, '101', '31', '3', '0');
INSERT INTO `list_links` VALUES ('435', null, '30', '32', '3', '0');
INSERT INTO `list_links` VALUES ('436', null, '31', '33', '3', '0');
INSERT INTO `list_links` VALUES ('437', null, '32', '34', '3', '0');
INSERT INTO `list_links` VALUES ('438', null, '33', '35', '3', '0');
INSERT INTO `list_links` VALUES ('439', null, '34', '36', '3', '0');
INSERT INTO `list_links` VALUES ('440', null, '35', '37', '3', '0');
INSERT INTO `list_links` VALUES ('441', null, '36', '38', '3', '0');
INSERT INTO `list_links` VALUES ('442', null, '37', '39', '3', '0');
INSERT INTO `list_links` VALUES ('443', null, '38', '40', '3', '0');
INSERT INTO `list_links` VALUES ('444', null, '39', '41', '3', '0');
INSERT INTO `list_links` VALUES ('445', null, '40', '42', '3', '0');
INSERT INTO `list_links` VALUES ('446', null, '41', '43', '3', '0');
INSERT INTO `list_links` VALUES ('447', null, '42', '44', '3', '0');
INSERT INTO `list_links` VALUES ('448', null, '43', '45', '3', '0');
INSERT INTO `list_links` VALUES ('449', null, '97', '46', '3', '0');
INSERT INTO `list_links` VALUES ('450', null, '44', '47', '3', '0');
INSERT INTO `list_links` VALUES ('451', null, '45', '48', '3', '0');
INSERT INTO `list_links` VALUES ('452', null, '46', '49', '3', '0');
INSERT INTO `list_links` VALUES ('453', null, '98', '50', '3', '0');
INSERT INTO `list_links` VALUES ('454', null, '47', '51', '3', '0');
INSERT INTO `list_links` VALUES ('455', null, '48', '52', '3', '0');
INSERT INTO `list_links` VALUES ('456', null, '49', '53', '3', '0');
INSERT INTO `list_links` VALUES ('457', null, '50', '54', '3', '0');
INSERT INTO `list_links` VALUES ('458', null, '51', '55', '3', '0');
INSERT INTO `list_links` VALUES ('459', null, '52', '56', '3', '0');
INSERT INTO `list_links` VALUES ('460', null, '53', '57', '3', '0');
INSERT INTO `list_links` VALUES ('461', null, '54', '58', '3', '0');
INSERT INTO `list_links` VALUES ('462', null, '55', '59', '3', '0');
INSERT INTO `list_links` VALUES ('463', null, '57', '60', '3', '0');
INSERT INTO `list_links` VALUES ('464', null, '99', '61', '3', '0');
INSERT INTO `list_links` VALUES ('465', null, '58', '62', '3', '0');
INSERT INTO `list_links` VALUES ('466', null, '59', '63', '3', '0');
INSERT INTO `list_links` VALUES ('467', null, '60', '64', '3', '0');
INSERT INTO `list_links` VALUES ('468', null, '61', '65', '3', '0');
INSERT INTO `list_links` VALUES ('469', null, '62', '66', '3', '0');
INSERT INTO `list_links` VALUES ('470', null, '63', '67', '3', '0');
INSERT INTO `list_links` VALUES ('471', null, '64', '68', '3', '0');
INSERT INTO `list_links` VALUES ('472', null, '65', '69', '3', '0');
INSERT INTO `list_links` VALUES ('473', null, '66', '70', '3', '0');
INSERT INTO `list_links` VALUES ('474', null, '67', '71', '3', '0');
INSERT INTO `list_links` VALUES ('475', null, '68', '72', '3', '0');
INSERT INTO `list_links` VALUES ('476', null, '69', '73', '3', '0');
INSERT INTO `list_links` VALUES ('477', null, '70', '74', '3', '0');
INSERT INTO `list_links` VALUES ('478', null, '71', '75', '3', '0');
INSERT INTO `list_links` VALUES ('479', null, '72', '76', '3', '0');
INSERT INTO `list_links` VALUES ('480', null, '73', '77', '3', '0');
INSERT INTO `list_links` VALUES ('481', null, '74', '78', '3', '0');
INSERT INTO `list_links` VALUES ('482', null, '75', '79', '3', '0');
INSERT INTO `list_links` VALUES ('483', null, '76', '80', '3', '0');
INSERT INTO `list_links` VALUES ('484', null, '77', '81', '3', '0');
INSERT INTO `list_links` VALUES ('485', null, '78', '82', '3', '0');
INSERT INTO `list_links` VALUES ('486', null, '79', '83', '3', '0');
INSERT INTO `list_links` VALUES ('487', null, '80', '84', '3', '0');
INSERT INTO `list_links` VALUES ('488', null, '81', '85', '3', '0');
INSERT INTO `list_links` VALUES ('489', null, '82', '86', '3', '0');
INSERT INTO `list_links` VALUES ('490', null, '92', '87', '3', '0');
INSERT INTO `list_links` VALUES ('491', null, '83', '88', '3', '0');
INSERT INTO `list_links` VALUES ('492', null, '93', '89', '3', '0');
INSERT INTO `list_links` VALUES ('493', null, '94', '90', '3', '0');
INSERT INTO `list_links` VALUES ('494', null, '84', '91', '3', '0');
INSERT INTO `list_links` VALUES ('495', null, '85', '92', '3', '0');
INSERT INTO `list_links` VALUES ('496', null, '86', '93', '3', '0');
INSERT INTO `list_links` VALUES ('497', null, '87', '94', '3', '0');
INSERT INTO `list_links` VALUES ('498', null, '95', '95', '3', '0');
INSERT INTO `list_links` VALUES ('499', null, '96', '96', '3', '0');
INSERT INTO `list_links` VALUES ('500', null, '88', '97', '3', '0');
INSERT INTO `list_links` VALUES ('501', null, '89', '98', '3', '0');
INSERT INTO `list_links` VALUES ('502', null, '90', '99', '3', '0');
INSERT INTO `list_links` VALUES ('503', null, '91', '100', '3', '0');

-- ----------------------------
-- Table structure for lists
-- ----------------------------
DROP TABLE IF EXISTS `lists`;
CREATE TABLE `lists` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `listName` varchar(255) DEFAULT NULL,
  `listType` varchar(255) DEFAULT NULL,
  `listDesc` varchar(255) DEFAULT NULL,
  `listCriteria` varchar(255) DEFAULT NULL,
  `tabLabel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lists
-- ----------------------------
INSERT INTO `lists` VALUES ('1', 'Movies Bucket List', 'movies', '100 Movies Bucket List Scratch off Poster', 'Unknown selection criteria.  Original rankings formulated by Gift Republic.', 'bucket');
INSERT INTO `lists` VALUES ('2', 'Movies by Vote', 'movies', '100 Top Movies as Voted by the Public', 'List sourced from TMDB. Critera: > 7500 votes, > 7.5 average vote.  Generated Aug 1st, 2019.', 'public');
INSERT INTO `lists` VALUES ('3', 'Books Bucket List', 'books', '100 Books Bucket List Scratch off Poster', 'Original selection of books formulated by Gift Republic.', 'book_bucket');
