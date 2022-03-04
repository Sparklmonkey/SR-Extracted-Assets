onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:17,k1:25};
   newObj.fct = function()
   {
      game.board = 2;
      game.bkgBoard.gotoAndStop(1);
      game.openPath1();
      game.stars._visible = false;
      game.unregisterDropZone(this);
      game.removeObject("boardItem");
   };
   fct = function(item)
   {
      if(item == "boardItem")
      {
         if(game.newTile.xtile == 17 && game.newTile.ytile == 25)
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
   if(game.board > 0)
   {
      game.registerDropZone(this);
   }
}
