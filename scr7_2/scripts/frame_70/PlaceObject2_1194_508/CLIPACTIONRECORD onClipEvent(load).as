onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:41,k1:25};
   newObj2 = {lvl:1,j1:37,k1:19};
   newObj.fct = function()
   {
      root.sfx.gotoAndPlay("correctBeep");
      game.web3.gotoAndPlay(2);
      game.char.char.gotoAndStop("climbweb03");
      game.endInteruptFct = function()
      {
         game.moveChar([game.getTileInfo(19,37)]);
         game.char.char.gotoAndStop("idleG");
      };
   };
   newObj2.fct = function()
   {
      root.sfx.gotoAndPlay("correctBeep");
      game.web3.gotoAndPlay(2);
      game.char.char.gotoAndStop("downweb03");
      game.endInteruptFct = function()
      {
         game.moveChar([game.getTileInfo(25,41)]);
         game.char.char.gotoAndStop("idleG");
      };
   };
   fct = function(item)
   {
      if(item == "spiderItem")
      {
         if(game.newTile.lvl == 1 && game.newTile.j1 <= 37)
         {
            if(game.newTile.j1 == 37 && game.newTile.k1 == 19)
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
         else if(game.newTile.j1 == 41 && game.newTile.k1 == 25)
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
