onClipEvent(load){
   _alpha = 0;
   this.onPress = function()
   {
      endFct = function()
      {
         root.askWindow.closeWindow();
         if(mg3 == undefined)
         {
            trace("THE MINIGAME WASNT LOADED");
            nextFct = function()
            {
               root.mGameWindow.drawWindow(3);
            };
            root.loadSwf(root.miniGame3,"miniGame3_" + root.mGame3Version + ".swf",nextFct,null,null);
         }
         else
         {
            trace("THE MINIGAME WAS LOADED");
            root.mGameWindow.drawWindow(3);
         }
      };
      root.askWindow.drawWindow(new Array(root.getInsName("txtMiniG3",root.parseKitWorld)),endFct);
   };
}
