onClipEvent(load){
   _visible = false;
   newObj = {lvl:3,j1:23,k1:11};
   newObj2 = {lvl:2,j1:25,k1:17};
   newObj.fct = function()
   {
      root.sfx.gotoAndPlay("correctBeep");
      game.web1.gotoAndPlay(2);
      game.char.char.gotoAndStop("downweb03");
      game.endInteruptFct = function()
      {
         game.moveChar([game.getTileInfo(17,27)]);
         game.char.char.gotoAndStop("idleG");
      };
   };
   newObj2.fct = function()
   {
      root.sfx.gotoAndPlay("correctBeep");
      game.web1.gotoAndPlay(2);
      game.char.char.gotoAndStop("climbweb03");
      game.endInteruptFct = function()
      {
         game.moveChar([game.getTileInfo(11,23)]);
         game.char.char.gotoAndStop("idleG");
      };
   };
   fct = function(item)
   {
      if(item == "spiderItem")
      {
         if(game.newTile.lvl == 2 && game.newTile.j1 <= 25)
         {
            if(game.newTile.j1 == 25 && game.newTile.k1 == 17)
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
         else if(game.newTile.j1 == 23 && game.newTile.k1 == 11)
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
