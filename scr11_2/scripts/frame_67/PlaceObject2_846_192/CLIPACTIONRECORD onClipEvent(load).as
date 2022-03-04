onClipEvent(load){
   _visible = false;
   if(game.trigger1 == 1)
   {
      fct = function()
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM11Z18_p1",root.parseKitMissions),root.getInsName("txtM11Z18_p2",root.parseKitMissions),root.getInsName("txtM11Z18_p3",root.parseKitMissions),root.getInsName("txtM11Z18_p4",root.parseKitMissions)],27,endFct);
         game.unregisterWalkZone(this);
      };
      game.registerWalkZone(this);
   }
}
