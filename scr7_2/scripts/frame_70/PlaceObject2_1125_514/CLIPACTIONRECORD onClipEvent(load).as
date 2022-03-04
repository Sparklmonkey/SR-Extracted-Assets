onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:27,k1:39};
   newObj.fct = function()
   {
      game.boardDroped = 2;
      game.boardShow._visible = true;
      root.sfx.gotoAndPlay("correctBeep");
      game.removeObject("board");
      game.unregisterDropZone(game.boardZone);
      game.openPath1();
      if(game.web == 1 && game.boardDroped == 2 && game.stone == 1)
      {
         game.event8 = 1;
         game.event7 = 1;
         game.event6 = 2;
      }
   };
   fct = function(item)
   {
      if(item == "board")
      {
         if(game.newTile.j1 == 27 && game.newTile.k1 == 39)
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
   if(game.boardDroped < 2)
   {
      game.registerDropZone(this);
   }
}
