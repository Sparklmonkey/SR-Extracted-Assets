onClipEvent(load){
   _alpha = 0;
   this.onPress = function()
   {
      endFct = function()
      {
         root.askWindow.closeWindow();
         if(mg1 == undefined)
         {
            trace("THE MINIGAME WASNT LOADED");
            nextFct = function()
            {
               root.mGameWindow.drawWindow(1);
            };
            root.loadSwf(root.miniGame1,"miniGame1_" + root.mGame1Version + ".swf",nextFct,null,null);
         }
         else
         {
            trace("THE MINIGAME WAS LOADED");
            root.mGameWindow.drawWindow(1);
         }
      };
      root.askWindow.drawWindow(new Array(root.getInsName("txtMiniG1",root.parseKitWorld)),endFct);
   };
}
