onClipEvent(load){
   this.onPress = function()
   {
      var _loc1_ = _parent;
      this.gotoAndStop("down");
      trace(root.playerStats.nbvisit);
      §§push(_loc1_);
      §§push(_loc2_);
      §§push(_loc3_);
      if(root.playerStats.nbvisit == 1)
      {
         var endFct4 = function()
         {
            root.textWindow.closeWindow();
            root.playerStats.nbvisit = root.playerStats.nbvisit + 1;
            trace(root.playerStats.nbvisit);
            delete endFct4;
         };
         root.textWindow.drawWindow([root.getInsName("txtFirst3Lvl",root.parseKitSheets)],0,endFct4);
      }
      else if(root.playerStats.guild == 0)
      {
         var _loc2_ = function()
         {
            _parent.gotoAndStop("guildSheet");
            root.askWindow.closeWindow();
         };
         root.askWindow.drawWindow([root.getInsName("txtJoinGuild1st",root.parseKitSheets)],_loc2_);
      }
      else if(_loc1_.spiderChange || _loc1_.charChange)
      {
         endFct = function()
         {
            var _loc1_ = _parent;
            root.showTextSheet = false;
            §§push(_loc1_);
            §§push(_loc2_);
            if(_loc1_.spiderChange)
            {
               _loc1_.spiderChange = false;
            }
            if(_loc1_.charChange)
            {
               _loc1_.charChange = false;
            }
            if(root.inWorld == false)
            {
               var _loc2_ = function()
               {
                  root.upPanel.endFct = function()
                  {
                     root.gotoAndPlay("remote");
                     root.charWindow.closeWindow();
                  };
                  root.askWindow.closeWindow();
                  root.upPanel.gotoAndPlay("close");
                  root.downPanel.gotoAndPlay("close");
                  root.askWindow.drawWindow([root.getInsName("txtNotSaveChar",root.parseKitSheets)],endFct);
               };
               root.askWindow.drawWindow([root.getInsName("txtExitMissions",root.parseKitSheets)],_loc2_);
            }
            else
            {
               root.upPanel.endFct = function()
               {
                  if(root.inWorld == undefined)
                  {
                     root.gotoAndPlay("remote");
                  }
                  root.charWindow.closeWindow();
               };
               root.askWindow.closeWindow();
               root.upPanel.gotoAndPlay("close");
               root.downPanel.gotoAndPlay("close");
            }
            delete endFct;
            _loc2_ = §§pop();
            _loc1_ = §§pop();
         };
         if(charChange)
         {
            root.askWindow.drawWindow([root.getInsName("txtNotSaveChar",root.parseKitSheets)],endFct);
         }
         else
         {
            root.askWindow.drawWindow([root.getInsName("txtNotSaveSpi",root.parseKitSheets)],endFct);
         }
      }
      else if(root.inWorld == false)
      {
         var _loc3_ = function()
         {
            root.showTextSheet = false;
            root.upPanel.endFct = function()
            {
               root.gotoAndPlay("remote");
               root.charWindow.closeWindow();
            };
            root.askWindow.closeWindow();
            root.upPanel.gotoAndPlay("close");
            root.downPanel.gotoAndPlay("close");
         };
         root.askWindow.drawWindow([root.getInsName("txtExitMissions",root.parseKitSheets)],_loc3_);
      }
      else
      {
         root.showTextSheet = false;
         root.upPanel.endFct = function()
         {
            if(root.inWorld == undefined)
            {
               root.gotoAndPlay("remote");
            }
            root.charWindow.closeWindow();
         };
         root.askWindow.closeWindow();
         root.upPanel.gotoAndPlay("close");
         root.downPanel.gotoAndPlay("close");
      }
      root.sfx.gotoAndPlay("clic2");
      _loc3_ = §§pop();
      _loc2_ = §§pop();
      _loc1_ = §§pop();
   };
   this.onRollOver = function()
   {
      this.gotoAndStop("over");
   };
   this.onRollOut = function()
   {
      this.gotoAndStop("up");
   };
   this.onRelease = function()
   {
      this.gotoAndStop("up");
   };
   this.onReleaseOutside = function()
   {
      this.gotoAndStop("up");
   };
}
