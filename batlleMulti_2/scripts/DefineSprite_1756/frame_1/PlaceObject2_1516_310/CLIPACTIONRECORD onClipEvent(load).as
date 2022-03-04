onClipEvent(load){
   function Update()
   {
      if(BattleSystem.wpnMasterEq)
      {
         BattleSystem.wpnMasterEq = false;
         BattleSystem.DiceRed += BattleSystem.DiceRed;
      }
      if(BattleSystem.bstBlazeEq)
      {
         BattleSystem.bstBlazeEq = false;
         BattleSystem.DiceRed += (BattleSystem.DiceYellowTotal() + BattleSystem.YellowDicesUsed) * 2;
      }
      if(BattleSystem.LghtOracleEq)
      {
         BattleSystem.LghtOracleEq = false;
         root.Trace("BattleSystem.WhiteDice : " + BattleSystem.WhiteDice);
         BattleSystem.DiceRed += BattleSystem.WhiteDice * 2;
      }
      if(BattleSystem.riderMasterEq)
      {
         BattleSystem.riderMasterEq = false;
         BattleSystem.DiceRed += BattleSystem.WeaponInGame() * 2;
      }
      if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
      {
         Dice.Text.txtValue.text = BattleSystem.PlayerDiceTotal() + BattleSystem.DiceRed - BattleSystem.MalusPlayer;
      }
      else
      {
         Dice.Text.txtValue.text = BattleSystem.PlayerDiceTotal() - BattleSystem.MalusPlayer;
      }
      Defence.Text.txtValue.text = BattleSystem.PlayerDefenceTotal() - BattleSystem.DefendMalusPlayer;
      Action.Text.txtValue.text = Math.max(0,BattleSystem.PlayerHitPointTotal());
   }
   onBattleSystemInit = Update;
   onBattleSystemDamage = Update;
   onBattleSystemActivateCard = Update;
   onBattleSystemRemoveCard = Update;
   onBattleSystemNextTurn = Update;
   onBattleSystemGameOver = Update;
}
