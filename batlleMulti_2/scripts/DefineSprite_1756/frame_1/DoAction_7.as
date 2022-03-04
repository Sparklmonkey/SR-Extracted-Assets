function OpponentDiceTotal()
{
   var _loc2_ = 0;
   _loc2_ += Opponent.Dice;
   _loc2_ += Opponent.Spider.Dice;
   _loc2_ += !DeckOpponentUI.Socket01.Card.IsActive ? 0 : LookUpCard(DeckOpponentUI.Socket01.Card.CardID).Dice;
   _loc2_ += !DeckOpponentUI.Socket02.Card.IsActive ? 0 : LookUpCard(DeckOpponentUI.Socket02.Card.CardID).Dice;
   _loc2_ += !DeckOpponentUI.Socket03.Card.IsActive ? 0 : LookUpCard(DeckOpponentUI.Socket03.Card.CardID).Dice;
   _loc2_ += !DeckOpponentUI.Socket04.Card.IsActive ? 0 : LookUpCard(DeckOpponentUI.Socket04.Card.CardID).Dice;
   _loc2_ += !DeckOpponentUI.Socket05.Card.IsActive ? 0 : LookUpCard(DeckOpponentUI.Socket05.Card.CardID).Dice;
   _loc2_ += !DeckOpponentUI.Socket06.Card.IsActive ? 0 : LookUpCard(DeckOpponentUI.Socket06.Card.CardID).Dice;
   _loc2_ += !DeckOpponentUI.Socket07.Card.IsActive ? 0 : LookUpCard(DeckOpponentUI.Socket07.Card.CardID).Dice;
   var _loc1_ = 1;
   while(_loc1_ <= 7)
   {
      if(IsFusionCard(DeckOpponentUI["Socket0" + _loc1_].Card) && DeckOpponentUI["Socket0" + _loc1_].Card.IsActive)
      {
         _loc2_ += DeckOpponentUI["Socket0" + _loc1_].Card.FusionDice;
      }
      _loc1_ = _loc1_ + 1;
   }
   return _loc2_;
}
function OpponentDefenceTotal()
{
   var _loc2_ = 0;
   _loc2_ += Opponent.Defence;
   _loc2_ += Opponent.Spider.Defence;
   _loc2_ += !DeckOpponentUI.Socket01.Card.IsActive ? 0 : LookUpCard(DeckOpponentUI.Socket01.Card.CardID).Defence;
   _loc2_ += !DeckOpponentUI.Socket02.Card.IsActive ? 0 : LookUpCard(DeckOpponentUI.Socket02.Card.CardID).Defence;
   _loc2_ += !DeckOpponentUI.Socket03.Card.IsActive ? 0 : LookUpCard(DeckOpponentUI.Socket03.Card.CardID).Defence;
   _loc2_ += !DeckOpponentUI.Socket04.Card.IsActive ? 0 : LookUpCard(DeckOpponentUI.Socket04.Card.CardID).Defence;
   _loc2_ += !DeckOpponentUI.Socket05.Card.IsActive ? 0 : LookUpCard(DeckOpponentUI.Socket05.Card.CardID).Defence;
   _loc2_ += !DeckOpponentUI.Socket06.Card.IsActive ? 0 : LookUpCard(DeckOpponentUI.Socket06.Card.CardID).Defence;
   _loc2_ += !DeckOpponentUI.Socket07.Card.IsActive ? 0 : LookUpCard(DeckOpponentUI.Socket07.Card.CardID).Defence;
   var _loc1_ = 1;
   while(_loc1_ <= 7)
   {
      if(IsFusionCard(DeckOpponentUI["Socket0" + _loc1_].Card) && DeckOpponentUI["Socket0" + _loc1_].Card.IsActive)
      {
         _loc2_ += DeckOpponentUI["Socket0" + _loc1_].Card.FusionDefence;
      }
      _loc1_ = _loc1_ + 1;
   }
   return _loc2_;
}
function OpponentHitPointTotal()
{
   var _loc1_ = 0;
   _loc1_ += Opponent.LifePoint;
   _loc1_ += Opponent.LifePointReserve;
   return _loc1_;
}
function OpponentActionTotal()
{
   return 7;
}
function HurtOpponent(damage)
{
   var _loc1_ = damage;
   var _loc2_ = 0;
   if(Opponent.LifePointReserve > 0)
   {
      if(Opponent.LifePointReserve > _loc1_)
      {
         Opponent.LifePointReserve -= _loc1_;
      }
      else
      {
         _loc2_ = _loc1_ - Opponent.LifePointReserve;
         Opponent.LifePointReserve = 0;
         Opponent.LifePoint -= _loc2_;
      }
   }
   else
   {
      Opponent.LifePoint -= _loc1_;
   }
   if(Opponent.LifePoint <= 0)
   {
      Opponent.LifePoint = 0;
      IsWinner = true;
      IsGameOver = true;
   }
}
var Opponent = new Object();
Opponent.ID = BattleSystem._parent.FromEngineOpponent.type;
Opponent.Name = BattleSystem._parent.FromEngineOpponent.Name;
Opponent.Rank = BattleSystem._parent.FromEngineOpponent.rank;
Opponent.Dice = BattleSystem._parent.FromEngineOpponent.dice;
Opponent.Defence = BattleSystem._parent.FromEngineOpponent.defense;
Opponent.Action = BattleSystem._parent.FromEngineOpponent.action;
Opponent.LifePoint = BattleSystem._parent.FromEngineOpponent.life;
Opponent.LifePointDup = BattleSystem._parent.FromEngineOpponent.life;
Opponent.VictoryPoint = BattleSystem._parent.FromEngineOpponent.victory;
Opponent.deckActive = BattleSystem._parent.FromEngineOpponent.deckActive;
Opponent.LifePointReserve = 0;
Opponent.isMyTurn = BattleSystem._parent.FromEngineOpponent.myTurn;
Opponent.Spider = new Object();
Opponent.Spider.Name = !BattleSystem._parent.FromEngineOpponent.SpiderAccess ? 0 : BattleSystem._parent.FromEngineOpponent.SpiderName;
Opponent.Spider.Dice = !BattleSystem._parent.FromEngineOpponent.SpiderAccess ? 0 : BattleSystem._parent.FromEngineOpponent.SpiderDice;
Opponent.Spider.Defence = !BattleSystem._parent.FromEngineOpponent.SpiderAccess ? 0 : BattleSystem._parent.FromEngineOpponent.SpiderDefence;
Opponent.Spider.LifePoint = !BattleSystem._parent.FromEngineOpponent.SpiderAccess ? 0 : BattleSystem._parent.FromEngineOpponent.SpiderAction;
Opponent.LifePoint += Opponent.Spider.LifePoint;
Opponent.LifePointDup += Opponent.Spider.LifePoint;
if(Opponent.deckActive == "A")
{
   deckNbrArr = new Array(1,4,5,7);
}
else if(root.deckActive == "B")
{
   deckNbrArr = new Array(2,4,6,7);
}
else
{
   deckNbrArr = new Array(3,5,6,7);
}
Opponent.CardDeck = new Array();
var i = 0;
while(i < BattleSystem._parent.FromEngineOpponent.card.length)
{
   var j = 0;
   while(j < deckNbrArr.length)
   {
      if(BattleSystem._parent.FromEngineOpponent.card[i].deck == deckNbrArr[j])
      {
         Opponent.CardDeck.push(BattleSystem._parent.FromEngineOpponent.card[i].id);
      }
      j++;
   }
   i++;
}
