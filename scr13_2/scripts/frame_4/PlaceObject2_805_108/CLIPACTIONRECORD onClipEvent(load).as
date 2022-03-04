onClipEvent(load){
   _visible = false;
   if(game.battle4 <= 1)
   {
      newObj = {lvl:0,j1:45,k1:33};
      newObj2 = {lvl:1,j1:37,k1:23};
      newObj.fct = function()
      {
         root.sfx.gotoAndPlay("correctBeep");
         game.web1.gotoAndPlay(2);
         game.char.char.gotoAndStop("climbweb04");
         game.endInteruptFct = function()
         {
            game.moveChar([game.getTileInfo(23,37)]);
            game.char.char.gotoAndStop("idleG");
         };
      };
      newObj2.fct = function()
      {
         root.sfx.gotoAndPlay("correctBeep");
         game.web1.gotoAndPlay(2);
         game.char.char.gotoAndStop("downweb04");
         game.endInteruptFct = function()
         {
            game.moveChar([game.getTileInfo(33,45)]);
            game.char.char.gotoAndStop("idleG");
         };
      };
      fct = function(item)
      {
         if(item == "spiderItem")
         {
            if(game.newTile.lvl == 1 && game.newTile.j1 <= 35)
            {
               if(game.newTile.j1 == 35 && game.newTile.k1 == 23)
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
            else if(game.newTile.j1 == 45 && game.newTile.k1 == 33)
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
}
