stop();
var BEGIN = travelWidth._x;
var LENGTH = travelWidth._width;
var END = BEGIN + LENGTH;
moveValue = Math.round(travelWidth._width / 60);
moveMiniChar = function()
{
   if(miniChar._x >= step5._x)
   {
      mg5.maxWaitValue = 1;
      mg5.minWaitValue = 1;
   }
   else if(miniChar._x >= step4._x)
   {
      mg5.maxWaitValue = 5;
      mg5.minWaitValue = 5;
   }
   else if(miniChar._x >= step3._x)
   {
      mg5.maxWaitValue = 10;
      mg5.minWaitValue = 10;
   }
   else if(miniChar._x >= step2._x)
   {
      mg5.maxWaitValue = 20;
      mg5.minWaitValue = 20;
   }
   else if(miniChar._x >= step1._x)
   {
      mg5.maxWaitValue = 30;
      mg5.minWaitValue = 30;
   }
   else
   {
      mg5.maxWaitValue = 50;
      mg5.minWaitValue = 50;
   }
   miniChar._x += moveValue;
   mg5.BossDelay--;
   if(miniChar._x >= END)
   {
      mg5.initBoss = true;
      mg5.introBoss.gotoAndPlay(2);
      clearInterval(mg5.bossInt);
   }
};
mg5.bossInt = setInterval(moveMiniChar,1000);
