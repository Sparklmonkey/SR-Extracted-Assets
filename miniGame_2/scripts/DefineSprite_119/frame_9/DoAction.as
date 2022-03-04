pauseTime--;
if(pauseTime <= 0)
{
   _parent.gotoAndStop("atck");
}
else
{
   gotoAndPlay(_currentframe - 1);
}
