bkg.useHandCursor = false;
var MIN_ALPHA = 25;
var MAX_ALPHA = 100;
increaseAlpha = function()
{
   var _loc1_ = this;
   _loc1_._alpha += 10;
   if(_loc1_._alpha >= MAX_ALPHA)
   {
      _loc1_._alpha = MAX_ALPHA;
      delete _loc1_.onEnterFrame;
   }
};
decreaseAlpha = function()
{
   var _loc1_ = this;
   _loc1_._alpha -= 10;
   if(_loc1_._alpha <= MIN_ALPHA)
   {
      _loc1_._alpha = MIN_ALPHA;
      delete _loc1_.onEnterFrame;
   }
};
var i = 1;
while(i <= 19)
{
   eval("mc_" + i).onRollOver = function()
   {
      this.onEnterFrame = increaseAlpha;
   };
   eval("mc_" + i).onRollOut = function()
   {
      this.onEnterFrame = decreaseAlpha;
   };
   i++;
}
