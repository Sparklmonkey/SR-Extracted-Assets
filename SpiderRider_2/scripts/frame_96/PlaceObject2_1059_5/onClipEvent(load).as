onClipEvent(load){
   fct = function()
   {
      root.sfx.gotoAndPlay("music1");
      gotoAndStop("init");
      play();
   };
   _parent.loadWindow.setLoader(this,fct);
}
