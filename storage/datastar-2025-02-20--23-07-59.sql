# ************************************************************
# Sequel Ace SQL dump
# Version 20080
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: datastar-testing.ddev.site (MySQL 8.0.36-0ubuntu0.22.04.1)
# Database: db
# Generation Time: 2025-02-21 06:07:59 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table addresses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `addresses`;

CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `addressLine3` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_qdfraqstjjjvpyamspoqsudcjwidacncyota` (`primaryOwnerId`),
  CONSTRAINT `fk_bofrumnfvhlrmnoqibiydzrsecsqcydufmpb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qdfraqstjjjvpyamspoqsudcjwidacncyota` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table announcements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `announcements`;

CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rsbhgjgtjnwtixxtlamzilgzrrestnmhucil` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_smjwexigggurgvvwvilmcfqqaolzndyctdwn` (`dateRead`),
  KEY `fk_vptmrkcmxojkrnpeefolemknlpwiobutjchb` (`pluginId`),
  CONSTRAINT `fk_pzillscoalhugnqiaypcaetauqignfwxnavn` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vptmrkcmxojkrnpeefolemknlpwiobutjchb` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table assetindexdata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assetindexdata`;

CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_iqkcdhfqqbvusyvkbaqmrskugjdpicfbjdaj` (`sessionId`,`volumeId`),
  KEY `idx_ykvtakeljmjkeflteutolgpxikixyxycsrcx` (`volumeId`),
  CONSTRAINT `fk_obnnwuttlzzqtohqmzqempmttydiuhgfpcen` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rqhxkxzuicmprekawjodtuacgwdrbrkzmgtb` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table assetindexingsessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assetindexingsessions`;

CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table assets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assets`;

CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ebtonjxewvtzfsmtuktgsxqsjwhmtatrokha` (`filename`,`folderId`),
  KEY `idx_obvzbsmqzepmlkusgosdszdtcdxevsqaclkv` (`folderId`),
  KEY `idx_dggfqbltcdvmnebayfywfmcgxgjnktxseyxm` (`volumeId`),
  KEY `fk_igldagwkisggzcenzdwhngnjpadpdhvuzvym` (`uploaderId`),
  CONSTRAINT `fk_cttpynqowyhwjtkiepvbfheyvjriakublwiw` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_igldagwkisggzcenzdwhngnjpadpdhvuzvym` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_prlmfzxkuhbeysevsswhdqpvfunkfjyticwi` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xnhwegqovgkxvqficpdndkwyhajusfdysanv` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;

INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`)
VALUES
	(2,1,1,1,'IMG_8130.jpeg','image',NULL,2180,1634,1413796,NULL,0,0,'2025-02-20 19:30:25','2025-02-20 19:30:25','2025-02-20 19:30:25'),
	(3,1,1,1,'IMG_8130.jpeg','image',NULL,2180,1634,1413796,NULL,0,0,'2025-02-20 19:32:19','2025-02-20 19:32:19','2025-02-20 19:32:19'),
	(4,1,1,1,'shoe-1.png','image',NULL,1024,768,1013497,NULL,NULL,NULL,'2025-02-20 19:34:40','2025-02-20 19:34:40','2025-02-20 19:34:40'),
	(5,1,1,1,'shoe-2.png','image',NULL,1024,768,1257278,NULL,NULL,NULL,'2025-02-20 19:34:40','2025-02-20 19:34:40','2025-02-20 19:34:40'),
	(6,1,1,1,'shoe-3.png','image',NULL,1024,768,944938,NULL,NULL,NULL,'2025-02-20 19:34:40','2025-02-20 19:34:40','2025-02-20 19:34:40'),
	(17,1,1,1,'Grok-Image.jpg','image',NULL,1024,768,151095,NULL,NULL,NULL,'2025-02-21 03:16:11','2025-02-21 03:16:11','2025-02-21 03:16:11'),
	(20,1,1,1,'Grok-Image-1.jpg','image',NULL,1024,768,181083,NULL,NULL,NULL,'2025-02-21 03:18:53','2025-02-21 03:18:53','2025-02-21 03:18:53'),
	(25,1,1,1,'Grok-Image-2.jpg','image',NULL,1024,768,211256,NULL,NULL,NULL,'2025-02-21 04:07:32','2025-02-21 04:07:32','2025-02-21 04:07:32'),
	(28,1,1,1,'Grok-Image-3.jpg','image',NULL,1024,768,236922,NULL,NULL,NULL,'2025-02-21 04:07:58','2025-02-21 04:07:58','2025-02-21 04:07:58'),
	(31,1,1,1,'Grok-Image-4.jpg','image',NULL,1024,768,244890,NULL,NULL,NULL,'2025-02-21 04:11:57','2025-02-21 04:11:57','2025-02-21 04:11:57'),
	(34,1,1,1,'Grok-Image-5.jpg','image',NULL,1024,768,156422,NULL,NULL,NULL,'2025-02-21 04:19:20','2025-02-21 04:19:20','2025-02-21 04:19:20');

/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table assets_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assets_sites`;

CREATE TABLE `assets_sites` (
  `assetId` int NOT NULL,
  `siteId` int NOT NULL,
  `alt` text,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_ehskrmjvxlkpmknjjbszjzcgaqgpkuswddqn` (`siteId`),
  CONSTRAINT `fk_ehskrmjvxlkpmknjjbszjzcgaqgpkuswddqn` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_xunonocmwgztmveoyydvapbrcfjebkhuftqd` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `assets_sites` WRITE;
/*!40000 ALTER TABLE `assets_sites` DISABLE KEYS */;

INSERT INTO `assets_sites` (`assetId`, `siteId`, `alt`)
VALUES
	(2,1,NULL),
	(3,1,NULL),
	(4,1,NULL),
	(5,1,NULL),
	(6,1,NULL),
	(17,1,NULL),
	(20,1,NULL),
	(25,1,NULL),
	(28,1,NULL),
	(31,1,NULL),
	(34,1,NULL);

/*!40000 ALTER TABLE `assets_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table authenticator
# ------------------------------------------------------------

DROP TABLE IF EXISTS `authenticator`;

CREATE TABLE `authenticator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `oldTimestamp` int unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_puohjssizeymzffetkvythoyrjhmjifzkfub` (`userId`),
  CONSTRAINT `fk_puohjssizeymzffetkvythoyrjhmjifzkfub` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gnazouufqwqnlyalqqltsenwbusbcaxnxmol` (`groupId`),
  KEY `fk_hhupdrroukzzahvfgawfbbxazjipzgmwxazs` (`parentId`),
  CONSTRAINT `fk_djjquksecnkqesyykfcnsixvaojqmdttgcju` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hhupdrroukzzahvfgawfbbxazjipzgmwxazs` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xudrkgsngjjkhkeznmltmiwvuocbwspgfkbi` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table categorygroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categorygroups`;

CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tafzhxywjobpzeugjchhtnclkpzrohiwgzzh` (`name`),
  KEY `idx_hacuwpvmkvrrppbdeuwpejeovhpgxaodjyyb` (`handle`),
  KEY `idx_vqhzuyuchngycoevameuyoikccmsivqsatei` (`structureId`),
  KEY `idx_krmyhhzcjmsltwbkzaabjfuacowqtyyjkaaw` (`fieldLayoutId`),
  KEY `idx_bbscghbyjxvlsbdhmuzvpilxuidfwbyivgns` (`dateDeleted`),
  CONSTRAINT `fk_fxjmofbfthjxqxcufxoavbzckgttjtzmfoxa` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_guyekmdyvjqxopsnfvqmvwrqusgnbvkmtuul` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table categorygroups_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categorygroups_sites`;

CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kwmruyflnyczpdekviztpbojrcrioocdtjwr` (`groupId`,`siteId`),
  KEY `idx_zkfflncbznwpfhkgcozsmddyuxckoamvkwas` (`siteId`),
  CONSTRAINT `fk_mrygmrrzfaltwdgewecdiunwzqfxjgmpbyrs` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pfridxipqvnkwqzyhnisdxyjmazlhshaqlwk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table changedattributes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `changedattributes`;

CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_hfrvrmcpyulwwqnzcqrokoddqmreyinxulfc` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_aayvvdviddariqrlygbehgvtprdksfhjobug` (`siteId`),
  KEY `fk_bpjkqspzetmozjlfjsiwbfozyybieubmuwxo` (`userId`),
  CONSTRAINT `fk_aayvvdviddariqrlygbehgvtprdksfhjobug` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bpjkqspzetmozjlfjsiwbfozyybieubmuwxo` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_guinwjygrpodgngynpblpgqumwiirndcissv` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;

INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`)
VALUES
	(7,1,'postDate','2025-02-20 19:38:17',0,1),
	(7,1,'slug','2025-02-20 19:37:52',0,1),
	(7,1,'title','2025-02-20 19:37:52',0,1),
	(7,1,'uri','2025-02-20 19:37:52',0,1),
	(9,1,'postDate','2025-02-20 19:38:44',0,1),
	(9,1,'slug','2025-02-20 19:38:23',0,1),
	(9,1,'title','2025-02-20 19:38:23',0,1),
	(9,1,'uri','2025-02-20 19:38:23',0,1),
	(14,1,'postDate','2025-02-20 19:39:40',0,1),
	(14,1,'slug','2025-02-20 19:39:22',0,1),
	(14,1,'title','2025-02-20 19:39:22',0,1),
	(14,1,'uri','2025-02-20 19:39:22',0,1),
	(16,1,'postDate','2025-02-21 03:16:16',0,1),
	(16,1,'slug','2025-02-21 03:14:42',0,1),
	(16,1,'title','2025-02-21 05:12:32',0,1),
	(16,1,'uri','2025-02-21 03:14:42',0,1),
	(19,1,'postDate','2025-02-21 03:19:28',0,1),
	(19,1,'slug','2025-02-21 03:17:22',0,1),
	(19,1,'title','2025-02-21 03:17:22',0,1),
	(19,1,'uri','2025-02-21 03:17:22',0,1),
	(24,1,'postDate','2025-02-21 04:07:34',0,1),
	(24,1,'slug','2025-02-21 04:07:20',0,1),
	(24,1,'title','2025-02-21 04:07:20',0,1),
	(24,1,'uri','2025-02-21 04:07:20',0,1),
	(27,1,'postDate','2025-02-21 04:08:06',0,1),
	(27,1,'slug','2025-02-21 04:08:04',0,1),
	(27,1,'title','2025-02-21 04:08:04',0,1),
	(27,1,'uri','2025-02-21 04:08:04',0,1),
	(30,1,'postDate','2025-02-21 04:11:59',0,1),
	(30,1,'slug','2025-02-21 04:11:32',0,1),
	(30,1,'title','2025-02-21 04:11:32',0,1),
	(30,1,'uri','2025-02-21 04:11:32',0,1),
	(33,1,'postDate','2025-02-21 04:19:41',0,1),
	(33,1,'slug','2025-02-21 04:18:46',0,1),
	(33,1,'title','2025-02-21 04:18:46',0,1),
	(33,1,'uri','2025-02-21 04:18:46',0,1);

/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table changedfields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `changedfields`;

CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `idx_rhehdrlzyvleqfmzvljevoaigfssrwtmbyis` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_dejjkmikepuyhnjrbgcjtwcgnnzzqrehtdin` (`siteId`),
  KEY `fk_dwbgcchhomistoyvvsykmfsjquitrzzxiwvh` (`fieldId`),
  KEY `fk_srwlvlixlgilzwfbqewmfpmfltxxdjshlcos` (`userId`),
  CONSTRAINT `fk_dejjkmikepuyhnjrbgcjtwcgnnzzqrehtdin` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dwbgcchhomistoyvvsykmfsjquitrzzxiwvh` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mzddqnddcsedyxanbygyxmhsehlepepqwkfu` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_srwlvlixlgilzwfbqewmfpmfltxxdjshlcos` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;

INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `layoutElementUid`, `dateUpdated`, `propagated`, `userId`)
VALUES
	(7,1,1,'5da727e9-a929-4c64-9b65-de690945636f','2025-02-20 19:39:00',0,1),
	(7,1,2,'4151fbe2-8252-44d2-aab5-0abf61b1dc12','2025-02-20 19:37:56',0,1),
	(7,1,3,'b37cdba4-7db3-499c-9359-82e0df04f120','2025-02-20 19:38:11',0,1),
	(9,1,1,'5da727e9-a929-4c64-9b65-de690945636f','2025-02-20 19:39:15',0,1),
	(9,1,2,'4151fbe2-8252-44d2-aab5-0abf61b1dc12','2025-02-20 19:38:30',0,1),
	(9,1,3,'b37cdba4-7db3-499c-9359-82e0df04f120','2025-02-20 19:38:38',0,1),
	(14,1,1,'5da727e9-a929-4c64-9b65-de690945636f','2025-02-20 19:39:30',0,1),
	(14,1,2,'4151fbe2-8252-44d2-aab5-0abf61b1dc12','2025-02-20 19:39:27',0,1),
	(14,1,3,'b37cdba4-7db3-499c-9359-82e0df04f120','2025-02-20 19:39:35',0,1),
	(16,1,1,'5da727e9-a929-4c64-9b65-de690945636f','2025-02-21 03:19:36',0,1),
	(16,1,2,'4151fbe2-8252-44d2-aab5-0abf61b1dc12','2025-02-21 03:16:02',0,1),
	(16,1,3,'b37cdba4-7db3-499c-9359-82e0df04f120','2025-02-21 03:16:13',0,1),
	(16,1,4,'39663fcd-8055-43d7-9ae5-702e90b0c65c','2025-02-21 05:12:32',0,1),
	(19,1,1,'5da727e9-a929-4c64-9b65-de690945636f','2025-02-21 03:19:27',0,1),
	(19,1,2,'4151fbe2-8252-44d2-aab5-0abf61b1dc12','2025-02-21 03:19:22',0,1),
	(19,1,3,'b37cdba4-7db3-499c-9359-82e0df04f120','2025-02-21 03:18:55',0,1),
	(19,1,4,'39663fcd-8055-43d7-9ae5-702e90b0c65c','2025-02-21 05:13:22',0,1),
	(24,1,1,'5da727e9-a929-4c64-9b65-de690945636f','2025-02-21 04:07:23',0,1),
	(24,1,2,'4151fbe2-8252-44d2-aab5-0abf61b1dc12','2025-02-21 04:07:16',0,1),
	(24,1,3,'b37cdba4-7db3-499c-9359-82e0df04f120','2025-02-21 04:07:33',0,1),
	(24,1,4,'39663fcd-8055-43d7-9ae5-702e90b0c65c','2025-02-21 05:12:56',0,1),
	(27,1,1,'5da727e9-a929-4c64-9b65-de690945636f','2025-02-21 04:07:54',0,1),
	(27,1,2,'4151fbe2-8252-44d2-aab5-0abf61b1dc12','2025-02-21 04:07:48',0,1),
	(27,1,3,'b37cdba4-7db3-499c-9359-82e0df04f120','2025-02-21 04:07:58',0,1),
	(27,1,4,'39663fcd-8055-43d7-9ae5-702e90b0c65c','2025-02-21 05:13:09',0,1),
	(30,1,1,'5da727e9-a929-4c64-9b65-de690945636f','2025-02-21 04:11:55',0,1),
	(30,1,2,'4151fbe2-8252-44d2-aab5-0abf61b1dc12','2025-02-21 04:11:50',0,1),
	(30,1,3,'b37cdba4-7db3-499c-9359-82e0df04f120','2025-02-21 04:11:58',0,1),
	(30,1,4,'39663fcd-8055-43d7-9ae5-702e90b0c65c','2025-02-21 05:11:57',0,1),
	(33,1,1,'5da727e9-a929-4c64-9b65-de690945636f','2025-02-21 04:19:38',0,1),
	(33,1,2,'4151fbe2-8252-44d2-aab5-0abf61b1dc12','2025-02-21 04:19:34',0,1),
	(33,1,3,'b37cdba4-7db3-499c-9359-82e0df04f120','2025-02-21 04:19:20',0,1),
	(33,1,4,'39663fcd-8055-43d7-9ae5-702e90b0c65c','2025-02-21 05:12:13',0,1);

/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craftidtokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craftidtokens`;

CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_vzbnxcvtfpjgbykxuznslgcdlubcflwblyqm` (`userId`),
  CONSTRAINT `fk_vzbnxcvtfpjgbykxuznslgcdlubcflwblyqm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table deprecationerrors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `deprecationerrors`;

CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cdihsaqazivaolxmnhnaxidxgwudzpcmspgn` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table drafts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `drafts`;

CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_wqhumfpxdneybhcuznibnksguzrwlymoihux` (`creatorId`,`provisional`),
  KEY `idx_ulezxwnrvagdampajcfazbkyvqdowcfeoaeu` (`saved`),
  KEY `fk_lzrqrfirlzdukzczczdfopevrrifsvzkwklg` (`canonicalId`),
  CONSTRAINT `fk_lzrqrfirlzdukzczczdfopevrrifsvzkwklg` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vjojwyssnylvrcbiwzwukoebctpvguutcvfc` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table elementactivity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `elementactivity`;

CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_isbvuiykedydchetvksyikbgwphzrcvjeygh` (`elementId`,`timestamp`,`userId`),
  KEY `fk_ofvjmsliwybsubixpsesauyigiwmbcqbqujv` (`userId`),
  KEY `fk_eyjmpzaognjlsplfikehvreqxbasvijdqvmj` (`siteId`),
  KEY `fk_ayvljwtkmwepijcsqbiyymynogiwsursqrnr` (`draftId`),
  CONSTRAINT `fk_ayvljwtkmwepijcsqbiyymynogiwsursqrnr` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_eyjmpzaognjlsplfikehvreqxbasvijdqvmj` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ijorlolxyqlpnonzgoqwqqlarldpgoerasmc` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ofvjmsliwybsubixpsesauyigiwmbcqbqujv` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;

INSERT INTO `elementactivity` (`elementId`, `userId`, `siteId`, `draftId`, `type`, `timestamp`)
VALUES
	(7,1,1,NULL,'edit','2025-02-20 19:38:59'),
	(7,1,1,NULL,'save','2025-02-20 19:39:00'),
	(9,1,1,NULL,'save','2025-02-20 19:39:15'),
	(14,1,1,NULL,'save','2025-02-20 19:39:40'),
	(16,1,1,NULL,'edit','2025-02-21 05:12:32'),
	(16,1,1,NULL,'save','2025-02-21 05:12:45'),
	(19,1,1,NULL,'edit','2025-02-21 05:13:21'),
	(19,1,1,NULL,'save','2025-02-21 05:13:22'),
	(24,1,1,NULL,'edit','2025-02-21 05:12:54'),
	(24,1,1,NULL,'save','2025-02-21 05:12:56'),
	(27,1,1,NULL,'edit','2025-02-21 05:13:08'),
	(27,1,1,NULL,'save','2025-02-21 05:13:09'),
	(30,1,1,NULL,'edit','2025-02-21 05:11:51'),
	(30,1,1,NULL,'save','2025-02-21 05:11:57'),
	(33,1,1,NULL,'edit','2025-02-21 05:12:12'),
	(33,1,1,NULL,'save','2025-02-21 05:12:13');

/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table elements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `elements`;

CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dfrmracjdhnjqjhjhwrnrzcikqobiosukxnz` (`dateDeleted`),
  KEY `idx_maajysvyahvjrnbkbcncsetflqnfvgwfcicx` (`fieldLayoutId`),
  KEY `idx_klwikfojmrbuwcaijvztjsyqshmgnnikdmem` (`type`),
  KEY `idx_qfepxyuqvumorifgclasfulbrcruyvzrvgav` (`enabled`),
  KEY `idx_hkuqhnnynhsyketkjmxygcwuvghbdpzplyds` (`canonicalId`),
  KEY `idx_mohosxhdcdffsjwhgjxfwhpumrrzyfxkobkt` (`archived`,`dateCreated`),
  KEY `idx_rckieczxnasvesemfvdqxqlzecucahakaemg` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_yikxgxfcpvojflgzfunjduwbumcnvvcsmuvv` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_pdghtfylbqluivsfukqpcjwcdmbluxmgncdb` (`draftId`),
  KEY `fk_pgtexmpwqwsjchghtjskmnonaxuxcqerbsax` (`revisionId`),
  CONSTRAINT `fk_izsctnjeaksdlygbdbnseksrikwuyrvifntu` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mlhkqsbgvysurapcsaiyqqyjhveprdvulplv` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_pdghtfylbqluivsfukqpcjwcdmbluxmgncdb` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pgtexmpwqwsjchghtjskmnonaxuxcqerbsax` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;

INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `deletedWithOwner`, `uid`)
VALUES
	(1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2025-02-20 19:13:50','2025-02-20 19:13:50',NULL,NULL,NULL,'c1f11bea-0379-489d-8f54-c9475b019185'),
	(2,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2025-02-20 19:30:25','2025-02-20 19:32:12',NULL,'2025-02-20 19:32:12',NULL,'b5608c8c-31fe-4b43-9919-782980a9cf80'),
	(3,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2025-02-20 19:32:19','2025-02-20 19:34:48',NULL,'2025-02-20 19:34:48',NULL,'64125f12-9d5f-4d6b-b746-e7a70d8b919b'),
	(4,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2025-02-20 19:34:40','2025-02-20 19:34:40',NULL,NULL,NULL,'20a4c6b0-8276-408c-9d1f-9dacbab7e3ea'),
	(5,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2025-02-20 19:34:40','2025-02-20 19:34:40',NULL,NULL,NULL,'e11ebca5-1e5a-4e21-89f0-a4a1f0a57428'),
	(6,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2025-02-20 19:34:40','2025-02-20 19:34:40',NULL,NULL,NULL,'e5812282-9743-4d16-8827-39c4dc64923d'),
	(7,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-02-20 19:37:14','2025-02-21 04:07:10',NULL,'2025-02-21 04:07:10',NULL,'68c0b8d0-ab29-4453-b1d9-32d164dd882c'),
	(8,7,NULL,1,1,'craft\\elements\\Entry',1,0,'2025-02-20 19:38:17','2025-02-20 19:38:17',NULL,'2025-02-21 04:07:10',NULL,'2e676fc4-0c58-4618-8c26-cce946893270'),
	(9,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-02-20 19:38:19','2025-02-21 04:07:10',NULL,'2025-02-21 04:07:10',NULL,'24f76ab4-1e46-450b-bc0f-29e2cc24da10'),
	(10,9,NULL,2,1,'craft\\elements\\Entry',1,0,'2025-02-20 19:38:44','2025-02-20 19:38:44',NULL,'2025-02-21 04:07:10',NULL,'c03d4289-3b1a-4666-8073-6b4f2ac30352'),
	(12,7,NULL,3,1,'craft\\elements\\Entry',1,0,'2025-02-20 19:39:00','2025-02-20 19:39:00',NULL,'2025-02-21 04:07:10',NULL,'a68aff32-6fc0-404d-a8d6-9275062a6671'),
	(13,9,NULL,4,1,'craft\\elements\\Entry',1,0,'2025-02-20 19:39:15','2025-02-20 19:39:15',NULL,'2025-02-21 04:07:10',NULL,'aa47c044-90af-402b-b84a-c8220da08b99'),
	(14,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-02-20 19:39:18','2025-02-21 04:07:10',NULL,'2025-02-21 04:07:10',NULL,'2ef940d3-e04c-452b-9573-be6bc39b61d2'),
	(15,14,NULL,5,1,'craft\\elements\\Entry',1,0,'2025-02-20 19:39:40','2025-02-20 19:39:40',NULL,'2025-02-21 04:07:10',NULL,'4955e1cf-dd42-45d9-bbe5-0987c007f266'),
	(16,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-02-21 03:14:32','2025-02-21 05:12:45',NULL,NULL,NULL,'6269c242-c37a-43b1-9e5f-378e4bc9e103'),
	(17,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2025-02-21 03:16:11','2025-02-21 03:16:11',NULL,NULL,NULL,'379efd0b-ee95-42ab-a2c1-2f4aa11bbffe'),
	(18,16,NULL,6,1,'craft\\elements\\Entry',1,0,'2025-02-21 03:16:16','2025-02-21 03:16:16',NULL,NULL,NULL,'692db9e3-938e-4db6-a444-2b68e5f823f7'),
	(19,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-02-21 03:17:14','2025-02-21 05:13:22',NULL,NULL,NULL,'a07b6f30-f93c-479e-a2f4-0a51a3c4bca1'),
	(20,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2025-02-21 03:18:53','2025-02-21 03:18:53',NULL,NULL,NULL,'42bf716f-64ef-48b3-ab16-66f0de646389'),
	(21,19,NULL,7,1,'craft\\elements\\Entry',1,0,'2025-02-21 03:19:28','2025-02-21 03:19:28',NULL,NULL,NULL,'2b2d1250-a963-4761-a1b6-c79f772f3fca'),
	(23,16,NULL,8,1,'craft\\elements\\Entry',1,0,'2025-02-21 03:19:36','2025-02-21 03:19:36',NULL,NULL,NULL,'6570c750-bf85-45a6-8d66-524e28fd36aa'),
	(24,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-02-21 04:07:11','2025-02-21 05:12:56',NULL,NULL,NULL,'fbcb8be5-5c58-4eda-85d4-2d6a02079398'),
	(25,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2025-02-21 04:07:32','2025-02-21 04:07:32',NULL,NULL,NULL,'302534c3-2ac8-4735-8e0b-4520a6bca0bb'),
	(26,24,NULL,9,1,'craft\\elements\\Entry',1,0,'2025-02-21 04:07:34','2025-02-21 04:07:34',NULL,NULL,NULL,'80c6ed11-511f-4002-89ae-ea97388f05f6'),
	(27,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-02-21 04:07:36','2025-02-21 05:13:09',NULL,NULL,NULL,'7bd782d9-16fb-4c73-992b-83e951d0bbcc'),
	(28,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2025-02-21 04:07:58','2025-02-21 04:07:58',NULL,NULL,NULL,'49967e24-c9ac-46a8-90b9-20b3b353136b'),
	(29,27,NULL,10,1,'craft\\elements\\Entry',1,0,'2025-02-21 04:08:06','2025-02-21 04:08:06',NULL,NULL,NULL,'499c5ad9-88a3-40af-b88a-6a9f2532bbce'),
	(30,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-02-21 04:11:01','2025-02-21 05:11:57',NULL,NULL,NULL,'108fe821-5373-4529-a4bf-fb79361425b2'),
	(31,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2025-02-21 04:11:57','2025-02-21 04:11:57',NULL,NULL,NULL,'a3c8f141-038f-48e5-aa06-483e84f18a10'),
	(32,30,NULL,11,1,'craft\\elements\\Entry',1,0,'2025-02-21 04:11:59','2025-02-21 04:11:59',NULL,NULL,NULL,'8540afc9-d894-43b2-b44f-32125df82c65'),
	(33,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-02-21 04:18:41','2025-02-21 05:12:13',NULL,NULL,NULL,'b6ddc915-7644-4f81-aa3a-57ea04053346'),
	(34,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2025-02-21 04:19:20','2025-02-21 04:19:20',NULL,NULL,NULL,'24232e4b-3a68-49c7-9f24-cabe41d777fb'),
	(35,33,NULL,12,1,'craft\\elements\\Entry',1,0,'2025-02-21 04:19:41','2025-02-21 04:19:41',NULL,NULL,NULL,'92996bde-d147-4c51-aaa9-3e41e051d795'),
	(37,30,NULL,13,1,'craft\\elements\\Entry',1,0,'2025-02-21 05:11:57','2025-02-21 05:11:57',NULL,NULL,NULL,'f096cb2b-134c-4b0f-9e87-c18063bb52a4'),
	(39,33,NULL,14,1,'craft\\elements\\Entry',1,0,'2025-02-21 05:12:13','2025-02-21 05:12:13',NULL,NULL,NULL,'f8b6817c-5bf2-4a69-b1c4-b58c49460d5d'),
	(41,16,NULL,15,1,'craft\\elements\\Entry',1,0,'2025-02-21 05:12:32','2025-02-21 05:12:32',NULL,NULL,NULL,'56be0ad5-b119-451b-9b7d-6e517744ec4d'),
	(42,16,NULL,16,1,'craft\\elements\\Entry',1,0,'2025-02-21 05:12:45','2025-02-21 05:12:45',NULL,NULL,NULL,'2f49afc5-7138-4eea-800e-9775e9031e89'),
	(44,24,NULL,17,1,'craft\\elements\\Entry',1,0,'2025-02-21 05:12:56','2025-02-21 05:12:56',NULL,NULL,NULL,'294a744d-984a-41ed-ac20-d3c75c4b655c'),
	(46,27,NULL,18,1,'craft\\elements\\Entry',1,0,'2025-02-21 05:13:09','2025-02-21 05:13:09',NULL,NULL,NULL,'b95027a9-2fd6-4043-986b-f28a543d4d78'),
	(48,19,NULL,19,1,'craft\\elements\\Entry',1,0,'2025-02-21 05:13:22','2025-02-21 05:13:22',NULL,NULL,NULL,'3348187e-4130-4e1d-8284-bff7c5b2748d');

/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table elements_bulkops
# ------------------------------------------------------------

DROP TABLE IF EXISTS `elements_bulkops`;

CREATE TABLE `elements_bulkops` (
  `elementId` int NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_linefpnuyqzrnyfaidwvmkkfcsuqjiprwuui` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table elements_owners
# ------------------------------------------------------------

DROP TABLE IF EXISTS `elements_owners`;

