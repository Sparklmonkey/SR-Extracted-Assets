function AILaunch()
{
   Console.Write("<AI>");
   AIPhaseCard();
}
function AIInit()
{
   return undefined;
}
function AIPhaseCard()
{
   clearInterval(intervalID);
   slot = AIFindEmptySlot();
   if(slot != null)
   {
      DeckOpponent.Card.Socket = slot;
      DeckOpponent.Card.onEnterFrame = MoveToSocket;
      DeckOpponent.Card = VoidCard;
   }
   WaitCallback = function()
   {
      clearInterval(intervalID);
      ThrowDice();
   };
   intervalID = setInterval(Wait,500);
}
function AIPhaseDice()
{
   diceBuffer = new Array();
   var _loc1_ = 0;
   while(_loc1_ < Dices.length)
   {
      diceBuffer.push(Dices[_loc1_]);
      _loc1_ = _loc1_ + 1;
   }
   AIDispatchDice();
}
function AIPhaseAction()
{
   clearInterval(intervalID);
   WaitCallback = function()
   {
      clearInterval(intervalID);
      SetMode(MODE_ACTION_ATTACK);
   };
   intervalID = setInterval(Wait,1000);
   Console.Write("</AI>");
}
function AIDispatchDice()
{
   WaitCallback = function()
   {
      clearInterval(intervalID);
      AIDispatchYellowDice();
   };
   intervalID = setInterval(Wait,250);
   Console.Write("\t<dispatch dice>");
}
function AIDispatchYellowDice()
{
   Console.Write("\t\t<yellow>");
   var _loc1_ = 0;
   while(true)
   {
      if(_loc1_ >= diceBuffer.length)
      {
         clearInterval(intervalID);
         intervalID = setInterval(AIDispatchGreenDice,delayDiceMove);
      }
      if(diceBuffer[_loc1_].Type == DICE_YELLOW)
      {
         diceBuffer[_loc1_].Socket = AIChooseCard(DICE_YELLOW);
         if(diceBuffer[_loc1_].Socket != null)
         {
            diceBuffer[_loc1_].onEnterFrame = MoveTo;
            diceBuffer[_loc1_].halo.gotoAndPlay("GLOW");
            clearInterval(intervalID);
            root.sfx.gotoAndPlay("DiceMove");
         }
         else
         {
            clearInterval(intervalID);
            intervalID = setInterval(AIDispatchGreenDice,delayDiceMove);
         }
         diceBuffer.splice(_loc1_,1);
         break;
      }
      _loc1_ = _loc1_ + 1;
   }
}
function AIDispatchGreenDice()
{
   Console.Write("\t\t<green>");
   var _loc1_ = 0;
   while(true)
   {
      if(_loc1_ >= diceBuffer.length)
      {
         clearInterval(intervalID);
         intervalID = setInterval(AIDispatchBlueDice,delayDiceMove);
      }
      if(diceBuffer[_loc1_].Type == DICE_GREEN)
      {
         diceBuffer[_loc1_].Socket = AIChooseCard(DICE_GREEN);
         if(diceBuffer[_loc1_].Socket != null)
         {
            diceBuffer[_loc1_].onEnterFrame = MoveTo;
            diceBuffer[_loc1_].halo.gotoAndPlay("GLOW");
            clearInterval(intervalID);
            root.sfx.gotoAndPlay("DiceMove");
         }
         else
         {
            clearInterval(intervalID);
            intervalID = setInterval(AIDispatchBlueDice,delayDiceMove);
         }
         diceBuffer.splice(_loc1_,1);
         break;
      }
      _loc1_ = _loc1_ + 1;
   }
}
function AIDispatchBlueDice()
{
   Console.Write("\t\t<blue>");
   var _loc1_ = 0;
   while(true)
   {
      if(_loc1_ >= diceBuffer.length)
      {
         clearInterval(intervalID);
         intervalID = setInterval(AIPhaseAction,delayDiceMove);
      }
      if(diceBuffer[_loc1_].Type == DICE_BLUE)
      {
         diceBuffer[_loc1_].Socket = AIChooseCard(DICE_BLUE);
         if(diceBuffer[_loc1_].Socket != null)
         {
            diceBuffer[_loc1_].onEnterFrame = MoveTo;
            diceBuffer[_loc1_].halo.gotoAndPlay("GLOW");
            clearInterval(intervalID);
            root.sfx.gotoAndPlay("DiceMove");
         }
         else
         {
            clearInterval(intervalID);
            intervalID = setInterval(AIPhaseAction,delayDiceMove);
         }
         diceBuffer.splice(_loc1_,1);
         break;
      }
      _loc1_ = _loc1_ + 1;
   }
}
function AIChooseCard(cardType)
{
   var _loc2_ = 0;
   var _loc1_ = VoidCard;
   var bestCard = VoidCard;
   var _loc3_ = null;
   if(cardType == DICE_YELLOW)
   {
      _loc1_ = DeckOpponentUI.Socket01.Card;
      if(_loc1_ != VoidCard && !_loc1_.IsActive && !_loc1_.IsLocked && IsYellowCard(_loc1_))
      {
         if(LookUpCard(_loc1_.CardID).Dice > _loc2_)
         {
            _loc2_ = LookUpCard(_loc1_.CardID).Dice;
            bestCard = _loc1_;
            _loc3_ = AISocketCard01;
         }
      }
      _loc1_ = DeckOpponentUI.Socket02.Card;
      if(_loc1_ != VoidCard && !_loc1_.IsActive && !_loc1_.IsLocked && IsYellowCard(_loc1_))
      {
         if(LookUpCard(_loc1_.CardID).Dice > _loc2_)
         {
            _loc2_ = LookUpCard(_loc1_.CardID).Dice;
            bestCard = _loc1_;
            _loc3_ = AISocketCard02;
         }
      }
      _loc1_ = DeckOpponentUI.Socket03.Card;
      if(_loc1_ != VoidCard && !_loc1_.IsActive && !_loc1_.IsLocked && IsYellowCard(_loc1_))
      {
         if(LookUpCard(_loc1_.CardID).Dice > _loc2_)
         {
            _loc2_ = LookUpCard(_loc1_.CardID).Dice;
            bestCard = _loc1_;
            _loc3_ = AISocketCard03;
         }
      }
      _loc1_ = DeckOpponentUI.Socket04.Card;
      if(_loc1_ != VoidCard && !_loc1_.IsActive && !_loc1_.IsLocked && IsYellowCard(_loc1_))
      {
         if(LookUpCard(_loc1_.CardID).Dice > _loc2_)
         {
            _loc2_ = LookUpCard(_loc1_.CardID).Dice;
            bestCard = _loc1_;
            _loc3_ = AISocketCard04;
         }
      }
      _loc1_ = DeckOpponentUI.Socket05.Card;
      if(_loc1_ != VoidCard && !_loc1_.IsActive && !_loc1_.IsLocked && IsYellowCard(_loc1_))
      {
         if(LookUpCard(_loc1_.CardID).Dice > _loc2_)
         {
            _loc2_ = LookUpCard(_loc1_.CardID).Dice;
            bestCard = _loc1_;
            _loc3_ = AISocketCard05;
         }
      }
      _loc1_ = DeckOpponentUI.Socket06.Card;
      if(_loc1_ != VoidCard && !_loc1_.IsActive && !_loc1_.IsLocked && IsYellowCard(_loc1_))
      {
         if(LookUpCard(_loc1_.CardID).Dice > _loc2_)
         {
            _loc2_ = LookUpCard(_loc1_.CardID).Dice;
            bestCard = _loc1_;
            _loc3_ = AISocketCard06;
         }
      }
      _loc1_ = DeckOpponentUI.Socket07.Card;
      if(_loc1_ != VoidCard && !_loc1_.IsActive && !_loc1_.IsLocked && IsYellowCard(_loc1_))
      {
         if(LookUpCard(_loc1_.CardID).Dice > _loc2_)
         {
            _loc2_ = LookUpCard(_loc1_.CardID).Dice;
            bestCard = _loc1_;
            _loc3_ = AISocketCard07;
         }
      }
      if(bestCard != VoidCard)
      {
         _loc3_.LinkedCard = bestCard;
         _loc3_.LinkedCard.IsLocked = true;
         return _loc3_;
      }
      return null;
   }
   if(cardType == DICE_GREEN)
   {
      _loc1_ = DeckOpponentUI.Socket01.Card;
      if(_loc1_ != VoidCard && !_loc1_.IsActive && !_loc1_.IsLocked && IsGreenCard(_loc1_))
      {
         if(Math.max(LookUpCard(_loc1_.CardID).Dice,LookUpCard(_loc1_.CardID).Defence) > _loc2_)
         {
            _loc2_ = LookUpCard(_loc1_.CardID).Defence;
            bestCard = _loc1_;
            _loc3_ = AISocketCard01;
         }
      }
      _loc1_ = DeckOpponentUI.Socket02.Card;
      if(_loc1_ != VoidCard && !_loc1_.IsActive && !_loc1_.IsLocked && IsGreenCard(_loc1_))
      {
         if(Math.max(LookUpCard(_loc1_.CardID).Dice,LookUpCard(_loc1_.CardID).Defence) > _loc2_)
         {
            _loc2_ = LookUpCard(_loc1_.CardID).Defence;
            bestCard = _loc1_;
            _loc3_ = AISocketCard02;
         }
      }
      _loc1_ = DeckOpponentUI.Socket03.Card;
      if(_loc1_ != VoidCard && !_loc1_.IsActive && !_loc1_.IsLocked && IsGreenCard(_loc1_))
      {
         if(Math.max(LookUpCard(_loc1_.CardID).Dice,LookUpCard(_loc1_.CardID).Defence) > _loc2_)
         {
            _loc2_ = LookUpCard(_loc1_.CardID).Defence;
            bestCard = _loc1_;
            _loc3_ = AISocketCard03;
         }
      }
      _loc1_ = DeckOpponentUI.Socket04.Card;
      if(_loc1_ != VoidCard && !_loc1_.IsActive && !_loc1_.IsLocked && IsGreenCard(_loc1_))
      {
         if(Math.max(LookUpCard(_loc1_.CardID).Dice,LookUpCard(_loc1_.CardID).Defence) > _loc2_)
         {
            _loc2_ = LookUpCard(_loc1_.CardID).Defence;
            bestCard = _loc1_;
            _loc3_ = AISocketCard04;
         }
      }
      _loc1_ = DeckOpponentUI.Socket05.Card;
      if(_loc1_ != VoidCard && !_loc1_.IsActive && !_loc1_.IsLocked && IsGreenCard(_loc1_))
      {
         if(Math.max(LookUpCard(_loc1_.CardID).Dice,LookUpCard(_loc1_.CardID).Defence) > _loc2_)
         {
            _loc2_ = LookUpCard(_loc1_.CardID).Defence;
            bestCard = _loc1_;
            _loc3_ = AISocketCard05;
         }
      }
      _loc1_ = DeckOpponentUI.Socket06.Card;
      if(_loc1_ != VoidCard && !_loc1_.IsActive && !_loc1_.IsLocked && IsGreenCard(_loc1_))
      {
         if(Math.max(LookUpCard(_loc1_.CardID).Dice,LookUpCard(_loc1_.CardID).Defence) > _loc2_)
         {
            _loc2_ = LookUpCard(_loc1_.CardID).Defence;
            bestCard = _loc1_;
            _loc3_ = AISocketCard06;
         }
      }
      _loc1_ = DeckOpponentUI.Socket07.Card;
      if(_loc1_ != VoidCard && !_loc1_.IsActive && !_loc1_.IsLocked && IsGreenCard(_loc1_))
      {
         if(Math.max(LookUpCard(_loc1_.CardID).Dice,LookUpCard(_loc1_.CardID).Defence) > _loc2_)
         {
            _loc2_ = LookUpCard(_loc1_.CardID).Defence;
            bestCard = _loc1_;
            _loc3_ = AISocketCard07;
         }
      }
      if(bestCard != VoidCard)
      {
         _loc3_.LinkedCard = bestCard;
         _loc3_.LinkedCard.IsLocked = true;
         return _loc3_;
      }
      return null;
   }
   if(cardType == DICE_BLUE)
   {
      var blueCard = new Array();
      _loc1_ = DeckOpponentUI.Socket01.Card;
      if(_loc1_ != VoidCard && !_loc1_.IsActive && !_loc1_.IsLocked && IsBlueCard(_loc1_))
      {
         _loc1_.diceSocket = AISocketCard01;
         blueCard.push(_loc1_);
      }
      _loc1_ = DeckOpponentUI.Socket02.Card;
      if(_loc1_ != VoidCard && !_loc1_.IsActive && !_loc1_.IsLocked && IsBlueCard(_loc1_))
      {
         _loc1_.diceSocket = AISocketCard02;
         blueCard.push(_loc1_);
      }
      _loc1_ = DeckOpponentUI.Socket03.Card;
      if(_loc1_ != VoidCard && !_loc1_.IsActive && !_loc1_.IsLocked && IsBlueCard(_loc1_))
      {
         _loc1_.diceSocket = AISocketCard03;
         blueCard.push(_loc1_);
      }
      _loc1_ = DeckOpponentUI.Socket04.Card;
      if(_loc1_ != VoidCard && !_loc1_.IsActive && !_loc1_.IsLocked && IsBlueCard(_loc1_))
      {
         _loc1_.diceSocket = AISocketCard04;
         blueCard.push(_loc1_);
      }
      _loc1_ = DeckOpponentUI.Socket05.Card;
      if(_loc1_ != VoidCard && !_loc1_.IsActive && !_loc1_.IsLocked && IsBlueCard(_loc1_))
      {
         _loc1_.diceSocket = AISocketCard05;
         blueCard.push(_loc1_);
      }
      _loc1_ = DeckOpponentUI.Socket06.Card;
      if(_loc1_ != VoidCard && !_loc1_.IsActive && !_loc1_.IsLocked && IsBlueCard(_loc1_))
      {
         _loc1_.diceSocket = AISocketCard06;
         blueCard.push(_loc1_);
      }
      _loc1_ = DeckOpponentUI.Socket07.Card;
      if(_loc1_ != VoidCard && !_loc1_.IsActive && !_loc1_.IsLocked && IsBlueCard(_loc1_))
      {
         _loc1_.diceSocket = AISocketCard07;
         blueCard.push(_loc1_);
      }
      if(blueCard.length != 0)
      {
         bestCard = blueCard[random(blueCard.length - 1)];
         _loc3_ = bestCard.diceSocket;
         _loc3_.LinkedCard = bestCard;
         _loc3_.LinkedCard.IsLocked = true;
         return _loc3_;
      }
      return null;
   }
   return null;
}
function AIFindEmptySlot()
{
   if(DeckOpponentUI.Socket01.Card == VoidCard)
   {
      return DeckOpponentUI.Socket01;
   }
   if(DeckOpponentUI.Socket02.Card == VoidCard)
   {
      return DeckOpponentUI.Socket02;
   }
   if(DeckOpponentUI.Socket03.Card == VoidCard)
   {
      return DeckOpponentUI.Socket03;
   }
   if(DeckOpponentUI.Socket04.Card == VoidCard)
   {
      return DeckOpponentUI.Socket04;
   }
   if(DeckOpponentUI.Socket05.Card == VoidCard)
   {
      return DeckOpponentUI.Socket05;
   }
   if(DeckOpponentUI.Socket06.Card == VoidCard)
   {
      return DeckOpponentUI.Socket06;
   }
   if(DeckOpponentUI.Socket07.Card == VoidCard)
   {
      return DeckOpponentUI.Socket07;
   }
   return null;
}
var diceBuffer = new Array();
