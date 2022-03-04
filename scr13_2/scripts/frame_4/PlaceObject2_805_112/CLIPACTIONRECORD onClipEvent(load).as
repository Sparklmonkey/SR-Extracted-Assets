onClipEvent(load){
   _visible = false;
   newObj = {lvl:1,j1:35,k1:21};
   newObj2 = {lvl:3,j1:33,k1:17};
   newObj.fct = function()
   {
      root.sfx.gotoAndPlay("correctBeep");
      game.web3.gotoAndPlay(2);
      game.char.char.gotoAndStop("climbweb03");
      game.endInteruptFct = function()
      {
         game.moveChar([game.getTileInfo(17,33)]);
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
         game.moveChar([game.getTileInfo(21,35)]);
         game.char.char.gotoAndStop("idleG");
      };
   };
   fct = function(item)
   {
      if(item == "spiderItem")
      {
         if(game.newTile.lvl == 3 && game.newTile.j1 <= 33)
         {
            if(game.newTile.j1 == 33 && game.newTile.k1 == 17)
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
         else if(game.newTile.j1 == 35 && game.newTile.k1 == 21)
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
