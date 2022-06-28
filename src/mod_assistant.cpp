#include "Chat.h"
#include "Config.h"
#include "Player.h"
#include "ScriptMgr.h"
#include "ScriptedGossip.h"

enum GossipId
{
    ASSISTANT_GOSSIP_TEXT = 48,
    ASSISTANT_GOSSIP_ARMOR = 100,
    ASSISTANT_GOSSIP_WEAPON = 200,
    ASSISTANT_GOSSIP_GLYPH = 300,
    ASSISTANT_GOSSIP_CONTAINER = 400,
    ASSISTANT_GOSSIP_PROFESSIONS = 500,
    ASSISTANT_GOSSIP_LEVEL = 600,
};

enum VendorId
{
    ASSISTANT_VENDOR_GEAR_WEAPON_ONE_HAND = 9000000,
    ASSISTANT_VENDOR_GEAR_WEAPON_TWO_HAND = 9000001,
    ASSISTANT_VENDOR_GEAR_WEAPON_OFF_HAND = 9000002,
    ASSISTANT_VENDOR_GEAR_TIER2_PRIEST = 9000003,
    ASSISTANT_VENDOR_GEAR_TIER2_PALADIN = 9000004,
    ASSISTANT_VENDOR_GEAR_TIER2_WARRIOR = 9000005,
    ASSISTANT_VENDOR_GEAR_TIER2_MAGE = 9000006,
    ASSISTANT_VENDOR_GEAR_TIER2_WARLOCK = 9000007,
    ASSISTANT_VENDOR_GEAR_TIER2_SHAMAN = 9000008,
    ASSISTANT_VENDOR_GEAR_TIER2_DRUID = 9000009,
    ASSISTANT_VENDOR_GEAR_TIER2_HUNTER = 9000010,
    ASSISTANT_VENDOR_GEAR_TIER2_ROGUE = 9000011,
    ASSISTANT_VENDOR_GEAR_CLOTH = 9000012,
    ASSISTANT_VENDOR_GEAR_LEATHER = 9000013,
    ASSISTANT_VENDOR_GEAR_MAIL = 9000014,
    ASSISTANT_VENDOR_GEAR_PLATE = 9000015,
    ASSISTANT_VENDOR_GEAR_RING = 9000016,
    ASSISTANT_VENDOR_GEAR_TRINKET = 9000017,
    ASSISTANT_VENDOR_GEAR_JEWELRY = 9000018,
    ASSISTANT_VENDOR_GEAR_RELIC = 9000019,
    ASSISTANT_VENDOR_GLYPH = 9000020,
    ASSISTANT_VENDOR_CONTAINER = 9000040,
};

enum Profession
{
    PROFESSION_LEVEL_APPRENTICE = 75,
    PROFESSION_LEVEL_JOURNEYMAN = 150,
    PROFESSION_LEVEL_EXPERT = 225,
    PROFESSION_LEVEL_ARTISAN = 300,
    PROFESSION_LEVEL_MASTER = 375,
    PROFESSION_LEVEL_GRAND_MASTER = 450,
};

enum Level
{
    ASSISTANT_LEVEL_60 = 60,
};

// Vendors
bool enableArmor;
bool enableWeapons;
bool enableGlyphs;
bool enableContainers;

// Professions
bool enableProfessions;
bool enableApprenticeProfession;
bool enableJourneymanProfession;
bool enableExpertProfession;
bool enableArtisanProfession;
bool enableMasterProfession;
bool enableGrandMasterProfession;
uint32 costApprenticeProfession;
uint32 costJourneymanProfession;
uint32 costExpertProfession;
uint32 costArtisanProfession;
uint32 costMasterProfession;
uint32 costGrandMasterProfession;

// Level
bool enableLevel;

class Assistant : public CreatureScript
{
public:
    Assistant() : CreatureScript("npc_assistant") {}

