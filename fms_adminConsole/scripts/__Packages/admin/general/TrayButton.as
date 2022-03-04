class admin.general.TrayButton extends UI.core.events
{
   var __width = 22;
   var __height = 19;
   function TrayButton()
   {
      super();
      this.isOver = false;
      this.attachMovie("TrayButton_Over","over",1);
      this.createEmptyMovieClip("hitSpace",2);
      this.over._visible = false;
      this.drawRect(this.hitSpace,0,0,this.__width,this.__height,0,0);
      var owner = this;
      this.hitSpace.onRollOver = function()
      {
         owner.isOver = true;
         owner.over._visible = true;
         owner.dispatchEvent("onRollOver",{target:owner});
      };
      this.hitSpace.onRollOut = this.hitSpace.onReleaseOutside = function()
      {
         owner.isOver = false;
         owner.over._visible = false;
         owner.dispatchEvent("onRollOut",{target:owner});
      };
      this.hitSpace.onPress = function()
      {
         owner.isOver = true;
         owner.dispatchEvent("onPress",{target:owner});
      };
      this.notab(this.hitSpace);
      this.hitSpace.useHandCursor = false;
      this.blockFocus();
   }
   function set icon(l)
   {
      this.iconSpace.removeMovieClip();
      this.attachMovie(l,"iconSpace",0);
      this.iconSpace._x = this.__width / 2 - this.iconSpace._width / 2;
      this.iconSpace._y = this.__height / 2 - this.iconSpace._height / 2;
   }
}
