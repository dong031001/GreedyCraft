/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 800

import crafttweaker.game.IGame;

val localizationMap as string[string] = {
    "dragon.minion": "龙之侍从",
    "dragon.larva": "龙之幼体",
    "wither.minion": "凋灵侍从",
    "material.adamant.name": "精金",
    "tile.adamant_block.name": "精金块",
    "tile.adamant_ore.name": "精金矿",
    "item.adamant_nugget.name": "精金粒",
    "item.adamant_dust.name": "精金粉",
    "item.adamant_ingot.name": "精金锭",
    "fluid.tconstruct.adamant_fluid.name": "熔融精金",
    "tile.thaumadditions:adaminite_smelter.name": "铿金源质冶炼厂",
    "tile.thaumadditions:jar_adaminite.name": "铿金源质罐子",
    "tile.thaumadditions:adaminite_block.name": "铿金块",
    "item.thaumadditions:adaminite_nugget.name": "铿金粒",
    "item.thaumadditions:adaminite_ingot.name": "铿金锭",
    "item.thaumadditions:adaminite_plate.name": "铿金板",
    "item.thaumadditions:adaminite_nugget.name": "铿金粒",
    "item.thaumadditions:adaminite_fabric.name": "铿金布匹",
    "item.thaumadditions:adaminite_sword.name": "铿金剑",
    "item.thaumadditions:adaminite_hood.name": "铿金神秘使兜帽",
    "item.thaumadditions:adaminite_robe.name": "铿金神秘使法袍",
    "item.thaumadditions:adaminite_belt.name": "铿金神秘使腰带",
    "item.thaumadditions:adaminite_boots.name": "铿金神秘使靴子",
    "research_name.thaumadditions:adaminite": "铿金金属",
    "research_stage.thaumadditions:adaminite.2": "我的实验已大获成功！书中它这种新造物称之为“铿金”。我都要疯了！我听说过灵液，神之血，但我认为这金属要远比灵液好，尽管它存在于这世上的任何地方。",
    "research_name.thaumadditions:adaminite_smelter": "铿金源质冶炼厂",
    "research_stage.thaumadditions:adaminite_smelter.2": "好啊！铿金似乎更好更高效！铿金源质冶炼厂现在能多产生 20% 源质。这意味着我可以更少的冶炼源质了。",
    "research_stage.thaumadditions:mithminite_smelter.1": "我想要改进铿金源质冶炼厂的质量并让它更快并且经常产生额外的源质。我知道秘金应该能有所帮助，并且我需要一点实验来确认我的想法是正确的。",
    "research_name.thaumadditions:adaminite_smelter": "铿金源质冶炼厂",
    "research_name.thaumadditions:adaminite_jar": "铿金源质罐子",
    "research_stage.thaumadditions:mithminite_jar.2": "我的结论是正确的，铿金罐子可以被秘金合金用一中复杂的注魔来觉醒, 这种新的（我希望是最终的）罐子可以装 4000 点源质，是铿金源质罐子的两倍。 我同时也注意到这罐子能销毁流入的多余源质，这可能对我的那些旧的虚空罐子是应该很不错的升级，而且这也不会因为源质溢出而爆炸。",
    "research_stage.thaumadditions:adaminite_jar.2": "铿金非常独特！我认为这个罐子可以容纳 2000 点源质，这使得它内部空间的源质十分稠密。",
    "research_stage.thaumadditions:adaminite_jar.3": "铿金非常独特！我认为这个罐子可以容纳 2000 点源质，这使得它内部空间的源质十分稠密。我听到一个叫泽尔西伦的人的声音，他是其中一位创世者，曾创造了这个世界。他轻声低语道：“这个罐子密度太大了，也许在某些特定的情况下会不稳定。我不认为把它完全装满源质是一个好主意...”。我从他的话语中也听出他非常惊讶于我所完成的这一艰难的挑战。",
    "research_stage.thaumadditions:mithminite_jar.1": "既然已我知晓了用秘银和一些水银可能可以觉醒铿金，我只需知道我能否负担得起这些秘金源质罐子。",
    "modifier.mutate.name": "突变",
    "modifier.mutate.desc": "似乎有什么在变化？",
    "material.prometheum.name": "普罗姆",
    "tile.prometheum_block.name": "普罗姆块",
    "tile.prometheum_ore.name": "普罗姆矿",
    "item.prometheum_nugget.name": "普罗姆粒",
    "item.prometheum_dust.name": "普罗姆粉",
    "item.prometheum_ingot.name": "普罗姆锭",
    "fluid.tconstruct.prometheum_fluid.name": "熔融普罗姆",
    "jaopca.entry.Ambrosium": "神能晶",
    "thaumicaugmentation.text.entered_void": "你拜访了无尽的虚空。",
    "thaumicaugmentation.text.mountain": "你拜访了一座高山。",
    "thaumicaugmentation.text.desert": "你拜访了一片荒漠。",
    "thaumicaugmentation.text.ocean": "你拜访了一片大海。",
    "thaumicaugmentation.text.forest": "你拜访了一片森林。",
    "thaumicaugmentation.text.impetus_damage": "你感受到了冲力带来的震撼。",
    "thaumicaugmentation.text.long_time_in_water": "你逐渐地适应了深水的压力。",
    "thaumicaugmentation.text.entered_spire": "你发现了%s。",
    "thaumicaugmentation.text.boss_room_spire": "你发现了尖塔的核心。",
    "death.attack.cinderSpark": "%s被%s的火球烧成了灰烬。",
    "botania_tweaks.entrodupe.nicetry": "TNT复制机？给爷爬。能不能拿点正常的东西喂我？！",
    "fluid.fusion_matrix": "熔融聚合矩阵",
    "fluid.insanium": "熔融究极精华",
    "jaopca.entry.Infernium": "永燃",
    "jaopca.entry.Titanium": "钛金",
    "jaopca.entry.LiquifiedCoralium": "精炼珊瑚",
    "fluid.cryonium": "熔融极寒",
    "jaopca.entry.Cryonium": "极寒",
    "jaopca.entry.Experience": "知识精华",
    "fluid.ethaxium": "熔融伊桑斯",
    "jaopca.entry.Cytosinite": "胞嘧",
    "jaopca.entry.Umbrium": "影素",
    "jaopca.entry.Hephaestite": "赫菲斯辛",
    "jaopca.entry.Scarlite": "绯红宝石",
    "jaopca.entry.Chromium": "铬",
    "jaopca.entry.Aqualite": "水华",
    "fluid.mithrillium": "熔融秘银",
    "fluid.adaminite": "熔融铿金",
    "fluid.mithminite": "熔融秘金",
    "fluid.ravaging": "毁灭流质",
    "fluid.gaia": "熔融盖亚魂锭",
    "fluid.terra_alloy": "熔融大地合金",
    "fluid.cosmilite": "寰宇超流体",
    "fluid.astral_metal": "星辰涌流",
    "fluid.orichalcos": "熔融奥利哈钢",
    "fluid.netherite": "熔融下界合金",
    "fluid.ancient_debris": "熔融远古残骸",
    "fluid.scorched": "熔融高炉砖",
    "fluid.organic_fluid": "有机液",
    "fluid.poison": "毒液",
    "fluid.modularium": "熔融模块化合金",
    "fluid.meteor": "熔融陨星",
    "fluid.stainless_steel": "熔融不锈钢",
    "fluid.protonium": "超密质子流体",
    "fluid.electronium": "粘性电子流质",
    "fluid.crimsonite": "猩红浆液",
    "fluid.manganese_steel": "熔融锰钢",
    "jaopca.entry.Dilithium": "双锂",
    "jaopca.entry.Asgardium": "神金",
    "jaopca.entry.Shadowium": "暗影",
    "jaopca.entry.Aeroite": "云浮",
    "jaopca.entry.AncientDebris": "远古残骸",
    "jaopca.entry.Meteor": "陨星",
    "jaopca.entry.Manganese": "锰铁",
    "jer.worldgen.averageChunk": "平均每区块方块数",
    "entity.spiderstpo.better_cave_spider.name": "洞穴蜘蛛",
    "entity.spiderstpo.better_spider.name": "蜘蛛",
    "death.attack.curse": "%s死于腐化的诅咒。",
    "craftcheck.failure.item.input": "缺少物品输入！",
    "craftcheck.failure.item.output.space": "没有足够的空间以供输出物品！",
    "craftcheck.failure.fluid.input": "缺少流体输入！",
    "craftcheck.failure.fluid.output.space": "没有足够的空间以供输出流体！",
    "craftcheck.failure.gas.input": "缺少气体输入！",
    "craftcheck.failure.gas.output.space": "没有足够的空间以供输出气体！",
    "craftcheck.failure.energy.input": "缺少能量输入！",
    "component.missing.modularmachinery.energy.output": "没有找到能量输出仓！",
    "component.missing.modularmachinery.energy.input": "没有找到能量输入仓！",
    "component.missing.modularmachinery.fluid.output": "没有找到流体输出仓！",
    "component.missing.modularmachinery.fluid.input": "没有找到流体输入仓！",
    "component.missing.modularmachinery.gas.output": "没有找到流体输出仓以供输出气体！",
    "component.missing.modularmachinery.gas.input": "没有找到流体输入仓以供输入气体！",
    "component.missing.modularmachinery.item.output": "没有找到物品输出仓！",
    "component.missing.modularmachinery.item.input": "没有找到物品输入仓！",
    "item.aether_portal_frame.name": "一键式天境传送门",
    "modifier.tconevo.crystalline.desc": "§c§n[已禁用]§r\n该特性将不会出现在工具或盔甲上。",
    "modifier.tconevo.will_strength_armor.desc": "§c§n[已禁用]§r\n该特性将不会出现在工具或盔甲上。",
    "tconevo.info.cannot_replace": "§c无法替换该部件。\n§e拥有进化属性的工具的部件无法被替换。",
    "tconevo.info.artifact_sealed": "§c无法改动未启封的“匠心之作”！\n§e要想改动该工具，请用工具锻造台将工具和§5启封之板§e合成。",
    "text.component.animus.transposition.cleared": "移位标记已清除！",
    "item.bloodmagic.alchemic_vial.base.name": "炼金之瓶",
    "tile.bloodarsenal.slate..name": "石板砖",
    "message.touhou_little_maid.change_model.disabled": "§e皮肤切换功能已被禁止，请使用§6扭蛋机§e抽取女仆皮肤！",
    "entity.Dummy.name": "训练用假人",
    "item.bountifulbaubles.trinketAnkhCharm.name": "安赫护符",
    "item.heart_food.name": "§c心之容器 EX§r",
    "tooltip.itemstages.name.default": "§5§ka§r §d未知物品 §5§ka§r",
    "commands.publish.started": "§e已在端口§6%s§e上开启局域网游戏。 \n§7(如果需要非正版玩家登录，请在整合包根目录的config/serverGlobalConfig.properties中把online-mode后面的true改成false)",
    "betterfoliage.rendererror": "§a[更好的树叶]§f 在渲染原木方块 %s （位于%s）时出错。§7（该提示一般可忽略）",
    "potion.saturation": "饱腹",
    "tconevo.info.cannot_replace": "无法替换该工具部件！（注：无法替换掉带有进化属性的部件）",
    "tile.quark:monster_box.name": "§c陷阱刷怪笼"
} as string[string];

