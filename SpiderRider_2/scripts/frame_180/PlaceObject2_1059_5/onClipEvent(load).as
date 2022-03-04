onClipEvent(load){
   fct = function()
   {
      root.sfx.gotoAndPlay("area1");
      gotoAndStop("init");
      play();
   };
   _parent.loadWindow.setLoader(this,fct);
}
