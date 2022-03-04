class UI.controls.ToolTip extends UI.core.movieclip
{
   var __autoSize = "none";
   function ToolTip()
   {
      super();
      this.createEmptyMovieClip("UISpace",0);
      this.createEmptyMovieClip("background",1);
      this.createTextField("__text",2,0,0,100,10);
      this.UISpace.attachMovie("ShadowBox","shadow",0);
      this.__text.type = "dynamic";
      this.__text.autoSize = true;
      this.__text._x = 8;
      this.__text._y = 5;
      this.__text.tabEnabled = false;
      this.__text.selectable = false;
      this.format = new TextFormat();
      this.format.font = "Verdana";
      this.format.color = 0;
      this.format.size = 10;
      this.__text.setNewTextFormat(this.format);
      this.__tooltips = new Object();
      this._visible = false;
      this.redraw();
   }
   function addToolTip(text, target)
   {
      this.__tooltips[target] = text;
      if(!target.addListener)
      {
         var o = this;
         target.onRollOver2 = function()
         {
            o.show({target:this});
         };
         target.onRollOut2 = function()
         {
            o.hide({target:this});
         };
      }
      else
      {
         target.addListener("onRollOver",this.show,this);
         target.addListener("onRollOut",this.hide,this);
      }
   }
   function show(evt)
   {
      if(this.__tooltips[evt.target] != "")
      {
         this.__text.text = this.__tooltips[evt.target];
         this.redraw();
         var _loc4_ = {x:0,y:0};
         evt.target.localToGlobal(_loc4_);
         var _loc2_ = _loc4_.x + (evt.target._width - this.__text.textWidth - 23) / 2;
         var _loc3_ = _loc4_.y - 30;
         _loc2_ = _loc2_ > 0 ? _loc2_ : 5;
         _loc2_ = _loc2_ + this.__text.textWidth + 23 <= this.__get__StageWidth() ? _loc2_ : this.__get__StageWidth() - this.__text.textWidth - 43;
         _loc3_ = _loc3_ >= 0 ? _loc3_ : 5;
         this._x = _loc2_;
         this._y = _loc3_;
         clearInterval(this.wait);
         this.wait = setInterval(this.reveal,333,this);
      }
   }
   function reveal(obj)
   {
      clearInterval(obj.wait);
      obj._visible = true;
      obj.swapDepths(obj._parent.getNextHighestDepth());
   }
   function hide(evt)
   {
      clearInterval(this.wait);
      this._visible = false;
   }
   function redraw()
   {
      var _loc2_ = this.__text.textWidth;
      this.background.clear();
      this.background.endFill();
      var _loc5_ = [15186443,15518003];
      var _loc3_ = [100,100];
      var _loc6_ = [0,170];
      var _loc4_ = {matrixType:"box",x:0,y:0,w:22,h:22,r:1.5707963267948966};
      this.background.beginGradientFill("linear",_loc5_,_loc3_,_loc6_,_loc4_);
      this.drawRect(this.background,2,2,_loc2_ + 16,24,null,100,5);
      this.background.endFill();
      _loc5_ = [16710888,16643488];
      _loc3_ = [100,100];
      _loc6_ = [0,170];
      _loc4_ = {matrixType:"box",x:0,y:0,w:22,h:22,r:1.5707963267948966};
      this.background.beginGradientFill("linear",_loc5_,_loc3_,_loc6_,_loc4_);
      this.drawRect(this.background,3,3,_loc2_ + 14,22,null,100,5);
      this.UISpace.shadow.setSize(_loc2_ + 23,29);
      this.UISpace.shadow._x = -1;
      this.UISpace.shadow._y = 1;
   }
   function removeToolTip(target)
   {
      delete this.__tooltips[target];
   }
}
