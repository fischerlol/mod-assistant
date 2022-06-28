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
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+20;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 43412);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 43413);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 43414);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 43415);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 43416);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 43417);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 43418);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 43419);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 43420);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 43421);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 43422);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 43423);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 43424);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 43425);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 43426);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 43427);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 43428);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 43429);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 43430);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 43431);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 43432);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 45790);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 45792);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 45793);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 45794);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 45795);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+20, 45797);
-- Glyph: Paladin (Major)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (41092, 41094, 41095, 41096, 41097, 41098, 41099, 41100, 41101, 41102, 41103, 41104, 41105, 41106, 41107, 41108, 41109, 41110, 43867, 43868, 43869, 45741, 45742, 45743, 45744, 45745, 45746, 45747);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+21;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 41092);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 41094);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 41095);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 41096);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 41097);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 41098);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 41099);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 41100);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 41101);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 41102);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 41103);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 41104);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 41105);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 41106);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 41107);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 41108);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 41109);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 41110);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43867);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43868);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 43869);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 45741);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 45742);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 45743);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 45744);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 45745);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 45746);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+21, 45747);
-- Glyph: Hunter (Major)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (42897, 42898, 42899, 42900, 42901, 42902, 42903, 42904, 42905, 42906, 42907, 42908, 42909, 42910, 42911, 42912, 42913, 42914, 42915, 42916, 42917, 45625, 45731, 45732, 45733, 45734, 45735);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+22;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 42897);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 42898);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 42899);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 42900);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 42901);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 42902);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 42903);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 42904);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 42905);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 42906);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 42907);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 42908);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 42909);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 42910);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 42911);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 42912);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 42913);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 42914);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 42915);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 42916);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 42917);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 45625);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 45731);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 45732);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 45733);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 45734);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+22, 45735);
-- Glyph: Rogue (Major)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (42954, 42955, 42956, 42957, 42958, 42959, 42960, 42961, 42962, 42963, 42964, 42965, 42966, 42967, 42968, 42969, 42970, 42971, 42972, 42973, 42974, 45761, 45762, 45764, 45766, 45767, 45768, 45769);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+23;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42954);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42955);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42956);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42957);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42958);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42959);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42960);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42961);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42962);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42963);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42964);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42965);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42966);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42967);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42968);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42969);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42970);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42971);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42972);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42973);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 42974);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 45761);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 45762);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 45764);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 45766);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 45767);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 45768);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+23, 45769);
-- Glyph: Priest (Major)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (42396, 42397, 42398, 42399, 42400, 42401, 42402, 42403, 42404, 42405, 42406, 42407, 42408, 42409, 42410, 42411, 42412, 42414, 42415, 42416, 42417, 45753, 45755, 45756, 45757, 45758, 45760);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+24;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42396);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42397);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42398);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42399);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42400);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42401);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42402);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42403);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42404);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42405);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42406);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42407);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42408);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42409);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42410);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42411);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42412);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42414);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42415);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42416);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 42417);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 45753);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 45755);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 45756);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 45757);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 45758);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+24, 45760);
-- Glyph: Death Knight (Major)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (43533, 43534, 43536, 43537, 43538, 43541, 43542, 43543, 43545, 43546, 43547, 43548, 43549, 43550, 43551, 43552, 43553, 43554, 43825, 43826, 43827, 45799, 45800, 45803, 45804, 45805, 45806);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+25;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 43533);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 43534);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 43536);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 43537);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 43538);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 43541);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 43542);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 43543);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 43545);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 43546);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 43547);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 43548);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 43549);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 43550);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 43551);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 43552);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 43553);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 43554);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 43825);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 43826);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 43827);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 45799);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 45800);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 45803);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 45804);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 45805);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+25, 45806);
-- Glyph: Shaman (Major)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (41517, 41518, 41524, 41526, 41527, 41529, 41530, 41531, 41532, 41533, 41534, 41535, 41536, 41537, 41538, 41539, 41540, 41541, 41542, 41547, 41552, 45770, 45771, 45772, 45775, 45776, 45777, 45778);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+26;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 41517);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 41518);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 41524);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 41526);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 41527);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 41529);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 41530);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 41531);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 41532);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 41533);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 41534);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 41535);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 41536);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 41537);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 41538);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 41539);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 41540);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 41541);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 41542);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 41547);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 41552);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 45770);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 45771);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 45772);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 45775);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 45776);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 45777);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+26, 45778);
-- Glyph: Mage (Major)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (42734, 42735, 42736, 42737, 42738, 42739, 42740, 42741, 42742, 42743, 42744, 42745, 42746, 42747, 42748, 42749, 42750, 42751, 42752, 42753, 42754, 44684, 44955, 45736, 45737, 45738, 45739, 45740, 50045);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+27;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 42734);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 42735);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 42736);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 42737);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 42738);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 42739);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 42740);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 42741);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 42742);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 42743);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 42744);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 42745);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 42746);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 42747);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 42748);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 42749);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 42750);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 42751);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 42752);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 42753);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 42754);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 44684);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 44955);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 45736);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 45737);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 45738);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 45739);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 45740);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+27, 50045);
-- Glyph: Warlock (Major)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (42453, 42454, 42455, 42456, 42457, 42458, 42459, 42460, 42461, 42462, 42463, 42464, 42465, 42466, 42467, 42468, 42469, 42470, 42471, 42473, 42742, 45779, 45780, 45781, 45782, 45783, 45785, 45789, 50077);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+28;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42453);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42454);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42455);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42456);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42457);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42458);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42459);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42460);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42461);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42462);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42463);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42464);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42465);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42466);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42467);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42468);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42469);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42470);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42471);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42473);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 42742);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 45779);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 45780);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 45781);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 45782);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 45783);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 45785);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 45789);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+28, 50077);
-- Glyph: Druid (Major)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (40896, 40897, 40899, 40900, 40901, 40902, 40903, 40906, 40908, 40909, 40912, 40913, 40914, 40915, 40916, 40919, 40920, 40921, 40922, 40923, 40924, 44928, 45601, 45602, 45603, 45604, 45622, 45623, 46372, 48720, 50125);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+29;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 40896);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 40897);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 40899);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 40900);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 40901);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 40902);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 40903);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 40906);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 40908);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 40909);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 40912);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 40913);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 40914);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 40915);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 40916);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 40919);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 40920);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 40921);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 40922);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 40923);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 40924);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 44928);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 45601);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 45602);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 45603);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 45604);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 45622);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 45623);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 46372);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 48720);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+29, 50125);
-- Glyph: Warrior (Minor)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (43395, 43396, 43397, 43398, 43399, 43400, 49084);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+30;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 43395);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 43396);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 43397);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 43398);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 43399);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 43400);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+30, 49084);
-- Glyph: Paladin (Minor)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (43340, 43365, 43366, 43367, 43368, 43369);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+31;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+31, 43340);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+31, 43365);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+31, 43366);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+31, 43367);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+31, 43368);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+31, 43369);
-- Glyph: Hunter (Minor)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (43338, 43350, 43351, 43354, 43355, 43356);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+32;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+32, 43338);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+32, 43350);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+32, 43351);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+32, 43354);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+32, 43355);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+32, 43356);
-- Glyph: Rogue (Minor)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (43343, 43376, 43377, 43378, 43379, 43380);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+33;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+33, 43343);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+33, 43376);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+33, 43377);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+33, 43378);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+33, 43379);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+33, 43380);
-- Glyph: Priest (Minor)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (43342, 43370, 43371, 43372, 43373, 43374);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+34;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+34, 43342);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+34, 43370);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+34, 43371);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+34, 43372);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+34, 43373);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+34, 43374);
-- Glyph: Death Knight (Minor)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (43535, 43539, 43544, 43671, 43672, 43673);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+35;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+35, 43535);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+35, 43539);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+35, 43544);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+35, 43671);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+35, 43672);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+35, 43673);
-- Glyph: Shaman (Minor)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (43344, 43381, 43385, 43386, 43388, 43725, 44923);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+36;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+36, 43344);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+36, 43381);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+36, 43385);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+36, 43386);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+36, 43388);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+36, 43725);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+36, 44923);
-- Glyph: Mage (Minor)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (43339, 43357, 43359, 43360, 43361, 43362, 43364, 44920);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+37;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+37, 43339);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+37, 43357);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+37, 43359);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+37, 43360);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+37, 43361);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+37, 43362);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+37, 43364);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+37, 44920);
-- Glyph: Warlock (Minor)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (43389, 43390, 43391, 43392, 43393, 43394);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+38;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+38, 43389);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+38, 43390);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+38, 43391);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+38, 43392);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+38, 43393);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+38, 43394);
-- Glyph: Druid (Minor)
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (43316, 43331, 43332, 43334, 43335, 43674, 44922);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+39;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+39, 43316);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+39, 43331);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+39, 43332);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+39, 43334);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+39, 43335);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+39, 43674);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+39, 44922);

-- Container
UPDATE `item_template` SET `BuyPrice`=0, `SellPrice`=0 WHERE `entry` IN (41597, 44447, 44448);
UPDATE `item_template` SET `RequiredLevel`=0 WHERE `entry` IN (44447, 44448);
DELETE FROM `npc_vendor` WHERE `entry`=@Entry+40;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+40, 23162);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+40, 41597);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+40, 44447);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (@Entry+40, 44448);
