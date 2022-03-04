onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:31,k1:23};
   newObj.fct = function()
   {
      root.sfx.gotoAndPlay("useObj");
      game.unregisterDropZone(this);
      game.removeObject("frag3");
      game.puzzlefrag3._alpha = 100;
      game.frag3 = 2;
      if(game.frag1 == 2 && game.frag2 == 2 && game.frag3 == 2 && game.frag4 == 2 && game.frag5 == 2)
      {
         game.doorShown.gotoAndPlay(2);
         game.puzzlefrag1._visible = false;
         game.puzzlefrag2._visible = false;
         game.puzzlefrag3._visible = false;
         game.puzzlefrag4._visible = false;
         game.puzzlefrag5._visible = false;
         game.gameTrigger = 5;
         game.lockBtn._visible = false;
      }
   };
   fct = function(item)
   {
      trace(item);
      if(item == "frag3")
      {
         if(game.newTile.xtile == 23 && game.newTile.ytile == 31)
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
   if(game.frag3 < 2)
   {
      game.registerDropZone(this);
   }
}
