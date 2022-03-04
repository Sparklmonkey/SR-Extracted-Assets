onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(game.machine1Inv != 0 || game.machine2Inv != 0 || game.machine3Inv != 0 || game.machine4Inv != 0)
      {
         score = (game.machine1Inv + game.machine2Inv + game.machine3Inv + game.machine4Inv) * 20;
         root.updateGuildScore(score);
         i = 1;
         while(i <= game.machine1Inv)
         {
            game.removeObject("machine1");
            i++;
         }
         game.machine1Inv = 0;
         i = 1;
         while(i <= game.machine2Inv)
         {
            game.removeObject("machine2");
            i++;
         }
         game.machine2Inv = 0;
         i = 1;
         while(i <= game.machine3Inv)
         {
            game.removeObject("machine3");
            i++;
         }
         game.machine3Inv = 0;
         i = 1;
         while(i <= game.machine4Inv)
         {
            game.removeObject("machine4");
            i++;
         }
         game.machine4Inv = 0;
         endFct = function()
         {
            root.textWindow.drawWindow([root.getInsName("txt_ev_give1",root.parseKitWorld) + score + root.getInsName("txt_ev_give2",root.parseKitWorld)],0,root.textWindow.closeWindow);
         };
         root.textWindow.drawWindow([root.getInsName("txt_ev5_bkg26_1",root.parseKitWorld)],22,endFct);
      }
      else if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev5_bkg26_2",root.parseKitWorld)],22,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev5_bkg26_3",root.parseKitWorld)],22,root.textWindow.closeWindow);
      }
   };
   if(root.crntEvent.id == 5)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint" || root.crntEvent.state == "result")
      {
         game.registerWalkZone(this);
      }
   }
}
