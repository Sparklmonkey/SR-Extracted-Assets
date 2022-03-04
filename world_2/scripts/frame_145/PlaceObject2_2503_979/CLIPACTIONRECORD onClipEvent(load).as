onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(game.flowerInv != 0)
      {
         score = game.flowerInv * 20;
         root.updateGuildScore(score);
         i = 1;
         while(i <= game.flowerInv)
         {
            game.removeObject("purple_flower");
            i++;
         }
         game.flowerInv = 0;
         endFct = function()
         {
            root.textWindow.drawWindow([root.getInsName("txt_ev_give1",root.parseKitWorld) + score + root.getInsName("txt_ev_give2",root.parseKitWorld)],0,root.textWindow.closeWindow);
         };
         root.textWindow.drawWindow([root.getInsName("txt_ev6_bkg25_1",root.parseKitWorld),root.getInsName("txt_ev6_bkg25_2",root.parseKitWorld)],5,endFct);
      }
      else if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev6_bkg25_3",root.parseKitWorld),root.getInsName("txt_ev6_bkg25_4",root.parseKitWorld),root.getInsName("txt_ev6_bkg25_5",root.parseKitWorld)],5,root.textWindow.closeWindow);
      }
      else if(root.crntEvent.state == "result")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev6_bkg25_6",root.parseKitWorld),root.getInsName("txt_ev6_bkg25_7",root.parseKitWorld)],5,root.textWindow.closeWindow);
      }
   };
   if(root.crntEvent.id == 6)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint" || root.crntEvent.state == "result")
      {
         game.registerWalkZone(this);
      }
   }
}
