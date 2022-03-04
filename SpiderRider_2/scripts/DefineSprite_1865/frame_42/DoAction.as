txtDesc.text = root.getInsName("btnDesc",root.parseKitSheets);
txtMentor.text = root.getInsName("txtMentor",root.parseKitSheets);
txtGCards.text = root.getInsName("txtGCards",root.parseKitSheets);
charLeader.gotoAndStop(guild);
guildColor.gotoAndStop(guild);
if(guild == 1)
{
   guildName1.text = guildName2.text = "HUNTER";
   descGuild.text = "Hunter" + root.getInsName("txtG1Desc",root.parseKitSheets);
   var guildCardIDArr = new Array(503,506,104,201,401);
}
else if(guild == 2)
{
   guildName1.text = guildName2.text = "PRINCE LUMEN";
   descGuild.text = "Lumen" + root.getInsName("txtG2Desc",root.parseKitSheets);
   var guildCardIDArr = new Array(502,503,504,100,101,300,104);
}
else if(guild == 3)
{
   guildName1.text = guildName2.text = "IGNEOUS";
   descGuild.text = "Igneous" + root.getInsName("txtG3Desc",root.parseKitSheets);
   var guildCardIDArr = new Array(505,201,207,405,404);
}
else if(guild == 4)
{
   guildName1.text = guildName2.text = "MAGMA";
   descGuild.text = "Magma" + root.getInsName("txtG4Desc",root.parseKitSheets);
   var guildCardIDArr = new Array(503,103,300,304,405,405,410);
}
play();
