on(release){
   if(mg1 == undefined)
   {
      trace("THE MINIGAME WASNT LOADED");
      root.userSO.send("hideFriendAction",_parent.userName.text);
      endFct = function()
      {
         root.setMGameScreen(_parent.userName.text,1);
      };
      root.loadSwf(root.miniGame1,"miniGame1_" + root.mGame1Version + ".swf",endFct,null,null);
   }
   else
   {
      trace("THE MINIGAME WAS LOADED");
      root.setMGameScreen(_parent.userName.text,1);
   }
}
