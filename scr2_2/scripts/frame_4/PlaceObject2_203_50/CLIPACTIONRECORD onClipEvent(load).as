onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:27,k1:21};
   newObj.fct = function()
   {
      game.rope = 2;
      game.bkgRope.gotoAndStop(1);
      game.openPath1();
      root.sfx.gotoAndPlay("correctBeep");
      game.unregisterDropZone(this);
      game.removeObject("rope");
   };
   fct = function(item)
   {
      if(item == "rope")
      {
         if(game.newTile.xtile == 27 && game.newTile.ytile == 21)
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
   if(game.rope > 0)
   {
      game.registerDropZone(this);
   }
}
