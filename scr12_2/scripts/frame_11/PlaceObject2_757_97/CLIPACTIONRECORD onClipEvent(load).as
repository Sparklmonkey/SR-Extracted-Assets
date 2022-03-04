onClipEvent(load){
   _visible = false;
   endFct = function()
   {
      root.textWindow.closeWindow();
      delete endFct;
   };
   newObj = {lvl:0,j1:23,k1:21};
   newObj.fct = function()
   {
      game.Key = 2;
      game.sparkle1._visible = false;
      game.porte._visible = true;
      game.protect._visible = false;
      root.sfx.gotoAndPlay("useObj");
      game.unregisterDropZone(this);
      game.removeObject("KeyItem");
      game.arrow3.gotoAndStop("D");
      game.unlock = 1;
      root.textWindow.drawWindow([root.getInsName("txtM12Z5_p1",root.parseKitMissions)],0,endFct);
   };
   fct = function(item)
   {
      if(item == "KeyItem")
      {
         if(game.newTile.xtile == 21 && game.newTile.ytile == 23)
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
   if(game.Key > 0)
   {
      game.registerDropZone(this);
   }
}