    bool OnGossipHello(Player* player, Creature* creature)
    {
        ClearGossipMenuFor(player);

        if (enableArmor)
            AddGossipItemFor(player, GOSSIP_ICON_TALK, "I want armor", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_ARMOR);

        if (enableWeapons)
            AddGossipItemFor(player, GOSSIP_ICON_TALK, "I want weapons", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_WEAPON);

        if (enableGlyphs)
            AddGossipItemFor(player, GOSSIP_ICON_TALK, "I want glyphs", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_GLYPH);

        if (enableContainers)
            AddGossipItemFor(player, GOSSIP_ICON_TALK, "I want containers", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_CONTAINER);

        if (enableProfessions)
            AddGossipItemFor(player, GOSSIP_ICON_TALK, "I want professions", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_PROFESSIONS);

        if (enableProfessions)
            AddGossipItemFor(player, GOSSIP_ICON_TALK, "I want levels", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_LEVEL);

        SendGossipMenuFor(player, ASSISTANT_GOSSIP_TEXT, creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action)
    {
        if (sender != GOSSIP_SENDER_MAIN)
            return false;

        if (action == 1)
        {
            OnGossipHello(player, creature);
        }
        else if (action == ASSISTANT_GOSSIP_ARMOR)
        {
            ClearGossipMenuFor(player);
            AddGossipItemFor(player, GOSSIP_ICON_VENDOR, "I want tier 2", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_ARMOR + 1);
            AddGossipItemFor(player, GOSSIP_ICON_VENDOR, "I want cloth", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_ARMOR + 2);
            AddGossipItemFor(player, GOSSIP_ICON_VENDOR, "I want leather", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_ARMOR + 3);
            AddGossipItemFor(player, GOSSIP_ICON_VENDOR, "I want mail", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_ARMOR + 4);
            AddGossipItemFor(player, GOSSIP_ICON_VENDOR, "I want plate", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_ARMOR + 5);
            AddGossipItemFor(player, GOSSIP_ICON_VENDOR, "I want rings", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_ARMOR + 6);
            AddGossipItemFor(player, GOSSIP_ICON_VENDOR, "I want trinkets", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_ARMOR + 7);
            AddGossipItemFor(player, GOSSIP_ICON_VENDOR, "I want jewelry", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_ARMOR + 8);
            AddGossipItemFor(player, GOSSIP_ICON_VENDOR, "I want relics", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_ARMOR + 9);
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, "Previous Page", GOSSIP_SENDER_MAIN, 1);
            SendGossipMenuFor(player, ASSISTANT_GOSSIP_TEXT, creature->GetGUID());
        }
        else if (action == ASSISTANT_GOSSIP_ARMOR + 1)
        {
            switch (player->getClass())
            {
                case CLASS_PRIEST:
                    return "Priest";
                    player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GEAR_TIER2_PRIEST);
                    break;
                case CLASS_PALADIN:
                    return "Paladin";
                    player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GEAR_TIER2_PALADIN);
                    break;
                case CLASS_WARRIOR:
                    return "Warrior";
                    player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GEAR_TIER2_WARRIOR);
                    break;
                case CLASS_MAGE:
                    return "Mage";
                    player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GEAR_TIER2_MAGE);
                    break;
                case CLASS_WARLOCK:
                    return "Warlock";
                    player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GEAR_TIER2_WARLOCK);
                    break;
                case CLASS_SHAMAN:
                    return "Shaman";
                    player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GEAR_TIER2_SHAMAN);
                    break;
                case CLASS_DRUID:
                    return "Druid";
                    player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GEAR_TIER2_DRUID);
                    break;
                case CLASS_HUNTER:
                    return "Hunter";
                    player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GEAR_TIER2_HUNTER);
                    break;
                case CLASS_ROGUE:
                    return "Rogue";
                    player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GEAR_TIER2_ROGUE);
                    break;
                case CLASS_DEATH_KNIGHT:
                    return "DeathKnight";
                    AddGossipItemFor(player, GOSSIP_ICON_CHAT, "Previous Page", GOSSIP_SENDER_MAIN, 1);
                    break;
                default:
                    break;
            }
        }
        else if (action == ASSISTANT_GOSSIP_ARMOR + 2)
        {
            player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GEAR_CLOTH);
        }
        else if (action == ASSISTANT_GOSSIP_ARMOR + 3)
        {
            player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GEAR_LEATHER);
        }
        else if (action == ASSISTANT_GOSSIP_ARMOR + 4)
        {
            player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GEAR_MAIL);
        }
        else if (action == ASSISTANT_GOSSIP_ARMOR + 5)
        {
            player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GEAR_PLATE);
        }
        else if (action == ASSISTANT_GOSSIP_ARMOR + 6)
        {
            player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GEAR_RING);
        }
         else if (action == ASSISTANT_GOSSIP_ARMOR + 7)
        {
            player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GEAR_TRINKET);
        }
         else if (action == ASSISTANT_GOSSIP_ARMOR + 8)
        {
            player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GEAR_JEWELRY);
        }
         else if (action == ASSISTANT_GOSSIP_ARMOR + 9)
        {
            player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GEAR_RELIC);
        }
        else if (action == ASSISTANT_GOSSIP_WEAPON)
        {
            ClearGossipMenuFor(player);
            AddGossipItemFor(player, GOSSIP_ICON_VENDOR, "I want one-hand weapons", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_WEAPON + 1);
            AddGossipItemFor(player, GOSSIP_ICON_VENDOR, "I want two-hand weapons", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_WEAPON + 2);
            AddGossipItemFor(player, GOSSIP_ICON_VENDOR, "I want off-hand weapons", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_WEAPON + 3);
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, "Previous Page", GOSSIP_SENDER_MAIN, 1);
            SendGossipMenuFor(player, ASSISTANT_GOSSIP_TEXT, creature->GetGUID());
        }
         else if (action == ASSISTANT_GOSSIP_WEAPON + 1)
        {
            player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GEAR_WEAPON_ONE_HAND);
        }
        else if (action == ASSISTANT_GOSSIP_WEAPON + 2)
        {
            player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GEAR_WEAPON_TWO_HAND);
        }
        else if (action == ASSISTANT_GOSSIP_WEAPON + 3)
        {
            player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GEAR_WEAPON_OFF_HAND);
        }
        else if (action == ASSISTANT_GOSSIP_GLYPH)
        {
            ClearGossipMenuFor(player);
            AddGossipItemFor(player, GOSSIP_ICON_VENDOR, "I want some major glyphs", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_GLYPH + 1);
            AddGossipItemFor(player, GOSSIP_ICON_VENDOR, "I want some minor glyphs", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_GLYPH + 2);
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, "Previous Page", GOSSIP_SENDER_MAIN, 1);
            SendGossipMenuFor(player, ASSISTANT_GOSSIP_TEXT, creature->GetGUID());
        }
        else if (action == ASSISTANT_GOSSIP_GLYPH + 1)
        {
            switch (player->getClass())
            {
            case CLASS_WARRIOR:
                player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GLYPH);
                break;
            case CLASS_PALADIN:
                player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GLYPH + 1);
                break;
            case CLASS_HUNTER:
                player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GLYPH + 2);
                break;
            case CLASS_ROGUE:
                player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GLYPH + 3);
                break;
            case CLASS_PRIEST:
                player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GLYPH + 4);
                break;
            case CLASS_DEATH_KNIGHT:
                player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GLYPH + 5);
                break;
            case CLASS_SHAMAN:
                player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GLYPH + 6);
                break;
            case CLASS_MAGE:
                player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GLYPH + 7);
                break;
            case CLASS_WARLOCK:
                player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GLYPH + 8);
                break;
            case CLASS_DRUID:
                player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GLYPH + 9);
                break;
            }
        }
        else if (action == ASSISTANT_GOSSIP_GLYPH + 2)
        {
            switch (player->getClass())
            {
            case CLASS_WARRIOR:
                player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GLYPH + 10);
                break;
            case CLASS_PALADIN:
                player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GLYPH + 11);
                break;
            case CLASS_HUNTER:
                player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GLYPH + 12);
                break;
            case CLASS_ROGUE:
                player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GLYPH + 13);
                break;
            case CLASS_PRIEST:
                player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GLYPH + 14);
                break;
            case CLASS_DEATH_KNIGHT:
                player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GLYPH + 15);
                break;
            case CLASS_SHAMAN:
                player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GLYPH + 16);
                break;
            case CLASS_MAGE:
                player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GLYPH + 17);
                break;
            case CLASS_WARLOCK:
                player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GLYPH + 18);
                break;
            case CLASS_DRUID:
                player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_GLYPH + 19);
                break;
            }
        }
        else if (action == ASSISTANT_GOSSIP_CONTAINER)
        {
            player->GetSession()->SendListInventory(creature->GetGUID(), ASSISTANT_VENDOR_CONTAINER);
        }
        else if (action == ASSISTANT_GOSSIP_PROFESSIONS)
        {
            ClearGossipMenuFor(player);

            if (player->HasSkill(SKILL_FIRST_AID))
            {
                uint16 currentSkillValue = player->GetSkillValue(SKILL_FIRST_AID);
                uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_FIRST_AID);
                uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_FIRST_AID);

                if (currentSkillValue < maxSkillValue)
                {
                    bool allowUpgrade = false;
                    uint32 professionCost = 0;

                    if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                    {
                        professionCost = costApprenticeProfession * GOLD;
                        if (enableApprenticeProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                    {
                        professionCost = costJourneymanProfession * GOLD;
                        if (enableJourneymanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                    {
                        professionCost = costExpertProfession * GOLD;
                        if (enableExpertProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                    {
                        professionCost = costArtisanProfession * GOLD;
                        if (enableArtisanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                    {
                        professionCost = costMasterProfession * GOLD;
                        if (enableMasterProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                    {
                        professionCost = costGrandMasterProfession * GOLD;
                        if (enableGrandMasterProfession)
                            allowUpgrade = true;
                    }

                    if (allowUpgrade)
                        AddGossipItemFor(player, GOSSIP_ICON_TRAINER, "I want to increase my skill in First Aid", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_PROFESSIONS + 1, "Do you wish to continue the transaction?", professionCost, false);
                }
            }

            if (player->HasSkill(SKILL_BLACKSMITHING))
            {
                uint16 currentSkillValue = player->GetSkillValue(SKILL_BLACKSMITHING);
                uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_BLACKSMITHING);
                uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_BLACKSMITHING);

                if (currentSkillValue < maxSkillValue)
                {
                    bool allowUpgrade = false;
                    uint32 professionCost = 0;

                    if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                    {
                        professionCost = costApprenticeProfession * GOLD;
                        if (enableApprenticeProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                    {
                        professionCost = costJourneymanProfession * GOLD;
                        if (enableJourneymanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                    {
                        professionCost = costExpertProfession * GOLD;
                        if (enableExpertProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                    {
                        professionCost = costArtisanProfession * GOLD;
                        if (enableArtisanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                    {
                        professionCost = costMasterProfession * GOLD;
                        if (enableMasterProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                    {
                        professionCost = costGrandMasterProfession * GOLD;
                        if (enableGrandMasterProfession)
                            allowUpgrade = true;
                    }

                    if (allowUpgrade)
                        AddGossipItemFor(player, GOSSIP_ICON_TRAINER, "I want to increase my skill in Blacksmithing", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_PROFESSIONS + 2, "Do you wish to continue the transaction?", professionCost, false);
                }
            }

            if (player->HasSkill(SKILL_LEATHERWORKING))
            {
                uint16 currentSkillValue = player->GetSkillValue(SKILL_LEATHERWORKING);
                uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_LEATHERWORKING);
                uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_LEATHERWORKING);

                if (currentSkillValue < maxSkillValue)
                {
                    bool allowUpgrade = false;
                    uint32 professionCost = 0;

                    if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                    {
                        professionCost = costApprenticeProfession * GOLD;
                        if (enableApprenticeProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                    {
                        professionCost = costJourneymanProfession * GOLD;
                        if (enableJourneymanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                    {
                        professionCost = costExpertProfession * GOLD;
                        if (enableExpertProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                    {
                        professionCost = costArtisanProfession * GOLD;
                        if (enableArtisanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                    {
                        professionCost = costMasterProfession * GOLD;
                        if (enableMasterProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                    {
                        professionCost = costGrandMasterProfession * GOLD;
                        if (enableGrandMasterProfession)
                            allowUpgrade = true;
                    }

                    if (allowUpgrade)
                        AddGossipItemFor(player, GOSSIP_ICON_TRAINER, "I want to increase my skill in Leatherworking", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_PROFESSIONS + 3, "Do you wish to continue the transaction?", professionCost, false);
                }
            }

            if (player->HasSkill(SKILL_ALCHEMY))
            {
                uint16 currentSkillValue = player->GetSkillValue(SKILL_ALCHEMY);
                uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_ALCHEMY);
                uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_ALCHEMY);

                if (currentSkillValue < maxSkillValue)
                {
                    bool allowUpgrade = false;
                    uint32 professionCost = 0;

                    if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                    {
                        professionCost = costApprenticeProfession * GOLD;
                        if (enableApprenticeProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                    {
                        professionCost = costJourneymanProfession * GOLD;
                        if (enableJourneymanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                    {
                        professionCost = costExpertProfession * GOLD;
                        if (enableExpertProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                    {
                        professionCost = costArtisanProfession * GOLD;
                        if (enableArtisanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                    {
                        professionCost = costMasterProfession * GOLD;
                        if (enableMasterProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                    {
                        professionCost = costGrandMasterProfession * GOLD;
                        if (enableGrandMasterProfession)
                            allowUpgrade = true;
                    }

                    if (allowUpgrade)
                        AddGossipItemFor(player, GOSSIP_ICON_TRAINER, "I want to increase my skill in Alchemy", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_PROFESSIONS + 4, "Do you wish to continue the transaction?", professionCost, false);
                }
            }

            if (player->HasSkill(SKILL_HERBALISM))
            {
                uint16 currentSkillValue = player->GetSkillValue(SKILL_HERBALISM);
                uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_HERBALISM);
                uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_HERBALISM);

                if (currentSkillValue < maxSkillValue)
                {
                    bool allowUpgrade = false;
                    uint32 professionCost = 0;

                    if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                    {
                        professionCost = costApprenticeProfession * GOLD;
                        if (enableApprenticeProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                    {
                        professionCost = costJourneymanProfession * GOLD;
                        if (enableJourneymanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                    {
                        professionCost = costExpertProfession * GOLD;
                        if (enableExpertProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                    {
                        professionCost = costArtisanProfession * GOLD;
                        if (enableArtisanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                    {
                        professionCost = costMasterProfession * GOLD;
                        if (enableMasterProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                    {
                        professionCost = costGrandMasterProfession * GOLD;
                        if (enableGrandMasterProfession)
                            allowUpgrade = true;
                    }

                    if (allowUpgrade)
                        AddGossipItemFor(player, GOSSIP_ICON_TRAINER, "I want to increase my skill in Herbalism", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_PROFESSIONS + 5, "Do you wish to continue the transaction?", professionCost, false);
                }
            }

            if (player->HasSkill(SKILL_COOKING))
            {
                uint16 currentSkillValue = player->GetSkillValue(SKILL_COOKING);
                uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_COOKING);
                uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_COOKING);

                if (currentSkillValue < maxSkillValue)
                {
                    bool allowUpgrade = false;
                    uint32 professionCost = 0;

                    if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                    {
                        professionCost = costApprenticeProfession * GOLD;
                        if (enableApprenticeProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                    {
                        professionCost = costJourneymanProfession * GOLD;
                        if (enableJourneymanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                    {
                        professionCost = costExpertProfession * GOLD;
                        if (enableExpertProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                    {
                        professionCost = costArtisanProfession * GOLD;
                        if (enableArtisanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                    {
                        professionCost = costMasterProfession * GOLD;
                        if (enableMasterProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                    {
                        professionCost = costGrandMasterProfession * GOLD;
                        if (enableGrandMasterProfession)
                            allowUpgrade = true;
                    }

                    if (allowUpgrade)
                        AddGossipItemFor(player, GOSSIP_ICON_TRAINER, "I want to increase my skill in Cooking", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_PROFESSIONS + 6, "Do you wish to continue the transaction?", professionCost, false);
                }
            }

            if (player->HasSkill(SKILL_MINING))
            {
                uint16 currentSkillValue = player->GetSkillValue(SKILL_MINING);
                uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_MINING);
                uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_MINING);

                if (currentSkillValue < maxSkillValue)
                {
                    bool allowUpgrade = false;
                    uint32 professionCost = 0;

                    if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                    {
                        professionCost = costApprenticeProfession * GOLD;
                        if (enableApprenticeProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                    {
                        professionCost = costJourneymanProfession * GOLD;
                        if (enableJourneymanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                    {
                        professionCost = costExpertProfession * GOLD;
                        if (enableExpertProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                    {
                        professionCost = costArtisanProfession * GOLD;
                        if (enableArtisanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                    {
                        professionCost = costMasterProfession * GOLD;
                        if (enableMasterProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                    {
                        professionCost = costGrandMasterProfession * GOLD;
                        if (enableGrandMasterProfession)
                            allowUpgrade = true;
                    }

                    if (allowUpgrade)
                        AddGossipItemFor(player, GOSSIP_ICON_TRAINER, "I want to increase my skill in Mining", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_PROFESSIONS + 7, "Do you wish to continue the transaction?", professionCost, false);
                }
            }

            if (player->HasSkill(SKILL_TAILORING))
            {
                uint16 currentSkillValue = player->GetSkillValue(SKILL_TAILORING);
                uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_TAILORING);
                uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_TAILORING);

                if (currentSkillValue < maxSkillValue)
                {
                    bool allowUpgrade = false;
                    uint32 professionCost = 0;

                    if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                    {
                        professionCost = costApprenticeProfession * GOLD;
                        if (enableApprenticeProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                    {
                        professionCost = costJourneymanProfession * GOLD;
                        if (enableJourneymanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                    {
                        professionCost = costExpertProfession * GOLD;
                        if (enableExpertProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                    {
                        professionCost = costArtisanProfession * GOLD;
                        if (enableArtisanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                    {
                        professionCost = costMasterProfession * GOLD;
                        if (enableMasterProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                    {
                        professionCost = costGrandMasterProfession * GOLD;
                        if (enableGrandMasterProfession)
                            allowUpgrade = true;
                    }

                    if (allowUpgrade)
                        AddGossipItemFor(player, GOSSIP_ICON_TRAINER, "I want to increase my skill in Tailoring", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_PROFESSIONS + 8, "Do you wish to continue the transaction?", professionCost, false);
                }
            }

            if (player->HasSkill(SKILL_ENGINEERING))
            {
                uint16 currentSkillValue = player->GetSkillValue(SKILL_ENGINEERING);
                uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_ENGINEERING);
                uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_ENGINEERING);

                if (currentSkillValue < maxSkillValue)
                {
                    bool allowUpgrade = false;
                    uint32 professionCost = 0;

                    if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                    {
                        professionCost = costApprenticeProfession * GOLD;
                        if (enableApprenticeProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                    {
                        professionCost = costJourneymanProfession * GOLD;
                        if (enableJourneymanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                    {
                        professionCost = costExpertProfession * GOLD;
                        if (enableExpertProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                    {
                        professionCost = costArtisanProfession * GOLD;
                        if (enableArtisanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                    {
                        professionCost = costMasterProfession * GOLD;
                        if (enableMasterProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                    {
                        professionCost = costGrandMasterProfession * GOLD;
                        if (enableGrandMasterProfession)
                            allowUpgrade = true;
                    }

                    if (allowUpgrade)
                        AddGossipItemFor(player, GOSSIP_ICON_TRAINER, "I want to increase my skill in Engineering", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_PROFESSIONS + 9, "Do you wish to continue the transaction?", professionCost, false);
                }
            }

            if (player->HasSkill(SKILL_ENCHANTING))
            {
                uint16 currentSkillValue = player->GetSkillValue(SKILL_ENCHANTING);
                uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_ENCHANTING);
                uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_ENCHANTING);

                if (currentSkillValue < maxSkillValue)
                {
                    bool allowUpgrade = false;
                    uint32 professionCost = 0;

                    if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                    {
                        professionCost = costApprenticeProfession * GOLD;
                        if (enableApprenticeProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                    {
                        professionCost = costJourneymanProfession * GOLD;
                        if (enableJourneymanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                    {
                        professionCost = costExpertProfession * GOLD;
                        if (enableExpertProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                    {
                        professionCost = costArtisanProfession * GOLD;
                        if (enableArtisanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                    {
                        professionCost = costMasterProfession * GOLD;
                        if (enableMasterProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                    {
                        professionCost = costGrandMasterProfession * GOLD;
                        if (enableGrandMasterProfession)
                            allowUpgrade = true;
                    }

                    if (allowUpgrade)
                        AddGossipItemFor(player, GOSSIP_ICON_TRAINER, "I want to increase my skill in Enchanting", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_PROFESSIONS + 10, "Do you wish to continue the transaction?", professionCost, false);
                }
            }

            if (player->HasSkill(SKILL_FISHING))
            {
                uint16 currentSkillValue = player->GetSkillValue(SKILL_FISHING);
                uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_FISHING);
                uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_FISHING);

                if (currentSkillValue < maxSkillValue)
                {
                    bool allowUpgrade = false;
                    uint32 professionCost = 0;

                    if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                    {
                        professionCost = costApprenticeProfession * GOLD;
                        if (enableApprenticeProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                    {
                        professionCost = costJourneymanProfession * GOLD;
                        if (enableJourneymanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                    {
                        professionCost = costExpertProfession * GOLD;
                        if (enableExpertProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                    {
                        professionCost = costArtisanProfession * GOLD;
                        if (enableArtisanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                    {
                        professionCost = costMasterProfession * GOLD;
                        if (enableMasterProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                    {
                        professionCost = costGrandMasterProfession * GOLD;
                        if (enableGrandMasterProfession)
                            allowUpgrade = true;
                    }

                    if (allowUpgrade)
                        AddGossipItemFor(player, GOSSIP_ICON_TRAINER, "I want to increase my skill in Fishing", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_PROFESSIONS + 11, "Do you wish to continue the transaction?", professionCost, false);
                }
            }

            if (player->HasSkill(SKILL_SKINNING))
            {
                uint16 currentSkillValue = player->GetSkillValue(SKILL_SKINNING);
                uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_SKINNING);
                uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_SKINNING);

                if (currentSkillValue < maxSkillValue)
                {
                    bool allowUpgrade = false;
                    uint32 professionCost = 0;

                    if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                    {
                        professionCost = costApprenticeProfession * GOLD;
                        if (enableApprenticeProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                    {
                        professionCost = costJourneymanProfession * GOLD;
                        if (enableJourneymanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                    {
                        professionCost = costExpertProfession * GOLD;
                        if (enableExpertProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                    {
                        professionCost = costArtisanProfession * GOLD;
                        if (enableArtisanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                    {
                        professionCost = costMasterProfession * GOLD;
                        if (enableMasterProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                    {
                        professionCost = costGrandMasterProfession * GOLD;
                        if (enableGrandMasterProfession)
                            allowUpgrade = true;
                    }

                    if (allowUpgrade)
                        AddGossipItemFor(player, GOSSIP_ICON_TRAINER, "I want to increase my skill in Skinning", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_PROFESSIONS + 12, "Do you wish to continue the transaction?", professionCost, false);
                }
            }

            if (player->HasSkill(SKILL_INSCRIPTION))
            {
                uint16 currentSkillValue = player->GetSkillValue(SKILL_INSCRIPTION);
                uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_INSCRIPTION);
                uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_INSCRIPTION);

                if (currentSkillValue < maxSkillValue)
                {
                    bool allowUpgrade = false;
                    uint32 professionCost = 0;

                    if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                    {
                        professionCost = costApprenticeProfession * GOLD;
                        if (enableApprenticeProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                    {
                        professionCost = costJourneymanProfession * GOLD;
                        if (enableJourneymanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                    {
                        professionCost = costExpertProfession * GOLD;
                        if (enableExpertProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                    {
                        professionCost = costArtisanProfession * GOLD;
                        if (enableArtisanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                    {
                        professionCost = costMasterProfession * GOLD;
                        if (enableMasterProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                    {
                        professionCost = costGrandMasterProfession * GOLD;
                        if (enableGrandMasterProfession)
                            allowUpgrade = true;
                    }

                    if (allowUpgrade)
                        AddGossipItemFor(player, GOSSIP_ICON_TRAINER, "I want to increase my skill in Inscription", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_PROFESSIONS + 13, "Do you wish to continue the transaction?", professionCost, false);
                }
            }

            if (player->HasSkill(SKILL_JEWELCRAFTING))
            {
                uint16 currentSkillValue = player->GetSkillValue(SKILL_JEWELCRAFTING);
                uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_JEWELCRAFTING);
                uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_JEWELCRAFTING);

                if (currentSkillValue < maxSkillValue)
                {
                    bool allowUpgrade = false;
                    uint32 professionCost = 0;

                    if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                    {
                        professionCost = costApprenticeProfession * GOLD;
                        if (enableApprenticeProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                    {
                        professionCost = costJourneymanProfession * GOLD;
                        if (enableJourneymanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                    {
                        professionCost = costExpertProfession * GOLD;
                        if (enableExpertProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                    {
                        professionCost = costArtisanProfession * GOLD;
                        if (enableArtisanProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                    {
                        professionCost = costMasterProfession * GOLD;
                        if (enableMasterProfession)
                            allowUpgrade = true;
                    }
                    else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                    {
                        professionCost = costGrandMasterProfession * GOLD;
                        if (enableGrandMasterProfession)
                            allowUpgrade = true;
                    }

                    if (allowUpgrade)
                        AddGossipItemFor(player, GOSSIP_ICON_TRAINER, "I want to increase my skill in Jewelcrafting", GOSSIP_SENDER_MAIN, ASSISTANT_GOSSIP_PROFESSIONS + 14, "Do you wish to continue the transaction?", professionCost, false);
                }
            }

            AddGossipItemFor(player, GOSSIP_ICON_CHAT, "Previous Page", GOSSIP_SENDER_MAIN, 1);
            SendGossipMenuFor(player, ASSISTANT_GOSSIP_TEXT, creature->GetGUID());
        }
        else if (action == ASSISTANT_GOSSIP_PROFESSIONS + 1)
        {
            uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_FIRST_AID);
            uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_FIRST_AID);
            uint32 professionCost = 0;

            if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                professionCost = costApprenticeProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                professionCost = costJourneymanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                professionCost = costExpertProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                professionCost = costArtisanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                professionCost = costMasterProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                professionCost = costGrandMasterProfession * GOLD;

            player->SetSkill(SKILL_FIRST_AID, 0, maxSkillValue, maxSkillValue);
            player->ModifyMoney(-professionCost);
            CloseGossipMenuFor(player);
        }
        else if (action == ASSISTANT_GOSSIP_PROFESSIONS + 2)
        {
            uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_BLACKSMITHING);
            uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_BLACKSMITHING);
            uint32 professionCost = 0;

            if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                professionCost = costApprenticeProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                professionCost = costJourneymanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                professionCost = costExpertProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                professionCost = costArtisanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                professionCost = costMasterProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                professionCost = costGrandMasterProfession * GOLD;

            player->SetSkill(SKILL_BLACKSMITHING, 0, maxSkillValue, maxSkillValue);
            player->ModifyMoney(-professionCost);
            CloseGossipMenuFor(player);
        }
        else if (action == ASSISTANT_GOSSIP_PROFESSIONS + 3)
        {
            uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_LEATHERWORKING);
            uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_LEATHERWORKING);
            uint32 professionCost = 0;

            if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                professionCost = costApprenticeProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                professionCost = costJourneymanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                professionCost = costExpertProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                professionCost = costArtisanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                professionCost = costMasterProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                professionCost = costGrandMasterProfession * GOLD;

            player->SetSkill(SKILL_LEATHERWORKING, 0, maxSkillValue, maxSkillValue);
            player->ModifyMoney(-professionCost);
            CloseGossipMenuFor(player);
        }
        else if (action == ASSISTANT_GOSSIP_PROFESSIONS + 4)
        {
            uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_ALCHEMY);
            uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_ALCHEMY);
            uint32 professionCost = 0;

            if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                professionCost = costApprenticeProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                professionCost = costJourneymanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                professionCost = costExpertProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                professionCost = costArtisanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                professionCost = costMasterProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                professionCost = costGrandMasterProfession * GOLD;

            player->SetSkill(SKILL_ALCHEMY, 0, maxSkillValue, maxSkillValue);
            player->ModifyMoney(-professionCost);
            CloseGossipMenuFor(player);
        }
        else if (action == ASSISTANT_GOSSIP_PROFESSIONS + 5)
        {
            uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_HERBALISM);
            uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_HERBALISM);
            uint32 professionCost = 0;

            if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                professionCost = costApprenticeProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                professionCost = costJourneymanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                professionCost = costExpertProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                professionCost = costArtisanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                professionCost = costMasterProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                professionCost = costGrandMasterProfession * GOLD;

            player->SetSkill(SKILL_HERBALISM, 0, maxSkillValue, maxSkillValue);
            player->ModifyMoney(-professionCost);
            CloseGossipMenuFor(player);
        }
        else if (action == ASSISTANT_GOSSIP_PROFESSIONS + 6)
        {
            uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_COOKING);
            uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_COOKING);
            uint32 professionCost = 0;

            if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                professionCost = costApprenticeProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                professionCost = costJourneymanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                professionCost = costExpertProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                professionCost = costArtisanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                professionCost = costMasterProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                professionCost = costGrandMasterProfession * GOLD;

            player->SetSkill(SKILL_COOKING, 0, maxSkillValue, maxSkillValue);
            player->ModifyMoney(-professionCost);
            CloseGossipMenuFor(player);
        }
        else if (action == ASSISTANT_GOSSIP_PROFESSIONS + 7)
        {
            uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_MINING);
            uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_MINING);
            uint32 professionCost = 0;

            if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                professionCost = costApprenticeProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                professionCost = costJourneymanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                professionCost = costExpertProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                professionCost = costArtisanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                professionCost = costMasterProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                professionCost = costGrandMasterProfession * GOLD;

            player->SetSkill(SKILL_MINING, 0, maxSkillValue, maxSkillValue);
            player->ModifyMoney(-professionCost);
            CloseGossipMenuFor(player);
        }
        else if (action == ASSISTANT_GOSSIP_PROFESSIONS + 8)
        {
            uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_TAILORING);
            uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_TAILORING);
            uint32 professionCost = 0;

            if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                professionCost = costApprenticeProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                professionCost = costJourneymanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                professionCost = costExpertProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                professionCost = costArtisanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                professionCost = costMasterProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                professionCost = costGrandMasterProfession * GOLD;

            player->SetSkill(SKILL_TAILORING, 0, maxSkillValue, maxSkillValue);
            player->ModifyMoney(-professionCost);
            CloseGossipMenuFor(player);
        }
        else if (action == ASSISTANT_GOSSIP_PROFESSIONS + 9)
        {
            uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_ENGINEERING);
            uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_ENGINEERING);
            uint32 professionCost = 0;

            if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                professionCost = costApprenticeProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                professionCost = costJourneymanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                professionCost = costExpertProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                professionCost = costArtisanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                professionCost = costMasterProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                professionCost = costGrandMasterProfession * GOLD;

            player->SetSkill(SKILL_ENGINEERING, 0, maxSkillValue, maxSkillValue);
            player->ModifyMoney(-professionCost);
            CloseGossipMenuFor(player);
        }
        else if (action == ASSISTANT_GOSSIP_PROFESSIONS + 10)
        {
            uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_ENCHANTING);
            uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_ENCHANTING);
            uint32 professionCost = 0;

            if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                professionCost = costApprenticeProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                professionCost = costJourneymanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                professionCost = costExpertProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                professionCost = costArtisanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                professionCost = costMasterProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                professionCost = costGrandMasterProfession * GOLD;

            player->SetSkill(SKILL_ENCHANTING, 0, maxSkillValue, maxSkillValue);
            player->ModifyMoney(-professionCost);
            CloseGossipMenuFor(player);
        }
        else if (action == ASSISTANT_GOSSIP_PROFESSIONS + 11)
        {
            uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_FISHING);
            uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_FISHING);
            uint32 professionCost = 0;

            if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                professionCost = costApprenticeProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                professionCost = costJourneymanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                professionCost = costExpertProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                professionCost = costArtisanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                professionCost = costMasterProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                professionCost = costGrandMasterProfession * GOLD;

            player->SetSkill(SKILL_FISHING, 0, maxSkillValue, maxSkillValue);
            player->ModifyMoney(-professionCost);
            CloseGossipMenuFor(player);
        }
        else if (action == ASSISTANT_GOSSIP_PROFESSIONS + 12)
        {
            uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_SKINNING);
            uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_SKINNING);
            uint32 professionCost = 0;

            if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                professionCost = costApprenticeProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                professionCost = costJourneymanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                professionCost = costExpertProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                professionCost = costArtisanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                professionCost = costMasterProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                professionCost = costGrandMasterProfession * GOLD;

            player->SetSkill(SKILL_SKINNING, 0, maxSkillValue, maxSkillValue);
            player->ModifyMoney(-professionCost);
            CloseGossipMenuFor(player);
        }
        else if (action == ASSISTANT_GOSSIP_PROFESSIONS + 13)
        {
            uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_INSCRIPTION);
            uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_INSCRIPTION);
            uint32 professionCost = 0;

            if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                professionCost = costApprenticeProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                professionCost = costJourneymanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                professionCost = costExpertProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                professionCost = costArtisanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                professionCost = costMasterProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                professionCost = costGrandMasterProfession * GOLD;

            player->SetSkill(SKILL_INSCRIPTION, 0, maxSkillValue, maxSkillValue);
            player->ModifyMoney(-professionCost);
            CloseGossipMenuFor(player);
        }
        else if (action == ASSISTANT_GOSSIP_PROFESSIONS + 14)
        {
            uint16 maxSkillValue = player->GetMaxSkillValue(SKILL_JEWELCRAFTING);
            uint16 pureMaxSkillValue = player->GetPureMaxSkillValue(SKILL_JEWELCRAFTING);
            uint32 professionCost = 0;

            if (pureMaxSkillValue == PROFESSION_LEVEL_APPRENTICE)
                professionCost = costApprenticeProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_JOURNEYMAN)
                professionCost = costJourneymanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_EXPERT)
                professionCost = costExpertProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_ARTISAN)
                professionCost = costArtisanProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_MASTER)
                professionCost = costMasterProfession * GOLD;
            else if (pureMaxSkillValue == PROFESSION_LEVEL_GRAND_MASTER)
                professionCost = costGrandMasterProfession * GOLD;

            player->SetSkill(SKILL_JEWELCRAFTING, 0, maxSkillValue, maxSkillValue);
            player->ModifyMoney(-professionCost);
            CloseGossipMenuFor(player);
        }
        else if (action == ASSISTANT_GOSSIP_LEVEL + 1)
        {
            if (player->getLevel() != ASSISTANT_LEVEL_60)
            {
                player->SetLevel(ASSISTANT_LEVEL_60, true);
            }
        }
        return true;
    }
};

class Configuration : public WorldScript
{
public:
    Configuration() : WorldScript("Configuration") {}

    void OnAfterConfigLoad(bool /*reload*/) override
    {
        // Vendors
        enableArmor = sConfigMgr->GetOption<bool>("Assistant.Armor", 0);
        enableWeapons = sConfigMgr->GetOption<bool>("Assistant.Weapons", 0);
        enableGlyphs = sConfigMgr->GetOption<bool>("Assistant.Glyphs", 0);
        enableContainers = sConfigMgr->GetOption<bool>("Assistant.Containers", 0);

        // Professions
        enableProfessions = sConfigMgr->GetOption<bool>("Assistant.Professions", 0);
        enableApprenticeProfession = sConfigMgr->GetOption<bool>("Assistant.Professions.Apprentice.Enabled", 1);
        enableJourneymanProfession = sConfigMgr->GetOption<bool>("Assistant.Professions.Journeyman.Enabled", 1);
        enableExpertProfession = sConfigMgr->GetOption<bool>("Assistant.Professions.Expert.Enabled", 1);
        enableArtisanProfession = sConfigMgr->GetOption<bool>("Assistant.Professions.Artisan.Enabled", 1);
        enableMasterProfession = sConfigMgr->GetOption<bool>("Assistant.Professions.Master.Enabled", 0);
        enableGrandMasterProfession = sConfigMgr->GetOption<bool>("Assistant.Professions.GrandMaster.Enabled", 0);
        costApprenticeProfession = sConfigMgr->GetOption<uint32>("Assistant.Professions.Apprentice.Cost", 100);
        costJourneymanProfession = sConfigMgr->GetOption<uint32>("Assistant.Professions.Journeyman.Cost", 250);
        costExpertProfession = sConfigMgr->GetOption<uint32>("Assistant.Professions.Expert.Cost", 500);
        costArtisanProfession = sConfigMgr->GetOption<uint32>("Assistant.Professions.Artisan.Cost", 750);
        costMasterProfession = sConfigMgr->GetOption<uint32>("Assistant.Professions.Master.Cost", 1250);
        costGrandMasterProfession = sConfigMgr->GetOption<uint32>("Assistant.Professions.GrandMaster.Cost", 2500);

        // Level
        enableLevel = sConfigMgr->GetOption<bool>("Assistant.Levels", 0);
    }
};

void AddSC_mod_assistant()
{
    new Assistant();
    new Configuration();
}
