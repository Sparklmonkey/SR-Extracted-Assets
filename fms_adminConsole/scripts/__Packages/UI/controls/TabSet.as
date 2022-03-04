class UI.controls.TabSet extends UI.core.events
{
   var __maxwidth = 0;
   var __maxheight = 0;
   var __tabIndex = 0;
   function TabSet()
   {
      super();
      this.createEmptyMovieClip("UISpace",0);
      this.__buttons = new Array();
      var _loc3_ = this;
      this.blockFocus(this);
   }
   function addButton(label, width, height, active, data, tip)
   {
      var _loc2_ = new Object();
      _loc2_.data = data;
      _loc2_.label = label;
      _loc2_.width = width;
      _loc2_.height = height;
      _loc2_.active = active;
      _loc2_.tip = tip;
      this.__buttons.push(_loc2_);
      this.reDraw();
   }
   function get selectedItem()
   {
      return this.__selectedItem;
   }
   function get width()
   {
      return this.__maxwidth;
   }
   function get height()
   {
      return this.__maxheight;
   }
   function clearTab()
   {
      var _loc3_ = 0;
      while(_loc3_ < this.__buttons.length)
      {
         _global.fm.clearTab(this.UISpace["b" + _loc3_]);
         _loc3_ = _loc3_ + 1;
      }
   }
   function set tabStart(i)
   {
      this.__tabIndex = i;
      i = 0;
      while(i < this.__buttons.length)
      {
         this.UISpace["b" + i].tabIndex = this.__tabIndex + i;
         i = i + 1;
      }
   }
   function reDraw()
   {
      var _loc3_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < this.__buttons.length)
      {
         this.UISpace.attachMovie("TabButton","b" + _loc2_,_loc2_);
         this.UISpace["b" + _loc2_]._x = _loc3_;
         this.UISpace["b" + _loc2_].setSize(this.__buttons[_loc2_].width,this.__buttons[_loc2_].height);
         this.UISpace["b" + _loc2_].label = this.__buttons[_loc2_].label;
         this.UISpace["b" + _loc2_].enabled = true;
         this.UISpace["b" + _loc2_].active = this.__buttons[_loc2_].active;
         this.UISpace["b" + _loc2_].data = this.__buttons[_loc2_].data;
         if(this.__buttons[_loc2_].active == true)
         {
            this.__selectedItem = this.UISpace["b" + _loc2_];
         }
         this.UISpace["b" + _loc2_].tabIndex = this.__tabIndex + _loc2_;
         switch(_loc2_)
         {
            case 0:
               this.UISpace["b" + _loc2_].setType("left");
               break;
            case this.__buttons.length - 1:
               this.UISpace["b" + _loc2_].setType("right");
               break;
            default:
               this.UISpace["b" + _loc2_].setType("center");
         }
         _loc3_ += this.__buttons[_loc2_].width;
         this.__maxheight = this.__maxheight >= this.__buttons[_loc2_].height ? this.__maxheight : this.__buttons[_loc2_].height;
         this.UISpace["b" + _loc2_].addListener("click",this.onClick,this);
         if(this.__buttons[_loc2_].tip != undefined)
         {
            this.addToolTip(this.__buttons[_loc2_].tip,this.UISpace["b" + _loc2_]);
         }
         _loc2_ = _loc2_ + 1;
      }
      this.__maxwidth = _loc3_;
   }
   function getItemAt(i)
   {
      return this.UISpace["b" + i];
   }
   function onClick(evt)
   {
      this.__selectedItem = evt.target;
      evt.target.active = true;
      var _loc2_ = 0;
      while(_loc2_ < this.__buttons.length)
      {
         this.UISpace["b" + _loc2_].active = evt.target == this.UISpace["b" + _loc2_];
         _loc2_ = _loc2_ + 1;
      }
      this.dispatchEvent("click",{target:this,label:evt.target.label,data:evt.target.data});
   }
}
