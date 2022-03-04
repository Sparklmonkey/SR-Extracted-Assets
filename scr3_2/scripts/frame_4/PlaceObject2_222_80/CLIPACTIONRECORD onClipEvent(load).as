onClipEvent(load){
   _visible = false;
   fct = function()
   {
      var _loc2_ = this;
      for(var _loc1_ in game.btnContainer)
      {
         game.btnContainer[_loc1_].removeMovieClip();
      }
      timeVisible = 100;
      root.sfx.gotoAndPlay("inHole");
      _loc2_.onEnterFrame = function()
      {
         if(timeVisible > 0)
         {
            timeVisible -= 5;
            game.char._alpha = timeVisible;
         }
         else
         {
            game.char._visible = false;
            endFct = function()
            {
               root.textWindow.closeWindow();
               root.gotoAndStop("level4");
               delete endFct;
            };
            root.textWindow.drawWindow([root.getInsName("txtM3Z2_p1",root.parseKitMissions)],0,endFct);
            root.sfx.gotoAndPlay("winner");
            delete this.onEnterFrame;
         }
      };
      game.unregisterWalkZone(_loc2_);
      delete fct;
   };
   if(game.missionOver > 0)
   {
      game.registerWalkZone(this);
   }
}
