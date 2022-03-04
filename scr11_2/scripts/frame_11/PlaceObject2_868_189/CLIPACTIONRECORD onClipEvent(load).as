onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:25,k1:37};
   newObj.fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         game.gold2 = 2;
         game.golds--;
         root.sfx.gotoAndPlay("useObj");
         game.unregisterDropZone(this);
         if(game.golds == 0)
         {
            game.removeObject("gold1");
         }
         if(game.golds == 1)
         {
            game.removeObject("gold2");
            game.addObject("gold1");
         }
         if(game.golds == 2)
         {
            game.removeObject("gold3");
            game.addObject("gold2");
         }
         game.addBattleCard(207);
         root.cardInfoWindow.drawWindow(207);
         game.itemContainer.cardField1._visible = false;
         game.text17 = 1;
         game.action2 = 1;
      };
      root.textWindow.drawWindow([root.getInsName("txtM11Z3_p1",root.parseKitMissions)],22,endFct);
   };
   fct = function(item)
   {
      if(item == "gold" + game.golds)
      {
         if(game.newTile.xtile == 25 && game.newTile.ytile == 37)
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
   if(game.action2 < 1)
   {
      game.registerDropZone(this);
   }
}
