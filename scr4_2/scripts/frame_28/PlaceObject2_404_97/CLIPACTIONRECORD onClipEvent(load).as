onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:21,k1:21};
   newObj.fct = function()
   {
      game.axe = 2;
      game.unregisterDropZone(this);
      game.removeObject("axeItem");
      root.sfx.gotoAndPlay("correctBeep");
      game.fallenTree.gotoAndStop("appear");
      game.openPath1();
      game.fallenTree.gotoAndStop(2);
   };
   fct = function(item)
   {
      if(item == "axeItem")
      {
         if(game.newTile.xtile == 21 && game.newTile.ytile == 21)
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
   if(game.axe < 2)
   {
      game.registerDropZone(this);
   }
}
