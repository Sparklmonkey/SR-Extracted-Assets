onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:37,k1:35};
   newObj.fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         game.gold1 = 2;
         root.sfx.gotoAndPlay("useObj");
         game.unregisterDropZone(this);
         game.removeObject("gold1");
         game.addBattleCard(105);
         root.cardInfoWindow.drawWindow(105);
         game.placeObject(0,16,19,"ring",1);
         game.itemContainer.cardField1._visible = false;
         game.registerWalkZone(game.ringZone);
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM15Z11_p1",root.parseKitMissions),root.getInsName("txtM15Z11_p2",root.parseKitMissions),root.getInsName("txtM15Z11_p3",root.parseKitMissions)],23,endFct);
   };
   fct = function(item)
   {
      if(item == "gold1")
      {
         if(game.newTile.xtile == 37 && game.newTile.ytile == 35)
         {
            root.tweenStop = false;
            newObj.fct();
         }
         else
         {
            root.tweenStop = false;
            game.text8 = 1;
            game.tileTriggered(newObj);
         }
      }
   };
   if(game.gold1 < 2)
   {
      game.registerDropZone(this);
   }
}
