if(nFois++ <= oCMG.NB_HIGHLIGHT)
{
   gotoAndStop("anim");
   play();
}
else
{
   oCMG.fAnimNext();
   stop();
}
