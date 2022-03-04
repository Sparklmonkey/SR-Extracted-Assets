onClipEvent(load){
   _alpha = 0;
   this.onPress = function()
   {
      endFct = function()
      {
         root.askWindow.closeWindow();
         unloadMovie(root.miniGame2);
         nextFct = function()
         {
            root.mGameWindow.drawWindow(2);
         };
         root.loadSwf(root.miniGame2,"miniGame2_" + root.mGame2Version + ".swf",nextFct,null,null);
      };
      root.askWindow.drawWindow(new Array(root.getInsName("txtMiniG2",root.parseKitWorld)),endFct);
   };
}
