class admin.general.Tray extends UI.core.movieclip
{
   var btnWidth = 22;
   var spacer = 2;
   function Tray()
   {
      super();
      this.createEmptyMovieClip("UISpace",0);
      this.byID = new Object();
      this.count = 0;
      this.order = "";
   }
   function addItem(id, ico)
   {
      if(id == "eID")
      {
         this.order = "eID," + this.order;
      }
      else
      {
         this.order += id + ",";
      }
      var _loc2_ = this.UISpace.attachMovie("TrayButton","t" + this.count,this.count);
      this.count = this.count + 1;
      _loc2_.icon = ico;
      _loc2_.id = id;
      _loc2_.addListener("onRollOver",this.doRollOver,this);
      _loc2_.addListener("onRollOut",this.doRollOut,this);
      _loc2_.addListener("onPress",this.doPress,this);
      this.byID[id] = _loc2_;
      this.redraw();
   }
   function removeItem(id)
   {
      this.byID[id].removeMovieClip();
      this.order = this.order.split(id + ",").join("");
      this.redraw();
   }
   function getItem(id)
   {
      return this.byID[id];
   }
   function clear()
   {
      for(var _loc2_ in this.byID)
      {
         this.byID[_loc2_].removeMovieClip();
      }
      this.byID = new Array();
      this.order = "";
      this.count = 0;
   }
   function redraw()
   {
      var _loc4_ = this.order.split(",");
      _loc4_.reverse();
      var _loc2_ = 0;
      while(_loc2_ < _loc4_.length)
      {
         var _loc3_ = _loc4_[_loc2_];
         this.byID[_loc3_]._x = _loc2_ * (this.btnWidth + this.spacer);
         _loc2_ = _loc2_ + 1;
      }
   }
   function get width()
   {
      return (this.order.split(",").length - 1) * (this.btnWidth + this.spacer);
   }
   function doRollOver(data)
   {
      this.rollOver(data);
   }
   function doRollOut(data)
   {
      this.rollOut(data);
   }
   function doPress(data)
   {
      this.onPressEvt(data);
   }
}
