on(release){
   if(mg3 == undefined)
   {
      trace("THE MINIGAME WASNT LOADED");
      root.userSO.send("hideFriendAction",_parent.userName.text);
      endFct = function()
      {
         root.setMGameScreen(_parent.userName.text,3);
      };
      root.loadSwf(root.miniGame3,"miniGame3_" + root.mGame3Version + ".swf",endFct,null,null);
   }
   else
   {
      trace("THE MINIGAME WAS LOADED");
      root.setMGameScreen(_parent.userName.text,3);
   }
}
