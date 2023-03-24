-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.27-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--LEAK BY 69.Shark.69#7300
--LEAK BY Phillip#6967

-- Dumping database structure for picaosrp
DROP DATABASE IF EXISTS `picaosrp`;
CREATE DATABASE IF NOT EXISTS `picaosrp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `picaosrp`;

-- Dumping structure for table picaosrp.account_info
DROP TABLE IF EXISTS `account_info`;
CREATE TABLE IF NOT EXISTS `account_info` (
  `steam64_hex` varchar(30) NOT NULL,
  `rp_name` varchar(100) DEFAULT NULL,
  `steam_name` varchar(100) DEFAULT NULL,
  `rockstar` varchar(50) DEFAULT NULL,
  `ipv4` varchar(20) DEFAULT NULL,
  `online_time` mediumint(9) DEFAULT 0,
  `last_connection` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`steam64_hex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.addon_account
DROP TABLE IF EXISTS `addon_account`;
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.addon_account_data
DROP TABLE IF EXISTS `addon_account_data`;
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.addon_inventory
DROP TABLE IF EXISTS `addon_inventory`;
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.addon_inventory_items
DROP TABLE IF EXISTS `addon_inventory_items`;
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB AUTO_INCREMENT=290 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.alertas
DROP TABLE IF EXISTS `alertas`;
CREATE TABLE IF NOT EXISTS `alertas` (
  `identificador` int(11) NOT NULL,
  `nivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.apartments
DROP TABLE IF EXISTS `apartments`;
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4159 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.api_tokens
DROP TABLE IF EXISTS `api_tokens`;
CREATE TABLE IF NOT EXISTS `api_tokens` (
  `token` varchar(255) NOT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `time` int(25) DEFAULT NULL,
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.baninfo
DROP TABLE IF EXISTS `baninfo`;
CREATE TABLE IF NOT EXISTS `baninfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `identifier` varchar(25) DEFAULT NULL,
  `liveid` varchar(21) DEFAULT NULL,
  `xblid` varchar(21) DEFAULT NULL,
  `discord` varchar(30) DEFAULT NULL,
  `playerip` varchar(25) DEFAULT NULL,
  `playername` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=595 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.banks
DROP TABLE IF EXISTS `banks`;
CREATE TABLE IF NOT EXISTS `banks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `coords` longtext DEFAULT NULL,
  `cashiercoords` longtext DEFAULT NULL,
  `beforevaults` longtext DEFAULT NULL,
  `vaults` longtext DEFAULT NULL,
  `vaultgate` longtext DEFAULT NULL,
  `finalgate` longtext DEFAULT NULL,
  `vg_spots` longtext DEFAULT NULL,
  `m_spots` longtext DEFAULT NULL,
  `bankOpen` tinyint(1) NOT NULL DEFAULT 1,
  `bankCooldown` int(11) NOT NULL DEFAULT 0,
  `bankType` enum('Small','Big','Paleto') NOT NULL DEFAULT 'Small',
  `moneyBags` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.bank_accounts
DROP TABLE IF EXISTS `bank_accounts`;
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(250) DEFAULT NULL,
  `buisness` varchar(50) DEFAULT NULL,
  `buisnessid` int(11) DEFAULT NULL,
  `gangid` longtext DEFAULT NULL,
  `amount` text NOT NULL DEFAULT '0',
  `account_type` enum('Current','Savings','Buisness','Gang') NOT NULL DEFAULT 'Current',
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `citizenid` (`citizenid`),
  KEY `buisness` (`buisness`),
  KEY `buisnessid` (`buisnessid`),
  KEY `gangid` (`gangid`(3072))
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.bank_cards
DROP TABLE IF EXISTS `bank_cards`;
CREATE TABLE IF NOT EXISTS `bank_cards` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `steamid` varchar(50) DEFAULT NULL,
  `cardNumber` varchar(50) DEFAULT NULL,
  `cardPin` text DEFAULT NULL,
  `cardActive` tinyint(1) DEFAULT NULL,
  `cardLocked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.bank_statements
DROP TABLE IF EXISTS `bank_statements`;
CREATE TABLE IF NOT EXISTS `bank_statements` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) DEFAULT NULL,
  `citizenid` varchar(250) DEFAULT NULL,
  `buisness` varchar(50) DEFAULT NULL,
  `buisnessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `account_number` int(11) DEFAULT NULL,
  `sort_code` int(11) DEFAULT NULL,
  `deposited` int(11) DEFAULT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `character_id` (`citizenid`),
  KEY `account_number` (`account_number`),
  KEY `sort_code` (`sort_code`),
  KEY `buisness` (`buisness`),
  KEY `buisnessid` (`buisnessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.banlist
