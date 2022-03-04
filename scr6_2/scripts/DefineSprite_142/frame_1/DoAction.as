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
      play();
   }
};
if(game.doorKey == 2)
{
   axe._visible = false;
}
