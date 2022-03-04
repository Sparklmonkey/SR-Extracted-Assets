pauseTime--;
if(pauseTime <= 0)
{
   play();
}
else
{
   gotoAndPlay(_currentframe - 1);
}
