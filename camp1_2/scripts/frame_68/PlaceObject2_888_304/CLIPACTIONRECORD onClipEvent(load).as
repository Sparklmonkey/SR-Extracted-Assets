onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:29,k1:27};
   newObj.fct = function()
   {
      root.sfx.gotoAndPlay("useObj");
      game.unregisterDropZone(this);
      game.removeObject("gold");
      game.invGold = 2;
      game.placeObject(0,14,12,"bottle",1);
      game.registerWalkZone(game.bottleZone);
      root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg23_1_1",root.parseKitMissions)],22,root.textWindow.closeWindow);
   };
   fct = function(item)
   {
      game.unregisterWalkZone(game.merchantZone);
      if(item == "gold")
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
   game.registerDropZone(this);
}
