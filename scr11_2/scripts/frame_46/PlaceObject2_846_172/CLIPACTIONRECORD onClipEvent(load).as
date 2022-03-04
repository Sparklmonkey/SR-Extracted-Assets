onClipEvent(load){
   _visible = false;
   if(game.trigger1 == 1)
   {
      fct = function()
      {
         game.text10 = 1;
         endFct2 = function()
         {
            root.textWindow.closeWindow();
            delete endFct2;
         };
         endFct = function()
         {
            root.textWindow.closeWindow();
            root.textWindow.drawWindow([root.getInsName("txtM11Z15_p1",root.parseKitMissions)],26,endFct2);
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM11Z15_p2",root.parseKitMissions),root.getInsName("txtM11Z15_p3",root.parseKitMissions),root.getInsName("txtM11Z15_p4",root.parseKitMissions),root.getInsName("txtM11Z15_p5",root.parseKitMissions),root.getInsName("txtM11Z15_p6",root.parseKitMissions),root.getInsName("txtM11Z15_p7",root.parseKitMissions)],26,endFct);
         game.unregisterWalkZone(this);
         game.trigger1 = 0;
         game.trigger2 = 1;
         game.placeObject(0,13,15,"gold",1);
         game.placeObject(0,16,15,"gold",2);
         game.placeObject(0,19,15,"gold",3);
         game.registerWalkZone(game.gold1Zone);
         game.registerWalkZone(game.gold2Zone);
         game.registerWalkZone(game.gold3Zone);
         game.action4 = 1;
         game.action5 = 1;
         game.action6 = 1;
      };
      if(game.text10 < 1)
      {
         game.registerWalkZone(this);
      }
   }
}
