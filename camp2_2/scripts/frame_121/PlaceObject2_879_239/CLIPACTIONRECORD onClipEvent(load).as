onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:33,k1:25};
   newObj.fct = function()
   {
      root.sfx.gotoAndPlay("useObj");
      game.unregisterDropZone(this);
      game.invBook = 2;
      game.gameTrigger = 5;
      game.removeObject("holyBook");
      game.bugueseZone.fct();
   };
   fct = function(item)
   {
      trace(item);
      if(item == "holyBook")
      {
         if(game.newTile.xtile == 33 && game.newTile.ytile == 25)
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
   if(game.invBook < 2)
   {
      game.registerDropZone(this);
   }
}
