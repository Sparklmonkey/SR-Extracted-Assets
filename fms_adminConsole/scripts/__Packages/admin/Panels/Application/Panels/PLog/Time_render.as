class admin.Panels.Application.Panels.PLog.Time_render extends UI.core.movieclip
{
   var weekDays = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
   function Time_render()
   {
      super();
      this.createTextField("label",0,0,2,10,20);
      this.label.selectable = false;
      var _loc3_ = new TextFormat();
      _loc3_.font = "Verdana";
      _loc3_.color = 0;
      _loc3_.size = 10;
      this.label.setNewTextFormat(_loc3_);
      this.label._y = 2;
   }
   function setData(info)
   {
      var _loc3_ = this.weekDays[info.time.getDay()] + " " + this.padTime(info.time.getHours()) + ":" + this.padTime(info.time.getMinutes());
      this.label.text = _loc3_;
      this.__data = info;
   }
   function getData()
   {
      return this.__data.time.getTime();
   }
   function getBestHeight()
   {
      return 20;
   }
   function setWidth(w)
   {
      this.label._width = w;
   }
   function padTime(n)
   {
      if(n.toString().length == 1)
      {
         return "0" + n;
      }
      return n.toString();
   }
   function getHoursAmPm(hour24)
   {
      var _loc3_ = new Object();
      _loc3_.ampm = hour24 >= 12 ? "PM" : "AM";
      var _loc2_ = hour24 % 12;
      if(_loc2_ == 0)
      {
         _loc2_ = 12;
      }
      _loc3_.hours = this.padTime(_loc2_);
      return _loc3_;
   }
}
