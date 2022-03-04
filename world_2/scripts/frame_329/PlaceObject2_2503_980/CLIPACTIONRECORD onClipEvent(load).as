onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(game.humanHeadInv != 0)
      {
         score = game.humanHeadInv * 20;
         root.updateGuildScore(score);
         i = 1;
         while(i <= game.humanHeadInv)
         {
            game.removeObject("objHuman");
            i++;
         }
         game.humanHeadInv = 0;
         endFct = function()
         {
            root.textWindow.drawWindow([root.getInsName("txt_ev_give1",root.parseKitWorld) + score + root.getInsName("txt_ev_give2",root.parseKitWorld)],0,root.textWindow.closeWindow);
         };
         root.textWindow.drawWindow([root.getInsName("txt_ev12_bkg48_2_1",root.parseKitWorld)],50,endFct);
      }
      else if(root.crntEvent.state == "collect")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev12_bkg48_2_2",root.parseKitWorld)],50,root.textWindow.closeWindow);
      }
      else if(root.crntEvent.state == "result")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev12_bkg48_2_3",root.parseKitWorld),root.getInsName("txt_ev12_bkg48_2_4",root.parseKitWorld)],50,root.textWindow.closeWindow);
      }
   };
   if(root.crntEvent.id == 12)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint" || root.crntEvent.state == "result")
      {
         game.registerWalkZone(this);
      }
   }
}
