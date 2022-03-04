onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:23,k1:31};
   newObj.fct = function()
   {
      root.sfx.gotoAndPlay("useObj");
      game.unregisterDropZone(this);
      game.removeObject("oileflask");
      game.gameTrigger = 2;
   };
   fct = function(item)
   {
      trace(item);
      if(item == "oileflask")
      {
         if(game.newTile.xtile == 23 && game.newTile.ytile == 31)
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
   if(game.invRemedy > 0)
   {
      game.registerDropZone(this);
   }
}
