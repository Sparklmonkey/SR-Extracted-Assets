onClipEvent(load){
   fct = function()
   {
      root.sfx.gotoAndPlay("area2");
      gotoAndStop("init");
      play();
   };
   _parent.loadWindow.setLoader(this,fct);
}
