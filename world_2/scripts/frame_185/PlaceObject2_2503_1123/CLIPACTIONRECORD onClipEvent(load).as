onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(game.stone1Inv != 0 || game.stone2Inv != 0 || game.stone3Inv != 0 || game.stone4Inv != 0)
      {
         score = (game.stone1Inv + game.stone2Inv + game.stone3Inv + game.stone4Inv) * 20;
         root.updateGuildScore(score);
         endFct = function()
         {
            root.textWindow.drawWindow([root.getInsName("txt_ev_give1",root.parseKitWorld) + score + root.getInsName("txt_ev_give2",root.parseKitWorld)],0,root.textWindow.closeWindow);
         };
         root.textWindow.drawWindow([root.getInsName("txt_ev4_bkg30_1_1",root.parseKitWorld),root.getInsName("txt_ev4_bkg30_1_2",root.parseKitWorld)],30,endFct);
         i = 1;
         while(i <= game.stone1Inv)
         {
            game.removeObject("stone1");
            i++;
         }
         game.stone1Inv = 0;
         i = 1;
         while(i <= game.stone2Inv)
         {
            game.removeObject("stone2");
            i++;
         }
         game.stone2Inv = 0;
         i = 1;
         while(i <= game.stone3Inv)
         {
            game.removeObject("stone3");
            i++;
         }
         game.stone3Inv = 0;
         i = 1;
         while(i <= game.stone4Inv)
         {
            game.removeObject("stone4");
            i++;
         }
         game.stone4Inv = 0;
      }
      else if(root.crntEvent.state == "collect")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev4_bkg30_1_3",root.parseKitWorld),root.getInsName("txt_ev4_bkg30_1_4",root.parseKitWorld),root.getInsName("txt_ev4_bkg30_1_5",root.parseKitWorld)],30,root.textWindow.closeWindow);
      }
      else if(root.crntEvent.state == "sprint")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev4_bkg30_1_6",root.parseKitWorld),root.getInsName("txt_ev4_bkg30_1_7",root.parseKitWorld)],30,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev4_bkg30_1_8",root.parseKitWorld),root.getInsName("txt_ev4_bkg30_1_9",root.parseKitWorld)],30,root.textWindow.closeWindow);
      }
   };
   if(root.crntEvent.id == 4)
   {
      game.registerWalkZone(this);
   }
}
