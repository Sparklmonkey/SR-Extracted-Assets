onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:31,k1:41};
   newObj.fct = function()
   {
      root.sfx.gotoAndPlay("useObj");
      game.unregisterDropZone(this);
      game.removeObject("KeyItem");
      game.openedGate = 1;
      game.openPath1();
      game.ironGate._visible = false;
   };
   fct = function(item)
   {
      trace(item);
      if(item == "KeyItem")
      {
         if(game.newTile.xtile == 29 && game.newTile.ytile == 27)
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
   if(game.openedGate < 1)
   {
      game.registerDropZone(this);
   }
}
