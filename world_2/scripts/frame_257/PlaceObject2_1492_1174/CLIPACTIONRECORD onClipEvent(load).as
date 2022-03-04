onClipEvent(load){
   _alpha = 0;
   this.onPress = function()
   {
      endFct = function()
      {
         root.askWindow.closeWindow();
         if(mg6 == undefined)
         {
            trace("THE MINIGAME WASNT LOADED");
            nextFct = function()
            {
               root.mGameWindow.drawWindow(6);
            };
            root.loadSwf(root.miniGame6,"miniGame6_" + root.mGame6Version + ".swf",nextFct,null,null);
         }
         else
         {
            trace("THE MINIGAME WAS LOADED");
            root.mGameWindow.drawWindow(6);
         }
      };
      root.askWindow.drawWindow(new Array(root.getInsName("txtMiniG6",root.parseKitWorld)),endFct);
   };
}
