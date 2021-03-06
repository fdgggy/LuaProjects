local a = {
["nCreateGuildVIp"]={
	["sKey"]="nCreateGuildVIp", 
	["sDesc"]="创建帮会VIP等级限制", 
	["nValue"]="1", 
},
["nCreateGuildMoney"]={
	["sKey"]="nCreateGuildMoney", 
	["sDesc"]="创建帮会消耗元宝", 
	["nValue"]="500", 
},
["nGuildNameWordMin"]={
	["sKey"]="nGuildNameWordMin", 
	["sDesc"]="帮会名字字数下限（字符）", 
	["nValue"]="4", 
},
["nGuildNameWordMax"]={
	["sKey"]="nGuildNameWordMax", 
	["sDesc"]="帮会名字字数上限（字符）", 
	["nValue"]="12", 
},
["nGuildPersonAwardMoney"]={
	["sKey"]="nGuildPersonAwardMoney", 
	["sDesc"]="达到人数奖励返还元宝", 
	["nValue"]="500", 
},
["nGuildPersonAwardCount"]={
	["sKey"]="nGuildPersonAwardCount", 
	["sDesc"]="达到人数奖励需求人数", 
	["nValue"]="25", 
},
["nGuildNoticeWordMin"]={
	["sKey"]="nGuildNoticeWordMin", 
	["sDesc"]="帮会宣言字数下限（字符）", 
	["nValue"]="0", 
},
["nGuildNoticeWordMax"]={
	["sKey"]="nGuildNoticeWordMax", 
	["sDesc"]="帮会宣言字数上限（字符）", 
	["nValue"]="100", 
},
["nGuildNoticeWordTest"]={
	["sKey"]="nGuildNoticeWordTest", 
	["sDesc"]="帮会宣言默认文字", 
	["nValue"]="欢迎加入本帮，请所有成员积极完成帮会的相关活动，保持活跃", 
},
["nGuildRecruitWordMin"]={
	["sKey"]="nGuildRecruitWordMin", 
	["sDesc"]="帮会招募字数下限（字符）", 
	["nValue"]="0", 
},
["nGuildRecruitWordMax"]={
	["sKey"]="nGuildRecruitWordMax", 
	["sDesc"]="帮会招募字数上限（字符）", 
	["nValue"]="100", 
},
["nGuildRecruitWordTest"]={
	["sKey"]="nGuildRecruitWordTest", 
	["sDesc"]="帮会招募默认文字", 
	["nValue"]="【#W】本帮由于名额不足，现对外招募志同道合的帮会成员，携手共济，开辟新天地", 
},
["nGuildRecruitMoney"]={
	["sKey"]="nGuildRecruitMoney", 
	["sDesc"]="帮会招募消耗元宝", 
	["nValue"]="10", 
},
["nGuildListClean"]={
	["sKey"]="nGuildListClean", 
	["sDesc"]="帮会列表玩家清理时间（秒）", 
	["nValue"]="172800", 
},
["nVoteTime"]={
	["sKey"]="nVoteTime", 
	["sDesc"]="弹劾投票上限时间（秒）", 
	["nValue"]="86400", 
},
["nSystemGuildLevel"]={
	["sKey"]="nSystemGuildLevel", 
	["sDesc"]="系统帮会等级", 
	["nValue"]="1", 
},
["nSystemGuildCleanTime"]={
	["sKey"]="nSystemGuildCleanTime", 
	["sDesc"]="系统帮会自动清理时间（天）", 
	["nValue"]="7", 
},
["nSystemGuildCloseCount"]={
	["sKey"]="nSystemGuildCloseCount", 
	["sDesc"]="系统帮会自动解散人数", 
	["nValue"]="7", 
},
["nSystemGuildCloseTime"]={
	["sKey"]="nSystemGuildCloseTime", 
	["sDesc"]="系统帮会自动解散周期（秒）", 
	["nValue"]="86400", 
},
["nJoinGuildMailTitle"]={
	["sKey"]="nJoinGuildMailTitle", 
	["sDesc"]="加入帮会邮件标题", 
	["nValue"]="欢迎加入帮会", 
},
["nJoinGuildMailMain"]={
	["sKey"]="nJoinGuildMailMain", 
	["sDesc"]="加入帮会邮件内容", 
	["nValue"]="欢迎加入#W帮会，望以后同舟共济，共创盛世帮会", 
},
["nDoneGuildMailTitle"]={
	["sKey"]="nDoneGuildMailTitle", 
	["sDesc"]="拒绝加帮邮件标题", 
	["nValue"]="拒绝入帮通知", 
},
["nDoneGuildMailMain"]={
	["sKey"]="nDoneGuildMailMain", 
	["sDesc"]="拒绝加帮邮件内容", 
	["nValue"]="#W帮会拒绝了你的入帮申请，请重新寻找志同道合的帮会", 
},
["nTreasureAward1"]={
	["sKey"]="nTreasureAward1", 
	["sDesc"]="宝藏一等奖排行个人积分", 
	["nValue"]="80", 
},
["nTreasureAward2"]={
	["sKey"]="nTreasureAward2", 
	["sDesc"]="宝藏二等奖排行个人积分", 
	["nValue"]="40", 
},
["nTreasureAward3"]={
	["sKey"]="nTreasureAward3", 
	["sDesc"]="宝藏三等奖排行个人积分", 
	["nValue"]="20", 
},
["nTreasureAward4"]={
	["sKey"]="nTreasureAward4", 
	["sDesc"]="宝藏安慰奖排行个人积分", 
	["nValue"]="10", 
},
["nTreasureMinTime"]={
	["sKey"]="nTreasureMinTime", 
	["sDesc"]="出现一等奖次数", 
	["nValue"]="40", 
},
["nImpeachTime"]={
	["sKey"]="nImpeachTime", 
	["sDesc"]="弹劾所需帮主离线时间（秒）", 
	["nValue"]="604800", 
},
["sVoteInstructionText"]={
	["sKey"]="sVoteInstructionText", 
	["sDesc"]="投票规则文字", 
	["nValue"]="任意一方达到50%票数直接产生结果。\r\n否则结束时根据票数多的一方决定结果。", 
},
["sDismissGuildTitle"]={
	["sKey"]="sDismissGuildTitle", 
	["sDesc"]="踢出帮会邮件标题", 
	["nValue"]="退出帮会通知", 
},
["sDismissGuildMain"]={
	["sKey"]="sDismissGuildMain", 
	["sDesc"]="踢出帮会邮件内容", 
	["nValue"]="你被#W帮会请离了帮会", 
},
["sBreakGuildTitle"]={
	["sKey"]="sBreakGuildTitle", 
	["sDesc"]="解散帮会邮件标题", 
	["nValue"]="解散帮会通知", 
},
["sBreakGuildMain"]={
	["sKey"]="sBreakGuildMain", 
	["sDesc"]="解散帮会邮件内容", 
	["nValue"]="#W帮会已经解散，你退出了帮会，请另寻其他帮会", 
},
["nGuildPersonAwardTitle"]={
	["sKey"]="nGuildPersonAwardTitle", 
	["sDesc"]="达到人数奖励返还元宝邮件标题", 
	["nValue"]="帮会人数奖励", 
},
["nGuildPersonAwardMain"]={
	["sKey"]="nGuildPersonAwardMain", 
	["sDesc"]="达到人数奖励返还元宝邮件内容", 
	["nValue"]="您的帮会首次达到#W人，特此返还您创建帮会的#D元宝，请注意查收", 
},
["sSystemFactionName"]={
	["sKey"]="sSystemFactionName", 
	["sDesc"]="系统帮会昵称", 
	["nValue"]="西游#W班", 
},
["nGuildTreasureAdd"]={
	["sKey"]="nGuildTreasureAdd", 
	["sDesc"]="帮会宝藏每次增加帮会经验", 
	["nValue"]="15000", 
},
}
 return a;