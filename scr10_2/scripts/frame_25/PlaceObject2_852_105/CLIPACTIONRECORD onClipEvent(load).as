onClipEvent(load){
   _visible = false;
   endFct = function()
   {
      root.textWindow.closeWindow();
      delete endFct;
   };
   newObj = {lvl:1,j1:27,k1:29};
   newObj.fct = function()
   {
      game.seal = 2;
      root.sfx.gotoAndPlay("useObj");
      game.unregisterDropZone(this);
      game.removeObject("seal");
      game.trigger1 = 0;
      game.trigger2 = 1;
      game.openPath1();
      root.textWindow.drawWindow([root.getInsName("txtM10Z3_p1",root.parseKitMissions)],32,endFct);
   };
   fct = function(item)
   {
      if(item == "seal")
      {
         if(game.newTile.xtile == 29 && game.newTile.ytile == 27)
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
   if(game.seal > 0)
   {
      game.registerDropZone(this);
   }
}
