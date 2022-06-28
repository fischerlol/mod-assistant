SET
@Entry := 9000000,
@Model := 27822,
@Name  := "Gabriella",
@Title := "The Assistant",
@Icon  := "Speak",
@GossipMenu := 0,
@MinLevel := 60,
@MaxLevel := 60,
@Faction  := 35,
@NPCFlag  := 129,
@Scale    := 1.0,
@Rank     := 0,
@Type     := 7,
@TypeFlags := 0,
@FlagsExtra := 16777218,
@Script     := "npc_assistant";

-- Creature template
DELETE FROM `creature_template` WHERE `entry`=@Entry;
INSERT INTO `creature_template` (`entry`, `modelid1`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `unit_class`, `unit_flags`, `type`, `type_flags`, `RegenHealth`, `flags_extra`, `ScriptName`) VALUES
(@Entry, @Model, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1, @Scale, @Rank, 1, 2, @Type, @TypeFlags, 1, @FlagsExtra, @Script);

-- Weapon: One-Hand
DELETE FROM `npc_vendor` WHERE `entry`=@Entry;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry, 17);
-- Weapon: Two-Hand
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+1;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+1, 25);
-- Weapon: Off-Hand
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+2;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+2, 35);

-- Armor: Tier 2 - Priest
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+3;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+3, 36);
-- Armor: Tier 2 - Paladin
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+4;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+4, 37);
-- Armor: Tier 2 - Warrior
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+5;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+5, 38);
-- Armor: Tier 2 - Mage
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+6;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+6, 39);
-- Armor: Tier 2 - Warlock
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+7;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+7, 40);
-- Armor: Tier 2 - Shaman
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+8;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+8, 41);
-- Armor: Tier 2 - Druid
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+9;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+9, 42);
-- Armor: Tier 2 - Hunter
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+10;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+10, 43);
-- Armor: Tier 2 - Rogue
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+11;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+11, 44);

-- Armor: Cloth
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+12;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+12, 45);
-- Armor: Leather
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+13;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+13, 46);
-- Armor: Mail
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+14;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+14, 47);
-- Armor: Plate
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+15;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+15, 48);

-- Armor: Ring
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+16;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+16, 49);
-- Armor: Trinket
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+17;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+17, 50);
-- Armor: Jewelry
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+18;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+18, 51);
-- Armor: Relic
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+19;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+19, 52);

