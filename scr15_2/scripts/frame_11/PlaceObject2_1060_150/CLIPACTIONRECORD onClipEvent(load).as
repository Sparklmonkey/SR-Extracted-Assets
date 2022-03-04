onClipEvent(load){
   _visible = false;
   endFct = function()
   {
      root.textWindow.closeWindow();
      root.gotoAndStop("level16");
      delete endFct;
   };
   fct = function()
   {
      root.textWindow.drawWindow([root.getInsName("txtM15Z3_p1",root.parseKitMissions),root.getInsName("txtM15Z3_p2",root.parseKitMissions),root.getInsName("txtM15Z3_p3",root.parseKitMissions)],0,endFct);
   };
   if(game.gold2 == 2)
   {
      game.registerWalkZone(this);
   }
}
