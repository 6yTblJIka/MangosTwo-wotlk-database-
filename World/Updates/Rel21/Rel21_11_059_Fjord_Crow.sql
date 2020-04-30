-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update (v1.4)
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

    -- Current Values (TODO - must be a better way to do this)
    SET @cCurVersion := (SELECT `version` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cCurStructure := (SELECT structure FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cCurContent := (SELECT content FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);

    -- Expected Values
    SET @cOldVersion = '21'; 
    SET @cOldStructure = '11'; 
    SET @cOldContent = '058';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '11';
    SET @cNewContent = '059';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Fjord Crow';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Fjord Crow';

    -- Evaluate all settings
    SET @cCurResult := (SELECT description FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cOldResult := (SELECT description FROM db_version WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @cOldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -


-- Fjord Crow

-- #108159
UPDATE creature SET position_x = 1806.434, position_y = -6021.932, position_z = 10.75427, orientation = 3.637148, SpawnDist = 0, MovementType = 2 WHERE guid = 108159;
DELETE FROM creature_movement WHERE id = 108159;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, orientation) VALUES
(108159,1,1798.313,-6025.522,12.1605,0,5,0),
(108159,2,1781.434,-6032.322,12.1605,0,0,0),
(108159,3,1764.042,-6036.658,12.1605,0,0,0),
(108159,4,1744.378,-6020.791,15.68827,0,0,0),
(108159,5,1759.933,-5976.301,20.10494,0,0,0),
(108159,6,1794.868,-5980.198,29.02161,0,0,0),
(108159,7,1815.572,-5993.727,32.82717,0,0,0),
(108159,8,1811.571,-6016.993,12.1605,0,0,0),
(108159,9,1798.313,-6025.522,12.1605,0,0,0);

-- #108160
UPDATE creature SET position_x = 1842.575, position_y = -5939.03, position_z = 21.42269, orientation = 3.34442, SpawnDist = 0, MovementType = 2 WHERE guid = 108160;
DELETE FROM creature_movement WHERE id = 108160;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, orientation) VALUES
(108160,1,1842.575,-5939.03,21.42269,0,5,0),
(108160,2,1830.167,-5941.044,21.42269,0,0,0),
(108160,3,1813.28,-5948.972,21.42269,0,0,0),
(108160,4,1804.44,-5960.443,21.42269,0,0,0),
(108160,5,1782.444,-5975.294,21.42269,0,0,0),
(108160,6,1762.042,-5975.969,21.42269,0,0,0),
(108160,7,1736.733,-5962.987,21.42269,0,0,0),
(108160,8,1706.252,-5954.771,21.42269,0,0,0),
(108160,9,1684.713,-5970.041,21.42269,0,0,0),
(108160,10,1679.545,-5991.559,21.42269,0,0,0),
(108160,11,1695.247,-6002.526,21.42269,0,0,0),
(108160,12,1716.442,-6004.625,21.42269,0,0,0),
(108160,13,1728.595,-5997.799,21.42269,0,0,0),
(108160,14,1761.79,-5982.948,21.42269,0,0,0),
(108160,15,1788.044,-5979.635,21.42269,0,0,0),
(108160,16,1834.086,-5985.302,21.42269,0,0,0),
(108160,17,1847.34,-5982.546,21.42269,0,0,0),
(108160,18,1857.246,-5975.559,21.42269,0,0,0),
(108160,19,1860.634,-5952.029,21.42269,0,0,0);

-- #108153
UPDATE creature SET position_x = 1839.916, position_y = -6046.515, position_z = 17.9714, orientation = 2.7208, SpawnDist = 0, MovementType = 2 WHERE guid = 108153;
DELETE FROM creature_movement WHERE id = 108153;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, orientation) VALUES
(108153,1,1839.916,-6046.515,17.9714,0,5,0),
(108153,2,1828.711,-6041.977,18.38033,0,0,0),
(108153,3,1790.419,-6014.862,18.38033,0,0,0),
(108153,4,1767.046,-5971.419,26.63033,0,0,0),
(108153,5,1769.659,-5945.266,28.6581,0,0,0),
(108153,6,1799.759,-5956.335,26.40811,0,0,0),
(108153,7,1829.891,-5980.739,20.93588,0,0,0),
(108153,8,1856.728,-6018.083,18.38033,0,0,0),
(108153,9,1862.548,-6037.211,18.38033,0,0,0),
(108153,10,1854.409,-6048.04,18.38033,0,0,0);

-- #108164
UPDATE creature SET position_x = 1809.912, position_y = -5928.011, position_z = 13.19573, orientation = 2.46789, SpawnDist = 0, MovementType = 2 WHERE guid = 108164;
DELETE FROM creature_movement WHERE id = 108164;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, orientation) VALUES
(108164,1,1809.912,-5928.011,13.19573,0,5,0),
(108164,2,1782.442,-5910.624,11.10143,0,0,0),
(108164,3,1771.135,-5901.194,11.10143,0,0,0),
(108164,4,1759.7,-5880.451,11.10143,0,0,0),
(108164,5,1755.855,-5856.976,11.10143,0,0,0),
(108164,6,1765.864,-5839.694,11.10143,0,0,0),
(108164,7,1791.245,-5834.033,11.10143,0,0,0),
(108164,8,1807.602,-5841.024,11.10143,0,0,0),
(108164,9,1824.091,-5865.016,11.10143,0,0,0),
(108164,10,1837.698,-5901.233,11.10143,0,0,0),
(108164,11,1835.611,-5934.645,11.65699,0,0,0),
(108164,12,1839.277,-5961.495,11.87921,0,0,0),
(108164,13,1847.492,-5975.602,12.12921,0,0,0),
(108164,14,1851.103,-5988.475,12.87921,0,0,0),
(108164,15,1861.56,-6000.432,14.90698,0,0,0),
(108164,16,1885.437,-6008.899,19.47353,0,0,0),
(108164,17,1911.274,-5993.772,24.1124,0,0,0),
(108164,18,1918.017,-5974.573,20.27907,0,0,0),
(108164,19,1914.094,-5963.311,12.69574,0,0,0),
(108164,20,1909.278,-5954.899,12.27907,0,0,0),
(108164,21,1894.895,-5948.164,11.80685,0,0,0),
(108164,22,1865.575,-5944.001,12.16796,0,0,0),
(108164,23,1845.721,-5939.84,12.14018,0,0,0);

