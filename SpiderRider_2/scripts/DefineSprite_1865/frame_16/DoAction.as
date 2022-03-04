txtSpiSheet.text = txtSpiSheetS.text = root.getInsName("txtSpiSheet",root.parseKitSheets);
txtBody.text = txtBodyS.text = root.getInsName("txtBody",root.parseKitSheets);
txtHead.text = txtHeadS.text = root.getInsName("txtHead",root.parseKitSheets);
txtLegs.text = txtLegsS.text = root.getInsName("txtLegs",root.parseKitSheets);
txtDice.text = root.getInsName("txtDice",root.parseKitSheets);
txtDef.text = root.getInsName("txtDef",root.parseKitSheets);
txtHealth.text = root.getInsName("txtHealth",root.parseKitSheets);
txtName.text = root.getInsName("txtName",root.parseKitSheets);
emptyClip.loadMovie("spider_" + root.spiderVersion + ".swf");
cardTabC = new Color(cardTab);
campaignBtnC = new Color(btn_camp);
diceTxt.text = root.spiderData.dice;
armorTxt.text = root.spiderData.defense;
lifeTxt.text = root.spiderData.action;
nameTxt.text = root.sprName;
darker = {ra:"50",rb:"0",ga:"50",gb:"0",ba:"50",bb:"0",aa:"100",ab:"0"};
if(root.playerStats.card.length < 1)
{
   cardTabC.setTransform(darker);
   btn_card.enabled = false;
}
if(root.showText2)
{
   root.showText2 = false;
   endFct = function()
   {
      root.textWindow.closeWindow();
      delete endFct;
   };
   root.textWindow.drawWindow([root.getInsName("txtSelectSpName",root.parseKitSheets),root.getInsName("txtSpSave",root.parseKitSheets)],0,endFct);
}
