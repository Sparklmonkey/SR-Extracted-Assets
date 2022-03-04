onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:33,k1:33};
   newObj.fct = function()
   {
      game.gold = 2;
      game.action1 = 1;
      root.sfx.gotoAndPlay("useObj");
      game.unregisterDropZone(this);
      game.removeObject("gold");
      if(game.pass == 0)
      {
         game.pass = 1;
         game.addObject("pick");
      }
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM14Z7_p1",root.parseKitMissions)],16,endFct);
      game.itemContainer.pick1._visible = false;
   };
   fct = function(item)
   {
      if(item == "gold")
      {
         if(game.newTile.xtile == 33 && game.newTile.ytile == 33)
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
   if(game.gold < 2)
   {
      game.registerDropZone(this);
   }
}
