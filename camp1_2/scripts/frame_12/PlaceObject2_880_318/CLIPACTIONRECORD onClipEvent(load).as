onClipEvent(load){
   _visible = false;
   fct = function()
   {
      root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg13_3_1",root.parseKitMissions)],39,game.battleZone1.fct);
      game.unregisterWalkZone(this);
   };
   if(game.gameTrigger > 2 && game.battle6 < 1)
   {
      game.registerWalkZone(this);
   }
}
