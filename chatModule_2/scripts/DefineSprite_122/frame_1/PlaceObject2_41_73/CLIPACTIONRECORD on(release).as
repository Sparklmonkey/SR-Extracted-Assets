on(release){
   gotoAndStop(1);
   _parent.killToolTip();
   unloadMovie(root.miniGame2);
   endFct = function()
   {
      _parent.iconReleaseFct(2);
   };
   root.loadSwf(root.miniGame2,"miniGame2_" + root.mGame2Version + ".swf",endFct,null,null);
}
