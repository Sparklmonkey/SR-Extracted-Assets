onClipEvent(load){
   _visible = false;
   var spiderUsed = false;
   var monacleUsed = false;
   var someItem = "";
   newObj = {lvl:0,j1:27,k1:25};
   newObj.fct = function()
   {
      endFct = function()
      {
         if(monacleUsed == true && spiderUsed == true)
         {
            game.unregisterDropZone(game.zoneA1);
         }
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.sfx.gotoAndPlay("useObj");
      if(someItem == "monacle")
      {
         root.textWindow.drawWindow([root.getInsName("txtM6Z1_p1",root.parseKitMissions),root.getInsName("txtM6Z1_p2",root.parseKitMissions),root.getInsName("txtM6Z1_p3",root.parseKitMissions)],13,endFct);
      }
      if(someItem == "spiderItem")
      {
         root.textWindow.drawWindow([root.getInsName("txtM6Z1_p4",root.parseKitMissions),root.getInsName("txtM6Z1_p5",root.parseKitMissions)],13,endFct);
      }
   };
   fct = function(item)
   {
      var _loc1_ = item;
      someItem = _loc1_;
      if(_loc1_ == "monacle" && monacleUsed !== true || _loc1_ == "spiderItem" && spiderUsed !== true)
      {
         if(_loc1_ == "monacle")
         {
            monacleUsed = true;
         }
         if(_loc1_ == "spiderItem")
         {
            spiderUsed = true;
         }
         if(game.newTile.xtile == 27 && game.newTile.ytile == 25)
         {
            root.tweenStop = false;
            newObj.fct();
         }
         else
         {
            root.tweenStop = false;
            game.tileTriggered(newObj);
         }
      }
   };
   if(spiderUsed !== true && monacleUsed !== true)
   {
      game.registerDropZone(this);
   }
}