for k, v in localizationMap {
    game.setLocalization("zh_cn", k, v);
}

/*
game.setLocalization("critword.0", "暴击！");
game.setLocalization("critword.1", "正中靶心！");
game.setLocalization("critword.2", "啊呀！");
game.setLocalization("critword.3", "致命一击！");
game.setLocalization("critword.4", "致命！");
game.setLocalization("critword.5", "砰！");
game.setLocalization("critword.6", "咚！");
game.setLocalization("critword.7", "正中要害！");
game.setLocalization("critword.8", "出色！");
game.setLocalization("critword.9", "重击！");
game.setLocalization("critword.10", "出色！");
game.setLocalization("critword.11", "精彩！");
game.setLocalization("critword.12", "哇呀！");
game.setLocalization("critword.13", "重击！");
game.setLocalization("critword.14", "暴击！");
game.setLocalization("critword.15", "粉碎性！");
game.setLocalization("critword.16", "压倒！");
game.setLocalization("critword.17", "致命一击！");
game.setLocalization("critword.19", "出色！");
game.setLocalization("critword.20", "重击！");
game.setLocalization("critword.21", "压倒性攻击！");
game.setLocalization("critword.22", "无人能挡！");
game.setLocalization("critword.23", "超神！");
game.setLocalization("critword.24", "精准命中！");
game.setLocalization("critword.25", "正中要害！");
game.setLocalization("critword.26", "会心一击！");
game.setLocalization("critword.27", "砰！");
game.setLocalization("critword.28", "哐当！");
game.setLocalization("critword.29", "暴击！");
game.setLocalization("critword.30", "重击！");
game.setLocalization("critword.31", "铛！");
game.setLocalization("critword.32", "咔擦！");
game.setLocalization("critword.33", "劈里啪啦！");
game.setLocalization("critword.34", "重击！");
game.setLocalization("critword.35", "暴击！");
game.setLocalization("critword.36", "会心一击！");
game.setLocalization("critword.37", "正中要害！");
game.setLocalization("critword.38", "哇哦！");
game.setLocalization("critword.39", "正中靶心！");
game.setLocalization("critword.40", "乓！");
game.setLocalization("critword.41", "乒！");
game.setLocalization("critword.42", "力量！");
game.setLocalization("critword.43", "全力一击！");
game.setLocalization("critword.44", "帅气！");
game.setLocalization("critword.45", "精彩！");
game.setLocalization("critword.46", "撕裂！");
game.setLocalization("critword.47", "粉碎！");
game.setLocalization("critword.48", "重击！");
game.setLocalization("critword.49", "暴击！");
game.setLocalization("critword.50", "全力一击！");
game.setLocalization("critword.51", "咚！");
game.setLocalization("critword.52", "吃我一刀！");
game.setLocalization("critword.53", "咔擦！");
game.setLocalization("critword.54", "哐当！");
game.setLocalization("critword.55", "重击！");
game.setLocalization("critword.56", "暴击！");
game.setLocalization("critword.57", "暴击！");
game.setLocalization("critword.58", "暴击！");
game.setLocalization("critword.59", "全力一击!");
game.setLocalization("critword.60", "啊呀呀！");
game.setLocalization("critword.61", "致命一击！");
game.setLocalization("critword.62", "致命一击！");
game.setLocalization("critword.63", "击倒！");
game.setLocalization("critword.64", "芜湖！");
game.setLocalization("critword.65", "风驰电掣！");
game.setLocalization("critword.66", "全力一击！");
game.setLocalization("critword.67", "会心一击！");
game.setLocalization("critword.68", "啪啦！");
game.setLocalization("critword.69", "吱呀！");
game.setLocalization("critword.70", "牛逼！");
game.setLocalization("critword.71", "暴击！");
game.setLocalization("critword.72", "势不可挡！");
game.setLocalization("critword.73", "吃我一剑！");
game.setLocalization("critword.74", "风驰电击！");
game.setLocalization("critword.75", "出其不意！");
game.setLocalization("critword.76", "正中要害！");
game.setLocalization("critword.77", "痛击！");
game.setLocalization("critword.78", "痛击！");
game.setLocalization("critword.79", "迎头痛击！");
game.setLocalization("critword.80", "重击！");
game.setLocalization("critword.81", "乌拉！");
game.setLocalization("critword.82", "全力一击！");
game.setLocalization("critword.83", "会心一击！");
game.setLocalization("critword.84", "暴击！");
*/
