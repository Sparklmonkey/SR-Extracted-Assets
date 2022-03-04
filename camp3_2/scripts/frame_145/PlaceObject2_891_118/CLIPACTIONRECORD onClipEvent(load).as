onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card2 = 1;
      game.char.char.gotoAndStop("pickUp");
      game.itemContainer.card1._visible = false;
      if(game.card3 == 1)
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            root.updatePlayer();
            root.inCamp = false;
            root.charWindow.drawWindow();
         };
         root.textWindow.drawWindow([root.getInsName("txt_cp3_bkg58_3_1",root.parseKitMissions)],0,endFct);
      }
      game.addBattleCard(600);
      root.cardInfoWindow.drawWindow(600);
      game.unregisterWalkZone(this);
   };
   if(game.battle8 > 0 && game.card2 < 1)
   {
      game.registerWalkZone(this);
   }
}
