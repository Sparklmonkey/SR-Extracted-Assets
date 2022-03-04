onClipEvent(load){
   onBattleSystemInit = function()
   {
      gotoAndStop("INACTIVE");
   };
   onBattleSystemChoose = function()
   {
      BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER ? (gotoAndStop("ACTIVE"), §§push(undefined), undefined) : (gotoAndStop("INACTIVE"), §§push(undefined), undefined);
   };
   onBattleSystemNextTurn = function()
   {
      BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER ? (gotoAndStop("ACTIVE"), §§push(undefined), undefined) : (gotoAndStop("INACTIVE"), §§push(undefined), undefined);
   };
}
