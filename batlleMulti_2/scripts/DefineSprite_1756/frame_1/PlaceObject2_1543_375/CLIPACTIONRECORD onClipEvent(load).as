onClipEvent(load){
   onBattleSystemUpdate = function()
   {
      BattleSystem.PlayerHandShader._visible = !(BattleSystem.PlayerCardInHand() == 0 && BattleSystem.Player.CardDeck.length == 0) ? false : true;
   };
}
