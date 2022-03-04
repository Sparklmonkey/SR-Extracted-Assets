onClipEvent(load){
   _visible = false;
   newObj = {lvl:4,j1:25,k1:35};
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
         if(game.newTile.xtile == 25 && game.newTile.ytile == 35)
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
