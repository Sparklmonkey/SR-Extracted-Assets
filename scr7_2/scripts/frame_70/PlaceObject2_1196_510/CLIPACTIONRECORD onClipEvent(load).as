onClipEvent(load){
   _visible = false;
   newObj = {lvl:2,j1:29,k1:21};
   newObj2 = {lvl:0,j1:39,k1:29};
   newObj.fct = function()
   {
      root.sfx.gotoAndPlay("correctBeep");
      game.web2.gotoAndPlay(2);
      game.char.char.gotoAndStop("downweb02");
      game.endInteruptFct = function()
      {
         game.moveChar([game.getTileInfo(29,39)]);
         game.char.char.gotoAndStop("idleC");
      };
   };
   newObj2.fct = function()
   {
      root.sfx.gotoAndPlay("correctBeep");
      game.web2.gotoAndPlay(2);
      game.char.char.gotoAndStop("climbweb02");
      game.endInteruptFct = function()
      {
         game.moveChar([game.getTileInfo(21,29)]);
         game.char.char.gotoAndStop("idleG");
      };
   };
   fct = function(item)
   {
      if(item == "spiderItem")
      {
         if(game.newTile.lvl == 0 && game.newTile.j1 <= 39)
         {
            if(game.newTile.j1 == 39 && game.newTile.k1 == 29)
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
         else if(game.newTile.j1 == 29 && game.newTile.k1 == 21)
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
