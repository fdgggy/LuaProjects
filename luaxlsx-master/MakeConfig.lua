
g_Package={
	client="app.binSet",
	server="",
	md5File="../Md5Config",
	--是否生成client文件和server文件
	createHeader=true
}

g_tMakeConfig = {
	-- {"/excel/游戏配置表.xlsx", "D_错误代码配置表", "/lua/ErrorCodeSet.lua"},--xlxs路径，sheet名，创建lua名
	
		--战斗表	
	{"/excel/战斗表/技能表.xlsx", "D_技能等级表", "/json/SkillLevelSet.json"},--xlxs路径，sheet名，创建lua名
	{"/excel/战斗表/技能招式表.xlsx", "D_招式等级表", "/json/SkillActSet.json"},
	{"/excel/战斗表/副本表.xlsx", "D_阵营关系", "/json/CampRelationSet.json"},
	{"/excel/战斗表/通用动作配置.xlsx", "D_动作配置表", "/json/ActForRepeat.json"},
	
	{"/excel/战斗表/技能表.xlsx", "D_技能等级表", "/lua/SkillLevelSet.lua"},--xlxs路径，sheet名，创建lua名
	{"/excel/战斗表/BUFF表.xlsx", "D_BUFF表", "/lua/BattleBufSet.lua"},--xlxs路径，sheet名，创建lua名
	{"/excel/角色表.xlsx","D_职业表","/lua/RoleSet.lua"},
	
	
	
	{"/excel/战斗表/副本表.xlsx","D_副本表","/lua/RaidSet.lua"},
	{"/excel/战斗表/副本表.xlsx","D_副本阵营","/lua/RaidTypeCamp.lua"},
	{"/excel/战斗表/副本表.xlsx", "D_章节表", "/lua/SectionNameSet.lua"},
	{"/excel/战斗表/副本表.xlsx", "D_副本三星评价", "/lua/ConditionSet.lua"},
	
	--活动日历
	{"/excel/活动日历.xlsx", "D_日常", "/lua/AllActivitySet.lua"},
	{"/excel/活动日历.xlsx", "D_活动", "/lua/AllTimeActivitySet.lua"},
	--经验副本
	{"/excel/活动日历.xlsx", "D_经验副本", "/lua/ExpRaidSet.lua"},
	{"/excel/活动日历.xlsx", "D_日常活动参数", "/lua/ExpRaidParameterSet.lua"},
	{"/excel/活动日历.xlsx", "D_经验本积分奖励", "/lua/ExpRaidRuleSet.lua"},
	{"/excel/活动日历.xlsx", "D_桃花源", "/lua/PetIslandSet.lua"},
	
	{"/excel/副本挂机表.xlsx", "D_副本挂机表", "/lua/CustomsPartner.lua"},
	{"/excel/战斗表/副本表.xlsx", "D_章节目标奖励", "/lua/CustomsSec.lua"},

	{"/excel/战斗表/场景表.xlsx","D_场景表","/lua/SceneSet.lua"},
	{"/excel/战斗表/怪物组.xlsx","D_怪物组","/lua/MonsterGroup.lua"},
	{"/excel/战斗表/怪物表.xlsx","D_怪物表","/lua/MonsterSet.lua"},
	{"/excel/战斗表/怪物技能库.xlsx","D_怪物技能库","/lua/MonserSkillSet.lua"},
	{"/excel/战斗表/AI表.xlsx","D_基础AI表","/lua/BaseAISet.lua"},
	{"/excel/战斗表/AI条件触发表.xlsx","D_条件触发AI表","/lua/ConditionAISet.lua"},
	
	{"/excel/语言包_Vindy.xlsx", "D_中文", "/lua/ChineseSet1.lua"},
	{"/excel/语言包_wjx.xlsx", "D_中文", "/lua/ChineseSet2.lua"},
	{"/excel/语言包_oudi.xlsx", "D_中文", "/lua/ChineseSet3.lua"},
	{"/excel/语言包_zhoujian.xlsx", "D_中文", "/lua/ChineseSet4.lua"},
	{"/excel/语言包_wjb.xlsx", "D_中文", "/lua/ChineseSet5.lua"},
	{"/excel/语言包_raid.xlsx", "D_中文", "/lua/ChineseSet6.lua"},
	
	-- {"/excel/语言包_Vindy.xlsx", "D_英文", "/lua/EnglishSet1.lua"},  
	-- {"/excel/语言包_wjx.xlsx", "D_英文", "/lua/EnglishSet2.lua"},
	-- {"/excel/语言包_oudi.xlsx", "D_英文", "/lua/EnglishSet3.lua"},
	-- {"/excel/语言包_zhoujian.xlsx", "D_英文", "/lua/EnglishSet4.lua"},
	-- {"/excel/语言包_wjb.xlsx", "D_英文", "/lua/EnglishSet5.lua"},   

	--[测试]服务器表
	{"/excel/服务器表.xlsx", "D_服务器", "/lua/ServerList.lua"},
	--随机名字表
	{"/excel/随机名字表.xlsx", "D_随机名字表", "/lua/RandomNameSet.lua"},
	--屏蔽字库
	{"/excel/屏蔽字库.xlsx", "D_屏蔽字库", "/lua/InvalidWords.lua"},
	--错误表
	{"/excel/错误表.xlsx", "D_错误表", "/lua/ErrorCodeSet.lua"},	
	--等级成长表
	{"/excel/角色等级表.xlsx", "D_等级成长表", "/lua/LevelUpSet.lua"},
	--技能功法表
	{"/excel/功法表.xlsx", "D_功法表", "/lua/SkillSet.lua"},
	--技能心法表
	{"/excel/心法表.xlsx", "D_心法章节表", "/lua/HeartLawSectionSet.lua"},
	{"/excel/心法表.xlsx", "D_心法表", "/lua/HeartLawSet.lua"},

	--被动效果表
	{"/excel/被动效果表.xlsx", "D_被动效果表", "/lua/ForeverEffect.lua"},


	--公共参数表
	{"/excel/公共参数表.xlsx", "D_参数", "/lua/GlobalValueSet.lua"},
	{"/excel/公共参数表.xlsx", "D_售价表", "/lua/GlobalPriceSet.lua"},
	--聊天参数表
	-- {"/excel/聊天表.xlsx", "D_聊天参数表", "/lua/ChatFactorSet.lua"},

	{"/excel/道具.xlsx", "D_道具", "/lua/PropsSet.lua"},
	{"/excel/掉落表.xlsx", "D_掉落表", "/lua/DropSet.lua"},
	{"/excel/收妖表.xlsx", "D_收妖表", "/lua/CatchPartenSet.lua"},
	

	--{"/excel/战斗表/技能效果表.csv", "", "/json/ActEffectSet.json"}
	--伙伴阵列表
	{"/excel/伙伴系统表.xlsx", "D_伙伴表", "/lua/PartnerInfoSet.lua"},
	{"/excel/伙伴系统表.xlsx", "D_阵列表", "/lua/PartnerArraySet.lua"},
	{"/excel/伙伴系统表.xlsx", "D_伙伴技能书", "/lua/PartnerSkillBookSet.lua"},
	{"/excel/伙伴系统表.xlsx", "D_伙伴种族", "/lua/PartnerRaceSet.lua"},
	{"/excel/伙伴系统表.xlsx", "D_羁绊随机", "/lua/PartnerRandomYokeSet.lua"},
	{"/excel/伙伴系统表.xlsx", "D_羁绊组合", "/lua/PartnerYokeGroudSet.lua"},
	{"/excel/伙伴系统表.xlsx", "D_伙伴羁绊", "/lua/PartnerYokeSet.lua"},
	{"/excel/伙伴系统表.xlsx", "D_升级系数表", "/lua/PartnerLvRatioSet.lua"},
	{"/excel/伙伴系统表.xlsx", "D_条目随机", "/lua/PartnerRandomCountSet.lua"},
	{"/excel/伙伴系统表.xlsx", "D_随机属性库", "/lua/PartnerAbilitySet.lua"},
	{"/excel/伙伴系统表.xlsx", "D_伙伴性格表", "/lua/PartnerCharacterSet.lua"},
	{"/excel/伙伴系统表.xlsx", "D_被动技能库", "/lua/partnerSkillLibrarySet.lua"},
	{"/excel/伙伴系统表.xlsx", "D_快速方案", "/lua/PartnerProgramSet.lua"},
	{"/excel/伙伴系统表.xlsx", "D_被动技能", "/lua/PartnerPassiveSkillSet.lua"},
	{"/excel/伙伴系统表.xlsx", "D_技能学习", "/lua/PartnerStudySkillSet.lua"},
	{"/excel/伙伴系统表.xlsx", "D_主动技能索引", "/lua/PartnerSkillIndex.lua"},

	--帮派商店表
	{"/excel/商店表.xlsx", "D_帮派商店表", "/lua/FactionShopSet.lua"},
	--帮派商店随机库
	{"/excel/商店表.xlsx", "D_帮派商店随机库", "/lua/FactionShopRandomSet.lua"},

	{"/excel/温馨提示.xlsx", "D_温馨提示", "/lua/WarmSet.lua"},
	{"/excel/伙伴系统表.xlsx", "D_图鉴", "/lua/PartnerManualSet.lua"},

	{"/excel/任务表.xlsx", "D_任务", "/lua/TaskSet.lua"},
	{"/excel/任务表.xlsx", "D_任务类型库", "/lua/TaskLibSet.lua"},
	{"/excel/任务表.xlsx", "D_积分宝箱", "/lua/DailyBonousSet.lua"},
	{"/excel/任务表.xlsx", "D_祈愿宝箱", "/lua/PrayBoxSet.lua"},
	{"/excel/任务表.xlsx", "D_祈愿规则", "/lua/PrayRuleSet.lua"},

	--装备表
	{"/excel/装备表.xlsx", "D_装备属性", "/lua/EquipInfoSet.lua"},
	{"/excel/装备表.xlsx", "D_随机属性库", "/lua/EquipRandomStuffSet.lua"},
	{"/excel/装备表.xlsx", "D_升星配置", "/lua/EquipStarUpSet.lua"},
	{"/excel/装备表.xlsx", "D_祈福表", "/lua/EquipPraySet.lua"},
	{"/excel/装备表.xlsx", "D_升星套装", "/lua/EquipStarSuitSet.lua"},
	{"/excel/装备表.xlsx", "D_装备套装", "/lua/EquipSuitSet.lua"},
	{"/excel/装备表.xlsx", "D_灵魂激活条件", "/lua/EquipSoulActiveSet.lua"},
	{"/excel/装备表.xlsx", "D_条目随机表", "/lua/EquipRandomCntSet.lua"},
	{"/excel/装备表.xlsx", "D_装备部位表", "/lua/EquipPartNameSet.lua"},
	--装备打造表
	{"/excel/打造表.xlsx", "D_打造配置表", "/lua/ForgeSet.lua"},
	{"/excel/打造表.xlsx", "D_打造掉落表", "/lua/ForgeDropSet.lua"},
	{"/excel/打造表.xlsx", "D_打造图鉴", "/lua/ForgeManualSet.lua"},
	{"/excel/打造表.xlsx", "D_图鉴目标", "/lua/ForgeManualMissionSet.lua"},
	{"/excel/打造表.xlsx", "D_材料合成", "/lua/ForgeSynthetiseSet.lua"},
	{"/excel/打造表.xlsx", "D_打造预览", "/lua/ForgePreviewSet.lua"},
	{"/excel/打造表.xlsx", "D_打造参数", "/lua/ForgeParameterSet.lua"},
	{"/excel/打造表.xlsx", "D_打造等级", "/lua/ForgeLvSet.lua"},

	{"/excel/战力公式表.xlsx", "D_战力换算", "/lua/FightPowerSet.lua"},
	
	{"/excel/体力表.xlsx", "D_体力表", "/lua/EnergySet.lua"},
	--竞技场
	{"/excel/竞技场表.xlsx", "D_竞技场", "/lua/ArenaAwardSet.lua"},
	{"/excel/竞技场表.xlsx", "D_对手配置表", "/lua/ArenaAIRoleSet.lua"},
	{"/excel/竞技场表.xlsx", "D_竞技场参数表", "/lua/ArenaParameterSet.lua"},
	{"/excel/竞技场表.xlsx", "D_匹配规则", "/lua/ArenaMatchRuleSet.lua"},
	{"/excel/竞技场表.xlsx", "D_境界守卫表", "/lua/ArenaGuardSet.lua"},
	{"/excel/竞技场表.xlsx", "D_膜拜规则", "/lua/ArenaWorshipRuleSet.lua"},

	--帮派
	{"/excel/帮会系统表.xlsx", "D_帮会等级表", "/lua/FactionLevelSet.lua"},
	{"/excel/帮会系统表.xlsx", "D_帮会标志表", "/lua/FactionSignSet.lua"},
	{"/excel/帮会系统表.xlsx", "D_帮会职务表", "/lua/FactionDutySet.lua"},
	{"/excel/帮会系统表.xlsx", "D_帮会参数表", "/lua/FactionValueSet.lua"},
	{"/excel/帮会系统表.xlsx", "D_帮会宝藏价格", "/lua/FactionPriceSet.lua"},
	{"/excel/帮会系统表.xlsx", "D_帮会宝藏中奖", "/lua/FactionAwardSet.lua"},
	{"/excel/帮会系统表.xlsx", "D_帮会宝藏目标", "/lua/FactionAwardTargetSet.lua"},

	--坐骑
	{"/excel/坐骑表.xlsx", "D_等级表", "/lua/HourseRiddingLevelSet.lua"},
	{"/excel/坐骑表.xlsx", "D_进阶表", "/lua/HourseRiddingStepSet.lua"},
	{"/excel/坐骑表.xlsx", "D_修炼表", "/lua/HourseRiddingPracticeSet.lua"},
	{"/excel/坐骑表.xlsx", "D_坐骑参数表", "/lua/HourseRiddingParamSet.lua"},  
	{"/excel/坐骑表.xlsx", "D_修炼阶段", "/lua/HourseRiddingPracticeManualSet.lua"},
	{"/excel/坐骑表.xlsx", "D_坐骑外形", "/lua/HourseRiddingAvatarSet.lua"},
	{"/excel/坐骑表.xlsx", "D_弼马温", "/lua/DrawRideFeederSet.lua"},
	{"/excel/坐骑表.xlsx", "D_坐骑抽奖掉落表", "/lua/DrawRideDropSet.lua"},
	{"/excel/坐骑表.xlsx", "D_积分奖励", "/lua/DrawRidePointAwardSet.lua"},

	{"/excel/新手指导.xlsx","D_引导","/lua/GuidanceSet.lua"},
	{"/excel/新功能开启.xlsx","D_新功能","/lua/SystemOpenSet.lua"},
	{"/excel/挑战宝箱.xlsx","D_宝箱","/lua/ChallengBoxSet.lua"},
	{"/excel/挑战宝箱.xlsx","D_对手","/lua/ChallengRoleSet.lua"},

	{"/excel/战斗表/永久特效挂点表.xlsx","D_挂点特效","/lua/HookEffect.lua"},
}
