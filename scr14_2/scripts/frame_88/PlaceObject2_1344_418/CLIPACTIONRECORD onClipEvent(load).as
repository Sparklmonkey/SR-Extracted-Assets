onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:33,k1:33};
   newObj.fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM14Z19_p1",root.parseKitMissions)],19,endFct);
      game.neckless = 2;
      game.placeObject(0,11,15,"gold",1);
      root.sfx.gotoAndPlay("useObj");
      game.unregisterDropZone(this);
      game.removeObject("neckless");
      game.registerWalkZone(game.pickupZone);
   };
   fct = function(item)
   {
      if(item == "neckless")
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
   if(game.neckless < 2)
   {
      game.registerDropZone(this);
   }
}
