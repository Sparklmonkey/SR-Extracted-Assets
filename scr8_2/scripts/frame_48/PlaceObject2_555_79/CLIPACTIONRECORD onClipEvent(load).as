onClipEvent(load){
   _visible = false;
   endFct = function()
   {
      root.textWindow.closeWindow();
      delete endFct;
   };
   newObj = {lvl:0,j1:29,k1:33};
   newObj.fct = function()
   {
      game.purpleFlower = 2;
      root.sfx.gotoAndPlay("useObj");
      game.unregisterDropZone(this);
      game.removeObject("purpleFlowerItem");
      game.unregisterWalkZone(this);
      root.textWindow.drawWindow([root.getInsName("txtM8Z11_p1",root.parseKitMissions),root.getInsName("txtM8Z11_p2",root.parseKitMissions),root.getInsName("txtM8Z11_p3",root.parseKitMissions),root.getInsName("txtM8Z11_p4",root.parseKitMissions),root.getInsName("txtM8Z11_p5",root.parseKitMissions),root.getInsName("txtM8Z11_p6",root.parseKitMissions),root.getInsName("txtM8Z11_p7",root.parseKitMissions),root.getInsName("txtM8Z11_p8",root.parseKitMissions)],5,endFct);
      game.trigger2 = 0;
      game.trigger3 = 1;
   };
   fct = function(item)
   {
      if(item == "purpleFlowerItem")
      {
         if(game.newTile.xtile == 33 && game.newTile.ytile == 29)
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
   if(game.purpleFlower > 0)
   {
      game.registerDropZone(this);
   }
}
