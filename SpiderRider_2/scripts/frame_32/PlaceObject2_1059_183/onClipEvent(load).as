onClipEvent(load){
   fct = function()
   {
      root.gotoAndStop("battleMulti");
      delete fct;
   };
   _parent.loadWindow.setLoader(this,fct,undefined);
}
