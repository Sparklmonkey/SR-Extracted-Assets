onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:27,k1:39};
   newObj.fct = function()
   {
      if(game.ring < 2)
      {
         endFct3 = function()
         {
            root.textWindow.closeWindow();
            delete endFct3;
         };
         root.textWindow.drawWindow([root.getInsName("txtM15Z4_p1",root.parseKitMissions)],22,endFct3);
      }
      else
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            game.gold2 = 2;
            root.sfx.gotoAndPlay("useObj");
            game.unregisterDropZone(this);
            game.removeObject("gold1");
            game.addBattleCard(206);
            game.registerWalkZone(game.endZone);
            root.cardInfoWindow.drawWindow(206);
            game.itemContainer.cardField1._visible = false;
            root.sfx.gotoAndPlay("winner");
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM15Z4_p2",root.parseKitMissions)],22,endFct);
      }
   };
   fct = function(item)
   {
      if(item == "gold1")
      {
         if(game.newTile.xtile == 39 && game.newTile.ytile == 27)
         {
            root.tweenStop = false;
            newObj.fct();
         }
         else
         {
            root.tweenStop = false;
            game.text9 = 1;
            game.tileTriggered(newObj);
         }
      }
   };
   if(game.gold2 < 2)
   {
      game.registerDropZone(this);
   }
}
