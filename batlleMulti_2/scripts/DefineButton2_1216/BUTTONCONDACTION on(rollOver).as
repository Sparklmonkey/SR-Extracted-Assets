on(rollOver){
   if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
   {
      if(BattleSystem.CurrentMode == BattleSystem.MODE_CARD)
      {
         halo.gotoAndPlay("GLOW_IN");
      }
   }
}
