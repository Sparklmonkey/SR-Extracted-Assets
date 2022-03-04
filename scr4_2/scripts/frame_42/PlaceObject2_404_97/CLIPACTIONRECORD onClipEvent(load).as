onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card3 = 1;
      game.addBattleCard(200);
      game.itemContainer.cardField5._visible = false;
      endFct = function()
      {
         root.cardInfoWindow.drawWindow(200);
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM4Z4_p1",root.parseKitMissions),root.getInsName("txtM4Z4_p2",root.parseKitMissions)],200,endFct);
      game.unregisterWalkZone(this);
      delete fct;
   };
   if(game.card3 < 1)
   {
      game.registerWalkZone(this);
   }
}
