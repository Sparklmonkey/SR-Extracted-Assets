onClipEvent(load){
   setLoader = function(obj, fct, outputMsg)
   {
      if(obj == undefined)
      {
         trace("setLoader fuck all");
      }
      target = obj;
      loadFct = fct;
      delete this.msg;
      if(outputMsg != undefined)
      {
         this.msg = outputMsg;
      }
      gotoAndStop("intro");
      play();
   };
   fct = function()
   {
      _parent.gotoAndStop("initialise");
   };
   setLoader(_parent,fct);
   _parent.stop();
}
