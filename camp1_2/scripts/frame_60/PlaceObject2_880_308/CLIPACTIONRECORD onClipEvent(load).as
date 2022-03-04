onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(game.text1 < 1)
      {
         endFct = function()
         {
            game.text1 = 1;
            game.placeObject(0,15,12,"gold",1);
            game.registerWalkZone(game.goldZone);
         };
         root.textWindow.drawWindow([root.getInsName("txt_cp1_bkg22_3_1",root.parseKitMissions),root.getInsName("txt_cp1_bkg22_3_2",root.parseKitMissions),root.getInsName("txt_cp1_bkg22_3_3",root.parseKitMissions),root.getInsName("txt_cp1_bkg22_3_4",root.parseKitMissions)],56,endFct);
      }
   };
   if(game.text1 < 1)
   {
      game.registerWalkZone(this);
   }
}
