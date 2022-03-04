class admin.general.InfoBox extends UI.core.events
{
   function InfoBox()
   {
      super();
      this.createEmptyMovieClip("UISpace",0);
      this.attachMovie("ShadowBox","shadow",1);
      this.attachMovie("Label","__label",2);
      this.createEmptyMovieClip("dragHit",5);
      this.attachMovie("closeBtn","closeBtn",6);
      this.__label.setFormat("color",3290163);
      this.__label._x = 16;
      this.__label._y = 7;
      var _loc3_ = new Color(this.closeBtn);
      _loc3_.setRGB(5073019);
      this.closeBtn._y = 12;
      this.shadow._x = 2;
      this.shadow._y = 5;
      this.shadow.space4._yscale = 50;
      this.shadow.space4._alpha = 100;
      var owner = this;
      this.dragHit.onPress = function()
      {
         owner.dispatchEvent("onStartDrag",{target:owner});
         owner.startDrag(false,0,0,owner.StageWidth - owner.__width,owner.StageHeight - owner.__height);
      };
      this.dragHit.onRelease = this.dragHit.onReleaseOutside = function()
      {
         owner.dispatchEvent("onStopDrag",{target:owner});
         owner.stopDrag();
      };
      this.dragHit.tabEnabled = false;
      this.dragHit._focusrect = false;
      this.dragHit.useHandCursor = false;
      this.closeBtn.onPress = function()
      {
         owner.content.onKillDialog();
         owner.onKillBox(owner);
      };
      this.closeBtn.tabEnabled = false;
      this.closeBtn._focusrect = false;
      this.closeBtn.useHandCursor = false;
      this.blockFocus();
   }
   function set title(s)
   {
      this.__label.text = s;
   }
   function set content(i)
   {
      this.__container.removeMovieClip();
      this.attachMovie(i,"__container",4);
      this.__container._x = 6;
      this.__container._y = 26;
   }
   function get content()
   {
      return this.__container;
   }
   function setSize(w, h)
   {
      this.__width = w;
      this.__height = h;
      this.UISpace.clear();
      this.shadow.setSize(w - 4,h - 7);
      this.__label.setSize(w - 38,20);
      this.closeBtn._x = w - 20;
      var _loc2_ = w - 10;
      var _loc5_ = h - 10;
      var _loc4_ = 5;
      var _loc3_ = 5;
      this.drawRect(this.UISpace,_loc4_,_loc3_,_loc2_,_loc5_,7313075,100,4);
      this.UISpace.endFill();
      var _loc8_ = [12177632,11981282];
      var _loc6_ = [100,100];
      var _loc11_ = [0,255];
      var _loc7_ = {matrixType:"box",x:0,y:0,w:w,h:h,r:1.5707963267948966};
      this.UISpace.beginGradientFill("linear",_loc8_,_loc6_,_loc11_,_loc7_);
      this.drawRect(this.UISpace,_loc4_ + 1,_loc3_ + 1,_loc2_ - 2,_loc5_ - 2,null,100,4);
      this.UISpace.endFill();
      this.drawRect(this.UISpace,_loc4_ + 1,_loc3_ + 19,_loc2_ - 2,1,0,10);
      this.drawRect(this.UISpace,_loc4_ + 1,_loc3_ + 20,_loc2_ - 2,1,16777215,20);
      this.dragHit.clear();
      this.drawRect(this.dragHit,_loc4_,_loc3_,_loc2_,19,0,0);
      this.__container.setSize(w - 12,h - 31);
   }
}
