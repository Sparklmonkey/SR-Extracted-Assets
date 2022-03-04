onClipEvent(load){
   function Update()
   {
      front.txt.text = BattleSystem.Opponent.CardDeck.length;
      back.txt.text = BattleSystem.Opponent.CardDeck.length;
   }
   onBattleSystemUpdate = Update;
}
