onClipEvent(load){
   _visible = false;
   fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         if(game.char._y + game.offsetIsoY > this._y)
         {
            game.moveChar([game.getTileInfo(49,35)]);
         }
         else
         {
            game.moveChar([game.getTileInfo(21,21)]);
         }
         delete endFct;
      };
      root.textWindow.drawWindow([root.getInsName("txtM5Z7_p1",root.parseKitMissions)],10,endFct);
   };
   if(game.battleBoss < 1)
   {
      game.registerWalkZone(this);
   }
}
