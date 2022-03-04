function Show()
{
   swapDepths(9999);
   if(CardType == BattleSystem.CARD_YELLOW)
   {
      BattleSystem.DeckOpponentUI.Socket01.Card == BattleSystem.VoidCard ? Arrow01.Hide() : (!BattleSystem.IsYellowCard(BattleSystem.DeckOpponentUI.Socket01.Card) ? Arrow01.Hide() : Arrow01.Show());
      BattleSystem.DeckOpponentUI.Socket02.Card == BattleSystem.VoidCard ? Arrow02.Hide() : (!BattleSystem.IsYellowCard(BattleSystem.DeckOpponentUI.Socket02.Card) ? Arrow02.Hide() : Arrow02.Show());
      BattleSystem.DeckOpponentUI.Socket03.Card == BattleSystem.VoidCard ? Arrow03.Hide() : (!BattleSystem.IsYellowCard(BattleSystem.DeckOpponentUI.Socket03.Card) ? Arrow03.Hide() : Arrow03.Show());
      BattleSystem.DeckOpponentUI.Socket04.Card == BattleSystem.VoidCard ? Arrow04.Hide() : (!BattleSystem.IsYellowCard(BattleSystem.DeckOpponentUI.Socket04.Card) ? Arrow04.Hide() : Arrow04.Show());
      BattleSystem.DeckOpponentUI.Socket05.Card == BattleSystem.VoidCard ? Arrow05.Hide() : (!BattleSystem.IsYellowCard(BattleSystem.DeckOpponentUI.Socket05.Card) ? Arrow05.Hide() : Arrow05.Show());
      BattleSystem.DeckOpponentUI.Socket06.Card == BattleSystem.VoidCard ? Arrow06.Hide() : (!BattleSystem.IsYellowCard(BattleSystem.DeckOpponentUI.Socket06.Card) ? Arrow06.Hide() : Arrow06.Show());
      BattleSystem.DeckOpponentUI.Socket07.Card == BattleSystem.VoidCard ? Arrow07.Hide() : (!BattleSystem.IsYellowCard(BattleSystem.DeckOpponentUI.Socket07.Card) ? Arrow07.Hide() : Arrow07.Show());
   }
   else if(CardType == BattleSystem.CARD_GREEN)
   {
      BattleSystem.DeckOpponentUI.Socket01.Card == BattleSystem.VoidCard ? Arrow01.Hide() : (!BattleSystem.IsGreenCard(BattleSystem.DeckOpponentUI.Socket01.Card) ? Arrow01.Hide() : Arrow01.Show());
      BattleSystem.DeckOpponentUI.Socket02.Card == BattleSystem.VoidCard ? Arrow02.Hide() : (!BattleSystem.IsGreenCard(BattleSystem.DeckOpponentUI.Socket02.Card) ? Arrow02.Hide() : Arrow02.Show());
      BattleSystem.DeckOpponentUI.Socket03.Card == BattleSystem.VoidCard ? Arrow03.Hide() : (!BattleSystem.IsGreenCard(BattleSystem.DeckOpponentUI.Socket03.Card) ? Arrow03.Hide() : Arrow03.Show());
      BattleSystem.DeckOpponentUI.Socket04.Card == BattleSystem.VoidCard ? Arrow04.Hide() : (!BattleSystem.IsGreenCard(BattleSystem.DeckOpponentUI.Socket04.Card) ? Arrow04.Hide() : Arrow04.Show());
      BattleSystem.DeckOpponentUI.Socket05.Card == BattleSystem.VoidCard ? Arrow05.Hide() : (!BattleSystem.IsGreenCard(BattleSystem.DeckOpponentUI.Socket05.Card) ? Arrow05.Hide() : Arrow05.Show());
      BattleSystem.DeckOpponentUI.Socket06.Card == BattleSystem.VoidCard ? Arrow06.Hide() : (!BattleSystem.IsGreenCard(BattleSystem.DeckOpponentUI.Socket06.Card) ? Arrow06.Hide() : Arrow06.Show());
      BattleSystem.DeckOpponentUI.Socket07.Card == BattleSystem.VoidCard ? Arrow07.Hide() : (!BattleSystem.IsGreenCard(BattleSystem.DeckOpponentUI.Socket07.Card) ? Arrow07.Hide() : Arrow07.Show());
   }
   else if(CardType == BattleSystem.CARD_BLUE)
   {
      BattleSystem.DeckOpponentUI.Socket01.Card == BattleSystem.VoidCard ? Arrow01.Hide() : (!BattleSystem.IsBlueCard(BattleSystem.DeckOpponentUI.Socket01.Card) ? Arrow01.Hide() : Arrow01.Show());
      BattleSystem.DeckOpponentUI.Socket02.Card == BattleSystem.VoidCard ? Arrow02.Hide() : (!BattleSystem.IsBlueCard(BattleSystem.DeckOpponentUI.Socket02.Card) ? Arrow02.Hide() : Arrow02.Show());
      BattleSystem.DeckOpponentUI.Socket03.Card == BattleSystem.VoidCard ? Arrow03.Hide() : (!BattleSystem.IsBlueCard(BattleSystem.DeckOpponentUI.Socket03.Card) ? Arrow03.Hide() : Arrow03.Show());
      BattleSystem.DeckOpponentUI.Socket04.Card == BattleSystem.VoidCard ? Arrow04.Hide() : (!BattleSystem.IsBlueCard(BattleSystem.DeckOpponentUI.Socket04.Card) ? Arrow04.Hide() : Arrow04.Show());
      BattleSystem.DeckOpponentUI.Socket05.Card == BattleSystem.VoidCard ? Arrow05.Hide() : (!BattleSystem.IsBlueCard(BattleSystem.DeckOpponentUI.Socket05.Card) ? Arrow05.Hide() : Arrow05.Show());
      BattleSystem.DeckOpponentUI.Socket06.Card == BattleSystem.VoidCard ? Arrow06.Hide() : (!BattleSystem.IsBlueCard(BattleSystem.DeckOpponentUI.Socket06.Card) ? Arrow06.Hide() : Arrow06.Show());
      BattleSystem.DeckOpponentUI.Socket07.Card == BattleSystem.VoidCard ? Arrow07.Hide() : (!BattleSystem.IsBlueCard(BattleSystem.DeckOpponentUI.Socket07.Card) ? Arrow07.Hide() : Arrow07.Show());
   }
   Arrow01.LinkedCardSocket = BattleSystem.DeckOpponentUI.Socket01;
   Arrow02.LinkedCardSocket = BattleSystem.DeckOpponentUI.Socket02;
   Arrow03.LinkedCardSocket = BattleSystem.DeckOpponentUI.Socket03;
   Arrow04.LinkedCardSocket = BattleSystem.DeckOpponentUI.Socket04;
   Arrow05.LinkedCardSocket = BattleSystem.DeckOpponentUI.Socket05;
   Arrow06.LinkedCardSocket = BattleSystem.DeckOpponentUI.Socket06;
   Arrow07.LinkedCardSocket = BattleSystem.DeckOpponentUI.Socket07;
   _visible = true;
}
function Hide()
{
   swapDepths(1);
   _visible = false;
}
function SubmitCard(SocketOfCardToKill)
{
   var _loc1_ = SocketOfCardToKill;
   if(BattleSystem.CardsIDToKill == "")
   {
      BattleSystem.CardsIDToKill = _loc1_.Card.CardID + "~" + (!_loc1_.Card.IsActive ? 0 : 1);
   }
   else
   {
      BattleSystem.CardsIDToKill += "," + (_loc1_.Card.CardID + "~" + (!_loc1_.Card.IsActive ? 0 : 1));
   }
   _loc1_.Card.Socket = BattleSystem.CemeteryOpponent.Socket;
   _loc1_.Card.onEnterFrame = BattleSystem.MoveToSocket;
   _loc1_.Card = BattleSystem.VoidCard;
   Hide();
}
var CardType = BattleSystem.CARD_VOID;
btn.useHandCursor = false;
Hide();
