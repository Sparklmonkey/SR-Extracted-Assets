function selectSpiderFct(spiderID)
{
   var _loc2_ = this;
   var _loc3_ = spiderID;
   mySpider = _loc3_;
   var _loc1_ = 1;
   while(_loc1_ <= 3)
   {
      if(_loc1_ != _loc3_)
      {
         _loc2_["spider" + _loc1_].gotoAndStop("btn");
      }
      else
      {
         _loc2_["spider" + _loc1_].gotoAndStop("select");
      }
      _loc1_ = _loc1_ + 1;
   }
}
trace("///");
selectSpiderFct(2);
cleanAllScreen();
stop();
