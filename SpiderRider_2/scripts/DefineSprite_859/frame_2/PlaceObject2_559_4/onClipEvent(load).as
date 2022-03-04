onClipEvent(load){
   this.onEnterFrame = function()
   {
      if(drawCard != null)
      {
         drawCard(root.findCardObj(_parent._parent.ico));
         delete this.onEnterFrame;
      }
   };
}
