onClipEvent(load){
   _visible = false;
   endFct = function()
   {
      root.textWindow.closeWindow();
      delete endFct;
   };
   newObj = {lvl:0,j1:37,k1:41};
   newObj.fct = function()
   {
      game.KeyA = 2;
      game.openPath3();
      game.sparkle._visible = false;
      root.sfx.gotoAndPlay("useObj");
      game.unregisterDropZone(this);
      game.removeObject("Key1");
      root.textWindow.drawWindow([root.getInsName("txtM10Z14_p1",root.parseKitMissions)],0,endFct);
   };
   fct = function(item)
   {
      if(item == "Key1")
      {
         game.text17 = 1;
         if(game.newTile.xtile == 37 && game.newTile.ytile == 41)
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
   if(game.KeyA > 0)
   {
      game.registerDropZone(this);
   }
}
