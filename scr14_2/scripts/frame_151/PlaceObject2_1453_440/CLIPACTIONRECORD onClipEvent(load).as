onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:27,k1:39};
   newObj2 = {lvl:0,j1:27,k1:31};
   newObj.fct = function()
   {
      root.sfx.gotoAndPlay("correctBeep");
      game.web5.gotoAndPlay(2);
      game.char.char.gotoAndStop("runNweb2");
      game.endInteruptFct = function()
      {
         game.moveChar([game.getTileInfo(31,25)]);
         game.char.char.gotoAndStop("idleC");
      };
   };
   newObj2.fct = function()
   {
      root.sfx.gotoAndPlay("correctBeep");
      game.web5.gotoAndPlay(2);
      game.char.char.gotoAndStop("runSweb2");
      game.endInteruptFct = function()
      {
         game.moveChar([game.getTileInfo(39,27)]);
         game.char.char.gotoAndStop("idleC");
      };
   };
   fct = function(item)
   {
      if(item == "spiderItem")
      {
         if(game.newTile.j1 == 27 && game.newTile.k1 == 39)
         {
            root.tweenStop = false;
            newObj2.fct();
         }
         else
         {
            root.tweenStop = false;
            game.tileTriggered(newObj2);
         }
         if(game.newTile.j1 == 27 && game.newTile.k1 == 31)
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
   game.registerDropZone(this);
}
