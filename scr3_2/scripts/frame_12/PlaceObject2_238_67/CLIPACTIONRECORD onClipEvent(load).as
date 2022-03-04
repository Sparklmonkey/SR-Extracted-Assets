onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:41,k1:49};
   newObj.fct = function()
   {
      game.door = game.doorKey = 2;
      game.bkg.gate2.gotoAndStop(2);
      game.bkg.gate.gotoAndStop(2);
      game.frg.gate.gotoAndStop(2);
      game.openPath1();
      game.unregisterDropZone(this);
      game.stars._visible = false;
      game.removeObject("doorKeyItem");
      root.sfx.gotoAndPlay("lock");
   };
   fct = function(item)
   {
      if(item == "doorKeyItem")
      {
         if(game.newTile.xtile == 41 && game.newTile.ytile == 49)
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
   if(game.door < 1)
   {
      game.registerDropZone(this);
   }
}