-- #108161
UPDATE creature SET position_x = 1853.918, position_y = -5965.874, position_z = 17.0367, orientation = 3.29418, SpawnDist = 0, MovementType = 2 WHERE guid = 108161;
DELETE FROM creature_movement WHERE id = 108161;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, orientation) VALUES
(108161,1,1853.918,-5965.874,17.0367,0,5,0),
(108161,2,1847.714,-5967.06,17.0367,0,0,0),
(108161,3,1827.836,-5972.045,17.0367,0,0,0),
(108161,4,1812.559,-5978.658,17.0367,0,0,0),
(108161,5,1787.812,-5984.059,17.0367,0,0,0),
(108161,6,1770.101,-5983.982,17.0367,0,0,0),
(108161,7,1736.097,-5983.688,17.0367,0,0,0),
(108161,8,1715.143,-5992.873,17.0367,0,0,0),
(108161,9,1701.75,-5998.483,17.0367,0,0,0),
(108161,10,1682.904,-5994.281,17.0367,0,0,0),
(108161,11,1675.37,-5965.318,17.0367,0,0,0),
(108161,12,1682.495,-5937.573,17.0367,0,0,0),
(108161,13,1698.489,-5927.727,17.0367,0,0,0),
(108161,14,1730.398,-5923.192,17.0367,0,0,0),
(108161,15,1769.103,-5942.496,17.0367,0,0,0),
(108161,16,1784.335,-5958.75,17.0367,0,0,0),
(108161,17,1789.752,-5964.648,17.0367,0,0,0),
(108161,18,1814.925,-5989.133,17.0367,0,0,0),
(108161,19,1824.929,-5997.979,17.0367,0,0,0),
(108161,20,1850.328,-6008.414,19.50894,0,0,0),
(108161,21,1872.931,-5996.634,23.28673,0,0,0),
(108161,22,1869.903,-5975.502,17.98117,0,0,0);