CREATE TABLE `elements_owners` (
  `elementId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `fk_fzliulduywzggqpmrjhyxsbqwtivayazschs` (`ownerId`),
  CONSTRAINT `fk_fzliulduywzggqpmrjhyxsbqwtivayazschs` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lmtzxuxuqwzvuoxabzkrvexyevpwaklxadli` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table elements_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `elements_sites`;

CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lnbidbsbimihnxmmblgivnwcnpqywzohirct` (`elementId`,`siteId`),
  KEY `idx_axqgmqgwsdgryomcvhhuwiflfnxlrcinejja` (`siteId`),
  KEY `idx_nxhdqsxrulxhzspikqwwaaiqxupfrzcbuwtq` (`title`,`siteId`),
  KEY `idx_ghomwkcakhmoumxgxjglykthrvlpapusgmub` (`slug`,`siteId`),
  KEY `idx_oezupzaionvavymgfcdbkdxefkqpcdozswwr` (`enabled`),
  KEY `idx_hwqrghlmucvxccqxmgijulgmnibynxbelild` (`uri`,`siteId`),
  CONSTRAINT `fk_gvvcorfyguvbfspfaqutgmytylpauqmgvawr` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ruyznctsabheqqdupauuupkmatkhcevwcpdp` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `title`, `slug`, `uri`, `content`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,NULL,NULL,NULL,NULL,1,'2025-02-20 19:13:50','2025-02-20 19:13:50','454b8ab8-8e47-4643-ac42-d726f479a8fd'),
	(2,2,1,'IMG 8130',NULL,NULL,NULL,1,'2025-02-20 19:30:25','2025-02-20 19:30:25','dab5d44c-d477-4879-8380-067c1e58a9f4'),
	(3,3,1,'IMG 8130',NULL,NULL,NULL,1,'2025-02-20 19:32:19','2025-02-20 19:32:19','4d01331a-e049-4123-a99c-bbfbddc77cc2'),
	(4,4,1,'Shoe 1',NULL,NULL,NULL,1,'2025-02-20 19:34:40','2025-02-20 19:34:40','77b343b5-a9a3-43cf-ae6b-74567616ce66'),
	(5,5,1,'Shoe 2',NULL,NULL,NULL,1,'2025-02-20 19:34:40','2025-02-20 19:34:40','d91b97de-8d86-49ed-8e2f-7162374146e0'),
	(6,6,1,'Shoe 3',NULL,NULL,NULL,1,'2025-02-20 19:34:40','2025-02-20 19:34:40','81891353-d77e-48a7-8f52-4c89ba854a4f'),
	(7,7,1,'Nimbus Kicks','nimbus-kicks','shoes/nimbus-kicks','{\"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Evoking the light, airy feel of clouds, these shoes suggest comfort and effortless style.\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"20999\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [4]}',1,'2025-02-20 19:37:14','2025-02-20 19:39:00','d94a2642-8364-4c47-87b4-4ded0d60fa7e'),
	(8,8,1,'Nimbus Kicks','nimbus-kicks','shoes/nimbus-kicks','{\"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Evoking the light, airy feel of clouds, these shoes suggest comfort and effortless style.\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [4]}',1,'2025-02-20 19:38:17','2025-02-20 19:38:17','bfb34b61-b255-4a19-9334-28760c3eb4e0'),
	(9,9,1,'Zephyr Strides','zephyr-strides','shoes/zephyr-strides','{\"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Inspired by a gentle breeze, these imply speed and a smooth, flowing stride.\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"14999\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [6]}',1,'2025-02-20 19:38:19','2025-02-20 19:39:15','5060c8ae-9d3d-49e1-a977-d0d889d432c4'),
	(10,10,1,'Zephyr Strides','zephyr-strides','shoes/zephyr-strides','{\"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Inspired by a gentle breeze, these imply speed and a smooth, flowing stride.\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"14900\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [6]}',1,'2025-02-20 19:38:44','2025-02-20 19:38:44','d2ac158a-79ca-4c04-87b1-5272407f1986'),
	(12,12,1,'Nimbus Kicks','nimbus-kicks','shoes/nimbus-kicks','{\"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Evoking the light, airy feel of clouds, these shoes suggest comfort and effortless style.\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"20999\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [4]}',1,'2025-02-20 19:39:00','2025-02-20 19:39:00','dcf70841-b8c3-4f30-a21b-36ceea5b75f3'),
	(13,13,1,'Zephyr Strides','zephyr-strides','shoes/zephyr-strides','{\"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Inspired by a gentle breeze, these imply speed and a smooth, flowing stride.\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"14999\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [6]}',1,'2025-02-20 19:39:15','2025-02-20 19:39:15','4257c74c-5f00-4aac-820b-327b3fad9c14'),
	(14,14,1,'Lunacore Treads','lunacore-treads','shoes/lunacore-treads','{\"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Combining lunar vibes with a tough core, these hint at futuristic design and durability.\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"8999\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [5]}',1,'2025-02-20 19:39:18','2025-02-20 19:39:34','693f533e-8dc3-40c7-af52-35331482dad4'),
	(15,15,1,'Lunacore Treads','lunacore-treads','shoes/lunacore-treads','{\"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Combining lunar vibes with a tough core, these hint at futuristic design and durability.\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"8999\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [5]}',1,'2025-02-20 19:39:40','2025-02-20 19:39:40','a6745e16-edb5-4488-bf31-65fb7565b521'),
	(16,16,1,'NOT A CULT Baseball Cap','not-a-cult-baseball-cap','products/not-a-cult-baseball-cap','{\"39663fcd-8055-43d7-9ae5-702e90b0c65c\": [{\"col1\": \"Ironic headwear that showcases Datastar\'s self-aware humor\"}, {\"col1\": \"Premium construction for all-day comfort\"}, {\"col1\": \"Guaranteed conversation starter at tech events\"}], \"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Join the Datastar movement with our tongue-in-cheek \\\"NOT A CULT\\\" baseball cap. Wear it proudly. (But remember, we\'re definitely NOT A CULT... we just really love our data solutions.)\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"2999\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [17]}',1,'2025-02-21 03:14:32','2025-02-21 05:12:32','a74488fd-d467-46b1-9033-1454f364fe06'),
	(17,17,1,'Grok Image',NULL,NULL,NULL,1,'2025-02-21 03:16:11','2025-02-21 03:16:11','b281139e-ab7d-459f-98e0-399603d017f0'),
	(18,18,1,'NOT A CULT Baseball Cap','not-a-cult-baseball-cap','shoes/not-a-cult-baseball-cap','{\"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Join the Datastar movement with our tongue-in-cheek \\\"NOT A CULT\\\" baseball cap. Wear it proudly. (But remember, we\'re definitely NOT A CULT... we just really love our data solutions.)\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"4999\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [17]}',1,'2025-02-21 03:16:16','2025-02-21 03:16:16','aadd0b2a-d5a0-4ccc-a495-b066567d6c22'),
	(19,19,1,'NOT A CULT T-Shirt','not-a-cult-t-shirt','products/not-a-cult-t-shirt','{\"39663fcd-8055-43d7-9ae5-702e90b0c65c\": [{\"col1\": \"Soft-touch fabric with a message that turns heads\"}, {\"col1\": \"Perfect balance of tech humor and premium quality\"}, {\"col1\": \"The ultimate team identifier at conferences and meetups\"}], \"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Rock the Datastar vibe with our sleek \\\"NOT A CULT\\\" t-shirt. This premium cotton blend tee combines comfort with statement-making design, featuring our ironic slogan in bold typography against Datastar\'s signature colors.\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"4999\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [20]}',1,'2025-02-21 03:17:14','2025-02-21 05:13:22','e580cb53-3541-47f5-a721-6bf924511907'),
	(20,20,1,'Grok Image 1',NULL,NULL,NULL,1,'2025-02-21 03:18:53','2025-02-21 03:18:53','230fdf03-76bb-4cee-a917-255e35ad1b0b'),
	(21,21,1,'NOT A CULT T-Shirt','not-a-cult-t-shirt','shoes/not-a-cult-t-shirt','{\"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Rock the Datastar vibe with our sleek \\\"NOT A CULT\\\" t-shirt. This premium cotton blend tee combines comfort with statement-making design, featuring our ironic slogan in bold typography against Datastar\'s signature colors.\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"4999\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [20]}',1,'2025-02-21 03:19:28','2025-02-21 03:19:28','79294c4b-509a-4a39-aaf3-88b079b04104'),
	(23,23,1,'NOT A CULT Baseball Cap','not-a-cult-baseball-cap','shoes/not-a-cult-baseball-cap','{\"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Join the Datastar movement with our tongue-in-cheek \\\"NOT A CULT\\\" baseball cap. Wear it proudly. (But remember, we\'re definitely NOT A CULT... we just really love our data solutions.)\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"2999\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [17]}',1,'2025-02-21 03:19:36','2025-02-21 03:19:36','455b0397-3840-449b-87af-aefae6586bda'),
	(24,24,1,'D* Sneakers','d-sneakers','products/d-sneakers','{\"39663fcd-8055-43d7-9ae5-702e90b0c65c\": [{\"col1\": \"Data-driven comfort meets everyday style\"}, {\"col1\": \"Subtle branding for the discerning tech professional\"}, {\"col1\": \"Engineered for optimal performance during long office hours\"}], \"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Slip into Datastar\'s \\\"NOT A CULT\\\" sneakers – comfortable tech swagger with a wink. Data-driven design meets footwear rebellion in these conversation-starting kicks that silently proclaim your allegiance without saying a word.\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"14999\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [25]}',1,'2025-02-21 04:07:11','2025-02-21 05:12:56','66500bae-f1e8-45a6-a934-10239f28214d'),
	(25,25,1,'Grok Image 2',NULL,NULL,NULL,1,'2025-02-21 04:07:32','2025-02-21 04:07:32','17cb099c-c027-49e0-a91b-b2b0196f83c5'),
	(26,26,1,'D* Sneakers','d-sneakers','shoes/d-sneakers','{\"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Slip into Datastar\'s \\\"NOT A CULT\\\" sneakers – comfortable tech swagger with a wink. Data-driven design meets footwear rebellion in these conversation-starting kicks that silently proclaim your allegiance without saying a word.\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"14999\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [25]}',1,'2025-02-21 04:07:34','2025-02-21 04:07:34','4b7ede48-0d00-4ec4-9e53-9dead22fa5e9'),
	(27,27,1,'D* Blue Running Shoes','d-blue-running-shoes','products/d-blue-running-shoes','{\"39663fcd-8055-43d7-9ae5-702e90b0c65c\": [{\"col1\": \"Performance footwear for the data-obsessed athlete\"}, {\"col1\": \"Responsive cushioning that matches your analytical precision\"}, {\"col1\": \"Gold embroidery that shines brighter with every mile\"}], \"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Slip into Datastar\'s \\\"NOT A CULT\\\" sneakers – comfortable tech swagger with a wink. Data-driven design meets footwear rebellion in these conversation-starting kicks that silently proclaim your allegiance without saying a word.\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"20999\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [28]}',1,'2025-02-21 04:07:36','2025-02-21 05:13:09','17e2182f-e587-4f51-880f-a169b30af7a3'),
	(28,28,1,'Grok Image 3',NULL,NULL,NULL,1,'2025-02-21 04:07:58','2025-02-21 04:07:58','e73d45fb-6a13-4f86-b864-d3b93a82f18b'),
	(29,29,1,'D* Blue Running Shoes','d-blue-running-shoes','shoes/d-blue-running-shoes','{\"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Slip into Datastar\'s \\\"NOT A CULT\\\" sneakers – comfortable tech swagger with a wink. Data-driven design meets footwear rebellion in these conversation-starting kicks that silently proclaim your allegiance without saying a word.\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"20999\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [28]}',1,'2025-02-21 04:08:06','2025-02-21 04:08:06','929e5921-8052-4e6b-9ec4-3f7e54fb8862'),
	(30,30,1,'OK It Might Be a Cult Sweatpants','ok-it-might-be-a-cult-sweatpants','products/ok-it-might-be-a-cult-sweatpants','{\"39663fcd-8055-43d7-9ae5-702e90b0c65c\": [{\"col1\": \"Ultra-comfortable confession wear for true Datastar devotees\"}, {\"col1\": \"Perfect blend of irony and luxury for marathon coding sessions\"}, {\"col1\": \"Conversation-starting leg text that separates insiders from outsiders\"}], \"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Luxury loungewear for the truly converted. Embrace the obsession with these ultra-soft sweatpants featuring our cheeky confession emblazoned down the leg, perfect for coding marathons or spreading the Datastar gospel at casual meetups.\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"7999\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [31]}',1,'2025-02-21 04:11:01','2025-02-21 05:11:57','12ac87d9-bdb5-4366-8264-47ac1fe28840'),
	(31,31,1,'Grok Image 4',NULL,NULL,NULL,1,'2025-02-21 04:11:57','2025-02-21 04:11:57','2477f86d-013c-480c-b095-69e5fa05469d'),
	(32,32,1,'OK It Might Be a Cult Sweatpants','ok-it-might-be-a-cult-sweatpants','shoes/ok-it-might-be-a-cult-sweatpants','{\"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Luxury loungewear for the truly converted. Embrace the obsession with these ultra-soft sweatpants featuring our cheeky confession emblazoned down the leg, perfect for coding marathons or spreading the Datastar gospel at casual meetups.\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"7999\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [31]}',1,'2025-02-21 04:11:59','2025-02-21 04:11:59','c9da3671-83ef-436c-86d4-695f2a5b51f3'),
	(33,33,1,'D* Trucker Hat','d-trucker-hat','products/d-trucker-hat','{\"39663fcd-8055-43d7-9ae5-702e90b0c65c\": [{\"col1\": \"Breathable mesh meets sophisticated gold embroidery\"}, {\"col1\": \"Instantly recognizable symbol of data excellence\"}, {\"col1\": \"Versatile enough for both client meetings and weekend adventures\"}], \"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Elevate your style with Datastar\'s minimalist gold D* cap – understated luxury meets tech sophistication. The premium embroidered emblem speaks volumes without saying a word, instantly identifying you as part of the elite data revolution. A subtle flex for those who know.\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"2999\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [34]}',1,'2025-02-21 04:18:41','2025-02-21 05:12:13','de743099-6dea-4255-ada6-930c4e986c7d'),
	(34,34,1,'Grok Image 5',NULL,NULL,NULL,1,'2025-02-21 04:19:20','2025-02-21 04:19:20','71fda73f-332f-4b3e-874b-09c36c690b1c'),
	(35,35,1,'D* Trucker Hat','d-trucker-hat','shoes/d-trucker-hat','{\"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Elevate your style with Datastar\'s minimalist gold D* cap – understated luxury meets tech sophistication. The premium embroidered emblem speaks volumes without saying a word, instantly identifying you as part of the elite data revolution. A subtle flex for those who know.\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"2999\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [34]}',1,'2025-02-21 04:19:41','2025-02-21 04:19:41','03deb485-70c6-4ab4-8665-4113450ad137'),
	(37,37,1,'OK It Might Be a Cult Sweatpants','ok-it-might-be-a-cult-sweatpants','products/ok-it-might-be-a-cult-sweatpants','{\"39663fcd-8055-43d7-9ae5-702e90b0c65c\": [{\"col1\": \"Ultra-comfortable confession wear for true Datastar devotees\"}, {\"col1\": \"Perfect blend of irony and luxury for marathon coding sessions\"}, {\"col1\": \"Conversation-starting leg text that separates insiders from outsiders\"}], \"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Luxury loungewear for the truly converted. Embrace the obsession with these ultra-soft sweatpants featuring our cheeky confession emblazoned down the leg, perfect for coding marathons or spreading the Datastar gospel at casual meetups.\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"7999\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [31]}',1,'2025-02-21 05:11:57','2025-02-21 05:11:57','b9906b64-b40c-49f2-a1ac-58a310f85540'),
	(39,39,1,'D* Trucker Hat','d-trucker-hat','products/d-trucker-hat','{\"39663fcd-8055-43d7-9ae5-702e90b0c65c\": [{\"col1\": \"Breathable mesh meets sophisticated gold embroidery\"}, {\"col1\": \"Instantly recognizable symbol of data excellence\"}, {\"col1\": \"Versatile enough for both client meetings and weekend adventures\"}], \"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Elevate your style with Datastar\'s minimalist gold D* cap – understated luxury meets tech sophistication. The premium embroidered emblem speaks volumes without saying a word, instantly identifying you as part of the elite data revolution. A subtle flex for those who know.\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"2999\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [34]}',1,'2025-02-21 05:12:13','2025-02-21 05:12:13','79de0966-f8d6-4014-8477-349f71696048'),
	(41,41,1,'NOT A CULT Baseball Cap','not-a-cult-baseball-cap','products/not-a-cult-baseball-cap','{\"39663fcd-8055-43d7-9ae5-702e90b0c65c\": [{\"col1\": \"Ironic headwear that showcases Datastar\'s self-aware humor\"}, {\"col1\": \"Premium construction for all-day comfort\"}, {\"col1\": \"Guaranteed conversation starter at tech events\"}], \"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Join the Datastar movement with our tongue-in-cheek \\\"NOT A CULT\\\" baseball cap. Wear it proudly. (But remember, we\'re definitely NOT A CULT... we just really love our data solutions.)\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"2999\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [17]}',1,'2025-02-21 05:12:32','2025-02-21 05:12:32','0e96e14f-2b6d-4ae2-aacb-a0dea3ede58d'),
	(42,42,1,'NOT A CULT Baseball Cap','not-a-cult-baseball-cap','products/not-a-cult-baseball-cap','{\"39663fcd-8055-43d7-9ae5-702e90b0c65c\": [{\"col1\": \"Ironic headwear that showcases Datastar\'s self-aware humor\"}, {\"col1\": \"Premium construction for all-day comfort\"}, {\"col1\": \"Guaranteed conversation starter at tech events\"}], \"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Join the Datastar movement with our tongue-in-cheek \\\"NOT A CULT\\\" baseball cap. Wear it proudly. (But remember, we\'re definitely NOT A CULT... we just really love our data solutions.)\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"2999\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [17]}',1,'2025-02-21 05:12:45','2025-02-21 05:12:45','331b8a3d-9f38-404e-a278-71d285e2f423'),
	(44,44,1,'D* Sneakers','d-sneakers','products/d-sneakers','{\"39663fcd-8055-43d7-9ae5-702e90b0c65c\": [{\"col1\": \"Data-driven comfort meets everyday style\"}, {\"col1\": \"Subtle branding for the discerning tech professional\"}, {\"col1\": \"Engineered for optimal performance during long office hours\"}], \"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Slip into Datastar\'s \\\"NOT A CULT\\\" sneakers – comfortable tech swagger with a wink. Data-driven design meets footwear rebellion in these conversation-starting kicks that silently proclaim your allegiance without saying a word.\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"14999\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [25]}',1,'2025-02-21 05:12:56','2025-02-21 05:12:56','26bfd38f-5728-44b7-a1ca-737422bba985'),
	(46,46,1,'D* Blue Running Shoes','d-blue-running-shoes','products/d-blue-running-shoes','{\"39663fcd-8055-43d7-9ae5-702e90b0c65c\": [{\"col1\": \"Performance footwear for the data-obsessed athlete\"}, {\"col1\": \"Responsive cushioning that matches your analytical precision\"}, {\"col1\": \"Gold embroidery that shines brighter with every mile\"}], \"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Slip into Datastar\'s \\\"NOT A CULT\\\" sneakers – comfortable tech swagger with a wink. Data-driven design meets footwear rebellion in these conversation-starting kicks that silently proclaim your allegiance without saying a word.\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"20999\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [28]}',1,'2025-02-21 05:13:09','2025-02-21 05:13:09','3a9926b4-1abb-4274-86a6-61c2abf39448'),
	(48,48,1,'NOT A CULT T-Shirt','not-a-cult-t-shirt','products/not-a-cult-t-shirt','{\"39663fcd-8055-43d7-9ae5-702e90b0c65c\": [{\"col1\": \"Soft-touch fabric with a message that turns heads\"}, {\"col1\": \"Perfect balance of tech humor and premium quality\"}, {\"col1\": \"The ultimate team identifier at conferences and meetups\"}], \"4151fbe2-8252-44d2-aab5-0abf61b1dc12\": \"Rock the Datastar vibe with our sleek \\\"NOT A CULT\\\" t-shirt. This premium cotton blend tee combines comfort with statement-making design, featuring our ironic slogan in bold typography against Datastar\'s signature colors.\", \"5da727e9-a929-4c64-9b65-de690945636f\": \"4999\", \"b37cdba4-7db3-499c-9359-82e0df04f120\": [20]}',1,'2025-02-21 05:13:22','2025-02-21 05:13:22','37b87212-e152-419b-9846-5f3a53ccfce1');

