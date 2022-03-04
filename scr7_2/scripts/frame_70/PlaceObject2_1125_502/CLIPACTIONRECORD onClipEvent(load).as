onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:39,k1:51};
   newObj.fct = function()
   {
      game.web = 1;
      game.itemContainer.toile1._visible = false;
      root.sfx.gotoAndPlay("correctBeep");
      game.removeObject("oilItem");
      game.sparkle1._visible = false;
      game.unregisterDropZone(game.phatwebZone);
      game.openPath2();
      if(game.web == 1 && game.boardDroped == 2 && game.stone == 1)
      {
         game.event8 = 1;
         game.event7 = 1;
         game.event6 = 2;
      }
   };
   newObj2 = {lvl:0,j1:41,k1:41};
   newObj2.fct = function()
   {
      game.web = 1;
      game.itemContainer.toile1._visible = false;
      root.sfx.gotoAndPlay("correctBeep");
      game.removeObject("oilItem");
      game.sparkle1._visible = false;
      game.unregisterDropZone(game.phatwebZone);
      game.openPath2();
      if(game.web == 1 && game.boardDroped == 1 && game.stone == 1)
      {
         game.event7 = 1;
         game.event6 = 2;
      }
   };
   fct = function(item)
   {
      if(item == "oilItem")
      {
         if(game.newTile.xtile == 51 && game.newTile.ytile == 39 || game.newTile.xtile == 41 && game.newTile.ytile == 41)
         {
            root.tweenStop = false;
            newObj.fct();
         }
         else
         {
            root.tweenStop = false;
            if(game.char._y + game.offsetIsoY < game.phatwebZone._y)
            {
               game.tileTriggered(newObj2);
            }
            else
            {
               game.tileTriggered(newObj);
            }
         }
      }
   };
   if(game.web < 1)
   {
      game.registerDropZone(this);
   }
}
