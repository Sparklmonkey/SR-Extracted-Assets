onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:39,k1:31};
   newObj2 = {lvl:0,j1:41,k1:39};
   newObj.fct = function()
   {
      root.sfx.gotoAndPlay("correctBeep");
      game.web4.gotoAndPlay(2);
      game.char.char.gotoAndStop("runSweb2");
      game.endInteruptFct = function()
      {
         game.moveChar([game.getTileInfo(39,41)]);
         game.char.char.gotoAndStop("idleC");
      };
   };
   newObj2.fct = function()
   {
      root.sfx.gotoAndPlay("correctBeep");
      game.web4.gotoAndPlay(2);
      game.char.char.gotoAndStop("runNweb2");
      game.endInteruptFct = function()
      {
         game.moveChar([game.getTileInfo(31,39)]);
         game.char.char.gotoAndStop("idleG");
      };
   };
   fct = function(item)
   {
      if(item == "spiderItem")
      {
         if(game.newTile.j1 == 39 && game.newTile.k1 == 31)
         {
            root.tweenStop = false;
            newObj2.fct();
         }
         else
         {
            root.tweenStop = false;
            game.tileTriggered(newObj2);
         }
         if(game.newTile.j1 == 41 && game.newTile.k1 == 39)
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