-- #108169
UPDATE creature SET position_x = 1764.808, position_y = -5996.37, position_z = 15.92465, orientation = 5.49704, SpawnDist = 0, MovementType = 2 WHERE guid = 108169;
DELETE FROM creature_movement WHERE id = 108169;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, orientation) VALUES
(108169,1,1764.808,-5996.37,15.92465,0,5,0),
(108169,2,1785.296,-6015.696,13.214,0,0,0),
(108169,3,1809.404,-6024.292,14.64077,0,0,0),
(108169,4,1831.345,-6019.988,17.16855,0,0,0),
(108169,5,1848.38,-5997.679,12.91855,0,0,0),
(108169,6,1845.405,-5974.462,12.91855,0,0,0),
(108169,7,1826.122,-5953.111,11.89078,0,0,0),
(108169,8,1798.466,-5942.82,14.30744,0,0,0),
(108169,9,1773.023,-5952.433,14.52966,0,0,0),
(108169,10,1767.446,-5976.824,17.55744,0,0,0),
(108169,11,1787.316,-6000.516,24.05744,0,0,0),
(108169,12,1821.324,-5998.787,25.72412,0,0,0),
(108169,13,1827.069,-5966.253,12.91855,0,0,0),
(108169,14,1817.921,-5925.949,12.91855,0,0,0),
(108169,15,1786.483,-5919.94,12.91855,0,0,0),
(108169,16,1770.775,-5934.303,12.91855,0,0,0),
(108169,17,1776.043,-5970.667,12.91855,0,0,0),
(108169,18,1800.633,-5982.743,12.91855,0,0,0),
(108169,19,1827.47,-5972.246,15.9741,0,0,0),
(108169,20,1848.431,-5944.668,17.75189,0,0,0),
(108169,21,1847.489,-5914.517,19.58522,0,0,0),
(108169,22,1833.57,-5894.481,24.39688,0,0,0),
(108169,23,1813.075,-5882.202,25.1191,0,0,0),
(108169,24,1783.377,-5885.683,25.1191,0,0,0),
(108169,25,1762.736,-5915.438,25.1191,0,0,0),
(108169,26,1756.174,-5942.465,22.67465,0,0,0),
(108169,27,1761.196,-5974.324,19.45242,0,0,0);

-- #108167
UPDATE creature SET position_x = 1764.808, position_y = -5996.37, position_z = 15.92465, orientation = 5.49704, SpawnDist = 0, MovementType = 2 WHERE guid = 108167;
DELETE FROM creature_movement WHERE id = 108167;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, orientation) VALUES
(108167,1,1849.085,-5980.763,57.95314,0,5,0),
(108167,2,1842.954,-5963.617,56.42534,0,0,0),
(108167,3,1840.917,-5925.655,41.0087,0,0,0),
(108167,4,1826.681,-5890.358,25.092,0,0,0),
(108167,5,1805.578,-5868.823,17.73092,0,0,0),
(108167,6,1793.947,-5869.31,17.92537,0,0,0),
(108167,7,1782.513,-5879.542,20.53646,0,0,0),
(108167,8,1782.096,-5892.334,21.36979,0,0,0),
(108167,9,1790.645,-5911.59,21.092,0,0,0),
(108167,10,1810.954,-5936.142,27.48094,0,0,0),
(108167,11,1830.439,-5953.158,35.95314,0,0,0),
(108167,12,1861.98,-5971.207,49.0087,0,0,0),
(108167,13,1900.502,-6001.618,52.00869,0,0,0),
(108167,14,1921.55,-6034.05,57.95314,0,0,0),
(108167,15,1919.594,-6059.063,62.56425,0,0,0),
(108167,16,1910.168,-6073.116,65.3698,0,0,0),
(108167,17,1892.958,-6074.357,65.67538,0,0,0),
(108167,18,1881.476,-6070.102,63.92538,0,0,0),
(108167,19,1874.849,-6064.443,60.5087,0,0,0),
(108167,20,1870.661,-6056.695,57.95314,0,0,0),
(108167,21,1869.202,-6046.252,57.95314,0,0,0),
(108167,22,1868.417,-6029.92,57.95314,0,0,0),
(108167,23,1866.429,-6021.896,57.95314,0,0,0),
(108167,24,1862.894,-6009.511,57.95314,0,0,0),
(108167,25,1853.084,-5989.761,57.95314,0,0,0);