/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `entries`;

CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `deletedWithSection` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ldqemmsrgqexlkyceibpdjapkctrjyqmcgpl` (`postDate`),
  KEY `idx_xalxsyggwwpwfmubfymeqfsuzgwmbnubqnqn` (`expiryDate`),
  KEY `idx_sutmkvlwynyufdyhsvuylhddjanhieahpftv` (`sectionId`),
  KEY `idx_fuwljdurkzanmefueicmcmkoyqdocchpnjsl` (`typeId`),
  KEY `idx_leaipwqfrlttndivyucaodncleupxpfvbkdq` (`primaryOwnerId`),
  KEY `idx_ikplbhibdwunpawmqigysypgldcaowyrqjdc` (`fieldId`),
  KEY `fk_euinbbpwtfrzrqchjtojqyascodnpjuskvmo` (`parentId`),
  CONSTRAINT `fk_agodwhntosdyvljuhidyispwegfnmuveokmq` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_bumjmzpvvymsnsfgyucthvyecpvjpxwqtjoa` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_euinbbpwtfrzrqchjtojqyascodnpjuskvmo` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mipegmawbiaurkeozzmwzlczghhrdlgtzuet` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yfejtugkgfkljidvjfhffujfjqnnvjkngyse` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yrhvyagflfvsqazuelfzjqjvrlfimqiazzkz` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;

INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `primaryOwnerId`, `fieldId`, `typeId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `deletedWithSection`, `dateCreated`, `dateUpdated`)
VALUES
	(7,1,NULL,NULL,NULL,1,'2025-02-20 19:38:00',NULL,0,0,'2025-02-20 19:37:14','2025-02-20 19:38:17'),
	(8,1,NULL,NULL,NULL,1,'2025-02-20 19:38:00',NULL,NULL,NULL,'2025-02-20 19:38:17','2025-02-20 19:38:17'),
	(9,1,NULL,NULL,NULL,1,'2025-02-20 19:38:00',NULL,0,0,'2025-02-20 19:38:19','2025-02-20 19:38:44'),
	(10,1,NULL,NULL,NULL,1,'2025-02-20 19:38:00',NULL,NULL,NULL,'2025-02-20 19:38:44','2025-02-20 19:38:44'),
	(12,1,NULL,NULL,NULL,1,'2025-02-20 19:38:00',NULL,NULL,NULL,'2025-02-20 19:39:00','2025-02-20 19:39:00'),
	(13,1,NULL,NULL,NULL,1,'2025-02-20 19:38:00',NULL,NULL,NULL,'2025-02-20 19:39:15','2025-02-20 19:39:15'),
	(14,1,NULL,NULL,NULL,1,'2025-02-20 19:39:00',NULL,0,0,'2025-02-20 19:39:18','2025-02-20 19:39:40'),
	(15,1,NULL,NULL,NULL,1,'2025-02-20 19:39:00',NULL,NULL,NULL,'2025-02-20 19:39:40','2025-02-20 19:39:40'),
	(16,1,NULL,NULL,NULL,1,'2025-02-21 03:16:00',NULL,NULL,NULL,'2025-02-21 03:14:32','2025-02-21 03:16:16'),
	(18,1,NULL,NULL,NULL,1,'2025-02-21 03:16:00',NULL,NULL,NULL,'2025-02-21 03:16:16','2025-02-21 03:16:16'),
	(19,1,NULL,NULL,NULL,1,'2025-02-21 03:19:00',NULL,NULL,NULL,'2025-02-21 03:17:14','2025-02-21 03:19:28'),
	(21,1,NULL,NULL,NULL,1,'2025-02-21 03:19:00',NULL,NULL,NULL,'2025-02-21 03:19:28','2025-02-21 03:19:28'),
	(23,1,NULL,NULL,NULL,1,'2025-02-21 03:16:00',NULL,NULL,NULL,'2025-02-21 03:19:36','2025-02-21 03:19:36'),
	(24,1,NULL,NULL,NULL,1,'2025-02-21 04:07:00',NULL,NULL,NULL,'2025-02-21 04:07:11','2025-02-21 04:07:34'),
	(26,1,NULL,NULL,NULL,1,'2025-02-21 04:07:00',NULL,NULL,NULL,'2025-02-21 04:07:34','2025-02-21 04:07:34'),
	(27,1,NULL,NULL,NULL,1,'2025-02-21 04:08:00',NULL,NULL,NULL,'2025-02-21 04:07:36','2025-02-21 04:08:06'),
	(29,1,NULL,NULL,NULL,1,'2025-02-21 04:08:00',NULL,NULL,NULL,'2025-02-21 04:08:06','2025-02-21 04:08:06'),
	(30,1,NULL,NULL,NULL,1,'2025-02-21 04:11:00',NULL,NULL,NULL,'2025-02-21 04:11:01','2025-02-21 04:11:59'),
	(32,1,NULL,NULL,NULL,1,'2025-02-21 04:11:00',NULL,NULL,NULL,'2025-02-21 04:11:59','2025-02-21 04:11:59'),
	(33,1,NULL,NULL,NULL,1,'2025-02-21 04:19:00',NULL,NULL,NULL,'2025-02-21 04:18:41','2025-02-21 04:19:41'),
	(35,1,NULL,NULL,NULL,1,'2025-02-21 04:19:00',NULL,NULL,NULL,'2025-02-21 04:19:41','2025-02-21 04:19:41'),
	(37,1,NULL,NULL,NULL,1,'2025-02-21 04:11:00',NULL,NULL,NULL,'2025-02-21 05:11:57','2025-02-21 05:11:57'),
	(39,1,NULL,NULL,NULL,1,'2025-02-21 04:19:00',NULL,NULL,NULL,'2025-02-21 05:12:13','2025-02-21 05:12:13'),
	(41,1,NULL,NULL,NULL,1,'2025-02-21 03:16:00',NULL,NULL,NULL,'2025-02-21 05:12:32','2025-02-21 05:12:32'),
	(42,1,NULL,NULL,NULL,1,'2025-02-21 03:16:00',NULL,NULL,NULL,'2025-02-21 05:12:45','2025-02-21 05:12:45'),
	(44,1,NULL,NULL,NULL,1,'2025-02-21 04:07:00',NULL,NULL,NULL,'2025-02-21 05:12:56','2025-02-21 05:12:56'),
	(46,1,NULL,NULL,NULL,1,'2025-02-21 04:08:00',NULL,NULL,NULL,'2025-02-21 05:13:09','2025-02-21 05:13:09'),
	(48,1,NULL,NULL,NULL,1,'2025-02-21 03:19:00',NULL,NULL,NULL,'2025-02-21 05:13:22','2025-02-21 05:13:22');

/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table entries_authors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `entries_authors`;

CREATE TABLE `entries_authors` (
  `entryId` int NOT NULL,
  `authorId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `idx_vjrhsjtitzisnnnjqmqyodtkrakgwpzqztpp` (`authorId`),
  KEY `idx_qrymrvzjqwpfbvscitaiepsuffslsghsvdcu` (`entryId`,`sortOrder`),
  CONSTRAINT `fk_pdaiptkkdqrwzxageemzpuopcddmhcwbmsei` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rxyxgvgbspwaohnqfbcxqztkaetieykdnsuz` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `entries_authors` WRITE;
/*!40000 ALTER TABLE `entries_authors` DISABLE KEYS */;

INSERT INTO `entries_authors` (`entryId`, `authorId`, `sortOrder`)
VALUES
	(7,1,1),
	(8,1,1),
	(9,1,1),
	(10,1,1),
	(12,1,1),
	(13,1,1),
	(14,1,1),
	(15,1,1),
	(16,1,1),
	(18,1,1),
	(19,1,1),
	(21,1,1),
	(23,1,1),
	(24,1,1),
	(26,1,1),
	(27,1,1),
	(29,1,1),
	(30,1,1),
	(32,1,1),
	(33,1,1),
	(35,1,1),
	(37,1,1),
	(39,1,1),
	(41,1,1),
	(42,1,1),
	(44,1,1),
	(46,1,1),
	(48,1,1);

/*!40000 ALTER TABLE `entries_authors` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table entrytypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `entrytypes`;

CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT '1',
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ytbfzvhreldcmjvgjzthbpnkdtfiztrdponz` (`fieldLayoutId`),
  KEY `idx_lgevizoeussqqonkobhhsjyftdepvoyfqneg` (`dateDeleted`),
  CONSTRAINT `fk_nmygjiifsavulzhpmzzpejfxictcicgjcqav` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;

INSERT INTO `entrytypes` (`id`, `fieldLayoutId`, `name`, `handle`, `icon`, `color`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `showSlugField`, `slugTranslationMethod`, `slugTranslationKeyFormat`, `showStatusField`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,'Product','product','boot-heeled','cyan',1,'site',NULL,NULL,1,'site',NULL,1,'2025-02-20 19:28:14','2025-02-21 04:23:24',NULL,'c10c3318-d328-4d46-b052-8f485c053667');

/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fieldlayouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldlayouts`;

CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ydjndvvqnlqnvbkcqleinuxfyjyasrbvpnhk` (`dateDeleted`),
  KEY `idx_xfywtcuibzmtiqxbjknrpkjrlmiruubiakfo` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;

