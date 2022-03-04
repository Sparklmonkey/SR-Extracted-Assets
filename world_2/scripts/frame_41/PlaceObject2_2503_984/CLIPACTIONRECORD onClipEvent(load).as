onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(game.wheatInv != 0)
      {
         score = game.wheatInv * 20;
         root.updateGuildScore(score);
         i = 1;
         while(i <= game.wheatInv)
         {
            game.removeObject("wheat");
            i++;
         }
         game.wheatInv = 0;
         endFct = function()
         {
            root.textWindow.drawWindow([root.getInsName("txt_ev_give1",root.parseKitWorld) + score + root.getInsName("txt_ev_give2",root.parseKitWorld)],0,root.textWindow.closeWindow);
         };
         root.textWindow.drawWindow([root.getInsName("txt_ev7_bkg12_1",root.parseKitWorld)],19,endFct);
      }
      else if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev7_bkg12_2",root.parseKitWorld)],19,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev7_bkg12_3",root.parseKitWorld)],19,root.textWindow.closeWindow);
      }
   };
   if(root.crntEvent.id == 7)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint" || root.crntEvent.state == "result")
      {
         game.registerWalkZone(this);
      }
   }
}