DROP TABLE IF EXISTS `banlist`;
CREATE TABLE IF NOT EXISTS `banlist` (
  `license` varchar(50) NOT NULL,
  `identifier` varchar(25) DEFAULT NULL,
  `liveid` varchar(21) DEFAULT NULL,
  `xblid` varchar(21) DEFAULT NULL,
  `discord` varchar(30) DEFAULT NULL,
  `playerip` varchar(25) DEFAULT NULL,
  `targetplayername` varchar(32) DEFAULT NULL,
  `sourceplayername` varchar(32) DEFAULT NULL,
  `reason` varchar(255) NOT NULL,
  `timeat` varchar(50) NOT NULL,
  `expiration` varchar(50) NOT NULL,
  `permanent` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.banlisthistory
DROP TABLE IF EXISTS `banlisthistory`;
CREATE TABLE IF NOT EXISTS `banlisthistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `identifier` varchar(25) DEFAULT NULL,
  `liveid` varchar(21) DEFAULT NULL,
  `xblid` varchar(21) DEFAULT NULL,
  `discord` varchar(30) DEFAULT NULL,
  `playerip` varchar(25) DEFAULT NULL,
  `targetplayername` varchar(32) DEFAULT NULL,
  `sourceplayername` varchar(32) DEFAULT NULL,
  `reason` varchar(255) NOT NULL,
  `timeat` int(11) NOT NULL,
  `added` varchar(40) NOT NULL,
  `expiration` int(11) NOT NULL,
  `permanent` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.bans
DROP TABLE IF EXISTS `bans`;
CREATE TABLE IF NOT EXISTS `bans` (
  `name` varchar(255) NOT NULL,
  `steamid` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `discordId` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `xbl` varchar(255) DEFAULT NULL,
  `live` varchar(255) DEFAULT NULL,
  `fecha` varchar(255) NOT NULL,
  `expira` varchar(255) NOT NULL DEFAULT '',
  `admin` varchar(255) NOT NULL,
  `razon` varchar(255) NOT NULL,
  `permanente` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.bansblacklist
DROP TABLE IF EXISTS `bansblacklist`;
CREATE TABLE IF NOT EXISTS `bansblacklist` (
  `name` varchar(255) NOT NULL,
  `steamid` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `discordId` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `xbl` varchar(255) DEFAULT NULL,
  `live` varchar(255) DEFAULT NULL,
  `fecha` varchar(255) NOT NULL,
  `admin` varchar(255) NOT NULL,
  `razon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.bansperm
DROP TABLE IF EXISTS `bansperm`;
CREATE TABLE IF NOT EXISTS `bansperm` (
  `id` varchar(50) NOT NULL,
  `steam` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `fecha` varchar(50) NOT NULL,
  `admin` varchar(50) NOT NULL,
  `razon` varchar(400) NOT NULL,
  `baneado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.billing
DROP TABLE IF EXISTS `billing`;
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=466 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.bills
DROP TABLE IF EXISTS `bills`;
CREATE TABLE IF NOT EXISTS `bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=1111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.bought_houses
DROP TABLE IF EXISTS `bought_houses`;
CREATE TABLE IF NOT EXISTS `bought_houses` (
  `houseid` int(50) NOT NULL,
  PRIMARY KEY (`houseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.businesses
DROP TABLE IF EXISTS `businesses`;
CREATE TABLE IF NOT EXISTS `businesses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `description` varchar(75) NOT NULL,
  `blipname` varchar(75) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `earnings` int(11) NOT NULL,
  `position` text NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `stock_price` int(11) NOT NULL DEFAULT 100,
  `employees` text NOT NULL,
  `taxrate` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.cardealer_vehicles
DROP TABLE IF EXISTS `cardealer_vehicles`;
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.characters
DROP TABLE IF EXISTS `characters`;
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dateofbirth` varchar(255) NOT NULL,
  `sex` varchar(1) NOT NULL DEFAULT 'M',
  `height` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=801 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.communityservice
DROP TABLE IF EXISTS `communityservice`;
CREATE TABLE IF NOT EXISTS `communityservice` (
  `identifier` varchar(100) NOT NULL,
  `actions_remaining` int(10) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.crypto
DROP TABLE IF EXISTS `crypto`;
CREATE TABLE IF NOT EXISTS `crypto` (
  `#` int(11) NOT NULL AUTO_INCREMENT,
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`#`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.crypto_transactions
DROP TABLE IF EXISTS `crypto_transactions`;
CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=939 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.datastore
DROP TABLE IF EXISTS `datastore`;
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

--LEAK BY 69.Shark.69#7300
--LEAK BY Phillip#6967

-- Dumping structure for table picaosrp.datastore_data
DROP TABLE IF EXISTS `datastore_data`;
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4715 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.dealers
DROP TABLE IF EXISTS `dealers`;
CREATE TABLE IF NOT EXISTS `dealers` (
  `#` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`#`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.dpkeybinds
DROP TABLE IF EXISTS `dpkeybinds`;
CREATE TABLE IF NOT EXISTS `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.fine_types
DROP TABLE IF EXISTS `fine_types`;
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.gangs
DROP TABLE IF EXISTS `gangs`;
CREATE TABLE IF NOT EXISTS `gangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `grades` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.gang_territoriums
DROP TABLE IF EXISTS `gang_territoriums`;
CREATE TABLE IF NOT EXISTS `gang_territoriums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gang` varchar(50) DEFAULT NULL,
  `points` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.gloveboxitems
DROP TABLE IF EXISTS `gloveboxitems`;
CREATE TABLE IF NOT EXISTS `gloveboxitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `info` text DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `slot` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.gloveboxitemsnew
DROP TABLE IF EXISTS `gloveboxitemsnew`;
CREATE TABLE IF NOT EXISTS `gloveboxitemsnew` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) DEFAULT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`)
) ENGINE=InnoDB AUTO_INCREMENT=1555 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.houselocations
DROP TABLE IF EXISTS `houselocations`;
CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(2) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(2) DEFAULT NULL,
  `garage` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.house_plants
DROP TABLE IF EXISTS `house_plants`;
CREATE TABLE IF NOT EXISTS `house_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `building` (`building`),
  KEY `plantid` (`plantid`)
) ENGINE=InnoDB AUTO_INCREMENT=7123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.items
DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `limit` int(11) NOT NULL DEFAULT -1,
  `rare` int(11) NOT NULL DEFAULT 0,
  `can_remove` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.jail
DROP TABLE IF EXISTS `jail`;
CREATE TABLE IF NOT EXISTS `jail` (
  `identifier` varchar(100) NOT NULL,
  `jail_time` int(10) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.job_grades
DROP TABLE IF EXISTS `job_grades`;
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.lapraces
DROP TABLE IF EXISTS `lapraces`;
CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raceid` (`raceid`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.licenses
DROP TABLE IF EXISTS `licenses`;
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.lsrp_motels
DROP TABLE IF EXISTS `lsrp_motels`;
CREATE TABLE IF NOT EXISTS `lsrp_motels` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `ident` varchar(50) NOT NULL,
  `motel_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `motel_id` (`motel_id`),
  KEY `ident` (`ident`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.mdt_reports
DROP TABLE IF EXISTS `mdt_reports`;
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` varchar(48) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `incident` longtext DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `jailtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.mdt_warrants
DROP TABLE IF EXISTS `mdt_warrants`;
CREATE TABLE IF NOT EXISTS `mdt_warrants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `char_id` varchar(48) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL,
  `report_title` varchar(255) DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `expire` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.mindiw_panel_logs
DROP TABLE IF EXISTS `mindiw_panel_logs`;
CREATE TABLE IF NOT EXISTS `mindiw_panel_logs` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `staff` text NOT NULL,
  `usuario` text NOT NULL,
  `steamid` text DEFAULT NULL,
  `razon` longtext NOT NULL,
  `tiempo` text NOT NULL,
  `tipo` int(11) NOT NULL,
  `method` varchar(255) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.mindiw_panel_tickets
DROP TABLE IF EXISTS `mindiw_panel_tickets`;
CREATE TABLE IF NOT EXISTS `mindiw_panel_tickets` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `staff` text NOT NULL,
  `usuario` text NOT NULL,
  `steamid` text DEFAULT NULL,
  `licencia` text NOT NULL,
  `razon` longtext NOT NULL,
  `comentarios` varchar(255) DEFAULT NULL,
  `tiempo` text NOT NULL,
  `tipo` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `ip` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.mindiw_panel_users
DROP TABLE IF EXISTS `mindiw_panel_users`;
CREATE TABLE IF NOT EXISTS `mindiw_panel_users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USUARIO` longtext NOT NULL,
  `PASS` longtext NOT NULL,
  `RANGO` int(11) NOT NULL DEFAULT 2,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT 0,
  `LastIP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.moneysafes
DROP TABLE IF EXISTS `moneysafes`;
CREATE TABLE IF NOT EXISTS `moneysafes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `safe` varchar(50) NOT NULL DEFAULT '0',
  `money` int(11) NOT NULL DEFAULT 0,
  `transactions` text NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.nwac_bans
DROP TABLE IF EXISTS `nwac_bans`;
CREATE TABLE IF NOT EXISTS `nwac_bans` (
  `name` varchar(255) NOT NULL,
  `steamid` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `discordId` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `xbl` varchar(255) DEFAULT NULL,
  `live` varchar(255) DEFAULT NULL,
  `razon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.occasion_vehicles
DROP TABLE IF EXISTS `occasion_vehicles`;
CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.owned_properties
DROP TABLE IF EXISTS `owned_properties`;
CREATE TABLE IF NOT EXISTS `owned_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.owned_vehicles
DROP TABLE IF EXISTS `owned_vehicles`;
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `vehicle` longtext NOT NULL,
  `owner` varchar(60) NOT NULL,
  `stored` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'State of the vehicle',
  `garage_name` varchar(50) NOT NULL DEFAULT 'Garage_Centre',
  `pound` tinyint(1) NOT NULL DEFAULT 0,
  `vehiclename` varchar(50) DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'car',
  `job` varchar(50) DEFAULT NULL,
  `lasthouse` int(11) DEFAULT 0,
  PRIMARY KEY (`plate`),
  KEY `vehsowned` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `steam` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `permission` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `steam` (`steam`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.phone_app_chat
DROP TABLE IF EXISTS `phone_app_chat`;
CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.phone_calls
DROP TABLE IF EXISTS `phone_calls`;
CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=556 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.phone_invoices
DROP TABLE IF EXISTS `phone_invoices`;
CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `#` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `invoiceid` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`#`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.phone_messages
DROP TABLE IF EXISTS `phone_messages`;
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7047 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Data exporting was unselected.

--LEAK BY 69.Shark.69#7300
--LEAK BY Phillip#6967

-- Dumping structure for table picaosrp.phone_tweets
DROP TABLE IF EXISTS `phone_tweets`;
CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=5436 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.phone_users_contacts
DROP TABLE IF EXISTS `phone_users_contacts`;
CREATE TABLE IF NOT EXISTS `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=146 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.playerammo
DROP TABLE IF EXISTS `playerammo`;
CREATE TABLE IF NOT EXISTS `playerammo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `ammo` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=3638 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.playerhousing
DROP TABLE IF EXISTS `playerhousing`;
CREATE TABLE IF NOT EXISTS `playerhousing` (
  `id` int(32) NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `rented` tinyint(1) DEFAULT NULL,
  `price` int(32) DEFAULT NULL,
  `wardrobe` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.playeritems
DROP TABLE IF EXISTS `playeritems`;
CREATE TABLE IF NOT EXISTS `playeritems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `info` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `slot` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=255891 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.players
DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `#` int(11) NOT NULL,
  `citizenid` varchar(255) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `steam` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `firstname` text DEFAULT NULL,
  `lastname` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.playerskins
DROP TABLE IF EXISTS `playerskins`;
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(2) NOT NULL DEFAULT 1,
  `tattoos` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=43034 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.player_boats
DROP TABLE IF EXISTS `player_boats`;
CREATE TABLE IF NOT EXISTS `player_boats` (
  `#` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `boathouse` varchar(50) DEFAULT NULL,
  `fuel` int(11) NOT NULL DEFAULT 100,
  `state` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`#`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.player_contacts
DROP TABLE IF EXISTS `player_contacts`;
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=12437 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.player_houses
DROP TABLE IF EXISTS `player_houses`;
CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `house` (`house`),
  KEY `citizenid` (`citizenid`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.player_mails
DROP TABLE IF EXISTS `player_mails`;
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=67026 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.player_outfits
DROP TABLE IF EXISTS `player_outfits`;
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text DEFAULT NULL,
  `outfitId` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `outfitId` (`outfitId`)
) ENGINE=InnoDB AUTO_INCREMENT=8978 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.player_vehicles
DROP TABLE IF EXISTS `player_vehicles`;
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `#` int(11) NOT NULL AUTO_INCREMENT,
  `steam` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  PRIMARY KEY (`#`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `steam` (`steam`)
) ENGINE=InnoDB AUTO_INCREMENT=2444 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.player_warns
DROP TABLE IF EXISTS `player_warns`;
CREATE TABLE IF NOT EXISTS `player_warns` (
  `#` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`#`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.properties
DROP TABLE IF EXISTS `properties`;
CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entering` varchar(255) DEFAULT NULL,
  `exit` varchar(255) DEFAULT NULL,
  `inside` varchar(255) DEFAULT NULL,
  `outside` varchar(255) DEFAULT NULL,
  `ipls` varchar(255) DEFAULT '[]',
  `gateway` varchar(255) DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.queue
DROP TABLE IF EXISTS `queue`;
CREATE TABLE IF NOT EXISTS `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `steam` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.rented_vehicles
DROP TABLE IF EXISTS `rented_vehicles`;
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.shops
DROP TABLE IF EXISTS `shops`;
CREATE TABLE IF NOT EXISTS `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.shops2
DROP TABLE IF EXISTS `shops2`;
CREATE TABLE IF NOT EXISTS `shops2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.society_moneywash
DROP TABLE IF EXISTS `society_moneywash`;
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.stashitems
DROP TABLE IF EXISTS `stashitems`;
CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `info` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `slot` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15024 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.stashitemsnew
DROP TABLE IF EXISTS `stashitemsnew`;
CREATE TABLE IF NOT EXISTS `stashitemsnew` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stash` (`stash`)
) ENGINE=InnoDB AUTO_INCREMENT=2118 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.tm1_enclosures
DROP TABLE IF EXISTS `tm1_enclosures`;
CREATE TABLE IF NOT EXISTS `tm1_enclosures` (
  `enclosure_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `groupid` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.tm1_groups
DROP TABLE IF EXISTS `tm1_groups`;
CREATE TABLE IF NOT EXISTS `tm1_groups` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `aprove` int(1) DEFAULT 0,
  `money` int(11) DEFAULT 0,
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB AUTO_INCREMENT=4824 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.tm1_inventory
DROP TABLE IF EXISTS `tm1_inventory`;
CREATE TABLE IF NOT EXISTS `tm1_inventory` (
  `identifier` varchar(250) DEFAULT '',
  `cantidad` varchar(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.tm1_membersgroups
DROP TABLE IF EXISTS `tm1_membersgroups`;
CREATE TABLE IF NOT EXISTS `tm1_membersgroups` (
  `groupid` int(11) DEFAULT 0,
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `rank` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.tm1_plants
DROP TABLE IF EXISTS `tm1_plants`;
CREATE TABLE IF NOT EXISTS `tm1_plants` (
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `object` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `finalobject` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.trunkitems
DROP TABLE IF EXISTS `trunkitems`;
CREATE TABLE IF NOT EXISTS `trunkitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `info` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `slot` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=633 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.trunkitemsnew
DROP TABLE IF EXISTS `trunkitemsnew`;
CREATE TABLE IF NOT EXISTS `trunkitemsnew` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`)
) ENGINE=InnoDB AUTO_INCREMENT=1127 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.trunk_inventory
DROP TABLE IF EXISTS `trunk_inventory`;
CREATE TABLE IF NOT EXISTS `trunk_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`)
) ENGINE=InnoDB AUTO_INCREMENT=927 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.twitter_accounts
DROP TABLE IF EXISTS `twitter_accounts`;
CREATE TABLE IF NOT EXISTS `twitter_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.twitter_likes
DROP TABLE IF EXISTS `twitter_likes`;
CREATE TABLE IF NOT EXISTS `twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  KEY `FK_twitter_likes_twitter_tweets` (`tweetId`),
  CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.twitter_tweets
DROP TABLE IF EXISTS `twitter_tweets`;
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) DEFAULT NULL,
  `message` varchar(256) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_tweets_twitter_accounts` (`authorId`),
  CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(50) NOT NULL,
  `license` varchar(50) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT '',
  `skin` longtext DEFAULT NULL,
  `job` varchar(50) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `job2` varchar(255) DEFAULT 'unemployed2',
  `job2_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `position` longtext DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `firstname` varchar(50) DEFAULT '',
  `lastname` varchar(50) DEFAULT '',
  `dateofbirth` varchar(25) DEFAULT '',
  `sex` varchar(10) DEFAULT '',
  `height` varchar(5) DEFAULT '',
  `is_dead` tinyint(1) DEFAULT 0,
  `last_property` varchar(255) DEFAULT NULL,
  `tattoos` varchar(255) DEFAULT '{}',
  `phone_number` varchar(10) DEFAULT NULL,
  `stress` int(5) NOT NULL DEFAULT 0,
  `vip` tinyint(1) DEFAULT 0,
  `last_motel` varchar(50) DEFAULT NULL,
  `last_motel_room` varchar(50) DEFAULT NULL,
  `house` longtext NOT NULL DEFAULT '{"owns":false,"furniture":[],"houseId":0}',
  `bought_furniture` longtext NOT NULL DEFAULT '{}',
  `last_house` int(11) DEFAULT 0,
  `discordId` varchar(255) NOT NULL DEFAULT '0',
  `ip` varchar(255) NOT NULL DEFAULT '0',
  `xbl` varchar(255) NOT NULL DEFAULT '0',
  `live` varchar(255) NOT NULL DEFAULT '0',
  `isVip` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.user_accounts
DROP TABLE IF EXISTS `user_accounts`;
CREATE TABLE IF NOT EXISTS `user_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) NOT NULL,
  `name` varchar(50) NOT NULL,
  `money` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=610 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.user_convictions
DROP TABLE IF EXISTS `user_convictions`;
CREATE TABLE IF NOT EXISTS `user_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` varchar(48) DEFAULT NULL,
  `offense` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.user_inventory
DROP TABLE IF EXISTS `user_inventory`;
CREATE TABLE IF NOT EXISTS `user_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) NOT NULL,
  `item` varchar(50) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61794 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.user_licenses
DROP TABLE IF EXISTS `user_licenses`;
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.user_mdt
DROP TABLE IF EXISTS `user_mdt`;
CREATE TABLE IF NOT EXISTS `user_mdt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` varchar(48) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `mugshot_url` varchar(255) DEFAULT NULL,
  `fingerprint` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.vehicles
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.vehicle_categories
DROP TABLE IF EXISTS `vehicle_categories`;
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.vehicle_sold
DROP TABLE IF EXISTS `vehicle_sold`;
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.weashops
DROP TABLE IF EXISTS `weashops`;
CREATE TABLE IF NOT EXISTS `weashops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table picaosrp.whitelist
DROP TABLE IF EXISTS `whitelist`;
CREATE TABLE IF NOT EXISTS `whitelist` (
  `identifier` varchar(50) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
