on(release){
   gotoAndStop(1);
   _parent.killToolTip();
   if(mg3 == undefined)
   {
      trace("THE MINIGAME WASNT LOADED");
      endFct = function()
      {
         _parent.iconReleaseFct(3);
      };
      root.loadSwf(root.miniGame3,"miniGame3_" + root.mGame3Version + ".swf",endFct,null,null);
   }
   else
   {
      trace("THE MINIGAME WAS LOADED");
      _parent.iconReleaseFct(3);
   }
}
