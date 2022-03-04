onClipEvent(load){
   fct = function()
   {
      root.sfx.gotoAndPlay("area1");
      root.nextFrame();
      delete fct;
   };
   _parent.loadWindow.setLoader(this,fct,root.getInsName("loadWorld",root.parseKitConnect));
}
