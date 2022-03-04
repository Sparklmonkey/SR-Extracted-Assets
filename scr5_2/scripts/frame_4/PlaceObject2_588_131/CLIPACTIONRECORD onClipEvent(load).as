onClipEvent(load){
   _visible = false;
   fct = function()
   {
      if(game.balsam < 2)
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         textArray = [root.getInsName("txtM5Z2_p1",root.parseKitMissions)];
         if(game.purpleFlower < 2)
         {
            textArray.push(root.getInsName("txtM5Z2_p2",root.parseKitMissions));
         }
         if(game.womanbag < 2)
         {
            textArray.push(root.getInsName("txtM5Z2_p3",root.parseKitMissions));
         }
         root.textWindow.drawWindow(textArray,3,endFct);
      }
      else
      {
         endFct = function()
         {
            root.textWindow.closeWindow();
            delete endFct;
         };
         root.textWindow.drawWindow([root.getInsName("txtM5Z2_p4",root.parseKitMissions)],3,endFct);
      }
      game.unregisterWalkZone(this);
   };
   game.registerWalkZone(this);
}
