class admin.general.errorAlert extends UI.core.movieclip
{
   function errorAlert()
   {
      super();
      this.createEmptyMovieClip("UISpace",0);
      this.createTextField("txt",1,25,6,0,0);
      this.attachMovie("error_ico","eIco",2);
      this.attachMovie("errorClose","cBtn",3);
      this.attachMovie("NumericNavigator","nav",4);
      this.errors = new Array();
      this.nav.addListener("click",this.onClick,this);
      this.eIco._y = this.cBtn._y = 6;
      this.eIco._x = 6;
      this.eIco.onPress = function()
      {
         _global.am.onClose(0);
      };
      this.eIco.useHandCursor = false;
      this.nav._x = 6;
      this.fm = new TextFormat();
      this.fm.font = "Verdana";
      this.fm.size = 10;
      this.fm.color = 3355443;
      this.txt.setNewTextFormat(this.fm);
      this.txt._width = 152;
      this.txt.multiline = true;
      this.txt.wordWrap = true;
      this.txt.selectable = false;
      var owner = this;
      this.cBtn.onPress = function()
      {
         this.gotoAndStop(3);
      };
      this.cBtn.onRollOver = function()
      {
         this.gotoAndStop(2);
      };
      this.cBtn.onRelease = function()
      {
         this.gotoAndStop(2);
         owner.killMsg();
      };
      this.cBtn.onReleaseOutside = this.cBtn.onRollOut = function()
      {
         this.gotoAndStop(1);
      };
      this.cBtn.tabEnabled = false;
      this.cBtn._focusrect = false;
      this.cBtn.useHandCursor = false;
   }
   function killMsg()
   {
      this.errors.splice(this.nav.selectedIndex,1);
      var _loc4_ = this.nav.length - 1;
      this.nav.clear();
      var _loc3_ = 0;
      while(_loc3_ < _loc4_)
      {
         this.nav.addItem(_loc3_ + 1);
         _loc3_ = _loc3_ + 1;
      }
      this.nav.selectedIndex = this.nav.length - 1;
      if(this.nav.length == 0)
      {
         _global.am.onClose(0);
         _global.am.regError = false;
         _global.am.tray.removeItem("eID");
      }
      this._parent.repositionItem(0);
   }
   function clear()
   {
      this.nav.clear();
      this.errors = new Array();
   }
   function get width()
   {
      return this.__width;
   }
   function onClick(data)
   {
      this.__set__text(this.errors[data.selectedIndex]);
      this._parent.repositionItem(0);
   }
   function push(msg, navEnd)
   {
      this.errors.push(msg);
      if(this.errors.length > 10)
      {
         this.errors.shift();
      }
      else
      {
         this.nav.addItem(this.errors.length);
      }
      this.nav.selectedIndex = this.nav.length - 1;
      this.__selected = this.nav.length - 1;
      if(this.nav.length > 1 && this.nav._visible == false)
      {
         this.nav._visible = true;
      }
   }
   function redraw(w, h)
   {
      this.__width = w;
      this.cBtn._x = w - 23;
      this.nav._y = h - 20;
      this.nav.setSize(w - 12);
      this.UISpace.clear();
      this.drawRect(this.UISpace,2,3,w,h,0,30,5);
      this.UISpace.endFill();
      var _loc4_ = [15186443,15518003];
      var _loc2_ = [100,100];
      var _loc7_ = [0,255];
      var _loc3_ = {matrixType:"box",x:0,y:0,w:w / 4 * 3,h:h,r:1.5707963267948966};
      this.UISpace.beginGradientFill("linear",_loc4_,_loc2_,_loc7_,_loc3_);
      this.drawRect(this.UISpace,0,0,w,h,null,100,5);
      this.UISpace.endFill();
      _loc4_ = [16710888,16643488];
      _loc2_ = [100,100];
      _loc7_ = [0,255];
      var _loc10_ = w / 4 * 2;
      _loc3_ = {matrixType:"box",x:0,y:0,w:w / 4 * 3,h:h,r:1.5707963267948966};
      this.UISpace.beginGradientFill("linear",_loc4_,_loc2_,_loc7_,_loc3_);
      this.drawRect(this.UISpace,1,1,w - 2,h - 2,null,100,5);
      this.UISpace.endFill();
      if(this.nav.length < 2)
      {
         this.nav._visible = false;
      }
      else
      {
         this.nav._visible = true;
      }
   }
   function set text(t)
   {
      this.txt.text = t;
      var _loc2_ = this.txt.textWidth + 4;
      var _loc6_ = this.fm.getTextExtent(t);
      if(_loc2_ > 145)
      {
         _loc2_ = 145;
      }
      this.txt._height = 16;
      this.txt._width = _loc2_;
      var _loc3_ = this.countLines(this.txt,t,145);
      var _loc4_ = _loc3_ * 14;
      this.txt._height = _loc4_ + _loc3_ * 2;
      this.redraw(_loc2_ + 50,_loc4_ + 30);
   }
   function countLines(tf, string, wid)
   {
      var _loc3_ = 0;
      var _loc5_ = 0;
      var _loc1_ = 0;
      while(_loc1_ < string.length)
      {
         tf.text = string.substr(0,_loc1_ + 1);
         tf._width = wid;
         if(tf.textHeight > _loc3_)
         {
            _loc3_ = tf.textHeight;
            _loc5_ = _loc5_ + 1;
         }
         _loc1_ = _loc1_ + 1;
      }
      return _loc5_;
   }
}
