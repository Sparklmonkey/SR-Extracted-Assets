function selectTrackFct(trackID)
{
   var _loc2_ = this;
   var _loc3_ = trackID;
   myTrack = _loc3_;
   var _loc1_ = 1;
   while(_loc1_ <= 3)
   {
      if(_loc1_ != _loc3_)
      {
         _loc2_["track" + _loc1_].gotoAndStop("btn");
      }
      else
      {
         _loc2_["track" + _loc1_].gotoAndStop("select");
      }
      _loc1_ = _loc1_ + 1;
   }
}
selectTrackFct(2);
cleanAllScreen();
stop();
