function CallUpdateDeckToGSO(bUpdatePlayer)
{
   root.Trace("CallUpdate ! : " + (!bUpdatePlayer ? "LAUTRE" : "MOI"));
   if(bUpdatePlayer)
   {
      root.gameSO.send("updateCardDeck",root.playerStats.Name,true,GetStringCardID(false),GetStringCardIDInDeckWithCode(false,false));
   }
   else
   {
      root.gameSO.send("updateCardDeck",root.playerStats.Name,false,GetStringCardID(true),GetStringCardIDInDeckWithCode(true,false));
   }
}
function updateDeckFGSO(bMyDeck, strCardId, strCardIdInDeck, nCardOnBook, bThrowReceipt)
{
   if(!DEBUG_MULTI.bDebugEcoute)
   {
      return undefined;
   }
   if(bThrowReceipt == undefined)
   {
      bThrowReceipt = false;
   }
   root.Trace("UpdateDechFGSO : Deck de " + (!bMyDeck ? "LAUTRE" : "MOI"));
   if(bThrowReceipt)
   {
      root.gameSO.send("AccuseReceptionInit",root.playerStats.Name);
   }
   tabCardsToUse = new Array();
   if(bMyDeck)
   {
      RemoveAllCardFromDeck(bMyDeck,TURN_PLAYER);
      var tabCardInDeck = new Array();
      tabCardInDeck = strCardIdInDeck.split(",");
      if(strCardId != null && strCardId != undefined)
      {
         Player.CardDeck = new Array();
         Player.CardDeck = strCardId.split(",");
      }
      var i = 1;
      while(i <= 7)
      {
         var tabCardActivated = new Array();
         tabCardWithStats = tabCardInDeck[i - 1].split("~");
         if(tabCardWithStats[0] == 0 || tabCardWithStats[0] == null || tabCardWithStats[0] == undefined || tabCardWithStats[0] == "")
         {
            eval("DeckPlayerInHandUI.Socket0" + i).Card = VoidCard;
            VoidCard.IsActive = false;
         }
         else
         {
            var newCard = this.attachMovie("CardCloner","Card" + indexCard++,++nextDepth);
            var socketTarget = eval("DeckPlayerInHandUI.Socket0" + i);
            newCard.IsLocked = false;
            newCard.FlushNow = false;
            InitCard(newCard.CardCloner,tabCardWithStats[0]);
            if(Number(tabCardWithStats[0]) >= 600 && Number(tabCardWithStats[0]) <= 700)
            {
               root.Trace("Je suis ici : " + tabCardWithStats[2] + "/" + tabCardWithStats[3]);
               newCard.FusionDice = Number(tabCardWithStats[2]);
               newCard.FusionDefence = Number(tabCardWithStats[3]);
               setCardAttribute(newCard,newCard.FusionDice,newCard.FusionDefence);
            }
            if(tabCardWithStats[1] != undefined && tabCardWithStats[1] != null)
            {
               if(tabCardWithStats[1] != 0)
               {
                  if(tabCardWithStats[1] == 1 || Dices.length <= 0)
                  {
                     Activate(newCard,TURN_PLAYER);
                     ShowCardStats(newCard.CardCloner);
                  }
               }
               else
               {
                  newCard.IsActive = false;
               }
               ShowCardStats(newCard.CardCloner);
            }
            else
            {
               newCard.IsActive = false;
            }
            newCard._x = DeckPlayerInHandUI._x + socketTarget._x;
            newCard._y = DeckPlayerInHandUI._y;
            newCard.Socket = socketTarget;
            newCard.isPlayerCard = true;
            newCard.FlushNow = false;
            newCard.CardCloner.btn.enabled = true;
            newCard.hasBeenActivated = false;
            socketTarget.Card = newCard;
         }
         i++;
      }
      if(nCardOnBook != undefined)
      {
         DrawCardOnDeckFGSO(true,nCardOnBook);
      }
      else
      {
         BattleSystem.CardOnTop = false;
      }
   }
   else
   {
      RemoveAllCardFromDeck(bMyDeck,TURN_OPPONENT);
      var tabCardInDeck = new Array();
      tabCardInDeck = strCardIdInDeck.split(",");
      if(strCardId != null && strCardId != undefined)
      {
         Opponent.CardDeck = new Array();
         Opponent.CardDeck = strCardId.split(",");
      }
      var i = 1;
      while(i <= 7)
      {
         var tabCardActivated = new Array();
         tabCardWithStats = tabCardInDeck[i - 1].split("~");
         if(tabCardWithStats[0] == 0)
         {
            eval("DeckOpponentUI.Socket0" + i).Card = VoidCard;
            VoidCard.IsActive = false;
         }
         else
         {
            var newCard = this.attachMovie("CardCloner","Card" + indexCard++,++nextDepth);
            var socketTarget = eval("DeckOpponentUI.Socket0" + i);
            newCard.IsLocked = false;
            newCard.FlushNow = false;
            InitCard(newCard.CardCloner,tabCardWithStats[0]);
            if(Number(tabCardWithStats[0]) >= 600 && Number(tabCardWithStats[0]) <= 700)
            {
               root.Trace("Je suis ici : " + tabCardWithStats[2] + "/" + tabCardWithStats[3]);
               newCard.FusionDice = Number(tabCardWithStats[2]);
               newCard.FusionDefence = Number(tabCardWithStats[3]);
               setCardAttribute(newCard,newCard.FusionDice,newCard.FusionDefence);
            }
            if(tabCardWithStats[1] != undefined && tabCardWithStats[1] != null)
            {
               if(tabCardWithStats[1] != 0)
               {
                  if(tabCardWithStats[1] == 1 || Dices.length <= 0)
                  {
                     Activate(newCard,TURN_OPPONENT);
                     ShowCardStats(newCard.CardCloner);
                  }
                  else
                  {
                     HideCardStats(newCard.CardCloner);
                     tabCardsToUse.push(newCard);
                  }
               }
               else
               {
                  newCard.IsActive = false;
                  HideCardStats(newCard.CardCloner);
               }
            }
            else
            {
               newCard.IsActive = false;
               HideCardStats(newCard.CardCloner);
            }
            newCard._x = DeckOpponentUI._x + socketTarget._x;
            newCard._y = DeckOpponentUI._y;
            newCard.Socket = socketTarget;
            newCard.isPlayerCard = false;
            newCard.FlushNow = false;
            newCard.CardCloner.btn.enabled = false;
            newCard.hasBeenActivated = false;
            socketTarget.Card = newCard;
         }
         i++;
      }
      if(nCardOnBook != undefined && tabCardActivated != null)
      {
         DrawCardOnDeckFGSO(false,nCardOnBook);
      }
      else
      {
         BattleSystem.CardOnTop = false;
      }
   }
}
function ResetActivatedCard()
{
   var i = 1;
   while(i <= 7)
   {
      eval("DeckPlayerInHandUI.Socket0" + i).Card.hasBeenActivated = false;
      i++;
   }
}
function useNextCard()
{
   if(tabCardsToUse.length <= 0)
   {
      return true;
   }
   var _loc1_ = tabCardsToUse.shift();
   OpponentUseCardFGSO(GetTypeOfDiceNeeded(_loc1_.CardID),_loc1_.CardID);
   return false;
}
function DrawCardOnBookFGSO(bMyDeck, nCard)
{
   if(bMyDeck)
   {
      if(nCardOnBook == 0)
      {
         Deck.Card = VoidCard;
      }
      else
      {
         var _loc1_ = this.attachMovie("CardCloner","Card" + indexCard++,++nextDepth);
         _loc1_.isPlayerCard = true;
         _loc1_.symbol.btn.enabled = true;
         InitCard(_loc1_.CardCloner,nCard);
         _loc1_._x = Deck._x + Deck.Socket._x;
         _loc1_._y = Deck._y + Deck.Socket._y;
         Deck.Card = _loc1_;
      }
   }
   else if(nCardOnBook == 0)
   {
      DeckOpponent.Card = VoidCard;
   }
   else
   {
      _loc1_ = this.attachMovie("CardCloner","Card" + indexCard++,++nextDepth);
      _loc1_.isPlayerCard = false;
      _loc1_.symbol.btn.enabled = false;
      InitCard(_loc1_.CardCloner,nCard);
      _loc1_._x = DeckOpponent._x + DeckOpponent.Socket._x;
      _loc1_._y = DeckOpponent._y + DeckOpponent.Socket._y;
      DeckOpponent.Card = _loc1_;
   }
}
function RemoveAllCardFromDeck(bMyDeck, nTurn)
{
   var cardToRemove = null;
   if(nTurn != undefined)
   {
      var turnBackup = CurrentPlayer;
      CurrentPlayer = nTurn;
   }
   if(bMyDeck)
   {
      var i = 1;
      while(i <= 7)
      {
         cardToRemove = eval("DeckPlayerInHandUI.Socket0" + i).Card;
         if(cardToRemove != VoidCard)
         {
            if((IsBlueCard(cardToRemove) || cardToRemove.CardID == 303) && cardToRemove.IsActive)
            {
               LookUpCard(cardToRemove.CardID).Deactivate(BattleSystem.TURN_PLAYER);
            }
            cardToRemove.removeMovieClip();
            cardToRemove = VoidCard;
         }
         i++;
      }
      if((IsBlueCard(Deck.Card) || Deck.Card.CardID == 303) && Deck.Card.IsActive)
      {
         LookUpCard(Deck.Card.CardID).Deactivate();
      }
      Deck.Card.removeMovieClip();
      Deck.Card = VoidCard;
   }
   else
   {
      var i = 1;
      while(i <= 7)
      {
         cardToRemove = eval("DeckOpponentUI.Socket0" + i + ".Card");
         if(cardToRemove != VoidCard)
         {
            if((IsBlueCard(cardToRemove) || cardToRemove.CardID == 303) && cardToRemove.IsActive)
            {
               LookUpCard(cardToRemove.CardID).Deactivate();
            }
            cardToRemove.removeMovieClip();
            eval("DeckOpponentUI.Socket0" + i).Card = VoidCard;
         }
         i++;
      }
      if((IsBlueCard(DeckOpponent.Card) || DeckOpponent.Card.CardID == 303) && DeckOpponent.Card.IsActive)
      {
         LookUpCard(DeckOpponent.Card.CardID).Deactivate(BattleSystem.TURN_OPPONENT);
      }
      DeckOpponent.Card.removeMovieClip();
      DeckOpponent.Card = VoidCard;
   }
   if(nTurn != undefined)
   {
      CurrentPlayer = turnBackup;
   }
}
function GetStringCardID(bMyDeck)
{
   var _loc2_ = !bMyDeck ? Opponent : Player;
   var _loc3_ = "";
   var _loc1_ = 0;
   while(_loc1_ < _loc2_.CardDeck.length)
   {
      _loc3_ += _loc3_ != "" ? "," + _loc2_.CardDeck[_loc1_] : _loc2_.CardDeck[_loc1_];
      _loc1_ = _loc1_ + 1;
   }
   return _loc3_;
}
function GetStringCardIDInDeck(bMyDeck)
{
   var _loc2_ = !bMyDeck ? DeckOpponentUI : DeckPlayerInHandUI;
   var _loc3_ = "";
   var _loc1_ = 1;
   while(_loc1_ <= 7)
   {
      if(_loc3_ == "")
      {
         _loc3_ = _loc2_["Socket0" + _loc1_].Card.CardID != undefined ? _loc2_["Socket0" + _loc1_].Card.CardID : "000";
      }
      else
      {
         _loc3_ += "," + (_loc2_["Socket0" + _loc1_].Card.CardID != undefined ? _loc2_["Socket0" + _loc1_].Card.CardID : "000");
      }
      _loc1_ = _loc1_ + 1;
   }
   return _loc3_;
}
function GetStringCardIDInDeckWithCode(bMyDeck, bCheckForFusionCard)
{
   var _loc2_ = !bMyDeck ? DeckOpponentUI : DeckPlayerInHandUI;
   var _loc3_ = "";
   if(bCheckForFusionCard == undefined)
   {
      bCheckForFusionCard = false;
   }
   var _loc1_ = 1;
   while(_loc1_ <= 7)
   {
      if(_loc3_ == "")
      {
         _loc3_ = _loc2_["Socket0" + _loc1_].Card.CardID != undefined ? _loc2_["Socket0" + _loc1_].Card.CardID : "000";
      }
      else
      {
         _loc3_ += "," + (_loc2_["Socket0" + _loc1_].Card.CardID != undefined ? _loc2_["Socket0" + _loc1_].Card.CardID : "000");
      }
      _loc3_ += "~" + getActivatedCode(_loc2_["Socket0" + _loc1_].Card);
      if(bCheckForFusionCard)
      {
         _loc3_ += getFusionCode(_loc2_["Socket0" + _loc1_].Card);
      }
      _loc1_ = _loc1_ + 1;
   }
   return _loc3_;
}
function GetStringCardActivated(bMyDeck)
{
   var _loc3_ = !bMyDeck ? DeckOpponentUI : DeckPlayerInHandUI;
   var _loc2_ = "";
   var _loc1_ = 1;
   while(_loc1_ <= 7)
   {
      if(_loc2_ == "")
      {
         _loc2_ = getActivatedCode(_loc3_["Socket0" + _loc1_].Card);
      }
      else
      {
         _loc2_ += "," + getActivatedCode(_loc3_["Socket0" + _loc1_].Card);
      }
      _loc1_ = _loc1_ + 1;
   }
   return _loc2_;
}
function InitCard(card_mc, nCardID)
{
   var _loc1_ = card_mc;
   if(nCardID == undefined)
   {
      if(BattleSystem.PickInPlayerArray)
      {
         var _loc3_ = random(BattleSystem.Player.CardDeck.length);
         if(DEBUG_MULTI.bDebugGiveCardNotInRandom)
         {
            _loc3_ = 0;
         }
         _loc1_._parent.CardID = _loc1_.CardID = BattleSystem.Player.CardDeck[_loc3_];
         BattleSystem.Player.CardDeck.splice(_loc3_,1);
      }
      else
      {
         _loc3_ = random(BattleSystem.Opponent.CardDeck.length);
         if(DEBUG_MULTI.bDebugGiveCardNotInRandom)
         {
            _loc3_ = 0;
         }
         _loc1_._parent.CardID = _loc1_.CardID = BattleSystem.Opponent.CardDeck[_loc3_];
         BattleSystem.Opponent.CardDeck.splice(_loc3_,1);
      }
   }
   else
   {
      _loc1_._parent.CardID = _loc1_.CardID = nCardID;
   }
   var _loc2_ = BattleSystem.LookUpCard(_loc1_.CardID);
   if(_loc2_.Dice > 0 || _loc1_._parent.FusionDice > 0 && IsFusionCard(_loc1_))
   {
      _loc1_.diceBox.Text.txtValue.text = !IsFusionCard(_loc1_) ? _loc2_.Dice : _loc1_._parent.FusionDice;
      _loc1_.diceBox._visible = true;
   }
   else
   {
      _loc1_.diceBox._visible = false;
   }
   if(_loc2_.Defence > 0 || _loc1_._parent.FusionDefence > 0 && IsFusionCard(_loc1_))
   {
      _loc1_.armorBox.Text.txtValue.text = !IsFusionCard(_loc1_) ? _loc2_.Defence : _loc1_._parent.FusionDefence;
      _loc1_.armorBox._visible = true;
   }
   else
   {
      _loc1_.armorBox._visible = false;
   }
   if(_loc2_.Action > 0)
   {
      _loc1_.actionBox.Text.txtValue.text = _loc2_.Action;
      _loc1_.actionBox._visible = true;
   }
   else
   {
      _loc1_.actionBox._visible = false;
   }
   if(IsFusionCard(_loc1_) && _loc1_._parent.nFusedCard == undefined)
   {
      _loc1_._parent.nFusedCard = 0;
      _loc1_._parent.FuseTypeCard = _loc2_.FuseTypeCard;
      _loc1_._parent.MAX_FUSE = _loc2_.MAX_FUSE;
      _loc1_._parent.FusionDice += _loc2_.Dice;
      _loc1_._parent.FusionDefence += _loc2_.Defence;
   }
   _loc1_.img_mc._visible = true;
   _loc1_.titleTxt.text = _loc2_.Name;
   _loc1_.titleTxt._visible = true;
   _loc1_._parent.helpButton._visible = true;
   _loc1_.gotoAndStop("ID_" + _loc1_.CardID);
}
function getActivatedCode(card_mc)
{
   var _loc1_ = card_mc;
   if(_loc1_.IsActive && _loc1_.hasBeenActivated)
   {
      return 2;
   }
   if(_loc1_.IsActive)
   {
      return 1;
   }
   return 0;
}
function getFusionCode(card_mc)
{
   var _loc1_ = card_mc;
   if(IsFusionCard(_loc1_))
   {
      return "~" + _loc1_.FusionDice + "~" + _loc1_.FusionDefence;
   }
   return "";
}
function HideCardStats(card_mc)
{
   var _loc1_ = card_mc;
   _loc1_.img_mc._visible = false;
   _loc1_.titleTxt._visible = false;
   _loc1_.diceBox._visible = false;
   _loc1_.armorBox._visible = false;
   _loc1_.actionBox._visible = false;
   _loc1_._parent.helpButton._visible = false;
}
function ShowCardStats(card_mc)
{
   InitCard(card_mc,card_mc.CardID);
}
function GetTypeOfDiceNeeded(cardID)
{
   var _loc1_ = cardID;
   if(_loc1_ >= 100 && _loc1_ < 400)
   {
      return DICE_GREEN;
   }
   if(_loc1_ >= 400 && _loc1_ < 500)
   {
      return DICE_BLUE;
   }
   if(_loc1_ >= 500 && _loc1_ < 600)
   {
      return DICE_YELLOW;
   }
   if(_loc1_ >= 600 && _loc1_ < 700)
   {
      return DICE_GREEN;
   }
   return null;
}
function OpponentUseCardFGSO(nDice, nCard)
{
   var bCheckDice = false;
   var bCheckCard = false;
   var i = 0;
   while(i < Dices.length && !bCheckDice)
   {
      bCheckDice = Dices[i].Type == nDice;
      i++;
   }
   i--;
   bCheckCard = false;
   var j = 1;
   while(j <= 7 && !bCheckCard)
   {
      bCheckCard = nCard == eval("DeckOpponentUI.Socket0" + j).Card.CardID && !eval("DeckOpponentUI.Socket0" + j).Card.IsActive;
      j++;
   }
   j--;
   if(bCheckCard && bCheckDice)
   {
      card = eval("DeckOpponentUI.Socket0" + j).Card;
      card.swapDepths(Dices[i]);
      Dices[i].Socket = eval("AISocketCard0" + j);
      Dices[i].Socket.LinkedCard = card;
      Dices[i].onEnterFrame = MoveTo;
      Dices[i].halo.gotoAndPlay("GLOW");
      Dices.splice(i,1);
   }
   else
   {
      root.Trace("J\'ai pas trouvé ");
      root.Trace("Type de dé : " + nDice);
      root.Trace("ID de carte : " + nCard);
      if(bCheckCard)
      {
         Activate(eval("DeckOpponentUI.Socket0" + j).Card);
         ShowCardStats(eval("DeckOpponentUI.Socket0" + j).Card);
      }
      OpponentUseCard();
   }
}
