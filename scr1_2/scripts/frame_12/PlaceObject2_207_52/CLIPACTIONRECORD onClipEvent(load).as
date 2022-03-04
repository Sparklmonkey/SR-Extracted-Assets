onClipEvent(load){
   _visible = false;
   if(game.text4 < 1 && game.rope > 0)
   {
      waitPopup = 20;
      this.onEnterFrame = function()
      {
         if(waitPopup > 0)
         {
            waitPopup--;
         }
         else
         {
            game.text4 = 1;
            endFct = function()
            {
               root.textWindow.closeWindow();
               delete endFct;
            };
            root.textWindow.drawWindow([root.getInsName("txtM1Z4_p1",root.parseKitMissions),root.getInsName("txtM1Z4_p2",root.parseKitMissions),root.getInsName("txtM1Z4_p3",root.parseKitMissions)],12,endFct);
            delete this.onEnterFrame;
            delete fct;
         }
      };
   }
}
