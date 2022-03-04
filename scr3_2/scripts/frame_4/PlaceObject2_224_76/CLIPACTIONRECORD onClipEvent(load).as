onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:19,k1:31};
   newObj.fct = function()
   {
      game.monacle = 2;
      game.stars._visible = false;
      endFct = function()
      {
         root.textWindow.closeWindow();
         root.sfx.gotoAndPlay("ambient");
         game.missionOver = 1;
         game.registerWalkZone(game.endZone);
         game.bkgDoor4.gotoAndPlay("show");
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM3Z3_p1",root.parseKitMissions),root.getInsName("txtM3Z3_p2",root.parseKitMissions),root.getInsName("txtM3Z3_p3",root.parseKitMissions),root.getInsName("txtM3Z3_p4",root.parseKitMissions)],1,endFct);
      game.unregisterDropZone(game.dropManacle);
      game.removeObject("monacleItem");
   };
   fct = function(item)
   {
      if(item == "monacleItem")
      {
         if(game.newTile.xtile == 19 && game.newTile.ytile == 31)
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
   if(game.monacle > 0)
   {
      game.registerDropZone(this);
   }
}
