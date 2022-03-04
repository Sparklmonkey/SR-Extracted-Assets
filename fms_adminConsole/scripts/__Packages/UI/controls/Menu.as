class UI.controls.Menu extends UI.core.events
{
   var __border = 8891341;
   var __backgroundAlpha = 100;
   var __headerText = "Header";
   var __transitionTime = 0.5;
   var __closedSelf = false;
   var __selectedIndex = 0;
   function Menu()
   {
      super();
      this.createEmptyMovieClip("UISpace",0);
      this.rowSpace = this.UISpace.createEmptyMovieClip("rowSpace",1);
      this.createEmptyMovieClip("rowMask",2);
      this.onKeyDown = this.onKeyDown();
      this.__open = false;
      this.outSideML = new Object();
      this.mListner = new Object();
      var owner = this;
      this.mListner.onMouseDown = function()
      {
         if(!owner.hitTest(_root._xmouse,_root._ymouse,false))
         {
            owner.__closedSelf = true;
            owner.hide();
         }
      };
   }
   function onKillFocus()
   {
      this.hide();
   }
   function onKeyDown()
   {
      if(Key.isDown(38))
      {
         this.navigate(-1);
      }
      else if(Key.isDown(40))
      {
         this.navigate(1);
      }
   }
   function set dataProvider(data)
   {
      this.__data = data;
      this.draw();
   }
   function get dataProvider()
   {
      return this.__data;
   }
   function get open()
   {
      return this.__open;
   }
   function get closedSelf()
   {
      return this.__closedSelf;
   }
   function get width()
   {
      return this.__width;
   }
   function get height()
   {
      return this.__height;
   }
   function get headerLabel()
   {
      return this.__headerText;
   }
   function set headerLabel(header)
   {
      this.__headerText = header;
   }
   function draw()
   {
      var _loc4_ = 0;
      while(_loc4_ < this.children.length)
      {
         this.children[_loc4_].removeMovieClip();
         _loc4_ = _loc4_ + 1;
      }
      this.children = new Array();
      var _loc5_ = this.__headerText.length;
      var _loc2_ = 0;
      while(_loc2_ < this.__data.length)
      {
         _loc5_ = _loc5_ >= this.__data[_loc2_].label.length ? _loc5_ : this.__data[_loc2_].label.length;
         _loc2_ = _loc2_ + 1;
      }
      this.__width = _loc5_ * 6 + 20;
      this.__height = this.__data.length * 16 + 32;
      var _loc8_ = this.rowSpace.attachMovie("Label","headerlabel",10);
      _loc8_.setSize(this.__width - 5,24);
      _loc8_.text = this.__headerText;
      _loc8_.setFormat("bold",true);
      _loc8_.setFormat("color",3965372);
      _loc8_._y = 5;
      _loc8_._x = 5;
      if(this.__data[0].type == "check")
      {
         this.__width += 10;
      }
      _loc2_ = 0;
      while(_loc2_ < this.__data.length)
      {
         if(this.__data[_loc2_].label != "spacer")
         {
            if(this.__data[_loc2_].type != "check")
            {
               var _loc3_ = this.rowSpace.attachMovie("Label","label" + _loc2_,_loc2_ + 11);
            }
            else
            {
               _loc3_ = this.rowSpace.attachMovie("Menu_CheckRender","label" + _loc2_,_loc2_ + 11);
               _loc3_.selected = this.__data[_loc2_].selected;
            }
            _loc3_.attachMovie("List_HighLight","highlight",-1);
            _loc3_.highlight._width = this.__width - 6;
            _loc3_.highlight._height = 16;
            _loc3_.highlight._x = -2;
            _loc3_.highlight._y = 0;
            _loc3_.highlight._visible = false;
            _loc3_.setSize(this.__width - 5,16);
            _loc3_.text = this.__data[_loc2_].label;
            _loc3_._y = 16 * _loc2_ + 29;
            _loc3_._x = 5;
            _loc3_.owner = this;
            this.children.push(_loc3_);
            _loc3_.data = this.__data[_loc2_].data;
            _loc3_.onPress = function()
            {
               this.selected = !this.selected;
               this.owner.dispatchEvent("click",{target:this,data:this.data});
               this.owner.hide();
            };
            _loc3_.onRollOver = function()
            {
               this.highlight._visible = true;
            };
            _loc3_.onRollOut = function()
            {
               this.highlight._visible = false;
            };
         }
         else
         {
            this.rowSpace.createEmptyMovieClip("spacer" + _loc2_,_loc2_ + 11);
            this.rowSpace["spacer" + _loc2_].lineStyle(1,13421772,100);
            this.rowSpace["spacer" + _loc2_].moveTo(10,0);
            this.rowSpace["spacer" + _loc2_].lineTo(this.__width - 20,0);
            this.rowSpace["spacer" + _loc2_]._y = 16 * _loc2_ + 38;
            this.rowSpace["spacer" + _loc2_]._x = 5;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.UISpace.attachMovie("ShadowBox","shadow",0);
      this.UISpace.shadow.setSize(this.__width + 6,this.__height + 4);
      this.UISpace.shadow._x = -3;
      this.UISpace.shadow._y = 0;
      this.rowSpace.clear();
      this.rowMask.clear();
      this.drawRect(this.rowSpace,0,0,this.__width,this.__height,this.__border,100);
      this.drawRect(this.rowSpace,1,1,this.__width - 2,this.__height - 2,16777215,100);
      this.drawRect(this.rowSpace,0,0,this.__width,27,this.__border,100);
      this.drawRect(this.rowSpace,1,1,this.__width - 2,25,13560318,100);
      this.drawRect(this.rowMask,-5,- this.__height - 30,this.__width + 10,this.__height + 20,16711680,100);
      this.UISpace.setMask(this.rowMask);
   }
   function show(x, y)
   {
      this._x = x;
      this._y = y;
      Key.addListener(this);
      this.reveal();
      Mouse.addListener(this.mListner);
   }
   function reveal()
   {
      if(!this.__open)
      {
         var _loc2_ = new mx.transitions.Tween(this.rowMask,"_y",mx.transitions.easing.Strong.easeOut,0,this.__height + 15,this.__transitionTime,true);
         this.__open = true;
         this.__closedSelf = false;
      }
   }
   function hide()
   {
      if(this.__open)
      {
         Mouse.removeListener(this.mListner);
         Key.removeListener(this);
         var _loc2_ = new mx.transitions.Tween(this.rowMask,"_y",mx.transitions.easing.Strong.easeOut,this.__height + 15,0,this.__transitionTime,true);
         this.__open = false;
      }
   }
   function navigate(delta)
   {
      this.__selectedIndex += delta;
      this.__selectedIndex = this.__selectedIndex >= 0 ? this.__selectedIndex : this.__data.length - 1;
      this.__selectedIndex = this.__selectedIndex < this.__data.length ? this.__selectedIndex : 0;
      var _loc2_ = 0;
      while(_loc2_ < this.__data.length)
      {
         this.rowSpace["label" + _loc2_].highlight._visible = _loc2_ == this.__selectedIndex;
         _loc2_ = _loc2_ + 1;
      }
   }
}
