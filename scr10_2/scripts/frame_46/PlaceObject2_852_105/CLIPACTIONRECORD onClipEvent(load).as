onClipEvent(load){
   _visible = false;
   if(game.trigger4 == 1)
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      newObj = {lvl:0,j1:37,k1:41};
      newObj.fct = function()
      {
         game.KeyB = 2;
         game.openPath3();
         game.sparkle1._visible = false;
         game.porte1._visible = true;
         game.arrow2.gotoAndStop("C");
         root.sfx.gotoAndPlay("useObj");
         game.unregisterDropZone(this);
         game.removeObject("KeyItem");
         root.textWindow.drawWindow([root.getInsName("txtM10Z14_p1",root.parseKitMissions)],0,endFct);
      };
      fct = function(item)
      {
         if(item == "KeyItem")
         {
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
      if(game.KeyB > 0)
      {
         game.registerDropZone(this);
      }
   }
}
