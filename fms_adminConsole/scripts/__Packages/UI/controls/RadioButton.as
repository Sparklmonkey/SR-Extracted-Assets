class UI.controls.RadioButton extends UI.core.events
{
   var __group = "foo";
   var focusBox = true;
   function RadioButton()
   {
      super();
      if(!_global.RadioManager)
      {
         _global.RadioManager = new Object();
         _global.RadioManager.data = new Object();
         _global.RadioManager.register = function(mc, group)
         {
            if(this.data[group] == undefined)
            {
               this.data[group] = {selected:mc,buttons:new Array()};
               this.data[group].buttons.push(mc);
               _global.RadioManager.select(mc,group);
            }
            else
            {
               this.data[group].buttons.push(mc);
            }
         };
         _global.RadioManager.select = function(mc, group)
         {
            var _loc3_ = this.data[group];
            _loc3_.selected.showSelected(false);
            _loc3_.selected = mc;
            mc.showSelected(true);
            var _loc2_ = 0;
            while(_loc2_ < _loc3_.buttons.length)
            {
               _loc3_.buttons[_loc2_].dispatchEvent("change",{target:mc});
               _loc2_ = _loc2_ + 1;
            }
         };
         _global.RadioManager.remove = function(mc, group)
         {
            var _loc3_ = this.data[group];
            var _loc2_ = 0;
            while(_loc2_ < _loc3_.buttons.length)
            {
               if(_loc3_.buttons[_loc2_] == mc)
               {
                  _loc3_.buttons.splice(_loc2_,1);
                  break;
               }
               _loc2_ = _loc2_ + 1;
            }
            if(_loc3_.buttons.length == 0)
            {
               delete this.data[group];
            }
         };
      }
      this.attachMovie("RadioButton_Base","BoxBase",0);
      this.attachMovie("RadioButton_Fill","BoxOver",1);
      this.createEmptyMovieClip("BoxHit",2);
      this.createTextField("txt",3,15,0,1,1);
      this.txt.autoSize = true;
      this.format = new TextFormat();
      this.format.font = "arial";
      this.format.size = 10;
      this.format.bold = true;
      this.txt.setNewTextFormat(this.format);
      this.txt.selectable = false;
      this.BoxHit.owner = this;
      this.notab(this.BoxHit);
      this.BoxHit.onPress = function()
      {
         this.owner.selected = !this.owner.selected;
      };
      this.BoxBase._y = 2;
      this.BoxOver._x = 4;
      this.BoxOver._y = 6;
      this.BoxOver._visible = false;
      this.redraw();
   }
   function onKeyDown()
   {
      if(Key.isDown(13))
      {
         this.__set__selected(!this.__get__selected());
      }
   }
   function set group(g)
   {
      this.__group = g;
      _global.RadioManager.register(this,g);
   }
   function onUnload()
   {
      _global.RadioManager.remove(this,this.__group);
   }
   function set selected(s)
   {
      _global.RadioManager.select(this,this.__group);
   }
   function showSelected(s)
   {
      this.BoxOver._visible = s;
      this.dispatchEvent("click",{target:this,selected:this.__get__selected()});
   }
   function get selected()
   {
      return this.BoxOver._visible;
   }
   function setFormat(prop, val)
   {
      this.format[prop] = val;
      this.txt.setNewTextFormat(this.format);
      this.txt.setTextFormat(this.format);
   }
   function set label(l)
   {
      this.txt.text = l;
      this.redraw();
   }
   function get label()
   {
      return this.txt.text;
   }
   function redraw()
   {
      this.BoxHit.clear();
      this.drawRect(this.BoxHit,0,0,this.txt.textWidth + 15,15,16777215,0);
   }
}
