txtOptions.text = txtOptionsS.text = root.getInsName("txtOptions",root.parseKitSheets);
txtInfTitle.text = root.getInsName("txtInfTitle",root.parseKitSheets);
txtInfBook.text = root.getInsName("txtInfBook",root.parseKitSheets);
root.googleAnalytic("javascript:urchinTracker(\'/help\');");
spiderTabC = new Color(spiderTab);
cardTabC = new Color(cardTab);
campaignBtnC = new Color(btn_camp);
darker = {ra:"50",rb:"0",ga:"50",gb:"0",ba:"50",bb:"0",aa:"100",ab:"0"};
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
stop();
