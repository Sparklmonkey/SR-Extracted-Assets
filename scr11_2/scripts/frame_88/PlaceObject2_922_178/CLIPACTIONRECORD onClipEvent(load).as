onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:31,k1:31};
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
         game.addBattleCard(106);
         root.cardInfoWindow.drawWindow(106);
         game.action3 = 1;
         game.text18 = 1;
         game.itemContainer.cardField1._visible = false;
      };
      root.textWindow.drawWindow([root.getInsName("txtM11Z22_p1",root.parseKitMissions)],19,endFct);
   };
   fct = function(item)
   {
      if(item == "gold" + game.golds)
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
   if(game.action3 < 1)
   {
      game.registerDropZone(this);
   }
}
