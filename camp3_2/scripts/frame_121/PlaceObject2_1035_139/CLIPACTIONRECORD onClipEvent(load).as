onClipEvent(load){
   _visible = false;
   newObj = {lvl:1,j1:31,k1:15};
   newObj.fct = function()
   {
      root.sfx.gotoAndPlay("useObj");
      game.unregisterDropZone(this);
      game.removeObject("KeyItem");
      game.openedGate = 1;
      game.gameTrigger = 4;
      game.lockBtn._visible = false;
      game.gate._visible = false;
   };
   fct = function(item)
   {
      trace(item);
      if(item == "KeyItem")
      {
         if(game.newTile.xtile == 31 && game.newTile.ytile == 15)
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
   if(game.gameTrigger > 2 && game.openedGate < 1)
   {
      game.registerDropZone(this);
   }
}
