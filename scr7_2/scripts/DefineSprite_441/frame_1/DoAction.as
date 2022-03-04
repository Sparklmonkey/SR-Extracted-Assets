stop();
waitForIdle = random(root.idleFrq) + 50;
this.onEnterFrame = function()
{
   if(waitForIdle > 0)
   {
      waitForIdle--;
   }
   else
   {
      delete this.onEnterFrame;
      play();
   }
};
