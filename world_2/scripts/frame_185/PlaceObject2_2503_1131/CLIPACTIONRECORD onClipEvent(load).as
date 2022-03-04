onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(game.starInv != 0)
      {
         score = game.starInv * 20;
         root.updateGuildScore(score);
         i = 1;
         while(i <= game.starInv)
         {
            game.removeObject("stars");
            i++;
         }
         game.starInv = 0;
         endFct = function()
         {
            root.textWindow.drawWindow([root.getInsName("txt_ev_give1",root.parseKitWorld) + score + root.getInsName("txt_ev_give2",root.parseKitWorld)],0,root.textWindow.closeWindow);
         };
         root.textWindow.drawWindow([root.getInsName("txt_ev9_bkg30_1",root.parseKitWorld),root.getInsName("txt_ev9_bkg30_2",root.parseKitWorld)],26,endFct);
      }
      else if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev9_bkg30_3",root.parseKitWorld)],26,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev9_bkg30_4",root.parseKitWorld)],26,root.textWindow.closeWindow);
      }
   };
   if(root.crntEvent.id == 9)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint" || root.crntEvent.state == "result")
      {
         game.registerWalkZone(this);
      }
   }
}
