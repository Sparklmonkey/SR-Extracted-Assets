onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(game.flagInv != 0)
      {
         score = game.flagInv * 20;
         root.updateGuildScore(score);
         i = 1;
         while(i <= game.flagInv)
         {
            game.removeObject("flag");
            i++;
         }
         game.flagInv = 0;
         endFct = function()
         {
            root.textWindow.drawWindow([root.getInsName("txt_ev_give1",root.parseKitWorld) + score + root.getInsName("txt_ev_give2",root.parseKitWorld)],0,root.textWindow.closeWindow);
         };
         root.textWindow.drawWindow([root.getInsName("txt_ev10_bkg26_1",root.parseKitWorld)],25,endFct);
      }
      else if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev10_bkg26_2",root.parseKitWorld)],25,root.textWindow.closeWindow);
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev10_bkg26_3",root.parseKitWorld)],25,root.textWindow.closeWindow);
      }
   };
   if(root.crntEvent.id == 10)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint" || root.crntEvent.state == "result")
      {
         game.registerWalkZone(this);
      }
   }
}
