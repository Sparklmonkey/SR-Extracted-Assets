onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         game.moveChar([game.getTileInfo(31,41)]);
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM5Z5_p1",root.parseKitMissions)],9,endFct);
   };
   if(game.text7 < 1)
   {
      game.registerWalkZone(this);
   }
}
