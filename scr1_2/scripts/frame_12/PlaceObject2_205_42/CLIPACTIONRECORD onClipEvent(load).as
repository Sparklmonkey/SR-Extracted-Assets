onClipEvent(load){
   _visible = false;
   newObj = {lvl:4,j1:35,k1:45};
   newObj.fct = function()
   {
      game.rope = 2;
      game.bkgRope.gotoAndStop("appear");
      game.openPath1();
      root.sfx.gotoAndPlay("correctBeep");
      game.unregisterDropZone(this);
      game.removeObject("rope");
   };
   fct = function(item)
   {
      if(item == "rope")
      {
         if(game.newTile.xtile == 35 && game.newTile.ytile == 45)
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
   if(game.rope == 1)
   {
      game.registerDropZone(this);
   }
}
