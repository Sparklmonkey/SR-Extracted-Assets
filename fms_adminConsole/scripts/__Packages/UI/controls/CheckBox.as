class UI.controls.CheckBox extends UI.core.events
{
   function CheckBox()
   {
      super();
      this.sel = true;
      this.focusRect = true;
      this.attachMovie("CheckBox_Base","BoxBase",0);
      this.attachMovie("CheckBox_Over","BoxOver",1);
      this.createEmptyMovieClip("BoxHit",2);
      this.createTextField("txt",3,15,0,1,1);
      this.txt.autoSize = true;
      this.format = new TextFormat();
      this.format.font = "Verdana";
      this.format.size = 10;
      this.format.color = 3355443;
      this.txt.setNewTextFormat(this.format);
      this.txt.selectable = false;
      this.txt._y = 1;
      this.BoxHit.owner = this;
      this.notab(this.BoxHit);
      this.BoxHit.onPress = function()
      {
         this.owner.selected = !this.owner.selected;
         this.owner.dispatchEvent("click",{target:this.owner,selected:this.owner.selected});
      };
      this.BoxHit.onRollOver = function()
      {
         this.owner.dispatchEvent("onRollOver",{target:this.owner});
      };
      this.BoxHit.onRollOut = this.BoxHit.onReleaseOutside = function()
      {
         this.owner.dispatchEvent("onRollOut",{target:this.owner});
      };
      this.BoxBase._y = 2;
      this.BoxOver._x = 3;
      this.BoxOver._y = 5;
      this.redraw();
   }
   function onKeyDown()
   {
      if(Key.isDown(13))
      {
         this.__set__selected(!this.__get__selected());
         this.dispatchEvent("click",{target:this,selected:this.__get__selected()});
      }
      else if(Key.isDown(32))
      {
         this.__set__selected(!this.__get__selected());
         this.dispatchEvent("click",{target:this,selected:this.__get__selected()});
      }
   }
   function set selected(s)
   {
      this.sel = s;
      this.BoxOver._visible = s;
   }
   function get selected()
   {
      return this.sel;
   }
   function get width()
   {
      return this.txt.textWidth + this.txt._x + 6;
   }
   function get height()
   {
      return 19;
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
