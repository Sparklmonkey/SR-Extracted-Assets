onClipEvent(load){
   _visible = false;
   newObj = {lvl:1,j1:41,k1:31};
   newObj.fct = function()
   {
      game.spider = 1;
      game.itemContainer.spiderField1._visible = false;
      game.addObject("spiderItem");
      root.sfx.gotoAndPlay("useObj");
      endFct = function()
      {
         game.text7 = 1;
         root.playerStats.spider = root.spiderData;
         root.sprSex = 1;
         root.sprName = "";
         root.sproffSet = 0;
         root.sprHead = 1;
         root.sprBody = 1;
         root.sprLegs = 1;
         root.sprAccess = true;
         root.textWindow.closeWindow();
         root.charWindow.drawWindow2();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM5Z6_p1",root.parseKitMissions)],9,endFct);
      game.unregisterWalkZone(game.spiderZone);
      game.unregisterDropZone(game.spiderZone2);
   };
   fct = function(item)
   {
      if(item == "monacle")
      {
         if(game.newTile.xtile == 31 && game.newTile.ytile == 41)
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
   if(game.spider < 1)
   {
      game.registerDropZone(this);
   }
}
