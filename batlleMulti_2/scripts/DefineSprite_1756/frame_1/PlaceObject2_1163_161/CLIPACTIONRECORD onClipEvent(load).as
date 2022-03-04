onClipEvent(load){
   onBattleSystemInit = function()
   {
      txtName.text = BattleSystem.TableRank[BattleSystem.Player.Rank].Name;
      BattleSystem.removeListener(this);
   };
}
