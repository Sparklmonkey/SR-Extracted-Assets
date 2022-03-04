onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(game.humanHeadInv != 0)
      {
         trace("humanHeadInv = " + game.humanHeadInv);
         score = game.humanHeadInv * 20;
         root.updateGuildScore(score);
         endFct2 = function()
         {
            root.textWindow.closeWindow();
         };
         endFct = function()
         {
            root.textWindow.drawWindow([root.getInsName("txt_ev_give1",root.parseKitWorld) + score + root.getInsName("txt_ev_give2",root.parseKitWorld)],0,endFct2);
         };
         root.textWindow.drawWindow([root.getInsName("txt_ev2_bkg7_1",root.parseKitWorld)],27,endFct);
         i = 1;
         while(i <= game.humanHeadInv)
         {
            game.removeObject("objHuman");
            i++;
         }
         game.humanHeadInv = 0;
      }
      else
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
         };
         if(root.crntEvent.state == "collect")
         {
            root.textWindow.drawWindow([root.getInsName("txt_ev2_bkg7_2",root.parseKitWorld),root.getInsName("txt_ev2_bkg7_3",root.parseKitWorld),root.getInsName("txt_ev2_bkg7_4",root.parseKitWorld)],27,endFct);
         }
         else if(root.crntEvent.state == "sprint")
         {
            root.textWindow.drawWindow([root.getInsName("txt_ev2_bkg7_5",root.parseKitWorld)],27,endFct);
         }
         else
         {
            root.textWindow.drawWindow([root.getInsName("txt_ev2_bkg7_6",root.parseKitWorld)],27,endFct);
         }
      }
   };
   if(root.crntEvent.id == 2)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint" || root.crntEvent.state == "result")
      {
         game.registerWalkZone(this);
      }
   }
}
