onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:23,k1:23};
   newObj.fct = function()
   {
      root.sfx.gotoAndPlay("useObj");
      game.unregisterDropZone(this);
      game.removeObject("bottle");
      game.invBottle = 2;
      game.placeObject(0,14,12,"oileflask",1);
      game.registerWalkZone(game.remedyZone);
      root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg13_1_1",root.parseKitMissions),root.getInsName("txt_cp1_bkg13_1_2",root.parseKitMissions),root.getInsName("txt_cp1_bkg13_1_3",root.parseKitMissions)],5,root.textWindow.closeWindow);
   };
   fct = function(item)
   {
      trace(item);
      game.unregisterWalkZone(game.healerZone);
      if(item == "bottle")
      {
         if(game.newTile.xtile == 23 && game.newTile.ytile == 23)
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
   if(game.invBottle < 2)
   {
      game.registerDropZone(this);
   }
}