INSERT INTO `fieldlayouts` (`id`, `type`, `config`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"a23211a5-3baa-4339-87cd-ffc8f2d2dd2c\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"a17267ea-ccc9-4676-8ba5-2e7f82ca0bbe\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-02-20T19:25:59+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"4151fbe2-8252-44d2-aab5-0abf61b1dc12\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"69cf82d5-482d-4b1b-8a34-72cb92965bcf\", \"required\": false, \"dateAdded\": \"2025-02-20T19:28:14+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"5da727e9-a929-4c64-9b65-de690945636f\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"c99ffa0f-b08c-4d6d-8dfe-410aaa5ccd99\", \"required\": false, \"dateAdded\": \"2025-02-20T19:28:14+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"b37cdba4-7db3-499c-9359-82e0df04f120\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"bcf1c20d-fef6-4456-a477-f4de83877e75\", \"required\": false, \"dateAdded\": \"2025-02-20T19:37:06+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"39663fcd-8055-43d7-9ae5-702e90b0c65c\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"afb8dc04-ca52-442f-ae72-8a8be4daef58\", \"required\": false, \"dateAdded\": \"2025-02-21T05:11:32+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-02-20 19:28:14','2025-02-21 05:11:32',NULL,'238507e3-9c50-419a-905a-2569586aa8b2'),
	(2,'craft\\elements\\Asset','{\"tabs\": [{\"uid\": \"5a64a5d6-c0ad-4703-b9ea-613fadf074bf\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"50911fbb-019f-49c7-8f84-701a0fe35551\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2025-02-20T19:27:25+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}','2025-02-20 19:30:10','2025-02-20 19:30:10',NULL,'af45e2e3-b911-4ca5-81be-4cbc21cfe7b0');

/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fields`;

CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bkdmwqskcwxpltedtqinlnkmjvpglmoojfvh` (`handle`,`context`),
  KEY `idx_qxpzjyaiuxxsfwpzwlvjakoanouyzllccdhm` (`context`),
  KEY `idx_gzmkybihrfizsgdiqeylwvynevwjufgvpane` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;

INSERT INTO `fields` (`id`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'Price','price','global',NULL,'Enter the item price',0,'none',NULL,'craft\\fields\\Money','{\"currency\":\"USD\",\"defaultValue\":null,\"max\":null,\"min\":0,\"showCurrency\":true,\"size\":null}','2025-02-20 19:27:40','2025-02-20 19:27:40',NULL,'c99ffa0f-b08c-4d6d-8dfe-410aaa5ccd99'),
	(2,'Description','description','global',NULL,'A description of the item',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"enlarged\"}','2025-02-20 19:28:08','2025-02-20 19:28:08',NULL,'69cf82d5-482d-4b1b-8a34-72cb92965bcf'),
	(3,'Image','image','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:4e309720-146d-4ef8-8b9f-7a1ca4c6578c\",\"defaultUploadLocationSubpath\":null,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":1,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:4e309720-146d-4ef8-8b9f-7a1ca4c6578c\",\"restrictedLocationSubpath\":null,\"selectionLabel\":\"Add an Image\",\"showCardsInGrid\":true,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:4e309720-146d-4ef8-8b9f-7a1ca4c6578c\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"large\"}','2025-02-20 19:37:02','2025-02-20 19:37:02',NULL,'bcf1c20d-fef6-4456-a477-f4de83877e75'),
	(4,'Product Highlights','productHighlights','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Table','{\"addRowLabel\":\"Add a row\",\"columns\":{\"col1\":{\"heading\":\"Highlight\",\"handle\":\"highlight\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":[{\"col1\":\"\"}],\"maxRows\":null,\"minRows\":null,\"staticRows\":false}','2025-02-21 05:11:29','2025-02-21 05:11:29',NULL,'afb8dc04-ca52-442f-ae72-8a8be4daef58');

/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table globalsets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `globalsets`;

CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gnzvqxxdyesscqjcgnmhmaixxaolvygfmtdn` (`name`),
  KEY `idx_vhfzdwfrojbkalfeqrlyzitzgvwsokzrrjlq` (`handle`),
  KEY `idx_jbtomzxqmwxfsxgolwtwgqfacckfresckzij` (`fieldLayoutId`),
  KEY `idx_pwtnkhsdbsqxoyivjegfzlrompsqqssctymf` (`sortOrder`),
  CONSTRAINT `fk_cnwdokuhffjdixoqvdekfwhkmxhydgknoeyj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rhuptzzmrlinccwtawifrbstxpqbdpmmkgfn` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table gqlschemas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gqlschemas`;

CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table gqltokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gqltokens`;

CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gprdblrsqqugbgapgboftncifrkgwptfxawp` (`accessToken`),
  UNIQUE KEY `idx_foqbrwasflebjcyjyedhlykxghjsuxahiwza` (`name`),
  KEY `fk_yinzjfgjcszxmqugvgvqpzuozlcxrocwpopq` (`schemaId`),
  CONSTRAINT `fk_yinzjfgjcszxmqugvgvqpzuozlcxrocwpopq` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table imagetransformindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `imagetransformindex`;

CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ndauclassrhcwoxxmyqkubtiztzbjmwqhdst` (`assetId`,`transformString`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `imagetransformindex` WRITE;
/*!40000 ALTER TABLE `imagetransformindex` DISABLE KEYS */;

INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(7,4,'craft\\imagetransforms\\ImageTransformer','shoe-1.png',NULL,'_30x22_crop_center-center_none',1,0,0,'2025-02-20 19:34:40','2025-02-20 19:34:40','2025-02-20 19:35:57','5a399037-8313-466c-a7a4-9713f048ad4b'),
	(8,4,'craft\\imagetransforms\\ImageTransformer','shoe-1.png',NULL,'_60x45_crop_center-center_none',1,0,0,'2025-02-20 19:34:40','2025-02-20 19:34:40','2025-02-20 19:35:34','9ae2aa22-3398-4c3a-9f51-1be3d3fc9886'),
	(9,5,'craft\\imagetransforms\\ImageTransformer','shoe-2.png',NULL,'_30x22_crop_center-center_none',1,0,0,'2025-02-20 19:34:40','2025-02-20 19:34:40','2025-02-20 19:35:57','2463030e-b630-43a7-a419-ff0f98e5f3e0'),
	(10,5,'craft\\imagetransforms\\ImageTransformer','shoe-2.png',NULL,'_60x45_crop_center-center_none',1,0,0,'2025-02-20 19:34:40','2025-02-20 19:34:40','2025-02-20 19:35:34','f7ad5966-fd24-4e0c-a9d2-ff4ba1146679'),
	(11,6,'craft\\imagetransforms\\ImageTransformer','shoe-3.png',NULL,'_30x22_crop_center-center_none',1,0,0,'2025-02-20 19:34:40','2025-02-20 19:34:40','2025-02-20 19:35:57','2bd5323e-971f-44be-a6c9-290a14494d21'),
	(12,6,'craft\\imagetransforms\\ImageTransformer','shoe-3.png',NULL,'_60x45_crop_center-center_none',1,0,0,'2025-02-20 19:34:40','2025-02-20 19:34:40','2025-02-20 19:35:34','2b7952c8-6ae9-4738-a5ae-2c3784f62f06'),
	(13,4,'craft\\imagetransforms\\ImageTransformer','shoe-1.png',NULL,'_120x90_crop_center-center_none',1,0,0,'2025-02-20 19:38:10','2025-02-20 19:38:10','2025-02-20 19:38:17','a503b73a-d288-479c-9d07-f7f4e23b497a'),
	(14,4,'craft\\imagetransforms\\ImageTransformer','shoe-1.png',NULL,'_240x180_crop_center-center_none',1,0,0,'2025-02-20 19:38:10','2025-02-20 19:38:10','2025-02-20 19:38:11','1d39ad05-4812-4f7d-b50b-145005e088d4'),
	(15,6,'craft\\imagetransforms\\ImageTransformer','shoe-3.png',NULL,'_120x90_crop_center-center_none',1,0,0,'2025-02-20 19:38:38','2025-02-20 19:38:38','2025-02-20 19:38:44','3da12755-328b-4567-af5e-35274a68ed32'),
	(16,6,'craft\\imagetransforms\\ImageTransformer','shoe-3.png',NULL,'_240x180_crop_center-center_none',1,0,0,'2025-02-20 19:38:38','2025-02-20 19:38:38','2025-02-20 19:38:38','be5e0177-d52f-48f5-93c8-20aca302f447'),
	(17,5,'craft\\imagetransforms\\ImageTransformer','shoe-2.png',NULL,'_120x90_crop_center-center_none',1,0,0,'2025-02-20 19:39:34','2025-02-20 19:39:34','2025-02-20 19:39:41','436acaee-ef77-4286-91c6-ea0f1878b362'),
	(18,5,'craft\\imagetransforms\\ImageTransformer','shoe-2.png',NULL,'_240x180_crop_center-center_none',1,0,0,'2025-02-20 19:39:34','2025-02-20 19:39:34','2025-02-20 19:39:34','3ae3bb71-b20d-49c9-9ddf-daf2dff20c86'),
	(19,17,'craft\\imagetransforms\\ImageTransformer','Grok-Image.jpg',NULL,'_30x22_crop_center-center_none',1,0,0,'2025-02-21 03:16:11','2025-02-21 03:16:11','2025-02-21 03:16:12','f4781c59-9cb3-4879-923b-e6bafc3c7f03'),
	(20,17,'craft\\imagetransforms\\ImageTransformer','Grok-Image.jpg',NULL,'_60x45_crop_center-center_none',1,0,0,'2025-02-21 03:16:11','2025-02-21 03:16:11','2025-02-21 03:16:12','f6a88059-0c00-4d3e-9d53-7c355de5b0c1'),
	(21,17,'craft\\imagetransforms\\ImageTransformer','Grok-Image.jpg',NULL,'_120x90_crop_center-center_none',1,0,0,'2025-02-21 03:16:13','2025-02-21 03:16:13','2025-02-21 03:16:16','3e853b49-04de-4b8e-a267-75efa7f27b15'),
	(22,17,'craft\\imagetransforms\\ImageTransformer','Grok-Image.jpg',NULL,'_240x180_crop_center-center_none',1,0,0,'2025-02-21 03:16:13','2025-02-21 03:16:13','2025-02-21 03:16:13','5e667fd7-2316-49fe-bfd6-9f6161b85fe3'),
	(23,20,'craft\\imagetransforms\\ImageTransformer','Grok-Image-1.jpg',NULL,'_30x22_crop_center-center_none',1,0,0,'2025-02-21 03:18:53','2025-02-21 03:18:53','2025-02-21 03:18:53','d6f8d70e-5e1b-4754-9f1a-8c650f19fab5'),
	(24,20,'craft\\imagetransforms\\ImageTransformer','Grok-Image-1.jpg',NULL,'_60x45_crop_center-center_none',1,0,0,'2025-02-21 03:18:53','2025-02-21 03:18:53','2025-02-21 03:18:53','5e6a1f2c-fa38-4a35-b5d1-bd536457b3af'),
	(25,20,'craft\\imagetransforms\\ImageTransformer','Grok-Image-1.jpg',NULL,'_120x90_crop_center-center_none',1,0,0,'2025-02-21 03:18:55','2025-02-21 03:18:55','2025-02-21 03:19:28','2082709e-1fba-4fdc-b3ff-5d86cdee6215'),
	(26,20,'craft\\imagetransforms\\ImageTransformer','Grok-Image-1.jpg',NULL,'_240x180_crop_center-center_none',1,0,0,'2025-02-21 03:18:55','2025-02-21 03:18:55','2025-02-21 03:18:55','bb3df8cc-89c0-41ba-86c1-3ffaffe02a8e'),
	(27,25,'craft\\imagetransforms\\ImageTransformer','Grok-Image-2.jpg',NULL,'_120x90_crop_center-center_none',1,0,0,'2025-02-21 04:07:32','2025-02-21 04:07:32','2025-02-21 04:07:32','cfd8a619-720b-4dcd-a143-c0ea28f8cefc'),
	(28,25,'craft\\imagetransforms\\ImageTransformer','Grok-Image-2.jpg',NULL,'_240x180_crop_center-center_none',1,0,0,'2025-02-21 04:07:32','2025-02-21 04:07:32','2025-02-21 04:07:32','3b08e483-1cfd-4f11-a122-d318ffd54e77'),
	(29,28,'craft\\imagetransforms\\ImageTransformer','Grok-Image-3.jpg',NULL,'_120x90_crop_center-center_none',1,0,0,'2025-02-21 04:07:58','2025-02-21 04:07:58','2025-02-21 04:07:58','a0590cc6-cad2-46bd-a74b-815a869c73ec'),
	(30,28,'craft\\imagetransforms\\ImageTransformer','Grok-Image-3.jpg',NULL,'_240x180_crop_center-center_none',1,0,0,'2025-02-21 04:07:58','2025-02-21 04:07:58','2025-02-21 04:07:58','eb88ef3e-3b62-4ff4-865f-d563b3e6111e'),
	(31,31,'craft\\imagetransforms\\ImageTransformer','Grok-Image-4.jpg',NULL,'_120x90_crop_center-center_none',1,0,0,'2025-02-21 04:11:58','2025-02-21 04:11:58','2025-02-21 04:11:58','74f61ff0-d6f5-4079-b734-e0a1b9b5fb2b'),
	(32,31,'craft\\imagetransforms\\ImageTransformer','Grok-Image-4.jpg',NULL,'_240x180_crop_center-center_none',1,0,0,'2025-02-21 04:11:58','2025-02-21 04:11:58','2025-02-21 04:11:58','770d5144-9713-4f14-ab3e-b4574002880e'),
	(33,34,'craft\\imagetransforms\\ImageTransformer','Grok-Image-5.jpg',NULL,'_120x90_crop_center-center_none',1,0,0,'2025-02-21 04:19:20','2025-02-21 04:19:20','2025-02-21 04:19:20','ea94bb24-4c6f-46dc-9eff-e69242cb3aeb'),
	(34,34,'craft\\imagetransforms\\ImageTransformer','Grok-Image-5.jpg',NULL,'_240x180_crop_center-center_none',1,0,0,'2025-02-21 04:19:20','2025-02-21 04:19:20','2025-02-21 04:19:20','1ce14940-8107-4ca7-a319-32b99840507f'),
	(35,34,'craft\\imagetransforms\\ImageTransformer','Grok-Image-5.jpg',NULL,'_30x22_crop_center-center_none',1,0,0,'2025-02-21 04:19:22','2025-02-21 04:19:22','2025-02-21 04:19:42','6a740bfe-0a4f-4b8d-86dd-67b160346e0d'),
	(36,34,'craft\\imagetransforms\\ImageTransformer','Grok-Image-5.jpg',NULL,'_60x45_crop_center-center_none',1,0,0,'2025-02-21 04:19:22','2025-02-21 04:19:22','2025-02-21 04:19:42','ad5943ed-88f3-4afc-8661-55ea8260c512'),
	(37,34,'craft\\imagetransforms\\ImageTransformer','Grok-Image-5.jpg',NULL,'_253x190_crop_center-center_none',1,0,0,'2025-02-21 04:19:22','2025-02-21 04:19:22','2025-02-21 04:19:42','053cb785-5859-46cb-9b85-9e9e5da78801'),
	(38,34,'craft\\imagetransforms\\ImageTransformer','Grok-Image-5.jpg',NULL,'_506x380_crop_center-center_none',1,0,0,'2025-02-21 04:19:22','2025-02-21 04:19:22','2025-02-21 04:19:23','fab12c75-1f75-4efb-adad-36be5d630b7c');

/*!40000 ALTER TABLE `imagetransformindex` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table imagetransforms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `imagetransforms`;

CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jmdscqesrhyoftgmcrfejaisglkvacphnnva` (`name`),
  KEY `idx_sptnhvnfdwhzjztxzmmcxvcbltkvwtuxjdne` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `info`;

CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'5.6.8','5.6.0.2',0,'hrzjuzlppgtt','3@kzqnjagcpn','2025-02-20 19:13:49','2025-02-21 05:11:32','a1f9ac16-df0b-4ab0-bbc5-17fd3130a54d');

/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gxfdsglkcgnejvpsraiinozshkilxnttpyrx` (`track`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'craft','Install','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','63cfbc0d-a1d2-4a62-971c-ef908fdec226'),
	(2,'craft','m221101_115859_create_entries_authors_table','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','d93d402f-951f-4535-9f2c-688fe7f95fdd'),
	(3,'craft','m221107_112121_add_max_authors_to_sections','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','d9948a76-4283-49f9-9b0d-18eeecdb4b29'),
	(4,'craft','m221205_082005_translatable_asset_alt_text','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','d290b40d-01fa-4c3e-a603-34a521f065ea'),
	(5,'craft','m230314_110309_add_authenticator_table','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','9371eee9-41c6-4ce0-9793-22b518d17b27'),
	(6,'craft','m230314_111234_add_webauthn_table','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','6308b7e3-56a9-4376-85a3-679af09ac738'),
	(7,'craft','m230503_120303_add_recoverycodes_table','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','587869aa-8e16-4e06-a326-6ef8c1aa77fc'),
	(8,'craft','m230511_000000_field_layout_configs','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','856da6e9-a191-4374-8bda-0050e7b20c00'),
	(9,'craft','m230511_215903_content_refactor','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','18e292bc-6718-44af-92f4-b3b152cfb0e8'),
	(10,'craft','m230524_000000_add_entry_type_show_slug_field','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','5745e67c-8f59-431b-ae86-2cfd219bc81c'),
	(11,'craft','m230524_000001_entry_type_icons','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','ec7b0949-8622-4564-a7d2-5d938d8ce471'),
	(12,'craft','m230524_000002_entry_type_colors','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','ff71878b-9e08-406e-b5e0-2c17f033bff4'),
	(13,'craft','m230524_220029_global_entry_types','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','9cd5cd46-58c9-4a59-a71a-7ed88e1d93e2'),
	(14,'craft','m230531_123004_add_entry_type_show_status_field','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','a6befcaa-f195-4b41-9177-9360d47d7598'),
	(15,'craft','m230607_102049_add_entrytype_slug_translation_columns','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','c962be48-9e61-4362-ba8a-f9fc35419ebc'),
	(16,'craft','m230616_173810_kill_field_groups','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','83e39358-0cac-4679-9c7f-840091f03664'),
	(17,'craft','m230616_183820_remove_field_name_limit','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','55c3b824-6b1e-458b-b544-8acf0d028b92'),
	(18,'craft','m230617_070415_entrify_matrix_blocks','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','beb50722-1839-40cf-b18b-707bc6a3450b'),
	(19,'craft','m230710_162700_element_activity','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','4d8bc0c7-f239-4c63-b5a8-8e4c81828a1f'),
	(20,'craft','m230820_162023_fix_cache_id_type','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','427f44fc-fd20-4736-8e30-8bd037444c83'),
	(21,'craft','m230826_094050_fix_session_id_type','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','a257fb1a-5d09-42d4-aff4-0a0a53a14501'),
	(22,'craft','m230904_190356_address_fields','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','331ed21d-b7d0-4a21-896f-bc7e8bc80535'),
	(23,'craft','m230928_144045_add_subpath_to_volumes','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','d76b1286-658d-48b9-8a09-399010acc73f'),
	(24,'craft','m231013_185640_changedfields_amend_primary_key','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','63aab4a3-6d1b-4e7d-a2bc-58c857078ce3'),
	(25,'craft','m231213_030600_element_bulk_ops','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','0a63b60e-8719-4b49-97d4-23451e5a0c4b'),
	(26,'craft','m240129_150719_sites_language_amend_length','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','2e93fb24-9b78-414f-966e-6a367375cc01'),
	(27,'craft','m240206_035135_convert_json_columns','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','3b4903f5-8ac3-43d6-96be-7b6c3857585a'),
	(28,'craft','m240207_182452_address_line_3','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','1748bd87-80e3-45bc-aa2e-4690e01132e6'),
	(29,'craft','m240302_212719_solo_preview_targets','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','2f35e144-92ed-4db6-bd77-c95bf6718811'),
	(30,'craft','m240619_091352_add_auth_2fa_timestamp','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','827ecb9f-96da-4130-99cb-e24f07be373b'),
	(31,'craft','m240723_214330_drop_bulkop_fk','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','a995f442-0e20-4c73-b86f-320c48f8c446'),
	(32,'craft','m240731_053543_soft_delete_fields','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','ab7fa729-4457-49c1-aae3-e4a9bf71b5c3'),
	(33,'craft','m240805_154041_sso_identities','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','371f9df0-1e59-46c2-a000-91ac7c78090c'),
	(34,'craft','m240926_202248_track_entries_deleted_with_section','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','8b39ede5-7a72-4216-bec1-84f7be6f195a'),
	(35,'craft','m241120_190905_user_affiliated_sites','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','d21e58cb-d7ce-4c7e-a697-58f927189307'),
	(36,'craft','m241125_122914_add_viewUsers_permission','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','70a72f35-433e-47b0-b373-73f6d2360545'),
	(37,'craft','m250119_135304_entry_type_overrides','2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-20 19:13:50','86226e9c-8641-4486-b617-a919d173fd2f');

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table plugins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `plugins`;

CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jpvrbdydunhqrnlqjhekequvburbfehdpcfg` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;

INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `installDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'datastar','1.0.0-beta.7','1.0.0','2025-02-20 19:49:40','2025-02-20 19:49:40','2025-02-20 19:49:40','7ee7531e-d0b8-4231-8ec1-efdbb6d823c1');

/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table projectconfig
# ------------------------------------------------------------

DROP TABLE IF EXISTS `projectconfig`;

CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;

INSERT INTO `projectconfig` (`path`, `value`)
VALUES
	('dateModified','1740114692'),
	('email.fromEmail','\"mbloomfield@uschamber.com\"'),
	('email.fromName','\"Datastar Merch Shop\"'),
	('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.color','\"cyan\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elementCondition','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.autocapitalize','true'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.autocomplete','false'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.autocorrect','true'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.class','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.dateAdded','\"2025-02-20T19:25:59+00:00\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.disabled','false'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.elementCondition','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.id','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.includeInCards','false'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.inputType','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.instructions','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.label','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.max','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.min','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.name','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.orientation','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.placeholder','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.providesThumbs','false'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.readonly','false'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.required','true'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.size','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.step','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.tip','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.title','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.uid','\"a17267ea-ccc9-4676-8ba5-2e7f82ca0bbe\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.userCondition','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.warning','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.0.width','100'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.1.dateAdded','\"2025-02-20T19:28:14+00:00\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.1.elementCondition','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.1.fieldUid','\"69cf82d5-482d-4b1b-8a34-72cb92965bcf\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.1.handle','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.1.includeInCards','false'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.1.instructions','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.1.label','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.1.providesThumbs','false'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.1.required','false'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.1.tip','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.1.uid','\"4151fbe2-8252-44d2-aab5-0abf61b1dc12\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.1.userCondition','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.1.warning','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.1.width','100'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.2.dateAdded','\"2025-02-20T19:28:14+00:00\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.2.elementCondition','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.2.fieldUid','\"c99ffa0f-b08c-4d6d-8dfe-410aaa5ccd99\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.2.handle','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.2.includeInCards','false'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.2.instructions','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.2.label','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.2.providesThumbs','false'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.2.required','false'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.2.tip','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.2.uid','\"5da727e9-a929-4c64-9b65-de690945636f\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.2.userCondition','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.2.warning','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.2.width','100'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.3.dateAdded','\"2025-02-20T19:37:06+00:00\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.3.elementCondition','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.3.fieldUid','\"bcf1c20d-fef6-4456-a477-f4de83877e75\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.3.handle','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.3.includeInCards','false'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.3.instructions','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.3.label','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.3.providesThumbs','false'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.3.required','false'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.3.tip','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.3.uid','\"b37cdba4-7db3-499c-9359-82e0df04f120\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.3.userCondition','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.3.warning','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.3.width','100'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.4.dateAdded','\"2025-02-21T05:11:32+00:00\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.4.elementCondition','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.4.fieldUid','\"afb8dc04-ca52-442f-ae72-8a8be4daef58\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.4.handle','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.4.includeInCards','false'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.4.instructions','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.4.label','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.4.providesThumbs','false'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.4.required','false'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.4.tip','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.4.uid','\"39663fcd-8055-43d7-9ae5-702e90b0c65c\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.4.userCondition','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.4.warning','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.elements.4.width','100'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.name','\"Content\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.uid','\"a23211a5-3baa-4339-87cd-ffc8f2d2dd2c\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.fieldLayouts.238507e3-9c50-419a-905a-2569586aa8b2.tabs.0.userCondition','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.handle','\"product\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.hasTitleField','true'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.icon','\"boot-heeled\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.name','\"Product\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.showSlugField','true'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.showStatusField','true'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.slugTranslationKeyFormat','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.slugTranslationMethod','\"site\"'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.titleFormat','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.titleTranslationKeyFormat','null'),
	('entryTypes.c10c3318-d328-4d46-b052-8f485c053667.titleTranslationMethod','\"site\"'),
	('fields.69cf82d5-482d-4b1b-8a34-72cb92965bcf.columnSuffix','null'),
	('fields.69cf82d5-482d-4b1b-8a34-72cb92965bcf.handle','\"description\"'),
	('fields.69cf82d5-482d-4b1b-8a34-72cb92965bcf.instructions','\"A description of the item\"'),
	('fields.69cf82d5-482d-4b1b-8a34-72cb92965bcf.name','\"Description\"'),
	('fields.69cf82d5-482d-4b1b-8a34-72cb92965bcf.searchable','false'),
	('fields.69cf82d5-482d-4b1b-8a34-72cb92965bcf.settings.byteLimit','null'),
	('fields.69cf82d5-482d-4b1b-8a34-72cb92965bcf.settings.charLimit','null'),
	('fields.69cf82d5-482d-4b1b-8a34-72cb92965bcf.settings.code','false'),
	('fields.69cf82d5-482d-4b1b-8a34-72cb92965bcf.settings.initialRows','4'),
	('fields.69cf82d5-482d-4b1b-8a34-72cb92965bcf.settings.multiline','true'),
	('fields.69cf82d5-482d-4b1b-8a34-72cb92965bcf.settings.placeholder','null'),
	('fields.69cf82d5-482d-4b1b-8a34-72cb92965bcf.settings.uiMode','\"enlarged\"'),
	('fields.69cf82d5-482d-4b1b-8a34-72cb92965bcf.translationKeyFormat','null'),
	('fields.69cf82d5-482d-4b1b-8a34-72cb92965bcf.translationMethod','\"none\"'),
	('fields.69cf82d5-482d-4b1b-8a34-72cb92965bcf.type','\"craft\\\\fields\\\\PlainText\"'),
	('fields.afb8dc04-ca52-442f-ae72-8a8be4daef58.columnSuffix','null'),
	('fields.afb8dc04-ca52-442f-ae72-8a8be4daef58.handle','\"productHighlights\"'),
	('fields.afb8dc04-ca52-442f-ae72-8a8be4daef58.instructions','null'),
	('fields.afb8dc04-ca52-442f-ae72-8a8be4daef58.name','\"Product Highlights\"'),
	('fields.afb8dc04-ca52-442f-ae72-8a8be4daef58.searchable','false'),
	('fields.afb8dc04-ca52-442f-ae72-8a8be4daef58.settings.addRowLabel','\"Add a row\"'),
	('fields.afb8dc04-ca52-442f-ae72-8a8be4daef58.settings.columns.__assoc__.0.0','\"col1\"'),
	('fields.afb8dc04-ca52-442f-ae72-8a8be4daef58.settings.columns.__assoc__.0.1.__assoc__.0.0','\"heading\"'),
	('fields.afb8dc04-ca52-442f-ae72-8a8be4daef58.settings.columns.__assoc__.0.1.__assoc__.0.1','\"Highlight\"'),
	('fields.afb8dc04-ca52-442f-ae72-8a8be4daef58.settings.columns.__assoc__.0.1.__assoc__.1.0','\"handle\"'),
	('fields.afb8dc04-ca52-442f-ae72-8a8be4daef58.settings.columns.__assoc__.0.1.__assoc__.1.1','\"highlight\"'),
	('fields.afb8dc04-ca52-442f-ae72-8a8be4daef58.settings.columns.__assoc__.0.1.__assoc__.2.0','\"width\"'),
	('fields.afb8dc04-ca52-442f-ae72-8a8be4daef58.settings.columns.__assoc__.0.1.__assoc__.2.1','\"\"'),
	('fields.afb8dc04-ca52-442f-ae72-8a8be4daef58.settings.columns.__assoc__.0.1.__assoc__.3.0','\"type\"'),
	('fields.afb8dc04-ca52-442f-ae72-8a8be4daef58.settings.columns.__assoc__.0.1.__assoc__.3.1','\"singleline\"'),
	('fields.afb8dc04-ca52-442f-ae72-8a8be4daef58.settings.defaults.0.__assoc__.0.0','\"col1\"'),
	('fields.afb8dc04-ca52-442f-ae72-8a8be4daef58.settings.defaults.0.__assoc__.0.1','\"\"'),
	('fields.afb8dc04-ca52-442f-ae72-8a8be4daef58.settings.maxRows','null'),
	('fields.afb8dc04-ca52-442f-ae72-8a8be4daef58.settings.minRows','null'),
	('fields.afb8dc04-ca52-442f-ae72-8a8be4daef58.settings.staticRows','false'),
	('fields.afb8dc04-ca52-442f-ae72-8a8be4daef58.translationKeyFormat','null'),
	('fields.afb8dc04-ca52-442f-ae72-8a8be4daef58.translationMethod','\"none\"'),
	('fields.afb8dc04-ca52-442f-ae72-8a8be4daef58.type','\"craft\\\\fields\\\\Table\"'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.columnSuffix','null'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.handle','\"image\"'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.instructions','null'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.name','\"Image\"'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.searchable','false'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.settings.allowedKinds','null'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.settings.allowSelfRelations','false'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.settings.allowSubfolders','false'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.settings.allowUploads','true'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.settings.branchLimit','null'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.settings.defaultUploadLocationSource','\"volume:4e309720-146d-4ef8-8b9f-7a1ca4c6578c\"'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.settings.defaultUploadLocationSubpath','null'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.settings.maintainHierarchy','false'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.settings.maxRelations','1'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.settings.minRelations','1'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.settings.previewMode','\"full\"'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.settings.restrictedDefaultUploadSubpath','null'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.settings.restrictedLocationSource','\"volume:4e309720-146d-4ef8-8b9f-7a1ca4c6578c\"'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.settings.restrictedLocationSubpath','null'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.settings.restrictFiles','false'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.settings.restrictLocation','false'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.settings.selectionLabel','\"Add an Image\"'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.settings.showCardsInGrid','true'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.settings.showSiteMenu','false'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.settings.showUnpermittedFiles','false'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.settings.showUnpermittedVolumes','false'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.settings.sources.0','\"volume:4e309720-146d-4ef8-8b9f-7a1ca4c6578c\"'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.settings.targetSiteId','null'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.settings.validateRelatedElements','false'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.settings.viewMode','\"large\"'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.translationKeyFormat','null'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.translationMethod','\"none\"'),
	('fields.bcf1c20d-fef6-4456-a477-f4de83877e75.type','\"craft\\\\fields\\\\Assets\"'),
	('fields.c99ffa0f-b08c-4d6d-8dfe-410aaa5ccd99.columnSuffix','null'),
	('fields.c99ffa0f-b08c-4d6d-8dfe-410aaa5ccd99.handle','\"price\"'),
	('fields.c99ffa0f-b08c-4d6d-8dfe-410aaa5ccd99.instructions','\"Enter the item price\"'),
	('fields.c99ffa0f-b08c-4d6d-8dfe-410aaa5ccd99.name','\"Price\"'),
	('fields.c99ffa0f-b08c-4d6d-8dfe-410aaa5ccd99.searchable','false'),
	('fields.c99ffa0f-b08c-4d6d-8dfe-410aaa5ccd99.settings.currency','\"USD\"'),
	('fields.c99ffa0f-b08c-4d6d-8dfe-410aaa5ccd99.settings.defaultValue','null'),
	('fields.c99ffa0f-b08c-4d6d-8dfe-410aaa5ccd99.settings.max','null'),
	('fields.c99ffa0f-b08c-4d6d-8dfe-410aaa5ccd99.settings.min','0'),
	('fields.c99ffa0f-b08c-4d6d-8dfe-410aaa5ccd99.settings.showCurrency','true'),
	('fields.c99ffa0f-b08c-4d6d-8dfe-410aaa5ccd99.settings.size','null'),
	('fields.c99ffa0f-b08c-4d6d-8dfe-410aaa5ccd99.translationKeyFormat','null'),
	('fields.c99ffa0f-b08c-4d6d-8dfe-410aaa5ccd99.translationMethod','\"none\"'),
	('fields.c99ffa0f-b08c-4d6d-8dfe-410aaa5ccd99.type','\"craft\\\\fields\\\\Money\"'),
	('fs.images.hasUrls','true'),
	('fs.images.name','\"Images\"'),
	('fs.images.settings.path','\"@webroot/assets/images\"'),
	('fs.images.type','\"craft\\\\fs\\\\Local\"'),
	('fs.images.url','\"/assets/images\"'),
	('fs.imageTransforms.hasUrls','true'),
	('fs.imageTransforms.name','\"Image Transforms\"'),
	('fs.imageTransforms.settings.path','\"@webroot/assets/image-transforms\"'),
	('fs.imageTransforms.type','\"craft\\\\fs\\\\Local\"'),
	('fs.imageTransforms.url','\"/assets/image-transforms\"'),
	('meta.__names__.221628aa-9195-4a80-8314-0a3608505e27','\"Datastar Merch Shop\"'),
	('meta.__names__.4e309720-146d-4ef8-8b9f-7a1ca4c6578c','\"Images\"'),
	('meta.__names__.69cf82d5-482d-4b1b-8a34-72cb92965bcf','\"Description\"'),
	('meta.__names__.a3df2783-bb31-4a7e-b363-c571bd9b9e4b','\"Datastar Merch Shop\"'),
	('meta.__names__.afb8dc04-ca52-442f-ae72-8a8be4daef58','\"Product Highlights\"'),
	('meta.__names__.bcf1c20d-fef6-4456-a477-f4de83877e75','\"Image\"'),
	('meta.__names__.c10c3318-d328-4d46-b052-8f485c053667','\"Product\"'),
	('meta.__names__.c99ffa0f-b08c-4d6d-8dfe-410aaa5ccd99','\"Price\"'),
	('meta.__names__.ec8c77fc-8b24-41b9-9ac5-3ecfbbd3bb03','\"Products\"'),
	('plugins.datastar.edition','\"standard\"'),
	('plugins.datastar.enabled','true'),
	('plugins.datastar.schemaVersion','\"1.0.0\"'),
	('sections.ec8c77fc-8b24-41b9-9ac5-3ecfbbd3bb03.defaultPlacement','\"end\"'),
	('sections.ec8c77fc-8b24-41b9-9ac5-3ecfbbd3bb03.enableVersioning','true'),
	('sections.ec8c77fc-8b24-41b9-9ac5-3ecfbbd3bb03.entryTypes.0.uid','\"c10c3318-d328-4d46-b052-8f485c053667\"'),
	('sections.ec8c77fc-8b24-41b9-9ac5-3ecfbbd3bb03.handle','\"products\"'),
	('sections.ec8c77fc-8b24-41b9-9ac5-3ecfbbd3bb03.maxAuthors','1'),
	('sections.ec8c77fc-8b24-41b9-9ac5-3ecfbbd3bb03.name','\"Products\"'),
	('sections.ec8c77fc-8b24-41b9-9ac5-3ecfbbd3bb03.previewTargets.0.__assoc__.0.0','\"label\"'),
	('sections.ec8c77fc-8b24-41b9-9ac5-3ecfbbd3bb03.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),
	('sections.ec8c77fc-8b24-41b9-9ac5-3ecfbbd3bb03.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),
	('sections.ec8c77fc-8b24-41b9-9ac5-3ecfbbd3bb03.previewTargets.0.__assoc__.1.1','\"{url}\"'),
	('sections.ec8c77fc-8b24-41b9-9ac5-3ecfbbd3bb03.previewTargets.0.__assoc__.2.0','\"refresh\"'),
	('sections.ec8c77fc-8b24-41b9-9ac5-3ecfbbd3bb03.previewTargets.0.__assoc__.2.1','\"1\"'),
	('sections.ec8c77fc-8b24-41b9-9ac5-3ecfbbd3bb03.propagationMethod','\"all\"'),
	('sections.ec8c77fc-8b24-41b9-9ac5-3ecfbbd3bb03.siteSettings.221628aa-9195-4a80-8314-0a3608505e27.enabledByDefault','true'),
	('sections.ec8c77fc-8b24-41b9-9ac5-3ecfbbd3bb03.siteSettings.221628aa-9195-4a80-8314-0a3608505e27.hasUrls','true'),
	('sections.ec8c77fc-8b24-41b9-9ac5-3ecfbbd3bb03.siteSettings.221628aa-9195-4a80-8314-0a3608505e27.template','\"_channels/products/product.twig\"'),
	('sections.ec8c77fc-8b24-41b9-9ac5-3ecfbbd3bb03.siteSettings.221628aa-9195-4a80-8314-0a3608505e27.uriFormat','\"products/{slug}\"'),
	('sections.ec8c77fc-8b24-41b9-9ac5-3ecfbbd3bb03.type','\"channel\"'),
	('siteGroups.a3df2783-bb31-4a7e-b363-c571bd9b9e4b.name','\"Datastar Merch Shop\"'),
	('sites.221628aa-9195-4a80-8314-0a3608505e27.baseUrl','\"$PRIMARY_SITE_URL\"'),
	('sites.221628aa-9195-4a80-8314-0a3608505e27.handle','\"default\"'),
	('sites.221628aa-9195-4a80-8314-0a3608505e27.hasUrls','true'),
	('sites.221628aa-9195-4a80-8314-0a3608505e27.language','\"en-US\"'),
	('sites.221628aa-9195-4a80-8314-0a3608505e27.name','\"Datastar Merch Shop\"'),
	('sites.221628aa-9195-4a80-8314-0a3608505e27.primary','true'),
	('sites.221628aa-9195-4a80-8314-0a3608505e27.siteGroup','\"a3df2783-bb31-4a7e-b363-c571bd9b9e4b\"'),
	('sites.221628aa-9195-4a80-8314-0a3608505e27.sortOrder','1'),
	('system.edition','\"solo\"'),
	('system.live','true'),
	('system.name','\"Datastar Merch Shop\"'),
	('system.schemaVersion','\"5.6.0.2\"'),
	('system.timeZone','\"America/Los_Angeles\"'),
	('users.allowPublicRegistration','false'),
	('users.defaultGroup','null'),
	('users.photoSubpath','null'),
	('users.photoVolumeUid','null'),
	('users.require2fa','false'),
	('users.requireEmailVerification','true'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.altTranslationKeyFormat','null'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.altTranslationMethod','\"none\"'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elementCondition','null'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.autocapitalize','true'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.autocomplete','false'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.autocorrect','true'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.class','null'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.dateAdded','\"2025-02-20T19:27:25+00:00\"'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.disabled','false'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.elementCondition','null'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.id','null'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.includeInCards','false'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.inputType','null'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.instructions','null'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.label','null'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.max','null'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.min','null'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.name','null'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.orientation','null'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.placeholder','null'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.providesThumbs','false'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.readonly','false'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.requirable','false'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.size','null'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.step','null'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.tip','null'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.title','null'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.uid','\"50911fbb-019f-49c7-8f84-701a0fe35551\"'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.userCondition','null'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.warning','null'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.elements.0.width','100'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.name','\"Content\"'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.uid','\"5a64a5d6-c0ad-4703-b9ea-613fadf074bf\"'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fieldLayouts.af45e2e3-b911-4ca5-81be-4cbc21cfe7b0.tabs.0.userCondition','null'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.fs','\"images\"'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.handle','\"images\"'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.name','\"Images\"'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.sortOrder','1'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.subpath','\"\"'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.titleTranslationKeyFormat','null'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.titleTranslationMethod','\"site\"'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.transformFs','\"imageTransforms\"'),
	('volumes.4e309720-146d-4ef8-8b9f-7a1ca4c6578c.transformSubpath','\"\"');

/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table queue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `queue`;

CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_wkhmcagugtftatdbozqifiuscblwgzdknlgj` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_txkwxojndpgghgplvsgnwkeyjdokenodzibm` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table recoverycodes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recoverycodes`;

CREATE TABLE `recoverycodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `recoveryCodes` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `relations`;

CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gkpysmqhirpcpieeqnmoigmfakundcxvatzd` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_nyxzadlyujyvwfmunzzzufjazqpuqsnusnpy` (`sourceId`),
  KEY `idx_tylotzgjazgrpwnuydgyroxtwpaxwrhxvfbd` (`targetId`),
  KEY `idx_imlfenwamzpalbvbbrzwvliqtpsjarexqawj` (`sourceSiteId`),
  CONSTRAINT `fk_liwekluswanoekfnljrbiccrpkjhgrjqwhrm` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_qxmrnytmufebxatupmjwsyvocoifscfctszo` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yuornqsavwmvfdweexstqwaeyibkctdnhmtl` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;

INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,3,7,NULL,4,1,'2025-02-20 19:38:11','2025-02-20 19:38:11','10d83622-c7c4-480b-b9b0-a99a77049eb1'),
	(2,3,8,NULL,4,1,'2025-02-20 19:38:17','2025-02-20 19:38:17','8052ca46-bf27-4cf9-b825-143fb1c758aa'),
	(3,3,9,NULL,6,1,'2025-02-20 19:38:38','2025-02-20 19:38:38','cba77381-61e6-429e-b9b4-774de8a14a03'),
	(4,3,10,NULL,6,1,'2025-02-20 19:38:44','2025-02-20 19:38:44','93ca744a-586a-4fd8-a76d-a406f96382a2'),
	(6,3,12,NULL,4,1,'2025-02-20 19:39:00','2025-02-20 19:39:00','b759261f-11ed-473f-9d0a-a7be4a8c334d'),
	(7,3,13,NULL,6,1,'2025-02-20 19:39:15','2025-02-20 19:39:15','331d1670-5594-47b2-98a9-bc387c96a344'),
	(8,3,14,NULL,5,1,'2025-02-20 19:39:34','2025-02-20 19:39:34','f63dbfc5-7bca-45a8-823d-8adb09fccbd4'),
	(9,3,15,NULL,5,1,'2025-02-20 19:39:40','2025-02-20 19:39:40','172bc072-d607-408f-9426-d5ede0954e73'),
	(10,3,16,NULL,17,1,'2025-02-21 03:16:13','2025-02-21 03:16:13','1593c356-b0a8-4777-9a0e-a002a6e9c077'),
	(11,3,18,NULL,17,1,'2025-02-21 03:16:16','2025-02-21 03:16:16','a03d2859-3493-411b-9f7c-cc5bdb919917'),
	(12,3,19,NULL,20,1,'2025-02-21 03:18:55','2025-02-21 03:18:55','95fe1367-4c3b-4a7b-a907-b63791ed6655'),
	(13,3,21,NULL,20,1,'2025-02-21 03:19:28','2025-02-21 03:19:28','13ec6ca3-0472-47dd-9fec-fa774481eb8f'),
	(15,3,23,NULL,17,1,'2025-02-21 03:19:36','2025-02-21 03:19:36','a2a911c9-ff1e-44c4-8b65-847758c980de'),
	(16,3,24,NULL,25,1,'2025-02-21 04:07:32','2025-02-21 04:07:32','821f5cb7-e67a-4322-8b5f-9771c2c38a43'),
	(17,3,26,NULL,25,1,'2025-02-21 04:07:34','2025-02-21 04:07:34','670ffc4e-3dc3-4d1b-82a0-76af5bffdd49'),
	(18,3,27,NULL,28,1,'2025-02-21 04:07:58','2025-02-21 04:07:58','1a90c7c9-f4c1-43f3-881e-f386c8da26dd'),
	(19,3,29,NULL,28,1,'2025-02-21 04:08:06','2025-02-21 04:08:06','4940e22f-e992-4724-ba8e-b6333d5d50ed'),
	(20,3,30,NULL,31,1,'2025-02-21 04:11:58','2025-02-21 04:11:58','9fbb584d-60a9-418b-a3a0-1240cd1ec6ec'),
	(21,3,32,NULL,31,1,'2025-02-21 04:11:59','2025-02-21 04:11:59','c11a188f-0187-4c2d-96d5-264082f6b843'),
	(22,3,33,NULL,34,1,'2025-02-21 04:19:20','2025-02-21 04:19:20','78dd5f6b-5430-46c7-9f09-dc5cf55de6ff'),
	(23,3,35,NULL,34,1,'2025-02-21 04:19:41','2025-02-21 04:19:41','ba4037f5-b566-4ba0-8f37-41e13e194d42'),
	(25,3,37,NULL,31,1,'2025-02-21 05:11:57','2025-02-21 05:11:57','8eecf326-14f2-4bc7-b9b9-961415c04c39'),
	(27,3,39,NULL,34,1,'2025-02-21 05:12:13','2025-02-21 05:12:13','629c8ceb-094b-4acc-b67b-ab03f27fde4b'),
	(29,3,41,NULL,17,1,'2025-02-21 05:12:32','2025-02-21 05:12:32','f91e8a13-721b-44c1-ae85-195252d1f320'),
	(30,3,42,NULL,17,1,'2025-02-21 05:12:45','2025-02-21 05:12:45','afd19cc2-a222-4e2a-9306-2a87a6ecf827'),
	(32,3,44,NULL,25,1,'2025-02-21 05:12:56','2025-02-21 05:12:56','11168abc-73be-4aef-81b0-cc8b12cd4ebf'),
	(34,3,46,NULL,28,1,'2025-02-21 05:13:09','2025-02-21 05:13:09','a84f69e9-32dd-4109-b26f-27f2b28d63a4'),
	(36,3,48,NULL,20,1,'2025-02-21 05:13:22','2025-02-21 05:13:22','80b87782-8804-441d-97a1-a3b18ef51f0b');

/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table resourcepaths
# ------------------------------------------------------------

DROP TABLE IF EXISTS `resourcepaths`;

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;

INSERT INTO `resourcepaths` (`hash`, `path`)
VALUES
	('132f9375','@craft/web/assets/selectize/dist'),
	('143a2957','@craft/web/assets/tailwindreset/dist'),
	('161c0140','@craft/web/assets/pluginstore/dist'),
	('19b8b467','@bower/inputmask/dist'),
	('1f67313d','@craft/web/assets/cp/dist'),
	('23563f9b','@craft/web/assets/axios/dist'),
	('3260ec9d','@craft/web/assets/updater/dist'),
	('32a382c4','@putyourlightson/datastar/resources/lib/datastar/1.0.0-beta.7'),
	('3824c296','@craft/web/assets/conditionbuilder/dist'),
	('3ba3aac2','@craft/web/assets/recententries/dist'),
	('459509f7','@craft/web/assets/utilities/dist'),
	('4dbfa181','@craft/web/assets/tablesettings/dist'),
	('519e8ac','@craft/web/assets/updateswidget/dist'),
	('5521774','@craft/web/assets/d3/dist'),
	('55bf9fc9','@craft/web/assets/fabric/dist'),
	('6a636647','@craft/web/assets/money/dist'),
	('6c83eb21','@craft/web/assets/admintable/dist'),
	('7d0da8de','@craft/web/assets/garnish/dist'),
	('85acbf5','@craft/web/assets/fieldsettings/dist'),
	('86857453','@craft/web/assets/vue/dist'),
	('86dd840c','@craft/web/assets/editsection/dist'),
	('92a5ac08','@craft/web/assets/velocity/dist'),
	('9732aebf','@craft/web/assets/jquerypayment/dist'),
	('976171dd','@craft/web/assets/jquerytouchevents/dist'),
	('9da023e1','@craft/web/assets/feed/dist'),
	('a0d1c961','@craft/web/assets/xregexp/dist'),
	('a2b51ea5','@craft/web/assets/craftsupport/dist'),
	('a41b84dd','@craft/web/assets/timepicker/dist'),
	('ab697461','@craft/web/assets/picturefill/dist'),
	('c19c0577','@bower/jquery/dist'),
	('cb7b9561','@craft/web/assets/jqueryui/dist'),
	('d50043ca','@craft/web/assets/fileupload/dist'),
	('d914b71','@craft/web/assets/theme/dist'),
	('de8860a3','@craft/web/assets/prismjs/dist'),
	('e331ec3','@craft/web/assets/iframeresizer/dist'),
	('e4e3052a','@craft/web/assets/dashboard/dist'),
	('f03587a5','@craft/web/assets/htmx/dist');

/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table revisions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `revisions`;

CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_excbttnfpmwjtihhpdecnszjcqgypvfqwevq` (`canonicalId`,`num`),
  KEY `fk_xpoilvmbfkldmgdpjddldcwbjqahyrfdsrzd` (`creatorId`),
  CONSTRAINT `fk_iehfahzyuwdtcfocluaocqohyqkavvkvzzwi` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xpoilvmbfkldmgdpjddldcwbjqahyrfdsrzd` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;

INSERT INTO `revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`)
VALUES
	(1,7,1,1,''),
	(2,9,1,1,''),
	(3,7,1,2,'Applied “Draft 1”'),
	(4,9,1,2,''),
	(5,14,1,1,''),
	(6,16,1,1,''),
	(7,19,1,1,''),
	(8,16,1,2,'Applied “Draft 1”'),
	(9,24,1,1,''),
	(10,27,1,1,''),
	(11,30,1,1,''),
	(12,33,1,1,''),
	(13,30,1,2,'Applied “Draft 1”'),
	(14,33,1,2,'Applied “Draft 1”'),
	(15,16,1,3,'Applied “Draft 1”'),
	(16,16,1,4,''),
	(17,24,1,2,'Applied “Draft 1”'),
	(18,27,1,2,'Applied “Draft 1”'),
	(19,19,1,2,'Applied “Draft 1”');

/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table searchindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `searchindex`;

CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_blnruvkecdcvkvvojpjpovxipgijekoswptt` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`)
VALUES
	(1,'email',0,1,' mbloomfield uschamber com '),
	(1,'firstname',0,1,''),
	(1,'fullname',0,1,''),
	(1,'lastname',0,1,''),
	(1,'slug',0,1,''),
	(1,'username',0,1,' mbloomfield uschamber com '),
	(2,'alt',0,1,''),
	(2,'extension',0,1,' jpeg '),
	(2,'filename',0,1,' img 8130 jpeg '),
	(2,'kind',0,1,' image '),
	(2,'slug',0,1,''),
	(2,'title',0,1,' img 8130 '),
	(3,'alt',0,1,''),
	(3,'extension',0,1,' jpeg '),
	(3,'filename',0,1,' img 8130 jpeg '),
	(3,'kind',0,1,' image '),
	(3,'slug',0,1,''),
	(3,'title',0,1,' img 8130 '),
	(4,'alt',0,1,''),
	(4,'extension',0,1,' png '),
	(4,'filename',0,1,' shoe 1 png '),
	(4,'kind',0,1,' image '),
	(4,'slug',0,1,''),
	(4,'title',0,1,' shoe 1 '),
	(5,'alt',0,1,''),
	(5,'extension',0,1,' png '),
	(5,'filename',0,1,' shoe 2 png '),
	(5,'kind',0,1,' image '),
	(5,'slug',0,1,''),
	(5,'title',0,1,' shoe 2 '),
	(6,'alt',0,1,''),
	(6,'extension',0,1,' png '),
	(6,'filename',0,1,' shoe 3 png '),
	(6,'kind',0,1,' image '),
	(6,'slug',0,1,''),
	(6,'title',0,1,' shoe 3 '),
	(7,'slug',0,1,' nimbus kicks '),
	(7,'title',0,1,' nimbus kicks '),
	(9,'slug',0,1,' zephyr strides '),
	(9,'title',0,1,' zephyr strides '),
	(14,'slug',0,1,' lunacore treads '),
	(14,'title',0,1,' lunacore treads '),
	(16,'slug',0,1,' not a cult baseball cap '),
	(16,'title',0,1,' not a cult baseball cap '),
	(17,'alt',0,1,''),
	(17,'extension',0,1,' jpg '),
	(17,'filename',0,1,' grok image jpg '),
	(17,'kind',0,1,' image '),
	(17,'slug',0,1,''),
	(17,'title',0,1,' grok image '),
	(19,'slug',0,1,' not a cult t shirt '),
	(19,'title',0,1,' not a cult t shirt '),
	(20,'alt',0,1,''),
	(20,'extension',0,1,' jpg '),
	(20,'filename',0,1,' grok image 1 jpg '),
	(20,'kind',0,1,' image '),
	(20,'slug',0,1,''),
	(20,'title',0,1,' grok image 1 '),
	(24,'slug',0,1,' d sneakers '),
	(24,'title',0,1,' d sneakers '),
	(25,'alt',0,1,''),
	(25,'extension',0,1,' jpg '),
	(25,'filename',0,1,' grok image 2 jpg '),
	(25,'kind',0,1,' image '),
	(25,'slug',0,1,''),
	(25,'title',0,1,' grok image 2 '),
	(27,'slug',0,1,' d blue running shoes '),
	(27,'title',0,1,' d blue running shoes '),
	(28,'alt',0,1,''),
	(28,'extension',0,1,' jpg '),
	(28,'filename',0,1,' grok image 3 jpg '),
	(28,'kind',0,1,' image '),
	(28,'slug',0,1,''),
	(28,'title',0,1,' grok image 3 '),
	(30,'slug',0,1,' ok it might be a cult sweatpants '),
	(30,'title',0,1,' ok it might be a cult sweatpants '),
	(31,'alt',0,1,''),
	(31,'extension',0,1,' jpg '),
	(31,'filename',0,1,' grok image 4 jpg '),
	(31,'kind',0,1,' image '),
	(31,'slug',0,1,''),
	(31,'title',0,1,' grok image 4 '),
	(33,'slug',0,1,' d trucker hat '),
	(33,'title',0,1,' d trucker hat '),
	(34,'alt',0,1,''),
	(34,'extension',0,1,' jpg '),
	(34,'filename',0,1,' grok image 5 jpg '),
	(34,'kind',0,1,' image '),
	(34,'slug',0,1,''),
	(34,'title',0,1,' grok image 5 ');

/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxAuthors` smallint unsigned NOT NULL DEFAULT '1',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wlyndmbyojakgkdpgoohdgfwmxupftyancnm` (`handle`),
  KEY `idx_rhksfzyetkofjaazzchaamrjwjffserfnizc` (`name`),
  KEY `idx_ktjlaoyeklqzzaaempnnqpgoiyqihkbvqzbc` (`structureId`),
  KEY `idx_fwyodrtnhbevwnhtaoitlojiaxvfpexumedu` (`dateDeleted`),
  CONSTRAINT `fk_ehjiljuaxjzrgmqeidlrirmcfujsujhwoyvh` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `maxAuthors`, `propagationMethod`, `defaultPlacement`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,NULL,'Products','products','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-02-20 19:28:16','2025-02-21 04:23:13',NULL,'ec8c77fc-8b24-41b9-9ac5-3ecfbbd3bb03');

/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sections_entrytypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sections_entrytypes`;

CREATE TABLE `sections_entrytypes` (
  `sectionId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_uwwvwvutagfjpgiuxmwxcpjaihxjapkyftzn` (`typeId`),
  CONSTRAINT `fk_bhkonaftgcudultcsdrvrrucacapxvbybiao` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uwwvwvutagfjpgiuxmwxcpjaihxjapkyftzn` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sections_entrytypes` DISABLE KEYS */;

INSERT INTO `sections_entrytypes` (`sectionId`, `typeId`, `sortOrder`, `name`, `handle`)
VALUES
	(1,1,1,NULL,NULL);

/*!40000 ALTER TABLE `sections_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sections_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sections_sites`;

CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kklyhgzvttsweffaujkdjvkdcfffbgolnlyd` (`sectionId`,`siteId`),
  KEY `idx_rsophxwxwjuzbdoyobwyewznzdwlnoowuxjk` (`siteId`),
  CONSTRAINT `fk_dehmdhxbdvcslcokymdrnzxyvkttirfwxnxc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ybfsxctaqtedyrsaubdcdkltuagjyzlkcyjq` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,1,'products/{slug}','_channels/products/product.twig',1,'2025-02-20 19:28:16','2025-02-21 04:24:43','02f59c03-418a-4ecf-97ef-cced4cb8b9b0');

/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sequences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sequences`;

CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_onitrjsxxhmwarmfllkzfqvczkmjvjfctidy` (`uid`),
  KEY `idx_ywpuwvnbsxallvgxabjudullpjoxalmjutfu` (`token`),
  KEY `idx_iozxsoctheqlbjpaohzdeeugpvbjyqeyqxxk` (`dateUpdated`),
  KEY `idx_ralatabxzfgnzkrhtgusfczdprvzelifybae` (`userId`),
  CONSTRAINT `fk_miphflzqdeoxiecjyuapayzuzzylivadsjfh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,1,'gX72Tf16lNgQwnveTqYDYwip0EtrLdapuHtfKYxiQ39MOo7cEFbhRgG_uFtaqwtoH4EHPg7EtjqvfM2IYSvIoPBF1A5hQdc1AsA6','2025-02-21 03:09:19','2025-02-21 05:52:50','ccf6b153-f810-4eda-85bc-93c3e9d3e385');

/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shunnedmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shunnedmessages`;

CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tguelwwoikzjretlqopicdqnicntioefxqeq` (`userId`,`message`),
  CONSTRAINT `fk_gppmviljytmcmejarsetcacyzhuuzkqkoclo` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table sitegroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sitegroups`;

CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hzbdonsvnojtosbunmldytrawvxoldxocckv` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'Datastar Merch Shop','2025-02-20 19:13:49','2025-02-20 19:13:49',NULL,'a3df2783-bb31-4a7e-b363-c571bd9b9e4b');

/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sites`;

CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tgvufitggtowimmebtymaqfugxdmhuklnxmj` (`dateDeleted`),
  KEY `idx_jvicxpmypgxeggrffdspwvhjrudmysachjfi` (`handle`),
  KEY `idx_bsxajzzkljmsooafdkbvneaytpqcziguhahp` (`sortOrder`),
  KEY `fk_laqzbgfvkzekhhfcqtqneikovschmmcxzzyw` (`groupId`),
  CONSTRAINT `fk_laqzbgfvkzekhhfcqtqneikovschmmcxzzyw` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;

INSERT INTO `sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,1,'true','Datastar Merch Shop','default','en-US',1,'$PRIMARY_SITE_URL',1,'2025-02-20 19:13:49','2025-02-20 19:13:49',NULL,'221628aa-9195-4a80-8314-0a3608505e27');

/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sso_identities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sso_identities`;

CREATE TABLE `sso_identities` (
  `provider` varchar(255) NOT NULL,
  `identityId` varchar(255) NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`provider`,`identityId`,`userId`),
  KEY `fk_fwmrgadsahvrmqqypmukautzemzrdwrzdylb` (`userId`),
  CONSTRAINT `fk_fwmrgadsahvrmqqypmukautzemzrdwrzdylb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table structureelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `structureelements`;

CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vanjishaykjpfqzunrqmpesvwkdwcltqzrkw` (`structureId`,`elementId`),
  KEY `idx_pquwlaxvurafpfsjdxwqeirrxtuauypmmzpx` (`root`),
  KEY `idx_sikonldpvxieflrxcexxfzcshzvmxwynqfyd` (`lft`),
  KEY `idx_cxjearlrgitjumfrpnmyxszhrwzscgwutqqh` (`rgt`),
  KEY `idx_aejiweklbxhymiszeqmliesittmbjcnjkluw` (`level`),
  KEY `idx_zennvuthjllgthpugwdtmzmygoplglrarzkh` (`elementId`),
  CONSTRAINT `fk_fxgfngqcdjtnwlxxslnkagxutnazjmgfzcrm` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table structures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `structures`;

CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aonhbikaipmnelvvfynxhazmpjwhebqmfzxa` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table systemmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `systemmessages`;

CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dkzzueypwqfqxtzkwsnruojkwajzgnaxeyix` (`key`,`language`),
  KEY `idx_jmmmeupfunrhovbzwmtrrfoybfauhqezbqyg` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table taggroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taggroups`;

CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uoolfdvfxlnsfvnhhliaasjgxyjuqriegqqd` (`name`),
  KEY `idx_cxphydpcyakrzqakytoovebmracaqcelemii` (`handle`),
  KEY `idx_gylphlobrbmnomxwwkxfrsskgxbzqryvpbnc` (`dateDeleted`),
  KEY `fk_xamfskqmjyzybxcszpihuppwopdtfchqaryx` (`fieldLayoutId`),
  CONSTRAINT `fk_xamfskqmjyzybxcszpihuppwopdtfchqaryx` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aluxhdzawgdkhmmmscfsmitgrbyaabstjrjv` (`groupId`),
  CONSTRAINT `fk_fvcwxrokprmterjpgtuaekyoemncvzdefcut` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xwtqwfqsljcpdkakxrpxuftawpfvosrnrvoi` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tokens`;

CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_phksmulcfyqvywizogmypxblmbibsqyteota` (`token`),
  KEY `idx_xvxahtzykkeerzlkddtecmuglttmzjbbcekw` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usergroups`;

CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_iivxxszvngcaoavmelqipnzwsbysuhxnijmn` (`handle`),
  KEY `idx_hujyzgpvysnwtkmvvshibmmwilcdcnbueawc` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table usergroups_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usergroups_users`;

CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cjxztyqipgdqmtehsygfqjmxqvjtkympwwuj` (`groupId`,`userId`),
  KEY `idx_vcuzdchgqgegigltbswdiyojnsaykcafiype` (`userId`),
  CONSTRAINT `fk_peqnifjegzhyknwdfpeaewvlpggqepsrlcqj` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_usulfvsrlncztogyieuxthirdeilglzlewfv` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table userpermissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpermissions`;

CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_meqodzodrfvkudqobrbyokgsjajpwcbjnvcf` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table userpermissions_usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpermissions_usergroups`;

CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gpirqxdqfrgmxxojhpmfoxoihbxredvjfwjo` (`permissionId`,`groupId`),
  KEY `idx_znqynvjepsgjpewtvygrxwhebdcjppkugmyp` (`groupId`),
  CONSTRAINT `fk_bzymxijzqodqfmfedelerryhgyphbzipvsvx` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uqpbvqjpgzdrpsptrstrwickobyrrqketsrt` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table userpermissions_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpermissions_users`;

CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_orfzceyiajmszcnllubtqniofueutpetdjrb` (`permissionId`,`userId`),
  KEY `idx_uvpxlzvgdxpmiovzvikbmkntbtoadmoicctl` (`userId`),
  CONSTRAINT `fk_bvlojcyysocibspbflndwemsspscnvyuaxzt` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dpcxaxgaoreoxarwziyhfcjhwlckhbhhrxhd` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table userpreferences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpreferences`;

CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` json DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_hunaocqybghkpbexyvacwccoahlrsjwsnftd` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;

INSERT INTO `userpreferences` (`userId`, `preferences`)
VALUES
	(1,'{\"language\": \"en-US\"}');

/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `affiliatedSiteId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_bvkfkhtrxydhpdsfibwwmhktcpqqdzhokgwi` (`active`),
  KEY `idx_bokvfhhkithgciyemonwilzxxhioitbmkcuw` (`locked`),
  KEY `idx_dmrlchpdbkvoqqwbyqztdleeytcwcvghqtgn` (`pending`),
  KEY `idx_vgffgujdffqgffohqospoqefyuplhautsein` (`suspended`),
  KEY `idx_svgquxffkguivkruydowtcdbhpjodeyzftdw` (`verificationCode`),
  KEY `idx_wqsgfjeudnlsiggnxtelannkxcmwazfbqjyd` (`email`),
  KEY `idx_lxjkdkabkuwajuahtzrkbphelevkfscrnade` (`username`),
  KEY `fk_dtiuwqhjztsthgxusbfmdbkyqexflubqxldk` (`photoId`),
  KEY `fk_wdtljifsgyiqpkqrxpgsyailrbncbnvswhwo` (`affiliatedSiteId`),
  CONSTRAINT `fk_dtiuwqhjztsthgxusbfmdbkyqexflubqxldk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ukmmcgmxpntwfzjxsfigumpwptjzsgxbvtat` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wdtljifsgyiqpkqrxpgsyailrbncbnvswhwo` FOREIGN KEY (`affiliatedSiteId`) REFERENCES `sites` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `photoId`, `affiliatedSiteId`, `active`, `pending`, `locked`, `suspended`, `admin`, `username`, `fullName`, `firstName`, `lastName`, `email`, `password`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`)
VALUES
	(1,NULL,NULL,1,0,0,0,1,'mbloomfield@uschamber.com',NULL,NULL,NULL,'mbloomfield@uschamber.com','$2y$13$ZhiYm5hwfB3LQ7LLiwR7QeqOzn1Opn6gUY72vUhFc.riXlTvCRBz.','2025-02-21 03:09:19',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2025-02-20 19:13:50','2025-02-20 19:13:50','2025-02-21 03:09:19');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table volumefolders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `volumefolders`;

CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lvzjuxsrnhkndmozapvxkkvpwfilqmlfljxs` (`name`,`parentId`,`volumeId`),
  KEY `idx_jnoemfwdndjnwmkfkblqbgympiynfopixqbp` (`parentId`),
  KEY `idx_qdyegmntgorjgvzxnoyszpnobewbpusxyanv` (`volumeId`),
  CONSTRAINT `fk_cxbokzzqkvnbcjrqimdmdlpwnwezixopmfum` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hpjogwuffgfthsxueclgerwfjawjhgsidwbi` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;

INSERT INTO `volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,1,'Images','','2025-02-20 19:30:10','2025-02-20 19:30:10','577120d9-a9c1-454c-b744-04ccfe32f189'),
	(2,NULL,NULL,'Temporary Uploads',NULL,'2025-02-20 19:30:14','2025-02-20 19:30:14','f83a782a-b0c3-4edd-ab4a-fdb80b169518'),
	(3,2,NULL,'user_1','user_1/','2025-02-20 19:30:14','2025-02-20 19:30:14','b4d70502-94ec-4ff0-bf6a-f26858cd024c');

/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table volumes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `volumes`;

CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `subpath` varchar(255) DEFAULT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `altTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nqucsieuccdciphljyjleivludsqinuwkxyu` (`name`),
  KEY `idx_kmrxunqslxqtkspttpkjqnoxgxtyhgnpswdo` (`handle`),
  KEY `idx_hjwuejplyhbbcawynwkdhfeauzcfvwgpunzy` (`fieldLayoutId`),
  KEY `idx_gyijciwmhjalubuvwmyvfcemfmbigldllbjn` (`dateDeleted`),
  CONSTRAINT `fk_rgybjmrdypsefnfayinizrgyohwbqxhkknoy` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;

INSERT INTO `volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `fs`, `subpath`, `transformFs`, `transformSubpath`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `altTranslationMethod`, `altTranslationKeyFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,2,'Images','images','images','','imageTransforms','','site',NULL,'none',NULL,1,'2025-02-20 19:30:10','2025-02-20 19:30:10',NULL,'4e309720-146d-4ef8-8b9f-7a1ca4c6578c');

/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table webauthn
# ------------------------------------------------------------

DROP TABLE IF EXISTS `webauthn`;

CREATE TABLE `webauthn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_unipgqnqmonhtmltenjwjqafhbccenxyxssr` (`userId`),
  CONSTRAINT `fk_unipgqnqmonhtmltenjwjqafhbccenxyxssr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table widgets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `widgets`;

CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_shpmourtdnipnectuluhjfqnujjdjyzetvec` (`userId`),
  CONSTRAINT `fk_tzrqjhatbbalairjetjdodrptipmdqszraac` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"limit\": 10, \"siteId\": 1, \"section\": \"*\"}',1,'2025-02-20 19:26:38','2025-02-20 19:26:38','9cb1213f-3134-49f1-8835-9e861ded49d7'),
	(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2025-02-20 19:26:38','2025-02-20 19:26:38','c9fb8a0e-9713-49ec-89d1-9446acc890db'),
	(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2025-02-20 19:26:38','2025-02-20 19:26:38','312b9ca6-11de-4386-af3f-4ad08158cb94'),
	(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\": \"https://craftcms.com/news.rss\", \"limit\": 5, \"title\": \"Craft News\"}',1,'2025-02-20 19:26:38','2025-02-20 19:26:38','43b79d32-6611-48d2-be80-9a08d63957d7');

/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
