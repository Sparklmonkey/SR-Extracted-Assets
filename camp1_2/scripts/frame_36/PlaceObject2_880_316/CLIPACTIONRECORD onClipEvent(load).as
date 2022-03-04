onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.card2 = 1;
      game.char.char.gotoAndStop("pickUp");
      game.itemContainer.card1._visible = false;
      game.addBattleCard(414);
      root.cardInfoWindow.drawWindow(414);
      endFct = function()
      {
         root.textWindow.closeWindow();
         root.charWindow.drawWindow();
         root.inCamp = false;
      };
      root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg16_4_1",root.parseKitMissions)],0,endFct);
      game.unregisterWalkZone(this);
   };
}
