battleSystem.loadMovie("battleSystem_" + battleVersion + ".swf");
getRewardType = function(ammountXP)
{
   var _loc3_ = ammountXP;
   §§push(_loc1_);
   §§push(_loc2_);
   §§push(_loc3_);
   if(_loc3_ <= 80)
   {
      var _loc2_ = new Array("20","50","100");
   }
   else if(_loc3_ <= 159)
   {
      _loc2_ = new Array("20","50","100","150","200","c502","c503","c504","c505","c506","c507","c508","c509","c102","c100","c101","c103","c200","c201","c202","c203","c302","c304","c303","c400","c401","c404","c405","c402","c403","c413","c414","c417","c418");
   }
   else if(_loc3_ <= 229)
   {
      _loc2_ = new Array("100","150","200","300","c506","c507","c508","c509","c510","c101","c103","c104","c105","c207","c300","c600","c601","c408","c406","c407","c421","c410","c411","c415","c416");
   }
   else
   {
      _loc2_ = new Array("400","500","600","c509","c510","c511","c105","c106","c107","c108","c109","c110","c301","c205","c204","c206","c208","c420","c419","c409");
   }
   var _loc1_ = _loc2_[random(_loc2_.length)];
   if(_loc1_ != undefined)
   {
      if(String(_loc1_).charAt(0) == "c")
      {
         root.updateCard(Number(_loc1_.substring(1)));
      }
      else
      {
         root.addGils(Number(_loc1_));
         root.cardInfoWindow.drawWindow(null,null,getInsName("infoReward",parseKitConnect),"gold",_loc1_);
      }
   }
   trace("MY REWARD: " + _loc1_);
   trace("ammountXP: " + _loc3_);
   _loc3_ = §§pop();
   _loc2_ = §§pop();
   _loc1_ = §§pop();
};
stop();
