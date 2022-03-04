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
         BattleSystem.DiceRed += BattleSystem.WhiteDice * 2;
      }
      if(BattleSystem.riderMasterEq)
      {
         BattleSystem.riderMasterEq = false;
         BattleSystem.DiceRed += BattleSystem.WeaponInGame() * 2;
      }
      if(BattleSystem.shldMasterEq)
      {
         BattleSystem.shldMasterEq = false;
         BattleSystem.DiceRed += BattleSystem.ShieldInGame() * 2;
      }
      if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
      {
         Dice.Text.txtValue.text = BattleSystem.OpponentDiceTotal() - BattleSystem.MalusOpponent;
      }
      else
      {
         Dice.Text.txtValue.text = BattleSystem.OpponentDiceTotal() + BattleSystem.DiceRed - BattleSystem.MalusOpponent;
      }
      Defence.Text.txtValue.text = BattleSystem.OpponentDefenceTotal() - BattleSystem.DefendMalusOpponent;
      Action.Text.txtValue.text = Math.max(0,BattleSystem.OpponentHitPointTotal());
   }
   onBattleSystemInit = Update;
   onBattleSystemDamage = Update;
   onBattleSystemActivateCard = Update;
   onBattleSystemRemoveCard = Update;
   onBattleSystemNextTurn = Update;
   onBattleSystemGameOver = Update;
}
