onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:13,k1:29};
   newObj.fct = function()
   {
      game.doorWarp._visible = false;
      game.doorKey = 2;
      endFct = function()
      {
         game.placeObject(0,17,8,"axe",4);
         root.sfx.gotoAndPlay("correctBeep");
         game.registerWalkZone(game.axeZone);
         root.textWindow.closeWindow();
         delete endFct;
      };
      game.removeObject("doorKeyItem");
      root.textWindow.drawWindow([root.getInsName("txtM4Z2_p1",root.parseKitMissions)],11,endFct);
      game.unregisterDropZone(this);
   };
   fct = function(item)
   {
      if(item == "doorKeyItem")
      {
         if(game.newTile.xtile == 13 && game.newTile.ytile == 29)
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
   if(game.doorKey > 0)
   {
      game.registerDropZone(this);
   }
   else
   {
      game.doorWarp._visible = false;
   }
}
