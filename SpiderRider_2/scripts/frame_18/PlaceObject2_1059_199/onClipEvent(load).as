onClipEvent(load){
   fct = function()
   {
      root.charWindow.drawWindow();
   };
   _parent.loadWindow.setLoader(this,fct);
}
