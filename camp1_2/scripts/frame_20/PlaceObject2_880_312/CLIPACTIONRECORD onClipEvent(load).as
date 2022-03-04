onClipEvent(load){
   _visible = false;
   fct = function()
   {
      root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg14_1_1",root.parseKitMissions),root.getInsName("txt_cp1_bkg14_1_2",root.parseKitMissions),root.getInsName("txt_cp1_bkg14_1_3",root.parseKitMissions)],6,game.battleZone1.fct);
      game.unregisterWalkZone(this);
   };
   if(game.battle3 < 1 && game.gameTrigger > 1)
   {
      game.registerWalkZone(this);
   }
}
