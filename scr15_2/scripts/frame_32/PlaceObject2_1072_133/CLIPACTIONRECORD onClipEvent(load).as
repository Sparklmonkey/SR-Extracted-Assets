onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:33,k1:33};
   newObj.fct = function()
   {
      game.ring = 2;
      game.card6 = 1;
      game.placeObject(0,11,15,"gold",1);
      game.placeObject(0,14,19,"cardField",1);
      root.sfx.gotoAndPlay("useObj");
      game.unregisterDropZone(this);
      game.registerWalkZone(game.goldZone);
      game.registerWalkZone(game.cardZone);
      game.removeObject("ring");
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM15Z8_p1",root.parseKitMissions),root.getInsName("txtM15Z8_p2",root.parseKitMissions),root.getInsName("txtM15Z8_p3",root.parseKitMissions)],19,endFct);
   };
   fct = function(item)
   {
      if(item == "ring")
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
   if(game.ring < 2)
   {
      game.registerDropZone(this);
   }
}
