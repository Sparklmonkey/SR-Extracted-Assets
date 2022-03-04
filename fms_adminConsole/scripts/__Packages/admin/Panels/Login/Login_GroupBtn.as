class admin.Panels.Login.Login_GroupBtn extends UI.core.events
{
   function Login_GroupBtn()
   {
      super();
      this.attachMovie("Login_GroupBtn_States","states",0);
      this.attachMovie("Label","__label",1);
      this.createEmptyMovieClip("hitSpace",2);
      var owner = this;
      this.drawRect(this.hitSpace,0,0,144,33,0,0);
      this.hitSpace.onPress = function()
      {
         owner.doPress();
      };
      this.hitSpace.onRollOver = this.hitSpace.onReleaseOutside = function()
      {
         owner.doRollOver();
      };
      this.hitSpace.onRollOut = function()
      {
         owner.doRollOut();
      };
      this.hitSpace.useHandCursor = false;
      this.notab(this.hitSpace);
      this.__label.setSize(105,16);
      this.__label.setFormat("bold",false);
      this.__label._x = 39;
      this.__label._y = 8;
   }
   function set label(l)
   {
      this.__label.text = l;
   }
   function doRollOver()
   {
      if(this.states._currentframe != 3)
      {
         this.states.gotoAndStop(2);
      }
   }
   function doRollOut()
   {
      if(this.states._currentframe != 3)
      {
         this.states.gotoAndStop(1);
      }
   }
   function doPress()
   {
      this.states.gotoAndStop(3);
      this.dispatchEvent("click",{target:this});
   }
   function onSetFocus()
   {
      this.doRollOver();
   }
   function get ignoreFocus()
   {
      if(this.states._currentframe == 3)
      {
         return true;
      }
      return false;
   }
   function onKillFocus()
   {
      this.doRollOut();
   }
   function onKeyDown()
   {
      if(Key.isDown(13))
      {
         this.doPress();
      }
   }
   function set icon(i)
   {
      this.attachMovie(i,"ico",3);
      this.ico._x = 9;
      this.ico._y = 4;
   }
}
