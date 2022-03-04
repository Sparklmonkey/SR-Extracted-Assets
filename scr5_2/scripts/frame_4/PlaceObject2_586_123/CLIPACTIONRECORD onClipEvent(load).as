onClipEvent(load){
   _visible = false;
   newObj = {lvl:0,j1:37,k1:21};
   newObj.fct = function()
   {
   };
   fct = function(item)
   {
      var _loc1_ = item;
      if(_loc1_ == "monacle" && game.text1 < 1)
      {
         newObj.fct = function()
         {
            endFct = function()
            {
               root.textWindow.closeWindow();
               delete endFct;
            };
            game.text1 = 1;
            root.sfx.gotoAndPlay("useObj");
            root.textWindow.drawWindow([root.getInsName("txtM5Z1_p1",root.parseKitMissions),root.getInsName("txtM5Z1_p2",root.parseKitMissions)],3,endFct);
         };
         if(game.newTile.xtile == 37 && game.newTile.ytile == 21)
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
      else if(_loc1_ == "purpleFlower" && game.purpleFlower == 1)
      {
         newObj.fct = function()
         {
            endFct = function()
            {
               root.textWindow.closeWindow();
               delete endFct;
            };
            game.purpleFlower = 2;
            game.removeObject("purpleFlower");
            root.sfx.gotoAndPlay("useObj");
            if(game.womanbag == 2)
            {
               root.textWindow.drawWindow([root.getInsName("txtM5Z1_p3",root.parseKitMissions),root.getInsName("txtM5Z1_p4",root.parseKitMissions)],3,endFct);
               game.placeObject(0,8,16,"balsam",3);
               game.registerWalkZone(game.balsamZone);
            }
            else
            {
               root.textWindow.drawWindow([root.getInsName("txtM5Z1_p5",root.parseKitMissions),root.getInsName("txtM5Z1_p6",root.parseKitMissions)],3,endFct);
            }
         };
         if(game.newTile.xtile == 37 && game.newTile.ytile == 21)
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
      else if(_loc1_ == "womanbag" && game.womanbag == 1)
      {
         newObj.fct = function()
         {
            endFct = function()
            {
               root.textWindow.closeWindow();
               delete endFct;
            };
            game.removeObject("womanbag");
            game.womanbag = 2;
            root.sfx.gotoAndPlay("useObj");
            if(game.purpleFlower == 2)
            {
               root.textWindow.drawWindow([root.getInsName("txtM5Z1_p7",root.parseKitMissions),root.getInsName("txtM5Z1_p8",root.parseKitMissions)],3,endFct);
               game.placeObject(0,8,16,"balsam",3);
               game.registerWalkZone(game.balsamZone);
            }
            else
            {
               root.textWindow.drawWindow([root.getInsName("txtM5Z1_p9",root.parseKitMissions),root.getInsName("txtM5Z1_p10",root.parseKitMissions)],3,endFct);
            }
         };
         if(game.newTile.xtile == 37 && game.newTile.ytile == 21)
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
