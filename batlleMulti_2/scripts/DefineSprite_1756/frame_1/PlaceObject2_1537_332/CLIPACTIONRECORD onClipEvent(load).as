onClipEvent(load){
   function Show()
   {
      if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
      {
         gotoAndStop("OPEN_PLAYER");
         play();
      }
      else
      {
         gotoAndStop("OPEN_OPPONENT");
         play();
      }
      Update();
      _visible = true;
   }
   function Hide()
   {
      gotoAndStop("NORMAL");
      Update();
      _visible = false;
   }
   function Update()
   {
      if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
      {
         BattleSystem.CurrentAttack.Dice = BattleSystem.PlayerDiceTotal() + BattleSystem.DiceRed - BattleSystem.MalusPlayer;
         BattleSystem.CurrentAttack.Defence = BattleSystem.OpponentDefenceTotal() - BattleSystem.DefendMalusOpponent;
         BattleSystem.CurrentAttack.Action = BattleSystem.PlayerDiceTotal() + BattleSystem.DiceRed - BattleSystem.MalusPlayer - (BattleSystem.OpponentDefenceTotal() - BattleSystem.DefendMalusOpponent);
         Spike.gotoAndStop("PLAYER");
      }
      else
      {
         BattleSystem.CurrentAttack.Dice = BattleSystem.OpponentDiceTotal() + BattleSystem.DiceRed - BattleSystem.MalusOpponent;
         BattleSystem.CurrentAttack.Defence = BattleSystem.PlayerDefenceTotal() - BattleSystem.DefendMalusPlayer;
         BattleSystem.CurrentAttack.Action = BattleSystem.OpponentDiceTotal() + BattleSystem.DiceRed - BattleSystem.MalusOpponent - (BattleSystem.PlayerDefenceTotal() - BattleSystem.DefendMalusPlayer);
         Spike.gotoAndStop("OPPONENT");
      }
      Dice.Text.txtValue.text = BattleSystem.CurrentAttack.Dice;
      Defence.Text.txtValue.text = BattleSystem.CurrentAttack.Defence;
      Action.Text.txtValue.text = Math.max(0,BattleSystem.CurrentAttack.Action);
   }
   onBattleSystemInit = Hide;
   onBattleSystemAttack = Show;
   onBattleSystemNextTurn = Hide;
   Hide();
}
