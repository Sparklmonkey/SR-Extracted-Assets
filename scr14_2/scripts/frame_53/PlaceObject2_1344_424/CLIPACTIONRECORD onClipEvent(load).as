onClipEvent(load){
   _visible = false;
   endFct = function()
   {
      root.sfx.gotoAndPlay("useObj");
      root.textWindow.closeWindow();
   };
   newObj = {lvl:0,j1:31,k1:31};
   newObj.fct = function()
   {
      if(game.passFlower == 1)
      {
         game.passFlower = 0;
         game.purpleFlowers = game.purpleFlowers + 1;
         if(game.purpleFlowers == 1)
         {
            game.removeObject("purpleFlower1");
            root.textWindow.drawWindow([root.getInsName("txtM14Z9_p1",root.parseKitMissions)],5,endFct);
         }
         else if(game.purpleFlowers == 2)
         {
            game.removeObject("purpleFlower2");
            root.textWindow.drawWindow([root.getInsName("txtM14Z9_p2",root.parseKitMissions)],5,endFct);
         }
         else if(game.purpleFlowers == 3)
         {
            game.removeObject("purpleFlower3");
            root.textWindow.drawWindow([root.getInsName("txtM14Z9_p3",root.parseKitMissions)],5,endFct);
         }
         else if(game.purpleFlowers == 4)
         {
            game.trigger2 = 0;
            game.trigger3 = 1;
            game.removeObject("purpleFlower4");
            game.unregisterDropZone(this);
            root.textWindow.drawWindow([root.getInsName("txtM14Z9_p4",root.parseKitMissions),root.getInsName("txtM14Z9_p5",root.parseKitMissions)],5,endFct);
         }
      }
      else
      {
         game.passFlower = 1;
      }
   };
   fct = function(item)
   {
      var _loc1_ = item;
      if(_loc1_ == "purpleFlower1" || _loc1_ == "purpleFlower2" || _loc1_ == "purpleFlower3" || _loc1_ == "purpleFlower4")
      {
         if(game.newTile.xtile == 31 && game.newTile.ytile == 31)
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
   if(game.purpleFlowers != 4)
   {
      game.registerDropZone(this);
   }
}
