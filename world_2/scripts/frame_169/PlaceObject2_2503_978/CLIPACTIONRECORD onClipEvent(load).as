onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.unregisterWalkZone(this);
      if(game.lumensHeadInv != 0)
      {
         trace("lumensHeadInv = " + game.lumensHeadInv);
         score = game.lumensHeadInv * 20;
         root.updateGuildScore(score);
         endFct = function()
         {
            root.textWindow.drawWindow([root.getInsName("txt_ev_give1",root.parseKitWorld) + score + root.getInsName("txt_ev_give2",root.parseKitWorld)],0,root.textWindow.closeWindow);
         };
         root.textWindow.drawWindow([root.getInsName("txt_ev3_bkg28_1",root.parseKitWorld)],25,endFct);
         i = 1;
         while(i <= game.lumensHeadInv)
         {
            game.removeObject("lumens_head");
            i++;
         }
         game.lumensHeadInv = 0;
      }
      else if(root.crntEvent.state == "collect")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev3_bkg28_2",root.parseKitWorld),root.getInsName("txt_ev3_bkg28_3",root.parseKitWorld),root.getInsName("txt_ev3_bkg28_4",root.parseKitWorld)],25,root.textWindow.closeWindow);
      }
      else if(root.crntEvent.state == "result")
      {
         root.textWindow.drawWindow([root.getInsName("txt_ev3_bkg28_5",root.parseKitWorld),root.getInsName("txt_ev3_bkg28_6",root.parseKitWorld)],25,root.textWindow.closeWindow);
      }
   };
   if(root.crntEvent.id == 3)
   {
      if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint" || root.crntEvent.state == "result")
      {
         game.registerWalkZone(this);
      }
   }
}
