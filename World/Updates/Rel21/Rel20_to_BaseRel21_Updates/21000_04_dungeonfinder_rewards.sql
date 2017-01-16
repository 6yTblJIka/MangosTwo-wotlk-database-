-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

  SET @cOldRev = 'required_21000_03_Cluck_Quest_Fix'; 

  -- Set the new revision string
  SET @cNewRev = 'required_21000_04_mangos_dungeonfinder_rewards';

  -- Set thisRevision to the column name of db_version in the currently selected database
  SET @cThisRev := ((SELECT column_name FROM information_schema.`COLUMNS` WHERE table_name='db_version' AND table_schema=(SELECT DATABASE() AS thisDB FROM DUAL) AND column_name LIKE 'required%'));

 
  -- Only Proceed if the old values match
  IF @cThisRev = @cOldRev THEN
    -- Make this all a single transaction
    START TRANSACTION;

-- version
    INSERT IGNORE INTO `db_version` SET `Version` = 'MaNGOSTwo Database Rev 21000_04';

    -- Apply the Version Change from Old Version to New Version
    SET @query = CONCAT('ALTER TABLE db_version CHANGE COLUMN ',@cOldRev, ' ' ,@cNewRev,' bit;');
    PREPARE stmt1 FROM @query;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
    -- The Above block is required for making table changes

    -- -- -- -- Normal Update / Insert / Delete statements will go here  -- -- -- -- --
          
CREATE TABLE IF NOT EXISTS `dungeonfinder_rewards` (
`id` INT(10) NOT NULL,
  `level` MEDIUMINT(8) UNSIGNED NOT NULL COMMENT 'uint32',
  `base_xp_reward` MEDIUMINT(8) UNSIGNED NOT NULL COMMENT 'uint32',
  `base_monetary_reward` INT(10) NOT NULL COMMENT 'int32',
  PRIMARY KEY (`id`)
) ENGINE=MYISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=67 ;

DELETE FROM `dungeonfinder_rewards` WHERE `id` BETWEEN 1 AND 66;

INSERT INTO `dungeonfinder_rewards` (`id`, `level`, `base_xp_reward`, `base_monetary_reward`) VALUES
(1, 15, 155, 1750),
(2, 16, 1525, 7650),
(3, 17, 1525, 7650),
(4, 18, 1525, 7650),
(5, 19, 1525, 7650),
(6, 20, 1525, 7650),
(7, 21, 155, 1750),
(8, 22, 155, 1750),
(9, 23, 155, 1750),
(10, 24, 155, 1750),
(11, 25, 155, 1750),
(12, 26, 235, 3500),
(13, 27, 235, 3500),
(14, 28, 235, 3500),
(15, 29, 235, 3500),
(16, 30, 235, 3500),
(17, 31, 235, 3500),
(18, 32, 235, 3500),
(19, 33, 235, 3500),
(20, 34, 412, 6500),
(21, 35, 412, 6500),
(22, 36, 412, 6500),
(23, 37, 412, 6500),
(24, 38, 412, 6500),
(25, 39, 412, 6500),
(26, 40, 4150, 20700),
(27, 41, 412, 6500),
(28, 42, 412, 6500),
(29, 43, 625, 6500),
(30, 44, 625, 6500),
(31, 45, 625, 6500),
(32, 46, 625, 8250),
(33, 47, 625, 8250),
(34, 48, 6125, 30600),
(35, 49, 6125, 30600),
(36, 50, 6125, 30600),
(37, 51, 6125, 30600),
(38, 52, 6125, 30600),
(39, 53, 6125, 30600),
(40, 54, 725, 9000),
(41, 55, 725, 9000),
(42, 56, 725, 9000),
(43, 57, 725, 9000),
(44, 58, 7150, 35700),
(45, 59, 800, 31000),
(46, 60, 800, 31000),
(47, 61, 800, 31000),
(48, 62, 800, 31000),
(49, 63, 800, 31000),
(50, 64, 800, 31000),
(51, 65, 550, 15500),
(52, 66, 550, 15500),
(53, 67, 9500, 47400),
(54, 68, 950, 44000),
(55, 69, 16550, 74000),
(56, 70, 16550, 74000),
(57, 71, 16550, 74000),
(58, 72, 16550, 74000),
(59, 73, 16550, 74000),
(60, 74, 16550, 74000),
(61, 75, 16550, 74000),
(62, 76, 16550, 74000),
(63, 77, 16550, 74000),
(64, 78, 16550, 74000),
(65, 79, 16550, 74000),
(66, 80, 0, 99300);

