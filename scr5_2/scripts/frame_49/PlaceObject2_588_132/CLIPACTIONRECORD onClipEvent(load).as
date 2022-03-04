onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:23,k1:35};
   newObj.fct = function()
   {
      game.balsam = 2;
      game.placeObject(0,16,10,"doorKey",6);
      game.registerWalkZone(game.keyZone);
      root.sfx.gotoAndPlay("useObj");
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM5Z9_p1",root.parseKitMissions),root.getInsName("txtM5Z9_p2",root.parseKitMissions)],7,endFct);
      game.unregisterDropZone(this);
      game.removeObject("balsam");
   };
   fct = function(item)
   {
      if(item == "balsam")
      {
         if(game.newTile.xtile == 23 && game.newTile.ytile == 35)
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
   if(game.balsam > 0)
   {
      game.registerDropZone(this);
   }
}
