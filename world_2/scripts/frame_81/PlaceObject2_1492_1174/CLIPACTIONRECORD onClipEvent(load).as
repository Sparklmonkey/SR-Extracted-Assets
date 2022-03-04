onClipEvent(load){
   _alpha = 0;
   this.onPress = function()
   {
      endFct = function()
      {
         root.askWindow.closeWindow();
         if(mg4 == undefined)
         {
            trace("THE MINIGAME WASNT LOADED");
            nextFct = function()
            {
               root.mGameWindow.drawWindow(4);
            };
            root.loadSwf(root.miniGame4,"miniGame4_" + root.mGame4Version + ".swf",nextFct,null,null);
         }
         else
         {
            trace("THE MINIGAME WAS LOADED");
            root.mGameWindow.drawWindow(4);
         }
      };
      root.askWindow.drawWindow(new Array(root.getInsName("txtMiniG4",root.parseKitWorld)),endFct);
   };
}
