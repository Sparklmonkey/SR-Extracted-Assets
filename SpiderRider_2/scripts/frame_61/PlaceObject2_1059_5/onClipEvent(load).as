onClipEvent(load){
   fct = function()
   {
      root.sfx.gotoAndPlay("music2");
      gotoAndStop("init");
      play();
   };
   trace("I want to load");
   _parent.loadWindow.setLoader(this,fct);
}
