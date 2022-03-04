on(rollOut){
   if(BattleSystem.CurrentMode == BattleSystem.MODE_CARD)
   {
      anim.gotoAndStop("HIGHLIGHT");
   }
   else if(BattleSystem.CurrentMode == BattleSystem.MODE_NEXT_TURN)
   {
      anim.gotoAndStop("HIGHLIGHT");
   }
   else
   {
      anim.gotoAndStop("RELEASED");
   }
}
