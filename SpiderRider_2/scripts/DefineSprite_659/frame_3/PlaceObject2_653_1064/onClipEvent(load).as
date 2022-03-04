onClipEvent(load){
   drawWindow = function(msg, fct)
   {
      this.msg = msg;
      this.okFct = fct;
      gotoAndPlay(2);
   };
}
