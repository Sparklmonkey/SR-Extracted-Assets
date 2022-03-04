onClipEvent(load){
   _visible = false;
   newObj = {lvl:4,j1:23,k1:35};
   newObj2 = {lvl:9,j1:23,k1:31};
   newObj.fct = function()
   {
      root.sfx.gotoAndPlay("correctBeep");
      game.web1.gotoAndPlay(2);
      game.char.char.gotoAndStop("climbweb04");
      game.endInteruptFct = function()
      {
         game.moveChar([game.getTileInfo(31,23)]);
         game.char.char.gotoAndStop("idleG");
      };
   };
   newObj2.fct = function()
   {
      root.sfx.gotoAndPlay("correctBeep");
      game.web1.gotoAndPlay(2);
      game.char.char.gotoAndStop("downweb03");
      game.endInteruptFct = function()
      {
         game.moveChar([game.getTileInfo(35,25)]);
         game.char.char.gotoAndStop("idleG");
      };
   };
   fct = function(item)
   {
      if(item == "spiderItem")
      {
         if(game.newTile.lvl == 9 && game.newTile.j1 <= 25)
         {
            if(game.newTile.j1 == 23 && game.newTile.k1 == 31)
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
         else if(game.newTile.j1 == 25 && game.newTile.k1 == 35)
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
