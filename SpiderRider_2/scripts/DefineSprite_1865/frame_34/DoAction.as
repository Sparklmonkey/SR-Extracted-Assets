btnJoin = root.getInsName("btnJoin",root.parseKitSheets);
txtGuild.text = txtGuildS.text = root.getInsName("txtGuild",root.parseKitSheets);
txtSelect.text = txtSelectS.text = root.getInsName("txtSelect",root.parseKitSheets);
txtJoin.text = root.getInsName("txtJoin",root.parseKitSheets);
root.googleAnalytic("javascript:urchinTracker(\'/character/guild\');");
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
guild = root.playerStats.guild;
this["guild" + guild].gotoAndStop(2);
this["joinCheck" + guild].gotoAndStop(2);
this["joinBtn" + guild].enabled = false;
joinBtn1.onRelease = function()
{
   endFct = function()
   {
      function endFct2()
      {
         root.textWindow.closeWindow();
         root.setGuild(1);
         resetPerso();
         saveInfoChar();
         root.updatePlayer();
         if(root.inWorld == true)
         {
            root.callChangeDesc();
         }
         delete endFct2;
      }
      root.askWindow.closeWindow();
      root.charWindow.joinCheck1.gotoAndStop(2);
      root.playerStats.guild = 1;
      typeArmor = 1;
      guild = root.playerStats.guild;
      gotoAndStop("guildDesc");
      root.charWindow.joinBtn1.enabled = false;
      root.textWindow.drawWindow([root.getInsName("txtJoinG1",root.parseKitSheets)],0,endFct2);
      delete endFct;
   };
   root.askWindow.drawWindow([root.getInsName("txtChangeGuild",root.parseKitSheets)],endFct);
};
joinBtn2.onRelease = function()
{
   endFct = function()
   {
      function endFct2()
      {
         root.textWindow.closeWindow();
         root.setGuild(2);
         resetPerso();
         saveInfoChar();
         root.updatePlayer();
         if(root.inWorld == true)
         {
            root.callChangeDesc();
         }
         delete endFct2;
      }
      root.askWindow.closeWindow();
      root.charWindow.joinCheck2.gotoAndStop(2);
      root.playerStats.guild = 2;
      typeArmor = 1;
      guild = root.playerStats.guild;
      gotoAndStop("guildDesc");
      root.charWindow.joinBtn2.enabled = false;
      root.textWindow.drawWindow([root.getInsName("txtJoinG2",root.parseKitSheets)],0,endFct2);
      delete endFct;
   };
   root.askWindow.drawWindow([root.getInsName("txtChangeGuild",root.parseKitSheets)],endFct);
};
joinBtn3.onRelease = function()
{
   endFct = function()
   {
      function endFct2()
      {
         root.textWindow.closeWindow();
         root.setGuild(3);
         resetPerso();
         saveInfoChar();
         root.updatePlayer();
         if(root.inWorld == true)
         {
            root.callChangeDesc();
         }
         delete endFct2;
      }
      root.askWindow.closeWindow();
      root.charWindow.joinCheck3.gotoAndStop(2);
      root.playerStats.guild = 3;
      typeArmor = 1;
      guild = root.playerStats.guild;
      gotoAndStop("guildDesc");
      root.charWindow.joinBtn3.enabled = false;
      root.textWindow.drawWindow([root.getInsName("txtJoinG3",root.parseKitSheets)],0,endFct2);
      delete endFct;
   };
   root.askWindow.drawWindow([root.getInsName("txtChangeGuild",root.parseKitSheets)],endFct);
};
joinBtn4.onRelease = function()
{
   endFct = function()
   {
      function endFct2()
      {
         root.textWindow.closeWindow();
         root.setGuild(4);
         resetPerso();
         saveInfoChar();
         root.updatePlayer();
         if(root.inWorld == true)
         {
            root.callChangeDesc();
         }
         delete endFct2;
      }
      root.askWindow.closeWindow();
      root.charWindow.joinCheck4.gotoAndStop(2);
      root.playerStats.guild = 4;
      typeArmor = 1;
      guild = root.playerStats.guild;
      gotoAndStop("guildDesc");
      root.charWindow.joinBtn4.enabled = false;
      root.textWindow.drawWindow([root.getInsName("txtJoinG4",root.parseKitSheets)],0,endFct2);
      delete endFct;
   };
   root.askWindow.drawWindow([root.getInsName("txtChangeGuild",root.parseKitSheets)],endFct);
};
var i = 1;
while(i <= 4)
{
   this["guild" + i].ID = i;
   this["desc" + i].onRollOver = function()
   {
      var _loc1_ = this;
      §§push(_loc1_);
      if(_loc1_._parent.guild != _loc1_.ID)
      {
         _loc1_.gotoAndStop(2);
         _loc1_._parent["guild" + i].gotoAndStop(2);
      }
      _loc1_ = §§pop();
   };
   this["desc" + i].onRollOut = function()
   {
      var _loc1_ = this;
      §§push(_loc1_);
      if(_loc1_._parent.guild != _loc1_.ID)
      {
         _loc1_.gotoAndStop(1);
         _loc1_._parent["guild" + i].gotoAndStop(1);
      }
      _loc1_ = §§pop();
   };
   this["guild" + i].onRelease = function()
   {
      var _loc2_ = this;
      §§push(_loc1_);
      §§push(_loc2_);
      if(_loc2_._parent.guild != _loc2_.ID)
      {
         _loc2_._parent.guild = _loc2_.ID;
         var _loc1_ = 1;
         while(_loc1_ <= 4)
         {
            _loc2_._parent["guild" + _loc1_].gotoAndStop(1);
            _loc1_ = _loc1_ + 1;
         }
         _loc2_.gotoAndStop(2);
      }
      _loc2_ = §§pop();
      _loc1_ = §§pop();
   };
   i++;
}
stop();
