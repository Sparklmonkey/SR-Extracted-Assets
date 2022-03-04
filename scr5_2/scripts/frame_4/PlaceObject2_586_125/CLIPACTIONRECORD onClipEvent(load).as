onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:27,k1:25};
   newObj.fct = function()
   {
      endFct = function()
      {
         root.textWindow.closeWindow();
         delete endFct;
      };
      game.text2 = 1;
      root.sfx.gotoAndPlay("useObj");
      root.textWindow.drawWindow([root.getInsName("txtM5Z3_p1",root.parseKitMissions)],4,endFct);
      game.unregisterDropZone(game.zoneA1);
   };
   fct = function(item)
   {
      if(item == "monacle")
      {
         if(game.newTile.xtile == 27 && game.newTile.ytile == 25)
         {
            root.tweenStop = false;
            newObj.fct();
         }
         else
         {
            root.tweenStop = false;
            game.tileTriggered(newObj);
         }
      }
   };
   if(game.text2 < 1)
   {
      game.registerDropZone(this);
   }
}
