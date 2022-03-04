onClipEvent(load){
   function Update()
   {
      front.txt.text = BattleSystem.Player.CardDeck.length;
      back.txt.text = BattleSystem.Player.CardDeck.length;
   }
   onBattleSystemUpdate = Update;
}
