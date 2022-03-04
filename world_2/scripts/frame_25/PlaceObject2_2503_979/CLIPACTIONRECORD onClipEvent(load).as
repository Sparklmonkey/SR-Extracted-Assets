onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(game.logInv != 0)
      {
         trace("logInv = " + game.logInv);
         score = game.logInv * 20;
         root.updateGuildScore(score);
         endFct2 = function()
         {
            root.textWindow.closeWindow();
         };
         endFct = function()
         {
            root.textWindow.drawWindow([root.getInsName("txt_ev_give1",root.parseKitWorld) + score + root.getInsName("txt_ev_give2",root.parseKitWorld)],0,endFct2);
         };
         root.textWindow.drawWindow([root.getInsName("txt_ev1_bkg10_1",root.parseKitWorld)],8,endFct);
         i = 1;
         while(i <= game.logInv)
         {
            game.removeObject("wood");
            i++;
         }
         game.logInv = 0;
      }
      else
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
         };
         if(root.crntEvent.state == "collect")
         {
            root.textWindow.drawWindow([root.getInsName("txt_ev1_bkg10_2",root.parseKitWorld),root.getInsName("txt_ev1_bkg10_3",root.parseKitWorld)],8,endFct);
         }
         else if(root.crntEvent.state == "sprint")
         {
            root.textWindow.drawWindow([root.getInsName("txt_ev1_bkg10_4",root.parseKitWorld)],8,endFct);
         }
         else
         {
            root.textWindow.drawWindow([root.getInsName("txt_ev1_bkg10_5",root.parseKitWorld)],8,endFct);
         }
      }
   };
   if(root.crntEvent.id == 1)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint" || root.crntEvent.state == "result")
      {
         game.registerWalkZone(this);
      }
   }
}
