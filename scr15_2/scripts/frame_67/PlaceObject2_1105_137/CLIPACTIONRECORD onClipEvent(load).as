onClipEvent(load){
   _visible = false;
   endFct = function()
   {
      root.textWindow.closeWindow();
      delete endFct;
   };
   newObj = {lvl:0,j1:27,k1:33};
   newObj.fct = function()
   {
      game.KeyB = 2;
      root.sfx.gotoAndPlay("useObj");
      game.unregisterDropZone(this);
      game.sparkle1._visible = false;
      game.protect._visible = false;
      game.removeObject("Key2");
      root.textWindow.drawWindow([root.getInsName("txtM10Z14_p1",root.parseKitMissions)],0,endFct);
   };
   fct = function(item)
   {
      if(item == "Key2")
      {
         if(game.newTile.xtile == 33 && game.newTile.ytile == 27)
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
   if(game.KeyB == 1)
   {
      game.registerDropZone(this);
   }
}
