onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.battle11 > 1 && game.battle12 > 1 && game.battle13 > 1)
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            root.gotoAndStop("level7");
            root.sfx.gotoAndPlay("winner");
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM6Z8_p1",root.parseKitMissions)],46,endFct);
         game.battle11 = 0;
         game.unregisterWalkZone(this);
      }
      else
      {
         game.unregisterWalkZone(this);
      }
   };
   if(game.battle11 < 1 || game.battle12 < 1 || game.battle13 < 1)
   {
      game.registerWalkZone(this);
   }
}
