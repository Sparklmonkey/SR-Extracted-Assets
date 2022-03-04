onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:25,k1:11};
   newObj.fct = function()
   {
      game.pick = 2;
      game.openPath4();
      game.trigger4 = 0;
      game.levelfrg5.sparkle._visible = false;
      game.levelfrg5.rockblok2.rockField.gotoAndPlay(2);
      root.sfx.gotoAndPlay("useObj");
      game.unregisterDropZone(this);
      game.removeObject("pick");
   };
   fct = function(item)
   {
      if(item == "pick")
      {
         if(game.newTile.xtile == 11 && game.newTile.ytile == 25)
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
   if(game.pick < 2)
   {
      game.registerDropZone(this);
   }
}
