onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:27,k1:39};
   fct = function(item)
   {
      game.registerWalkZone(game.woodmanZone);
      if(item == "doorKeyItem" && game.doorKey == 1)
      {
         newObj.fct = function()
         {
            game.doorKey = 2;
            game.itemContainer.woodsman.char.axe._visible = false;
            game.placeObject(0,19,13,"axe",5);
            game.registerWalkZone(game.keyZone);
            root.sfx.gotoAndPlay("useObj");
            root.textWindow.drawWindow([root.getInsName("txtM5Z11_p1",root.parseKitMissions),root.getInsName("txtM5Z11_p2",root.parseKitMissions)],8,root.textWindow.closeWindow);
            game.removeObject("doorKeyItem");
         };
         if(game.newTile.xtile == 27 && game.newTile.ytile == 39)
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
      else if(item == "monacle" && game.text6 < 1)
      {
         newObj.fct2 = function()
         {
            game.text6 = 1;
            root.sfx.gotoAndPlay("useObj");
            endFct = function()
            {
               root.textWindow.closeWindow();
               delete endFct;
            };
            root.textWindow.drawWindow([root.getInsName("txtM5Z11_p3",root.parseKitMissions)],8,endFct);
         };
         if(game.newTile.xtile == 27 && game.newTile.ytile == 39)
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
   if(game.doorKey > 0 || game.text6 < 1)
   {
      game.registerDropZone(this);
   }
}
