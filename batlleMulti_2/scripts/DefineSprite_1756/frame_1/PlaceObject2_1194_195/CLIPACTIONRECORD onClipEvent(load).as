onClipEvent(load){
   onBattleSystemInit = function()
   {
      txtName.text = BattleSystem.Player.Name;
      BattleSystem.removeListener(this);
   };
}
