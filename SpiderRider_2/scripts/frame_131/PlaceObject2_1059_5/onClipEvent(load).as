onClipEvent(load){
   fct = function()
   {
      root.sfx.gotoAndPlay("music3");
      gotoAndStop("init");
      play();
   };
   _parent.loadWindow.setLoader(this,fct);
}
