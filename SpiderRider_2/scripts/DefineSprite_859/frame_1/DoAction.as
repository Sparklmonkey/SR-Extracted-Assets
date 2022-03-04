if(_parent.ico > 0)
{
   if(_parent.ico > 99)
   {
      nextFrame();
   }
   else
   {
      iconPerso.gotoAndStop(_parent.ico);
   }
}
else
{
   _visible = false;
}
stop();
