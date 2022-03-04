onClipEvent(load){
   _alpha = 0;
   this.onPress = function()
   {
      endFct = function()
      {
         root.askWindow.closeWindow();
         if(mg5 == undefined)
         {
            trace("THE MINIGAME WASNT LOADED");
            nextFct = function()
            {
               root.mGameWindow.drawWindow(5);
            };
            root.loadSwf(root.miniGame5,"miniGame5_" + root.mGame5Version + ".swf",nextFct,null,null);
         }
         else
         {
            trace("THE MINIGAME WAS LOADED");
            root.mGameWindow.drawWindow(5);
         }
      };
      root.askWindow.drawWindow(new Array(root.getInsName("txtMiniG5",root.parseKitWorld)),endFct);
   };
}