-- #108157
UPDATE creature SET position_x = 1883.72, position_y = -5950.006, position_z = 8.658919, orientation = 2.35642, SpawnDist = 0, MovementType = 2 WHERE guid = 108157;
DELETE FROM creature_movement WHERE id = 108157;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, orientation) VALUES
(108157,1,1883.72,-5950.006,8.658919,0,5,0),
(108157,2,1868.077,-5941.038,23.65112,0,0,0),
(108157,3,1853.458,-5937.21,23.65112,0,0,0),
(108157,4,1828.296,-5912.031,21.51222,0,0,0),
(108157,5,1807.577,-5882.792,21.31777,0,0,0),
(108157,6,1769.402,-5883.362,17.20665,0,0,0),
(108157,7,1737.702,-5864.756,12.31777,0,0,0),
(108157,8,1745.258,-5847.689,12.23444,0,0,0),
(108157,9,1754.386,-5844.061,11.67888,0,0,0),
(108157,10,1763.963,-5842.793,13.70666,0,0,0),
(108157,11,1788.787,-5837.553,13.70666,0,0,0),
(108157,12,1814.119,-5849.518,13.70666,0,0,0),
(108157,13,1843.463,-5871.548,23.65112,0,0,0),
(108157,14,1874.109,-5888.459,23.65112,0,0,0),
(108157,15,1887.261,-5904.744,23.65112,0,0,0),
(108157,16,1884.408,-5933.902,23.65112,0,0,0);

-- #108163
UPDATE creature SET position_x = 1831.667, position_y = -5897.85, position_z = 20.2789, orientation = 2.40983, SpawnDist = 0, MovementType = 2 WHERE guid = 108163;
DELETE FROM creature_movement WHERE id = 108163;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, orientation) VALUES
(108163,1,1831.667,-5897.85,20.2789,0,5,0),
(108163,2,1816.325,-5883.429,20.2789,0,0,0),
(108163,3,1804.26,-5879.155,20.2789,0,0,0),
(108163,4,1788.189,-5883.42,20.2789,0,0,0),
(108163,5,1770.54,-5894.45,20.2789,0,0,0),
(108163,6,1757.553,-5918.95,20.2789,0,0,0),
(108163,7,1766.393,-5944.113,20.2789,0,0,0),
(108163,8,1788.116,-5964.526,20.2789,0,0,0),
(108163,9,1812.198,-5965.548,20.2789,0,0,0),
(108163,10,1838.463,-5958.992,20.2789,0,0,0),
(108163,11,1860.26,-5953.201,20.2789,0,0,0),
(108163,12,1889.18,-5954.702,20.2789,0,0,0),
(108163,13,1917.486,-5979.021,20.2789,0,0,0),
(108163,14,1923.368,-6001.902,20.2789,0,0,0),
(108163,15,1916.127,-6012.466,20.2789,0,0,0),
(108163,16,1902.862,-6023.549,20.2789,0,0,0),
(108163,17,1884.51,-6023.346,20.2789,0,0,0),
(108163,18,1862.808,-6013.548,20.2789,0,0,0),
(108163,19,1847.664,-5992.344,20.2789,0,0,0),
(108163,20,1847.083,-5973.488,20.2789,0,0,0),
(108163,21,1849.443,-5943.992,20.2789,0,0,0),
(108163,22,1849.005,-5919.72,20.2789,0,0,0);

