function PlayerDiceTotal()
{
   var _loc2_ = 0;
   _loc2_ += Player.Dice;
   _loc2_ += Player.Spider.Dice;
   _loc2_ += !DeckPlayerInHandUI.Socket01.Card.IsActive ? 0 : LookUpCard(DeckPlayerInHandUI.Socket01.Card.CardID).Dice;
   _loc2_ += !DeckPlayerInHandUI.Socket02.Card.IsActive ? 0 : LookUpCard(DeckPlayerInHandUI.Socket02.Card.CardID).Dice;
   _loc2_ += !DeckPlayerInHandUI.Socket03.Card.IsActive ? 0 : LookUpCard(DeckPlayerInHandUI.Socket03.Card.CardID).Dice;
   _loc2_ += !DeckPlayerInHandUI.Socket04.Card.IsActive ? 0 : LookUpCard(DeckPlayerInHandUI.Socket04.Card.CardID).Dice;
   _loc2_ += !DeckPlayerInHandUI.Socket05.Card.IsActive ? 0 : LookUpCard(DeckPlayerInHandUI.Socket05.Card.CardID).Dice;
   _loc2_ += !DeckPlayerInHandUI.Socket06.Card.IsActive ? 0 : LookUpCard(DeckPlayerInHandUI.Socket06.Card.CardID).Dice;
   _loc2_ += !DeckPlayerInHandUI.Socket07.Card.IsActive ? 0 : LookUpCard(DeckPlayerInHandUI.Socket07.Card.CardID).Dice;
   var _loc1_ = 1;
   while(_loc1_ <= 7)
   {
      if(IsFusionCard(DeckPlayerInHandUI["Socket0" + _loc1_].Card) && DeckPlayerInHandUI["Socket0" + _loc1_].Card.IsActive)
      {
         _loc2_ += DeckPlayerInHandUI["Socket0" + _loc1_].Card.FusionDice;
      }
      _loc1_ = _loc1_ + 1;
   }
   return _loc2_;
}
function PlayerDefenceTotal()
{
   var _loc2_ = 0;
   _loc2_ += Player.Defence;
   _loc2_ += Player.Spider.Defence;
   _loc2_ += !DeckPlayerInHandUI.Socket01.Card.IsActive ? 0 : LookUpCard(DeckPlayerInHandUI.Socket01.Card.CardID).Defence;
   _loc2_ += !DeckPlayerInHandUI.Socket02.Card.IsActive ? 0 : LookUpCard(DeckPlayerInHandUI.Socket02.Card.CardID).Defence;
   _loc2_ += !DeckPlayerInHandUI.Socket03.Card.IsActive ? 0 : LookUpCard(DeckPlayerInHandUI.Socket03.Card.CardID).Defence;
   _loc2_ += !DeckPlayerInHandUI.Socket04.Card.IsActive ? 0 : LookUpCard(DeckPlayerInHandUI.Socket04.Card.CardID).Defence;
   _loc2_ += !DeckPlayerInHandUI.Socket05.Card.IsActive ? 0 : LookUpCard(DeckPlayerInHandUI.Socket05.Card.CardID).Defence;
   _loc2_ += !DeckPlayerInHandUI.Socket06.Card.IsActive ? 0 : LookUpCard(DeckPlayerInHandUI.Socket06.Card.CardID).Defence;
   _loc2_ += !DeckPlayerInHandUI.Socket07.Card.IsActive ? 0 : LookUpCard(DeckPlayerInHandUI.Socket07.Card.CardID).Defence;
   var _loc1_ = 1;
   while(_loc1_ <= 7)
   {
      if(IsFusionCard(DeckPlayerInHandUI["Socket0" + _loc1_].Card) && DeckPlayerInHandUI["Socket0" + _loc1_].Card.IsActive)
      {
         _loc2_ += DeckPlayerInHandUI["Socket0" + _loc1_].Card.FusionDefence;
      }
      _loc1_ = _loc1_ + 1;
   }
   return _loc2_;
}
function PlayerHitPointTotal()
{
   var _loc1_ = 0;
   _loc1_ += Player.LifePoint;
   _loc1_ += Player.LifePointReserve;
   return _loc1_;
}
function PlayerActionTotal()
{
   return 7;
}
function PlayerCardInHand()
{
   var _loc1_ = 0;
   _loc1_ += !(DeckPlayerInHandUI.Socket01.Card != null && DeckPlayerInHandUI.Socket01.Card != VoidCard) ? 0 : 1;
   _loc1_ += !(DeckPlayerInHandUI.Socket02.Card != null && DeckPlayerInHandUI.Socket02.Card != VoidCard) ? 0 : 1;
   _loc1_ += !(DeckPlayerInHandUI.Socket03.Card != null && DeckPlayerInHandUI.Socket03.Card != VoidCard) ? 0 : 1;
   _loc1_ += !(DeckPlayerInHandUI.Socket04.Card != null && DeckPlayerInHandUI.Socket04.Card != VoidCard) ? 0 : 1;
   _loc1_ += !(DeckPlayerInHandUI.Socket05.Card != null && DeckPlayerInHandUI.Socket05.Card != VoidCard) ? 0 : 1;
   _loc1_ += !(DeckPlayerInHandUI.Socket06.Card != null && DeckPlayerInHandUI.Socket06.Card != VoidCard) ? 0 : 1;
   _loc1_ += !(DeckPlayerInHandUI.Socket07.Card != null && DeckPlayerInHandUI.Socket07.Card != VoidCard) ? 0 : 1;
   return _loc1_;
}
function PlayerCardInGame()
{
   var _loc1_ = 0;
   _loc1_ += !(DeckPlayerInHandUI.Socket01.Card != null && DeckPlayerInHandUI.Socket01.Card != VoidCard) ? 0 : 1;
   _loc1_ += !(DeckPlayerInHandUI.Socket02.Card != null && DeckPlayerInHandUI.Socket02.Card != VoidCard) ? 0 : 1;
   _loc1_ += !(DeckPlayerInHandUI.Socket03.Card != null && DeckPlayerInHandUI.Socket03.Card != VoidCard) ? 0 : 1;
   _loc1_ += !(DeckPlayerInHandUI.Socket04.Card != null && DeckPlayerInHandUI.Socket04.Card != VoidCard) ? 0 : 1;
   _loc1_ += !(DeckPlayerInHandUI.Socket05.Card != null && DeckPlayerInHandUI.Socket05.Card != VoidCard) ? 0 : 1;
   _loc1_ += !(DeckPlayerInHandUI.Socket06.Card != null && DeckPlayerInHandUI.Socket06.Card != VoidCard) ? 0 : 1;
   _loc1_ += !(DeckPlayerInHandUI.Socket07.Card != null && DeckPlayerInHandUI.Socket07.Card != VoidCard) ? 0 : 1;
   return _loc1_;
}
function PlayerShieldCardInGame()
{
   var _loc1_ = 0;
   _loc1_ += !(DeckPlayerInHandUI.Socket01.Card.CardID >= 200 && DeckPlayerInHandUI.Socket01.Card.CardID < 300 && DeckPlayerInHandUI.Socket01.Card != VoidCard) ? 0 : 1;
   _loc1_ += !(DeckPlayerInHandUI.Socket02.Card.CardID >= 200 && DeckPlayerInHandUI.Socket02.Card.CardID < 300 && DeckPlayerInHandUI.Socket02.Card != VoidCard) ? 0 : 1;
   _loc1_ += !(DeckPlayerInHandUI.Socket03.Card.CardID >= 200 && DeckPlayerInHandUI.Socket03.Card.CardID < 300 && DeckPlayerInHandUI.Socket03.Card != VoidCard) ? 0 : 1;
   _loc1_ += !(DeckPlayerInHandUI.Socket04.Card.CardID >= 200 && DeckPlayerInHandUI.Socket04.Card.CardID < 300 && DeckPlayerInHandUI.Socket04.Card != VoidCard) ? 0 : 1;
   _loc1_ += !(DeckPlayerInHandUI.Socket05.Card.CardID >= 200 && DeckPlayerInHandUI.Socket05.Card.CardID < 300 && DeckPlayerInHandUI.Socket05.Card != VoidCard) ? 0 : 1;
   _loc1_ += !(DeckPlayerInHandUI.Socket06.Card.CardID >= 200 && DeckPlayerInHandUI.Socket06.Card.CardID < 300 && DeckPlayerInHandUI.Socket06.Card != VoidCard) ? 0 : 1;
   _loc1_ += !(DeckPlayerInHandUI.Socket07.Card.CardID >= 200 && DeckPlayerInHandUI.Socket07.Card.CardID < 300 && DeckPlayerInHandUI.Socket07.Card != VoidCard) ? 0 : 1;
   return _loc1_;
}
function PlayerHaveActivatedAllGreenCardInGame()
{
   var _loc1_ = 0;
   _loc1_ += !(DeckPlayerInHandUI.Socket01.Card.CardID >= 100 && DeckPlayerInHandUI.Socket01.Card.CardID < 400 && DeckPlayerInHandUI.Socket01.Card != VoidCard && DeckPlayerInHandUI.Socket01.Card.IsActive && DeckPlayerInHandUI.Socket07.Card.CardID != 302) ? 0 : 1;
   _loc1_ += !(DeckPlayerInHandUI.Socket02.Card.CardID >= 100 && DeckPlayerInHandUI.Socket02.Card.CardID < 400 && DeckPlayerInHandUI.Socket02.Card != VoidCard && DeckPlayerInHandUI.Socket02.Card.IsActive && DeckPlayerInHandUI.Socket07.Card.CardID != 302) ? 0 : 1;
   _loc1_ += !(DeckPlayerInHandUI.Socket03.Card.CardID >= 100 && DeckPlayerInHandUI.Socket03.Card.CardID < 400 && DeckPlayerInHandUI.Socket03.Card != VoidCard && DeckPlayerInHandUI.Socket03.Card.IsActive && DeckPlayerInHandUI.Socket07.Card.CardID != 302) ? 0 : 1;
   _loc1_ += !(DeckPlayerInHandUI.Socket04.Card.CardID >= 100 && DeckPlayerInHandUI.Socket04.Card.CardID < 400 && DeckPlayerInHandUI.Socket04.Card != VoidCard && DeckPlayerInHandUI.Socket04.Card.IsActive && DeckPlayerInHandUI.Socket07.Card.CardID != 302) ? 0 : 1;
   _loc1_ += !(DeckPlayerInHandUI.Socket05.Card.CardID >= 100 && DeckPlayerInHandUI.Socket05.Card.CardID < 400 && DeckPlayerInHandUI.Socket05.Card != VoidCard && DeckPlayerInHandUI.Socket05.Card.IsActive && DeckPlayerInHandUI.Socket07.Card.CardID != 302) ? 0 : 1;
   _loc1_ += !(DeckPlayerInHandUI.Socket06.Card.CardID >= 100 && DeckPlayerInHandUI.Socket06.Card.CardID < 400 && DeckPlayerInHandUI.Socket06.Card != VoidCard && DeckPlayerInHandUI.Socket06.Card.IsActive && DeckPlayerInHandUI.Socket07.Card.CardID != 302) ? 0 : 1;
   _loc1_ += !(DeckPlayerInHandUI.Socket07.Card.CardID >= 100 && DeckPlayerInHandUI.Socket07.Card.CardID < 400 && DeckPlayerInHandUI.Socket07.Card != VoidCard && DeckPlayerInHandUI.Socket07.Card.IsActive && DeckPlayerInHandUI.Socket07.Card.CardID != 302) ? 0 : 1;
   return _loc1_;
}
function PlayerGetAllCard()
{
   return PlayerCardInHand() + Player.CardDeck.length;
}
function HurtPlayer(damage)
{
   var _loc1_ = damage;
   var _loc2_ = 0;
   if(Player.LifePointReserve > 0)
   {
      if(Player.LifePointReserve > _loc1_)
      {
         Player.LifePointReserve -= _loc1_;
      }
      else
      {
         _loc2_ = _loc1_ - Player.LifePointReserve;
         Player.LifePointReserve = 0;
         Player.LifePoint -= _loc2_;
      }
   }
   else
   {
      Player.LifePoint -= _loc1_;
   }
   if(Player.LifePoint <= 0)
   {
      Player.LifePoint = 0;
      IsWinner = false;
      IsGameOver = true;
   }
}
var Player = new Object();
Player.ID = BattleSystem._parent.FromEnginePlayer.type;
Player.Name = BattleSystem._parent.FromEnginePlayer.Name;
Player.Rank = BattleSystem._parent.FromEnginePlayer.rank;
Player.Dice = BattleSystem._parent.FromEnginePlayer.dice;
Player.Defence = BattleSystem._parent.FromEnginePlayer.defense;
Player.Action = BattleSystem._parent.FromEnginePlayer.action;
Player.LifePoint = BattleSystem._parent.FromEnginePlayer.life;
Player.LifePointDup = BattleSystem._parent.FromEnginePlayer.life;
Player.VictoryPoint = BattleSystem._parent.FromEnginePlayer.victory;
Player.myTurn = BattleSystem._parent.FromEnginePlayer.myTurn;
Player.Weapon = 0;
Player.Armor = false;
Player.LifePointReserve = 0;
delete BattleSystem._parent.FromEnginePlayer.myTurn;
Player.Spider = new Object();
Player.Spider.Name = !BattleSystem._parent.FromEnginePlayer.SpiderAccess ? "" : BattleSystem._parent.FromEnginePlayer.SpiderName;
Player.Spider.Dice = !BattleSystem._parent.FromEnginePlayer.SpiderAccess ? 0 : BattleSystem._parent.FromEnginePlayer.SpiderDice;
Player.Spider.Defence = !BattleSystem._parent.FromEnginePlayer.SpiderAccess ? 0 : BattleSystem._parent.FromEnginePlayer.SpiderDefence;
Player.Spider.LifePoint = !BattleSystem._parent.FromEnginePlayer.SpiderAccess ? 0 : BattleSystem._parent.FromEnginePlayer.SpiderAction;
Player.LifePoint += Player.Spider.LifePoint;
Player.LifePointDup += Player.Spider.LifePoint;
if(root.deckActive == "A")
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
Player.CardDeck = new Array();
var i = 0;
while(i < BattleSystem._parent.FromEnginePlayer.card.length)
{
   var j = 0;
   while(j < deckNbrArr.length)
   {
      if(BattleSystem._parent.FromEnginePlayer.card[i].deck == deckNbrArr[j])
      {
         Player.CardDeck.push(BattleSystem._parent.FromEnginePlayer.card[i].id);
      }
      j++;
   }
   i++;
}
