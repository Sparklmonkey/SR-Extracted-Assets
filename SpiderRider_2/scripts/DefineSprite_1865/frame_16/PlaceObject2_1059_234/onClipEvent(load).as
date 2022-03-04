onClipEvent(load){
   fct = function()
   {
      trace("_parent.sprSex = " + _parent.sprSex);
      gotoAndStop(_parent.sprSex != 1?"female":"male");
   };
   root.loadWindow.setLoader(this,fct);
}
