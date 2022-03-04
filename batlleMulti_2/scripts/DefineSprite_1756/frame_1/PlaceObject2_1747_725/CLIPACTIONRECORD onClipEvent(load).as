onClipEvent(load){
   function Update()
   {
      var _loc1_ = _parent;
      _loc1_.txtMalus.text = BattleSystem.MalusPlayer;
      _loc1_.txtDefendMalus.text = BattleSystem.DefendMalusPlayer;
      _loc1_.txtMalusOpp.text = BattleSystem.MalusOpponent;
      _loc1_.txtDefendMalusOpp.text = BattleSystem.DefendMalusOpponent;
   }
   onBattleSystemInit = Update;
   onBattleSystemDamage = Update;
   onBattleSystemActivateCard = Update;
   onBattleSystemRemoveCard = Update;
   onBattleSystemNextTurn = Update;
   onBattleSystemGameOver = Update;
}
