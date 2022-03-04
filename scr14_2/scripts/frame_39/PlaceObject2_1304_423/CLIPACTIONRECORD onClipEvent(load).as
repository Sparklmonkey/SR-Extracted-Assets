onClipEvent(load){
   _visible = false;
   if(game.trigger4 == 1)
   {
      fct = function()
      {
         game.text22 = 1;
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM14Z6_p1",root.parseKitMissions)],5,endFct);
         game.placeObject(0,17,12,"balsam",1);
         game.registerWalkZone(game.balsamZone);
         game.unregisterWalkZone(this);
      };
      if(game.text22 < 1)
      {
         game.registerWalkZone(this);
      }
   }
}
