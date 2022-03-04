class admin.Panels.Login.Login_LinkList extends UI.core.movieclip
{
   function Login_LinkList()
   {
      super();
   }
   function drawList(data)
   {
      this.createEmptyMovieClip("lHold",0);
      var _loc5_ = 0;
      var _loc3_ = 0;
      while(_loc3_ < data.length)
      {
         var _loc4_ = data[_loc3_];
         if(_loc4_.type == "space")
         {
            _loc5_ += _loc4_.height;
         }
         else
         {
            var _loc6_ = this.lHold.attachMovie("Login_linkArrow","a" + _loc3_,this.lHold.getNextHighestDepth());
            var _loc2_ = this.lHold.attachMovie("Label","l" + _loc3_,this.lHold.getNextHighestDepth());
            _loc2_.setSize(200,16);
            _loc2_.text = _loc4_.label;
            _loc2_.setFormat("color",2971251);
            _loc2_.setFormat("bold",true);
            _loc2_.link = _loc4_.url;
            _loc2_._x = 10;
            _loc6_._y = _loc5_ + 5;
            _loc2_._y = _loc5_;
            _loc5_ += 16;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
}
