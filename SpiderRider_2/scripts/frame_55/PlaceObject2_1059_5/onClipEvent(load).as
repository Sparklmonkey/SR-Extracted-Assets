onClipEvent(load){
   fct = function()
   {
      root.sfx.gotoAndPlay("area1");
      gotoAndStop("init");
      play();
      _parent.nextFrame();
   };
   _parent.loadWindow.setLoader(this,fct,getInsName("loadWorld",parseMultiConnect));
}
