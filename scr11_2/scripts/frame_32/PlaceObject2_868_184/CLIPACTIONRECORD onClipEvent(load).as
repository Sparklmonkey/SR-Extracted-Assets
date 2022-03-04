onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:37,k1:35};
   newObj.fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         game.gold1 = 2;
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
         game.addBattleCard(302);
         root.cardInfoWindow.drawWindow(302);
         game.itemContainer.cardField1._visible = false;
         game.action1 = 1;
         game.text19 = 1;
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM11Z10_p1",root.parseKitMissions)],23,endFct);
   };
   fct = function(item)
   {
      if(item == "gold" + game.golds)
      {
         if(game.newTile.xtile == 37 && game.newTile.ytile == 35)
         {
            root.tweenStop = false;
            newObj.fct();
         }
         else
         {
            root.tweenStop = false;
            game.text8 = 1;
            game.tileTriggered(newObj);
         }
      }
   };
   if(game.action1 < 1)
   {
      game.registerDropZone(this);
   }
}
