onClipEvent(load){
   fct = function()
   {
      root.gotoAndStop("world");
      delete fct;
   };
   _parent.loadWindow.setLoader(this,fct,undefined);
}
