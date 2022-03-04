on(release){
   gotoAndStop(1);
   _parent.killToolTip();
   if(mg1 == undefined)
   {
      trace("THE MINIGAME WASNT LOADED");
      endFct = function()
      {
         _parent.iconReleaseFct(1);
      };
      root.loadSwf(root.miniGame1,"miniGame1_" + root.mGame1Version + ".swf",endFct,null,null);
   }
   else
   {
      trace("THE MINIGAME WAS LOADED");
      _parent.iconReleaseFct(1);
   }
}
