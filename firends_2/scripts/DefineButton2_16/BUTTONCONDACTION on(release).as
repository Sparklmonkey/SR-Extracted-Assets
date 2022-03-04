on(release){
   unloadMovie(root.miniGame2);
   root.userSO.send("hideFriendAction",_parent.userName.text);
   endFct = function()
   {
      root.setMGameScreen(_parent.userName.text,2);
   };
   root.loadSwf(root.miniGame2,"miniGame2_" + root.mGame2Version + ".swf",endFct,null,null);
}
