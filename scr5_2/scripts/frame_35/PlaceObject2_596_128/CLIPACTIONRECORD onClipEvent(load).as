onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:15,k1:21};
   newObj.fct = function()
   {
      game.axe = 2;
      game.fallenTree.gotoAndStop(2);
      game.openPath1();
      root.sfx.gotoAndPlay("useObj");
      game.unregisterDropZone(this);
      game.removeObject("axeItem");
   };
   fct = function(item)
   {
      if(item == "axeItem")
      {
         if(game.newTile.xtile == 15 && game.newTile.ytile == 21)
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
   if(game.axe > 0)
   {
      game.registerDropZone(this);
   }
}
