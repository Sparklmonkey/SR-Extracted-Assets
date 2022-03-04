onClipEvent(load){
   var damage = 0;
   onBattleSystemDefense = function()
   {
      if(BattleSystem.CurrentPlayer == BattleSystem.TURN_OPPONENT)
      {
         damage = BattleSystem.LastActionDamage;
         if(damage > 0)
         {
            gotoAndStop("ANIM");
            play();
         }
         else
         {
            gotoAndStop("MISS");
            play();
         }
      }
   };
   gotoAndStop("HIDE");
}
