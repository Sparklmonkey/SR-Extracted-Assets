onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM3Z4_p1",root.parseKitMissions)],2,endFct);
      game.addObject("monacleItem");
      game.char.char.gotoAndStop("pickUp");
      game.char.char.pickUpFct = function()
      {
         game.itemContainer.monacle1._visible = false;
         delete game.char.char.pickUpFct;
      };
      game.monacle = 1;
      game.text2 = 2;
      game.unregisterWalkZone(this);
   };
   if(game.text2 < 1)
   {
      game.registerWalkZone(this);
   }
}
