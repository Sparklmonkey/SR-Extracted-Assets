onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card3 = 1;
      game.char.char.gotoAndStop("pickUp");
      game.itemContainer.card2._visible = false;
      if(game.card2 == 1)
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
      game.addBattleCard(419);
      root.cardInfoWindow.drawWindow(419);
      game.unregisterWalkZone(this);
   };
   if(game.battle8 > 0 && game.card3 < 1)
   {
      game.registerWalkZone(this);
   }
}
