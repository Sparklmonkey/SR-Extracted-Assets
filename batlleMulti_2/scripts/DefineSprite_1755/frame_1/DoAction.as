var depth = 0;
DoAfterWait = function(nFrameToWait, fct, desc, tabParam, bCondArret, bTrueOrFalse, bRepeat)
{
   depth++;
   var mcTemp = this.createEmptyMovieClip("waiter" + depth,depth);
   mcTemp.FRAME_MAX = nFrameToWait;
   mcTemp.nFrame = 0;
   mcTemp.fctToDo = fct;
   mcTemp.desc = desc;
   mcTemp.param = tabParam;
   mcTemp.bCondArret = bCondArret;
   mcTemp.bMustBeEgal = bTrueOrFalse;
   mcTemp.bRepeat = bRepeat != undefined ? bRepeat : false;
   mcTemp.onEnterFrame = function()
   {
      this.nFrame = this.nFrame + 1;
      if(this.nFrame >= this.FRAME_MAX)
      {
         if(!this.bRepeat)
         {
            delete this.onEnterFrame;
            this.fctToDo.apply(BattleSystem,this.param);
            this.removeMovieClip();
            delete this;
         }
         else
         {
            this.fctToDo.apply(BattleSystem,this.param);
            this.nFrame = 0;
         }
      }
      if(this.bCondArret != undefined && eval(this.bCondArret) == this.bMustBeEgal)
      {
         delete this.onEnterFrame;
         this.removeMovieClip();
         delete this;
      }
   };
};
ShowDescTimer = function()
{
   var _loc3_ = 0;
   var _loc2_ = null;
   var _loc1_ = 0;
   while(_loc1_ <= depth)
   {
      _loc2_ = this["waiter" + _loc1_];
      if(_loc2_ != undefined)
      {
         root.Trace("i : " + _loc1_ + "/" + _loc2_.desc);
         _loc3_ = _loc3_ + 1;
      }
      _loc1_ = _loc1_ + 1;
   }
};
stop();
