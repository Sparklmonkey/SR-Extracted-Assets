onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:25,k1:13};
   newObj.fct = function()
   {
      game.stone1.gotoAndPlay(2);
      game.stone2.gotoAndPlay(2);
      game.stone3.gotoAndPlay(2);
      game.removeObject("pickItem");
      game.event3 = 1;
      game.stone = 1;
      game.openPath();
      game.sparkle._visible = false;
      if(game.web == 1 && game.boardDroped == 2 && game.stone == 1)
      {
         game.event8 = 1;
         game.event7 = 1;
         game.event6 = 2;
      }
      game.unregisterDropZone(game.zoneStone);
      root.sfx.gotoAndPlay("correctBeep");
   };
   fct = function(item)
   {
      if(item == "pickItem")
      {
         if(game.newTile.xtile == 25 && game.newTile.ytile == 13 && game.stone < 1)
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
   if(game.stone < 1)
   {
      game.registerDropZone(this);
   }
}
