initWidth = bar._width;
refillRate = 2;
refreshBar = function(crntEnergy, totalEnergy)
{
   bar._width = crntEnergy * initWidth / totalEnergy;
};
refillBar = function()
{
   bar.onEnterFrame = function()
   {
      bar._width += refillRate;
      if(bar._width >= initWidth)
      {
         bar._width = initWidth;
         delete bar.onEnterFrame;
         gotoAndStop(1);
      }
   };
};
stop();