-- #108168
UPDATE creature SET position_x = 1726.899, position_y = -5913.412, position_z = 17.02714, orientation = 2.3332, SpawnDist = 0, MovementType = 2 WHERE guid = 108168;
DELETE FROM creature_movement WHERE id = 108168;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, orientation) VALUES
(108168,1,1726.899,-5913.412,17.02714,0,5,0),
(108168,2,1728.022,-5893.366,17.02714,0,0,0),
(108168,3,1734.616,-5881.488,17.02714,0,0,0),
(108168,4,1742.404,-5864.239,17.02714,0,0,0),
(108168,5,1756.174,-5842.653,22.55493,0,0,0),
(108168,6,1771.343,-5820.28,29.86048,0,0,0),
(108168,7,1794.444,-5807.632,43.0827,0,0,0),
(108168,8,1812.66,-5823.896,42.27715,0,0,0),
(108168,9,1810.755,-5845.847,32.66605,0,0,0),
(108168,10,1796.726,-5870.603,25.80494,0,0,0),
(108168,11,1783.066,-5885.331,17.02714,0,0,0),
(108168,12,1768.164,-5908.891,17.02714,0,0,0),
(108168,13,1765.392,-5938.714,17.02714,0,0,0),
(108168,14,1773.6,-5965.595,17.02714,0,0,0),
(108168,15,1762.02,-5985.601,17.02714,0,0,0),
(108168,16,1741.153,-5981.631,17.02714,0,0,0),
(108168,17,1729.268,-5960.358,17.02714,0,0,0),
(108168,18,1728.407,-5942.979,17.02714,0,0,0),
(108168,19,1726.799,-5924.204,17.02714,0,0,0);

-- #108144
UPDATE creature SET position_x = 1730.812, position_y = -6007.409, position_z = 40.93739, orientation = 0.835892, SpawnDist = 0, MovementType = 2 WHERE guid = 108144;
DELETE FROM creature_movement WHERE id = 108144;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, orientation) VALUES
(108144,1,1730.812,-6007.409,40.93739,0,5,0),
(108144,2,1738.864,-5997.687,38.88185,0,0,0),
(108144,3,1759.279,-5977.945,33.49295,0,0,0),
(108144,4,1794.243,-5942.844,26.02073,0,0,0),
(108144,5,1836.075,-5916.573,20.71521,0,0,0),
(108144,6,1838.574,-5873.448,21.63184,0,0,0),
(108144,7,1808.759,-5836.52,23.65962,0,0,0),
(108144,8,1776.501,-5815.663,30.74296,0,0,0),
(108144,9,1748.497,-5823.127,45.60408,0,0,0),
(108144,10,1720.599,-5839.787,47.49297,0,0,0),
(108144,11,1711.346,-5851.827,49.38185,0,0,0),
(108144,12,1702.799,-5875.525,54.46518,0,0,0),
(108144,13,1692.759,-5895.995,54.46518,0,0,0),
(108144,14,1684.363,-5915.061,54.46518,0,0,0),
(108144,15,1664.061,-5960.54,54.46518,0,0,0),
(108144,16,1666.497,-5988.84,54.46518,0,0,0),
(108144,17,1682.698,-6007.979,55.46519,0,0,0),
(108144,18,1699.94,-6010.21,54.46518,0,0,0),
(108144,19,1713.626,-6009.47,50.4374,0,0,0);

-- #108165
UPDATE creature SET position_x = 1726.214, position_y = -5891.933, position_z = 58.67258, orientation = 6.0902, SpawnDist = 0, MovementType = 2 WHERE guid = 108165;
DELETE FROM creature_movement WHERE id = 108165;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, orientation) VALUES
(108165,1,1702.063,-5891.933,58.67258,0,5,0),
(108165,2,1726.214,-5895.86,58.30159,0,0,0),
(108165,3,1766.362,-5902.586,58.30159,0,0,0),
(108165,4,1808.475,-5912.897,58.30159,0,0,0),
(108165,5,1835.293,-5935.789,26.99604,0,0,0),
(108165,6,1840.26,-5969.636,20.32934,0,0,0),
(108165,7,1819.568,-6000.028,20.49603,0,0,0),
(108165,8,1779.633,-5999.627,20.21824,0,0,0),
(108165,9,1743.921,-5992.751,40.49603,0,0,0),
(108165,10,1705.996,-5979.181,69.97819,0,0,0),
(108165,11,1678.317,-5963.596,72.39492,0,0,0),
(108165,12,1663.997,-5934.412,68.92266,0,0,0),
(108165,13,1674.214,-5898.284,61.08928,0,0,0);

