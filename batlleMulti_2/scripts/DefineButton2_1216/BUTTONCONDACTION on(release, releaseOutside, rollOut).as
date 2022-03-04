on(release, releaseOutside, rollOut){
   if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
   {
      if(BattleSystem.CurrentMode == BattleSystem.MODE_CARD)
      {
         halo.gotoAndPlay("GLOW_OUT");
      }
   }
}
