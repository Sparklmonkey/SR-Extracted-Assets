txtCharSheet.text = txtCharSheetS.text = root.getInsName("txtCharSheet",root.parseKitSheets);
txtHair.text = txtHairS.text = root.getInsName("txtHair",root.parseKitSheets);
txtEyes.text = txtEyesS.text = root.getInsName("txtEyes",root.parseKitSheets);
txtSkin.text = txtSkinS.text = root.getInsName("txtSkin",root.parseKitSheets);
txtUpBody.text = txtUpBodyS.text = root.getInsName("txtUpBody",root.parseKitSheets);
txtLowBody.text = txtLowBodyS.text = root.getInsName("txtLowBody",root.parseKitSheets);
txtArmor.text = txtArmorS.text = root.getInsName("txtArmor",root.parseKitSheets);
txtAtt.text = root.getInsName("txtAtt",root.parseKitSheets);
txtDef.text = root.getInsName("txtDef",root.parseKitSheets);
txtHealth.text = root.getInsName("txtHealth",root.parseKitSheets);
txtVicPts.text = root.getInsName("txtVicPts",root.parseKitSheets);
txtGuildPts.text = root.getInsName("txtGuildPts",root.parseKitSheets);
mainBlocker.useHandCursor = false;
root.googleAnalytic("javascript:urchinTracker(\'/character\');");
crntArmorShown = 0;
armorSelectArr = new Array(1,2,3,4);
if(root.playerStats.guild == 1)
{
   armorSelectArr.push(5,6,7,8);
}
else if(root.playerStats.guild == 2)
{
   armorSelectArr.push(21,22,23,24);
}
else if(root.playerStats.guild == 3)
{
   armorSelectArr.push(13,14,15,16);
}
else if(root.playerStats.guild == 4)
{
   armorSelectArr.push(17,18,19,20);
}
emptyClip.loadMovie("character_" + root.charVersion + ".swf");
spiderTabC = new Color(spiderTab);
cardTabC = new Color(cardTab);
campaignBtnC = new Color(btn_camp);
darker = {ra:"50",rb:"0",ga:"50",gb:"0",ba:"50",bb:"0",aa:"100",ab:"0"};
diceTxt.text = root.playerStats.dice;
armorTxt.text = root.playerStats.defense;
lifeTxt.text = root.playerStats.life;
scoreTxt.text = root.playerStats.victory;
guildScoreTxt.text = root.playerStats.guildScore;
charInfoPanel.nameTxt.text = root.playerStats.Name;
charInfoPanel.rankTxt.text = root.rankObj.titleName;
charInfoPanel.gilsTxt.text = root.playerStats.gils + " GILS";
if(root.playerStats.card.length < 1)
{
   cardTabC.setTransform(darker);
   btn_card.enabled = false;
}
if(!root.sprAccess)
{
   spiderTabC.setTransform(darker);
   btn_spider.enabled = false;
}
if(root.showText1)
{
   root.showText1 = false;
   root.textWindow.drawWindow([root.getInsName("txtSelectName",root.parseKitSheets),root.getInsName("txtSaveNClick",root.parseKitSheets)],0,root.textWindow.closeWindow);
}
resetPerso();
refreshPerso();
