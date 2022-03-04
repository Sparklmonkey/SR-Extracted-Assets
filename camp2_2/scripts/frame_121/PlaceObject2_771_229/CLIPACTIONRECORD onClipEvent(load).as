onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.invBook = 4;
      game.char.char.gotoAndStop("pickUp");
      endFct = function()
      {
         root.updatePlayer();
         root.charWindow.drawWindow();
         root.inCamp = false;
      };
      game.itemContainer.holyBook1._visible = false;
      root.textWindow.drawWindow([root.getInsName("txt_cp2_bkg59_2_1",root.parseKitMissions)],0,endFct);
      game.unregisterWalkZone(this);
   };
   if(game.battle4 == 1)
   {
      game.registerWalkZone(this);
   }
}
