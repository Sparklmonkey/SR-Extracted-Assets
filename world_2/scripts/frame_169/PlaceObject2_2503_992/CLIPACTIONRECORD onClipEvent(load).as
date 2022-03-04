onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(game.humanInv != 0)
      {
         score = game.humanInv * 20;
         root.updateGuildScore(score);
         i = 1;
         while(i <= game.humanInv)
         {
            game.removeObject("objHuman");
            i++;
         }
         game.humanInv = 0;
         endFct = function()
         {
            root.textWindow.drawWindow([root.getInsName("txt_ev_give1",root.parseKitWorld) + score + root.getInsName("txt_ev_give2",root.parseKitWorld)],0,root.textWindow.closeWindow);
         };
         root.textWindow.drawWindow([root.getInsName("txt_ev11_bkg28_1",root.parseKitWorld)],27,endFct);
      }
      else if(root.crntEvent.state == "collect")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev11_bkg28_2",root.parseKitWorld),root.getInsName("txt_ev11_bkg28_3",root.parseKitWorld)],27,root.textWindow.closeWindow);
      }
      else if(root.crntEvent.state == "sprint")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev11_bkg28_4",root.parseKitWorld)],27,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev11_bkg28_5",root.parseKitWorld),root.getInsName("txt_ev11_bkg28_6",root.parseKitWorld),root.getInsName("txt_ev11_bkg28_7",root.parseKitWorld)],27,root.textWindow.closeWindow);
      }
   };
   if(root.crntEvent.id == 11)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint" || root.crntEvent.state == "result")
      {
         game.registerWalkZone(this);
      }
   }
}