ALTER TABLE `dungeonfinder_rewards`
MODIFY `id` INT(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=67;

CREATE TABLE IF NOT EXISTS `dungeonfinder_requirements` (
  `mapId` MEDIUMINT(8) UNSIGNED NOT NULL,
  `difficulty` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
  `min_item_level` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
  `item` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
  `item_2` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
  `alliance_quest` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
  `horde_quest` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
  `achievement` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
  `quest_incomplete_text` TEXT,
  `comment` TEXT,
  PRIMARY KEY (`mapId`,`difficulty`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Dungeon Finder Requirements';

DELETE FROM `dungeonfinder_requirements` WHERE `difficulty`=0 AND `mapId` IN (269,632,650,658,668);
DELETE FROM `dungeonfinder_requirements` WHERE `difficulty`=1 AND `mapId` IN (269,540,542,543,545,546,547,552,553,554,555,556,557,558,560);
DELETE FROM `dungeonfinder_requirements` WHERE `difficulty`=1 AND `mapId` IN (574,575,576,578,585,595,599,600,601,602,604,608,619,632,650,658,668);
DELETE FROM `dungeonfinder_requirements` WHERE `difficulty`=2 AND `mapId` IN (631);
DELETE FROM `dungeonfinder_requirements` WHERE `difficulty`=3 AND `mapId` IN (631,649);

INSERT INTO `dungeonfinder_requirements` (`mapId`, `difficulty`, `min_item_level`, `item`, `item_2`, `alliance_quest`, `horde_quest`, `achievement`, `quest_incomplete_text`, `comment`) VALUES
(269, 0, 0, 0, 0, 10285, 10285, 0, 'You must complete the quest "Return to Andormu" before entering the Black Morass.', 'Caverns Of Time,Black Morass (Entrance)'),
(269, 1, 0, 30635, 0, 10285, 10285, 0, 'You must complete the quest "Return to Andormu" and be level 70 before entering the Heroic difficulty of the Black Morass.', 'Caverns Of Time,Black Morass (Entrance)'),
(540, 1, 0, 30637, 30622, 0, 0, 0, NULL, 'The Shattered Halls (Entrance)'),
(542, 1, 0, 30637, 30622, 0, 0, 0, NULL, 'The Blood Furnace (Entrance)'),
(543, 1, 0, 30637, 30622, 0, 0, 0, NULL, 'Hellfire Ramparts (Entrance)'),
(545, 1, 0, 30623, 0, 0, 0, 0, NULL, 'The Steamvault (Entrance)'),
(546, 1, 0, 30623, 0, 0, 0, 0, NULL, 'The Underbog (Entrance)'),
(547, 1, 0, 30623, 0, 0, 0, 0, NULL, 'The Slave Pens (Entrance)'),
(552, 1, 0, 30634, 0, 0, 0, 0, NULL, 'The Arcatraz (Entrance)'),
(553, 1, 0, 30634, 0, 0, 0, 0, NULL, 'The Botanica (Entrance)'),
(554, 1, 0, 30634, 0, 0, 0, 0, NULL, 'The Mechanar (Entrance)'),
(555, 1, 0, 30633, 0, 0, 0, 0, NULL, 'Shadow Labyrinth (Entrance)'),
(556, 1, 0, 30633, 0, 0, 0, 0, NULL, 'Sethekk Halls (Entrance)'),
(557, 1, 0, 30633, 0, 0, 0, 0, NULL, 'Mana Tombs (Entrance)'),
(558, 1, 0, 30633, 0, 0, 0, 0, NULL, 'Auchenai Crypts (Entrance)'),
(560, 1, 0, 30635, 0, 0, 0, 0, NULL, 'Caverns Of Time,Old Hillsbrad Foothills (Entrance)'),
(574, 1, 180, 0, 0, 0, 0, 0, NULL, 'Utgarde Keep (entrance)'),
(575, 1, 180, 0, 0, 0, 0, 0, NULL, 'Utgarde Pinnacle (entrance)'),
(576, 1, 180, 0, 0, 0, 0, 0, NULL, 'The Nexus (entrance)'),
(578, 1, 180, 0, 0, 0, 0, 0, NULL, 'The Oculus (entrance)'),
(585, 1, 0, 0, 0, 11492, 11492, 0, NULL, 'Magisters'' Terrace (Entrance)'),
(595, 1, 180, 0, 0, 0, 0, 0, NULL, 'Culling of Stratholme (entrance)'),
(599, 1, 180, 0, 0, 0, 0, 0, NULL, 'Ulduar,Halls of Stone (entrance)'),
(600, 1, 180, 0, 0, 0, 0, 0, NULL, 'Drak''Tharon Keep (entrance)'),
(601, 1, 180, 0, 0, 0, 0, 0, NULL, 'Azjol-Nerub (entrance)'),
(602, 1, 180, 0, 0, 0, 0, 0, NULL, 'Ulduar,Halls of Lightning (entrance)'),
(604, 1, 180, 0, 0, 0, 0, 0, NULL, 'Gundrak (entrance north)'),
(608, 1, 180, 0, 0, 0, 0, 0, NULL, 'Violet Hold (entrance)'),
(619, 1, 180, 0, 0, 0, 0, 0, NULL, 'Ahn''Kahet (entrance)'),
(631, 2, 0, 0, 0, 0, 0, 4530, NULL, 'IceCrown Citadel (Entrance)'),
(631, 3, 0, 0, 0, 0, 0, 4597, NULL, 'IceCrown Citadel (Entrance)'),
(632, 0, 200, 0, 0, 0, 0, 0, NULL, 'Forge of Souls (Entrance)'),
(632, 1, 200, 0, 0, 0, 0, 0, NULL, 'Forge of Souls (Entrance)'),
(649, 3, 0, 0, 0, 0, 0, 0, NULL, 'Trial of the Crusader'),
(650, 0, 200, 0, 0, 0, 0, 0, NULL, 'Trial of the Champion'),
(650, 1, 200, 0, 0, 0, 0, 0, NULL, 'Trial of the Champion'),
(658, 0, 200, 0, 0, 24499, 24511, 0, NULL, 'Pit of Saron (Entrance)'),
(658, 1, 200, 0, 0, 24499, 24511, 0, NULL, 'Pit of Saron (Entrance)'),
(668, 0, 219, 0, 0, 24710, 24712, 0, NULL, 'Halls of Reflection (Entrance)'),
(668, 1, 219, 0, 0, 24710, 24712, 0, NULL, 'Halls of Reflection (Entrance)');


CREATE TABLE IF NOT EXISTS `dungeonfinder_item_rewards` (
`id` INT(10) UNSIGNED NOT NULL,
  `min_level` SMALLINT(3) UNSIGNED NOT NULL COMMENT 'dbc value',
  `max_level` SMALLINT(3) UNSIGNED NOT NULL COMMENT 'dbc value',
  `item_reward` MEDIUMINT(8) UNSIGNED NOT NULL,
  `item_amount` MEDIUMINT(4) UNSIGNED NOT NULL,
  `dungeon_type` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MYISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

DELETE FROM `dungeonfinder_item_rewards` WHERE `id` BETWEEN 1 AND 10;

INSERT INTO `dungeonfinder_item_rewards` (`id`, `min_level`, `max_level`, `item_reward`, `item_amount`, `dungeon_type`) VALUES
(1, 15, 25, 51999, 1, 0),
(2, 26, 35, 52000, 1, 0),
(3, 36, 45, 52001, 1, 0),
(4, 46, 55, 52002, 1, 0),
(5, 56, 60, 52003, 1, 0),
(6, 61, 64, 52004, 1, 1),
(7, 65, 68, 52005, 1, 1),
(8, 69, 80, 29434, 12, 3),
(9, 80, 82, 49426, 2, 4),
(10, 70, 75, 0, 0, 2);


ALTER TABLE `dungeonfinder_item_rewards`
MODIFY `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
     
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    
    -- If we get here ok, commit the changes
    IF bRollback = TRUE THEN
      ROLLBACK;
      SELECT '* UPDATE FAILED *' AS 'Status',@cThisRev AS 'DB is on Version';
    ELSE
      COMMIT;
      SELECT '* UPDATE COMPLETE *' AS 'Status',@cNewRev AS 'DB is now on Version';
    END IF;
  ELSE
    SELECT '* UPDATE SKIPPED *' AS 'Status',@cOldRev AS 'Required Version',@cThisRev AS 'Found Version';
  END IF;

END $$

DELIMITER ;

-- Execute the procedure
CALL update_mangos();

-- Drop the procedure
DROP PROCEDURE IF EXISTS `update_mangos`;
