stop();
if(mg6.cVictory < 2)
{
   if(mg6.startNextRound)
   {
      mg6.checkEndRound();
   }
   else
   {
      _parent.gotoAndStop("recover");
   }
}
