onClipEvent(load){
   _visible = false;
   newObj = {lvl:1,j1:33,k1:23};
   newObj2 = {lvl:1,j1:31,k1:39};
   newObj.fct = function()
   {
      root.sfx.gotoAndPlay("correctBeep");
      game.web2.gotoAndPlay(2);
      game.char.char.gotoAndStop("runSweb");
      game.endInteruptFct = function()
      {
         game.moveChar([game.getTileInfo(39,29)]);
         game.char.char.gotoAndStop("idleC");
      };
   };
   newObj2.fct = function()
   {
      root.sfx.gotoAndPlay("correctBeep");
      game.web2.gotoAndPlay(2);
      game.char.char.gotoAndStop("runNweb");
      game.endInteruptFct = function()
      {
         game.moveChar([game.getTileInfo(23,33)]);
         game.char.char.gotoAndStop("idleG");
      };
   };
   fct = function(item)
   {
      if(item == "spiderItem")
      {
         if(game.newTile.j1 == 31 && game.newTile.k1 == 39)
         {
            root.tweenStop = false;
            newObj2.fct();
         }
         else
         {
            root.tweenStop = false;
            game.tileTriggered(newObj2);
         }
      }
      if(game.newTile.j1 == 33 && game.newTile.k1 == 23)
      {
         root.tweenStop = false;
         newObj.fct();
      }
      else
      {
         root.tweenStop = false;
         game.tileTriggered(newObj);
      }
   };
   game.registerDropZone(this);
}
