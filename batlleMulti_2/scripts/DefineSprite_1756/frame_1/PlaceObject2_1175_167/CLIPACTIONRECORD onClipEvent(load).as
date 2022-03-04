onClipEvent(load){
   onBattleSystemInit = function()
   {
      txtName.text = BattleSystem.Opponent.Name;
      BattleSystem.removeListener(this);
   };
}