-- Glyph: Warrior (Major)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (43412, 43413, 43414, 43415, 43416, 43417, 43418, 43419, 43420, 43421, 43422, 43423, 43424, 43425, 43426, 43427, 43428, 43429, 43430, 43431, 43432, 45790, 45792, 45793, 45794, 45795, 45797);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+21;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43412);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43413);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43414);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43415);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43416);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43417);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43418);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43419);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43420);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43421);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43422);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43423);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43424);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43425);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43426);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43427);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43428);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43429);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43430);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43431);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43432);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 45790);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 45792);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 45793);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 45794);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 45795);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 45797);
-- Glyph: Paladin (Major)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (41092, 41094, 41095, 41096, 41097, 41098, 41099, 41100, 41101, 41102, 41103, 41104, 41105, 41106, 41107, 41108, 41109, 41110, 43867, 43868, 43869, 45741, 45742, 45743, 45744, 45745, 45746, 45747);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+22;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 41092);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 41094);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 41095);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 41096);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 41097);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 41098);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 41099);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 41100);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 41101);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 41102);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 41103);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 41104);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 41105);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 41106);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 41107);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 41108);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 41109);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 41110);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 43867);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 43868);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 43869);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 45741);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 45742);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 45743);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 45744);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 45745);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 45746);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 45747);
-- Glyph: Hunter (Major)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (42897, 42898, 42899, 42900, 42901, 42902, 42903, 42904, 42905, 42906, 42907, 42908, 42909, 42910, 42911, 42912, 42913, 42914, 42915, 42916, 42917, 45625, 45731, 45732, 45733, 45734, 45735);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+23;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42897);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42898);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42899);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42900);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42901);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42902);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42903);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42904);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42905);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42906);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42907);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42908);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42909);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42910);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42911);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42912);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42913);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42914);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42915);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42916);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42917);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 45625);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 45731);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 45732);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 45733);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 45734);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 45735);
-- Glyph: Rogue (Major)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (42954, 42955, 42956, 42957, 42958, 42959, 42960, 42961, 42962, 42963, 42964, 42965, 42966, 42967, 42968, 42969, 42970, 42971, 42972, 42973, 42974, 45761, 45762, 45764, 45766, 45767, 45768, 45769);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+24;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42954);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42955);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42956);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42957);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42958);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42959);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42960);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42961);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42962);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42963);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42964);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42965);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42966);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42967);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42968);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42969);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42970);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42971);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42972);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42973);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42974);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 45761);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 45762);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 45764);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 45766);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 45767);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 45768);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 45769);
-- Glyph: Priest (Major)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (42396, 42397, 42398, 42399, 42400, 42401, 42402, 42403, 42404, 42405, 42406, 42407, 42408, 42409, 42410, 42411, 42412, 42414, 42415, 42416, 42417, 45753, 45755, 45756, 45757, 45758, 45760);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+25;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 42396);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 42397);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 42398);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 42399);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 42400);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 42401);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 42402);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 42403);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 42404);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 42405);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 42406);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 42407);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 42408);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 42409);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 42410);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 42411);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 42412);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 42414);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 42415);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 42416);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 42417);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 45753);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 45755);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 45756);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 45757);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 45758);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 45760);
-- Glyph: Death Knight (Major)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (43533, 43534, 43536, 43537, 43538, 43541, 43542, 43543, 43545, 43546, 43547, 43548, 43549, 43550, 43551, 43552, 43553, 43554, 43825, 43826, 43827, 45799, 45800, 45803, 45804, 45805, 45806);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+26;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 43533);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 43534);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 43536);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 43537);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 43538);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 43541);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 43542);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 43543);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 43545);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 43546);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 43547);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 43548);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 43549);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 43550);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 43551);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 43552);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 43553);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 43554);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 43825);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 43826);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 43827);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 45799);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 45800);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 45803);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 45804);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 45805);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 45806);
-- Glyph: Shaman (Major)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (41517, 41518, 41524, 41526, 41527, 41529, 41530, 41531, 41532, 41533, 41534, 41535, 41536, 41537, 41538, 41539, 41540, 41541, 41542, 41547, 41552, 45770, 45771, 45772, 45775, 45776, 45777, 45778);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+27;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 41517);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 41518);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 41524);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 41526);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 41527);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 41529);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 41530);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 41531);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 41532);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 41533);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 41534);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 41535);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 41536);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 41537);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 41538);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 41539);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 41540);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 41541);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 41542);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 41547);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 41552);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 45770);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 45771);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 45772);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 45775);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 45776);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 45777);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 45778);
-- Glyph: Mage (Major)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (42734, 42735, 42736, 42737, 42738, 42739, 42740, 42741, 42742, 42743, 42744, 42745, 42746, 42747, 42748, 42749, 42750, 42751, 42752, 42753, 42754, 44684, 44955, 45736, 45737, 45738, 45739, 45740, 50045);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+28;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42734);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42735);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42736);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42737);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42738);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42739);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42740);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42741);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42742);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42743);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42744);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42745);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42746);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42747);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42748);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42749);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42750);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42751);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42752);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42753);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42754);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 44684);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 44955);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 45736);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 45737);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 45738);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 45739);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 45740);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 50045);
-- Glyph: Warlock (Major)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (42453, 42454, 42455, 42456, 42457, 42458, 42459, 42460, 42461, 42462, 42463, 42464, 42465, 42466, 42467, 42468, 42469, 42470, 42471, 42473, 42742, 45779, 45780, 45781, 45782, 45783, 45785, 45789, 50077);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+29;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 42453);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 42454);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 42455);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 42456);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 42457);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 42458);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 42459);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 42460);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 42461);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 42462);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 42463);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 42464);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 42465);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 42466);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 42467);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 42468);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 42469);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 42470);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 42471);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 42473);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 42742);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 45779);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 45780);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 45781);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 45782);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 45783);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 45785);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 45789);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 50077);
-- Glyph: Druid (Major)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (40896, 40897, 40899, 40900, 40901, 40902, 40903, 40906, 40908, 40909, 40912, 40913, 40914, 40915, 40916, 40919, 40920, 40921, 40922, 40923, 40924, 44928, 45601, 45602, 45603, 45604, 45622, 45623, 46372, 48720, 50125);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+30;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 40896);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 40897);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 40899);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 40900);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 40901);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 40902);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 40903);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 40906);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 40908);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 40909);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 40912);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 40913);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 40914);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 40915);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 40916);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 40919);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 40920);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 40921);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 40922);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 40923);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 40924);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 44928);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 45601);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 45602);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 45603);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 45604);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 45622);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 45623);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 46372);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 48720);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 50125);
-- Glyph: Warrior (Minor)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (43395, 43396, 43397, 43398, 43399, 43400, 49084);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+31;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+31, 43395);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+31, 43396);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+31, 43397);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+31, 43398);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+31, 43399);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+31, 43400);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+31, 49084);
-- Glyph: Paladin (Minor)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (43340, 43365, 43366, 43367, 43368, 43369);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+32;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+32, 43340);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+32, 43365);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+32, 43366);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+32, 43367);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+32, 43368);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+32, 43369);
-- Glyph: Hunter (Minor)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (43338, 43350, 43351, 43354, 43355, 43356);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+33;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+33, 43338);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+33, 43350);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+33, 43351);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+33, 43354);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+33, 43355);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+33, 43356);
-- Glyph: Rogue (Minor)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (43343, 43376, 43377, 43378, 43379, 43380);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+34;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+34, 43343);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+34, 43376);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+34, 43377);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+34, 43378);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+34, 43379);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+34, 43380);
-- Glyph: Priest (Minor)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (43342, 43370, 43371, 43372, 43373, 43374);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+35;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+35, 43342);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+35, 43370);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+35, 43371);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+35, 43372);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+35, 43373);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+35, 43374);
-- Glyph: Death Knight (Minor)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (43535, 43539, 43544, 43671, 43672, 43673);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+36;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+36, 43535);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+36, 43539);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+36, 43544);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+36, 43671);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+36, 43672);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+36, 43673);
-- Glyph: Shaman (Minor)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (43344, 43381, 43385, 43386, 43388, 43725, 44923);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+37;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+37, 43344);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+37, 43381);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+37, 43385);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+37, 43386);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+37, 43388);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+37, 43725);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+37, 44923);
-- Glyph: Mage (Minor)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (43339, 43357, 43359, 43360, 43361, 43362, 43364, 44920);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+21;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43339);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43357);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43359);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43360);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43361);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43362);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43364);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 44920);
-- Glyph: Warlock (Minor)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (43389, 43390, 43391, 43392, 43393, 43394);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+21;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43389);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43390);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43391);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43392);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43393);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43394);
-- Glyph: Druid (Minor)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (43316, 43331, 43332, 43334, 43335, 43674, 44922);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+22;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 43316);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 43331);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 43332);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 43334);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 43335);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 43674);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 44922);

-- Container
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (41597, 44447, 44448);
UPDATE `item_template` SET `RequiredLevel`=0 WHERE `entry` IN (44447, 44448);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+40;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+40, 23162);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+40, 41597);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+40, 44447);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+40, 44448);
