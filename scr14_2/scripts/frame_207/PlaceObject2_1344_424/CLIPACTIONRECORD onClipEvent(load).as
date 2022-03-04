onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:37,k1:35};
   newObj.fct = function()
   {
      game.balsam = 2;
      root.sfx.gotoAndPlay("useObj");
      game.unregisterDropZone(this);
      game.removeObject("balsam");
      endFct = function()
      {
         root.textWindow.closeWindow();
         game.trigger5 = 0;
         game.trigger6 = 1;
         game.registerWalkZone(game.spiderText);
         game.registerWalkZone(game.coronaText);
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM14Z31_p1",root.parseKitMissions),root.getInsName("txtM14Z31_p2",root.parseKitMissions),root.getInsName("txtM14Z31_p3",root.parseKitMissions),root.getInsName("txtM14Z31_p4",root.parseKitMissions),root.getInsName("txtM14Z31_p5",root.parseKitMissions),root.getInsName("txtM14Z31_p6",root.parseKitMissions),root.getInsName("txtM14Z31_p7",root.parseKitMissions)],13,endFct);
   };
   fct = function(item)
   {
      if(item == "balsam")
      {
         if(game.newTile.xtile == 35 && game.newTile.ytile == 37)
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
   if(game.balsam < 2)
   {
      game.registerDropZone(this);
   }
}