-- #108143
UPDATE creature SET position_x = 1734.641, position_y = -5827.966, position_z = 79.14889, orientation = 4.6435, SpawnDist = 0, MovementType = 2 WHERE guid = 108143;
DELETE FROM creature_movement WHERE id = 108143;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, orientation) VALUES
(108143,1,1734.641,-5827.966,79.14889,0,5,0),
(108143,2,1738.043,-5842.045,79.92389,0,0,0),
(108143,3,1755.863,-5869.247,90.03503,0,0,0),
(108143,4,1770.263,-5900.222,91.7573,0,0,0),
(108143,5,1755.48,-5920.659,87.14611,0,0,0),
(108143,6,1737.091,-5921.499,74.36838,0,0,0),
(108143,7,1713.869,-5889.875,59.7017,0,0,0),
(108143,8,1707.994,-5842.974,44.45171,0,0,0),
(108143,9,1739.732,-5812.785,35.34058,0,0,0),
(108143,10,1774.754,-5812.979,35.34058,0,0,0),
(108143,11,1802.146,-5828.509,35.34058,0,0,0),
(108143,12,1817.201,-5848.972,21.67392,0,0,0),
(108143,13,1821.464,-5862.22,17.42392,0,0,0),
(108143,14,1810.822,-5887.364,16.34334,0,0,0),
(108143,15,1792.445,-5888.393,18.20443,0,0,0),
(108143,16,1767.026,-5882.877,20.64888,0,0,0),
(108143,17,1739.911,-5869.371,34.14888,0,0,0),
(108143,18,1707.461,-5849.163,65.20444,0,0,0),
(108143,19,1696.562,-5836.518,79.14889,0,0,0),
(108143,20,1689.1,-5813.774,79.14889,0,0,0),
(108143,21,1706.52,-5800.823,79.14889,0,0,0),
(108143,22,1726.765,-5814.766,79.14889,0,0,0);

-- EventAI
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `Entry` IN (23945,24128);
DELETE FROM creature_ai_scripts WHERE `creature_id` IN (23945,24128);
INSERT INTO `creature_ai_scripts` VALUES
-- Fjord Crow
(2394501,23945,9,0,75,1,0,5,12000,16000,11,49865,1,0,0,0,0,0,0,0,0,0,'Fjord Crow - Cast Eye Peck'),
-- Wild Worg
(2412801,24128,9,0,75,1,0,5,7000,11000,11,48287,1,0,0,0,0,0,0,0,0,0,'Wild Worg - Cast Powerfull Bite'); 

        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL ABOVE -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

        -- If we get here ok, commit the changes
        IF bRollback = TRUE THEN
            ROLLBACK;
            SHOW ERRORS;
            SELECT '* UPDATE FAILED *' AS `===== Status =====`,@cCurResult AS `===== DB is on Version: =====`;
        ELSE
            COMMIT;
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
            -- UPDATE THE DB VERSION
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
            INSERT INTO `db_version` VALUES (@cNewVersion, @cNewStructure, @cNewContent, @cNewDescription, @cNewComment);
            SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

            SELECT '* UPDATE COMPLETE *' AS `===== Status =====`,@cNewResult AS `===== DB is now on Version =====`;
        END IF;
    ELSE    -- Current version is not the expected version
        IF (@cCurResult = @cNewResult) THEN    -- Does the current version match the new version
            SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cCurResult AS `===== DB is already on Version =====`;
        ELSE    -- Current version is not one related to this update
            IF(@cCurResult IS NULL) THEN    -- Something has gone wrong
                SELECT '* UPDATE FAILED *' AS `===== Status =====`,'Unable to locate DB Version Information' AS `============= Error Message =============`;
            ELSE
                IF(@cOldResult IS NULL) THEN    -- Something has gone wrong
                    SET @cCurVersion := (SELECT `version` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SET @cOldResult = CONCAT('Rel',@cOldVersion, '_', @cOldStructure, '_', @cOldContent, ' - ','IS NOT APPLIED');
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                ELSE
                    SET @cCurVersion := (SELECT `version` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                END IF;
            END IF;
        END IF;
    END IF;
END $$

DELIMITER ;

-- Execute the procedure
CALL update_mangos();

-- Drop the procedure
DROP PROCEDURE IF EXISTS `update_mangos`;


