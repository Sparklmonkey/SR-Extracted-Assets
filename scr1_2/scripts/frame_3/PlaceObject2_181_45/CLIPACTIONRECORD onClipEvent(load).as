onClipEvent(load){
   _visible = false;
   if(game.text1 < 1)
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
            game.text1 = 1;
            endFct = function()
            {
               root.textWindow.closeWindow();
               delete endFct;
            };
            root.textWindow.drawWindow([root.getInsName("txtM1Z1_p1",root.parseKitMissions)],0,endFct);
            delete this.onEnterFrame;
            delete fct;
         }
      };
   }
}
