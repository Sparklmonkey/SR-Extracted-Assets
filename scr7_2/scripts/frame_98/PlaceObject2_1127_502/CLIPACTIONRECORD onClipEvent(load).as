onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:33,k1:31};
   newObj.fct = function()
   {
      endFct = function()
      {
         game.event5 = 1;
         game.dropRing = 1;
         game.openPath();
         game.porte._visible = true;
         game.removeObject("ringItem");
         game.unregisterDropZone(game.zoneDrop);
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.sfx.gotoAndPlay("useObj");
      root.textWindow.drawWindow([root.getInsName("txtM7Z19_p1",root.parseKitMissions)],55,endFct);
   };
   fct = function(item)
   {
      if(item == "ringItem")
      {
         if(game.newTile.xtile == 33 && game.newTile.ytile == 31)
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
   if(game.event5 < 1 && game.dropRing < 1)
   {
      game.registerDropZone(this);
   }
}
