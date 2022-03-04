onClipEvent(load){
   _visible = false;
   drawAction = function(frm)
   {
      var _loc1_ = this;
      _loc1_.gotoAndStop(frm);
      _loc1_._visible = true;
      timeCheck = 800;
      _loc1_.onEnterFrame = function()
      {
         trace("timeCheck = " + timeCheck);
         if(--timeCheck <= 0)
         {
            hideAction();
            delete this.onEnterFrame;
         }
      };
   };
   hideAction = function()
   {
      this._visible = false;
   };
}
