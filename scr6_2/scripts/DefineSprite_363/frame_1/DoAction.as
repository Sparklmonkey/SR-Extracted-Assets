stop();
waitForIdle = random(root.idleFrq);
this.onEnterFrame = function()
{
   if(waitForIdle > 0)
   {
      waitForIdle--;
   }
   else
   {
      delete this.onEnterFrame;
      gotoAndPlay("idle" + random(3));
   }
};
