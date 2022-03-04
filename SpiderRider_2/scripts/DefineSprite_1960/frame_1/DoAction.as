scoreTxt.text = root.playerStats.victory;
scoreTxtChange = function()
{
   var _loc1_ = root.playerStats.rank;
   root.rankObj = root.getRankValue2(root.playerStats.victory);
   trace(_loc1_ + "/" + root.rankObj.rank);
   §§push(_loc1_);
   if(_loc1_ < root.rankObj.rank)
   {
      endFct = function()
      {
         root.textWindow2.closeWindow();
         delete endFct;
      };
      root.textWindow2.drawWindow([root.getInsName("msgRankUp",root.parseKitConnect) + root.rankObj.titleName + "!"],0,endFct);
      root.setUpgrade(root.rankObj);
   }
   _loc1_ = §§pop();
};
this.onEnterFrame = function()
{
   if(root.playerStats.victory != oldVictory)
   {
      oldVictory = root.playerStats.victory;
      scoreTxtChange();
   }
};
