function Nop()
{
}
function Shake(dice)
{
   var _loc1_ = dice;
   _loc1_.gotoAndStop("SHUFFLE");
   switch(random(6))
   {
      case 0:
         _loc1_.Type = DICE_RED;
         break;
      case 1:
         _loc1_.Type = DICE_BLUE;
         break;
      case 2:
         _loc1_.Type = DICE_YELLOW;
         break;
      case 3:
         _loc1_.Type = DICE_GREEN;
         break;
      case 4:
         _loc1_.Type = DICE_WHITE;
         break;
      case 5:
         _loc1_.Type = DICE_WHITE;
   }
   return _loc1_.Value;
}
function DiceRedTotal()
{
   var _loc1_ = 0;
   for(var _loc2_ in Dices)
   {
      if(Dices[_loc2_].Type == DICE_RED)
      {
         _loc1_ += 1;
      }
   }
   return _loc1_;
}
function DiceBlueTotal()
{
   var _loc1_ = 0;
   for(var _loc2_ in Dices)
   {
      if(Dices[_loc2_].Type == DICE_BLUE)
      {
         _loc1_ += 1;
      }
   }
   return _loc1_;
}
function DiceGreenTotal()
{
   var _loc1_ = 0;
   for(var _loc2_ in Dices)
   {
      if(Dices[_loc2_].Type == DICE_GREEN)
      {
         _loc1_ += 1;
      }
   }
   return _loc1_;
}
function DiceYellowTotal()
{
   var _loc1_ = 0;
   for(var _loc2_ in Dices)
   {
      if(Dices[_loc2_].Type == DICE_YELLOW)
      {
         _loc1_ += 1;
      }
   }
   return _loc1_;
}
function DiceWhiteTotal()
{
   var _loc1_ = 0;
   for(var _loc2_ in Dices)
   {
      if(Dices[_loc2_].Type == DICE_WHITE)
      {
         _loc1_ += 1;
      }
   }
   return _loc1_;
}
function TraceTable(table, name)
{
   var _loc1_ = table;
   for(var _loc2_ in _loc1_)
   {
   }
}
function Generate(ID_MODULE)
{
   var _loc1_ = null;
   switch(ID_MODULE)
   {
      case GENERATE_NOTHING:
         _loc1_ = null;
         break;
      case GENERATE_DICE:
         nextDepth = _loc0_ = nextDepth + 1;
         _loc1_ = DiceCloner.duplicateMovieClip("Dice" + indexDice++,_loc0_);
         break;
      case GENERATE_CARD_PLAYER:
         PickInPlayerArray = true;
         nextDepth = _loc0_ = nextDepth + 1;
         _loc1_ = this.attachMovie("CardCloner","Card" + indexCard++,_loc0_);
         _loc1_.IsLocked = false;
         _loc1_.FlushNow = false;
         break;
      case GENERATE_CARD_OPPONENT:
         PickInPlayerArray = false;
         nextDepth = _loc0_ = nextDepth + 1;
         _loc1_ = this.attachMovie("CardCloner","Card" + indexCard++,_loc0_);
         _loc1_.IsLocked = false;
         _loc1_.FlushNow = false;
   }
   _loc1_.ID = ID_MODULE;
   _loc1_._x = 0;
   _loc1_._y = 0;
   _loc1_._visible = true;
   return _loc1_;
}
function setCardAttribute(card, newDices, newDef, newAction)
{
   var _loc1_ = card;
   var _loc2_ = newAction;
   var _loc3_ = newDices;
   if(_loc3_ != -1 and _loc3_ != undefined)
   {
      _loc1_.CardCloner.diceBox.Text.txtValue.text = _loc3_;
      _loc1_.CardCloner.diceBox._visible = true;
   }
   if(newDef != -1 and newDef != undefined)
   {
      _loc1_.CardCloner.armorBox.Text.txtValue.text = newDef;
      _loc1_.CardCloner.armorBox._visible = true;
   }
   if(_loc2_ != -1 and _loc2_ != undefined)
   {
      _loc1_.CardCloner.actionBox.Text.txtValue.text = _loc2_;
      _loc1_.CardCloner.actionBox._visible = true;
   }
   if(_loc3_ == 0)
   {
      _loc1_.CardCloner.diceBox._visible = false;
   }
   if(newDef == 0)
   {
      _loc1_.CardCloner.armorBox._visible = false;
   }
   if(_loc2_ == 0)
   {
      _loc1_.CardCloner.actionBox._visible = false;
   }
}
function Release()
{
   var collision = false;
   var _loc1_ = null;
   var oldCard = null;
   var _loc3_ = null;
   if(IsDraging)
   {
      IsDraging = false;
      HasMouseReleased = false;
      if(DragedCard != null)
      {
         DragedCard.stopDrag();
         DragedCard.Socket.Card = BattleSystem.VoidCard;
         _loc1_ = Snap();
         if(_loc1_ != null)
         {
            root.Trace("DragedCard.Socket : " + DrawCounter + "/" + DrawCardReserve);
            if(Deck.Card == DragedCard)
            {
               if(CutiePieEq)
               {
                  if(DrawCounter < DrawCardReserve)
                  {
                     DrawCardPlayer();
                     CardOnTop = true;
                  }
                  else
                  {
                     CutiePieEq = false;
                     CardOnTop = false;
                  }
                  DrawCounter++;
               }
               if(blessingCardEq)
               {
                  if(DrawCounter < DrawCardReserve)
                  {
                     DrawCardPlayer();
                     CardOnTop = true;
                  }
                  else
                  {
                     blessingCardEq = false;
                     CardOnTop = false;
                  }
                  DrawCounter++;
               }
            }
            if(Deck.Card == DragedCard)
            {
               Deck.Card = VoidCard;
               _loc3_ = Cemetery.Socket;
               CardOnTop = false;
            }
            else
            {
               _loc3_ = DragedCard.Socket;
            }
            if(IsFusionCard(_loc1_.Card))
            {
               if(_loc1_.Card.IsActive)
               {
                  if(_loc1_.Card.nFusedCard < _loc1_.Card.MAX_FUSE)
                  {
                     if(IsTypeOfFusion(_loc1_.Card.FuseTypeCard,DragedCard))
                     {
                        FusionnerCarte(_loc1_.Card,DragedCard);
                     }
                  }
               }
            }
            else
            {
               DragedCard.Socket = _loc1_;
               if(DragedCard.Socket.Card != VoidCard)
               {
                  DragedCard.Socket.Card.Socket = _loc3_;
                  DragedCard.Socket.Card.onEnterFrame = MoveToSocket;
               }
            }
            DragedCard.Socket.Card = DragedCard;
            DragedCard.onEnterFrame = MoveToSocket;
            root.sfx.gotoAndPlay("CardSnap");
         }
         else
         {
            if(DragedCard.Socket == null)
            {
               DragedCard.Socket = Deck.Socket;
               Deck.Card = DragedCard;
               CardOnTop = true;
            }
            DragedCard.onEnterFrame = MoveToSocket;
         }
         DragedCard = null;
      }
      else if(DragedDice != null)
      {
         if(CheckCollision(DeckPlayerInHandUI.Socket01.Card))
         {
            LastActivatedCardSocket = DeckPlayerInHandUI.Socket01;
            _loc1_ = DeckPlayerInHandUI.Socket01.Card;
         }
         else if(CheckCollision(DeckPlayerInHandUI.Socket02.Card))
         {
            LastActivatedCardSocket = DeckPlayerInHandUI.Socket02;
            _loc1_ = DeckPlayerInHandUI.Socket02.Card;
         }
         else if(CheckCollision(DeckPlayerInHandUI.Socket03.Card))
         {
            LastActivatedCardSocket = DeckPlayerInHandUI.Socket03;
            _loc1_ = DeckPlayerInHandUI.Socket03.Card;
         }
         else if(CheckCollision(DeckPlayerInHandUI.Socket04.Card))
         {
            LastActivatedCardSocket = DeckPlayerInHandUI.Socket04;
            _loc1_ = DeckPlayerInHandUI.Socket04.Card;
         }
         else if(CheckCollision(DeckPlayerInHandUI.Socket05.Card))
         {
            LastActivatedCardSocket = DeckPlayerInHandUI.Socket05;
            _loc1_ = DeckPlayerInHandUI.Socket05.Card;
         }
         else if(CheckCollision(DeckPlayerInHandUI.Socket06.Card))
         {
            LastActivatedCardSocket = DeckPlayerInHandUI.Socket06;
            _loc1_ = DeckPlayerInHandUI.Socket06.Card;
         }
         else if(CheckCollision(DeckPlayerInHandUI.Socket07.Card))
         {
            LastActivatedCardSocket = DeckPlayerInHandUI.Socket07;
            _loc1_ = DeckPlayerInHandUI.Socket07.Card;
         }
         if(_loc1_.IsActive)
         {
            _loc1_ = null;
         }
         if(_loc1_ != null)
         {
            var _loc2_ = _loc1_.CardID;
            if(_loc2_ >= 100 && _loc2_ < 400 && _loc2_ != 302)
            {
               if(DragedDice.Type == DICE_GREEN)
               {
                  DragedDice.gotoAndStop("REMOVE");
                  DragedDice.stopDrag();
                  DragedDice = null;
                  Activate(_loc1_);
                  _loc1_.hasBeenActivated = true;
               }
            }
            if(_loc2_ >= 400 && _loc2_ < 500 || _loc2_ == 302)
            {
               if(DragedDice.Type == DICE_BLUE)
               {
                  DragedDice.gotoAndStop("REMOVE");
                  DragedDice.stopDrag();
                  DragedDice = null;
                  Activate(_loc1_);
                  _loc1_.hasBeenActivated = true;
               }
            }
            if(_loc2_ >= 500 && _loc2_ < 600)
            {
               if(DragedDice.Type == DICE_YELLOW)
               {
                  DragedDice.gotoAndStop("REMOVE");
                  DragedDice.stopDrag();
                  DragedDice = null;
                  Activate(_loc1_);
                  _loc1_.hasBeenActivated = true;
                  BattleSystem.YellowDicesUsed = BattleSystem.YellowDicesUsed + 1;
               }
            }
            if(_loc2_ >= 600 && _loc2_ < 700)
            {
               if(DragedDice.Type == DICE_GREEN)
               {
                  DragedDice.gotoAndStop("REMOVE");
                  DragedDice.stopDrag();
                  DragedDice = null;
                  Activate(_loc1_);
                  _loc1_.hasBeenActivated = true;
               }
            }
            DragedDice.Socket = {_x:DragedDice.fromX,_y:DragedDice.fromY};
            DragedDice.onEnterFrame = MoveTo;
            DragedDice.stopDrag();
            DragedDice = null;
         }
         else
         {
            DragedDice.Socket = {_x:DragedDice.fromX,_y:DragedDice.fromY};
            DragedDice.onEnterFrame = MoveTo;
            DragedDice.stopDrag();
            DragedDice = null;
         }
      }
   }
}
function FusionnerCarte(carteFusion, carteAFusionner)
{
   var _loc1_ = carteFusion;
   var _loc2_ = carteAFusionner;
   _loc1_.nFusedCard = _loc1_.nFusedCard + 1;
   _loc2_.Socket.Card = VoidCard;
   var _loc3_ = BattleSystem.LookUpCard(_loc2_.CardID);
   var objFusion = BattleSystem.LookUpCard(_loc1_.CardID);
   _loc1_.FusionDice += _loc3_.Dice;
   _loc1_.FusionDefence += _loc3_.Defence;
   setCardAttribute(_loc1_,_loc1_.FusionDice,_loc1_.FusionDefence);
   Activate(_loc2_);
   _loc2_.removeMovieClip();
}
function MoveTo()
{
   var _loc1_ = this;
   _loc1_._x += (_loc1_.Socket._x - _loc1_._x) * TRANSITION_SPEED;
   _loc1_._y += (_loc1_.Socket._y - _loc1_._y) * TRANSITION_SPEED;
   if(Math.abs(_loc1_.Socket._x - _loc1_._x) < 3)
   {
      if(Math.abs(_loc1_.Socket._y - _loc1_._y) < 3)
      {
         _loc1_._x = _loc1_.Socket._x;
         _loc1_._y = _loc1_.Socket._y;
         delete _loc1_.onEnterFrame;
         if(_loc1_.Type == DICE_RED)
         {
            if(!BattleSystem.bHaveReceiveAttack)
            {
               DiceRed++;
            }
            _loc1_.removeMovieClip();
            root.sfx.gotoAndPlay("DiceRedPowerUp");
            statPlayerTotal.Update();
            statOpponentTotal.Update();
            waiter_mc.DoAfterWait(10,BattleSystem.CumulateRedDice,"CumulateRedDice",[null]);
            statCurrentAttack.Update();
         }
         else if(_loc1_.Type == DICE_YELLOW)
         {
            if(BattleSystem.CurrentPlayer != BattleSystem.TURN_PLAYER)
            {
               BattleSystem.Activate(_loc1_.Socket.LinkedCard);
               BattleSystem.ShowCardStats(_loc1_.Socket.LinkedCard.CardCloner);
               BattleSystem.OpponentUseCard();
               _loc1_.gotoAndStop("REMOVE");
            }
         }
         else if(_loc1_.Type == DICE_GREEN)
         {
            if(BattleSystem.CurrentPlayer != BattleSystem.TURN_PLAYER)
            {
               BattleSystem.Activate(_loc1_.Socket.LinkedCard);
               BattleSystem.ShowCardStats(_loc1_.Socket.LinkedCard.CardCloner);
               BattleSystem.OpponentUseCard();
               _loc1_.gotoAndStop("REMOVE");
            }
         }
         else if(_loc1_.Type == DICE_BLUE)
         {
            if(BattleSystem.CurrentPlayer != BattleSystem.TURN_PLAYER)
            {
               BattleSystem.Activate(_loc1_.Socket.LinkedCard);
               BattleSystem.ShowCardStats(_loc1_.Socket.LinkedCard.CardCloner);
               BattleSystem.OpponentUseCard();
               _loc1_.gotoAndStop("REMOVE");
            }
         }
      }
   }
}
function MoveToSocket()
{
   var _loc1_ = this;
   BattleSystem.DragLocked = true;
   var _loc2_ = {x:_loc1_.Socket._x + _loc1_.Socket._parent._x,y:_loc1_.Socket._y + _loc1_.Socket._parent._y};
   _loc1_._x += (_loc2_.x - _loc1_._x) * TRANSITION_SPEED;
   _loc1_._y += (_loc2_.y - _loc1_._y) * TRANSITION_SPEED;
   if(Math.abs(_loc2_.x - _loc1_._x) < 3)
   {
      if(Math.abs(_loc2_.y - _loc1_._y) < 3)
      {
         _loc1_._x = _loc2_.x;
         _loc1_._y = _loc2_.y;
         delete _loc1_.onEnterFrame;
         if(_loc1_.Socket == Cemetery.Socket)
         {
            root.sfx.gotoAndPlay("CardFlush");
            if((BattleSystem.IsBlueCard(_loc1_) || _loc1_.CardID == 303) && _loc1_.IsActive)
            {
               BattleSystem.LookUpCard(_loc1_.CardID).Deactivate(BattleSystem.TURN_PLAYER);
            }
            _loc1_.removeMovieClip();
            Cemetery.Card = VoidCard;
            Cemetery.Socket.Icon.gotoAndStop("USE");
         }
         else if(_loc1_.Socket == CemeteryOpponent.Socket)
         {
            root.sfx.gotoAndPlay("CardFlush");
            if((BattleSystem.IsBlueCard(_loc1_) || _loc1_.CardID == 303) && _loc1_.IsActive)
            {
               BattleSystem.LookUpCard(_loc1_.CardID).Deactivate(BattleSystem.TURN_OPPONENT);
            }
            _loc1_.removeMovieClip();
            CemeteryOpponent.Card = VoidCard;
            CemeteryOpponent.Socket.Icon.gotoAndStop("USE");
         }
         _loc1_.Socket.Card = _loc1_;
         BattleSystem.DragLocked = false;
         statPlayerTotal.Update();
         statOpponentTotal.Update();
      }
   }
}
function Snap()
{
   var _loc1_ = null;
   if(CurrentMode == MODE_NEXT_TURN || CurrentMode == MODE_DRAW || CurrentMode == MODE_CARD)
   {
      if(PlayerCardInHand() < PlayerActionTotal())
      {
         if(CheckCollision(DeckPlayerInHandUI.Socket01))
         {
            _loc1_ = DeckPlayerInHandUI.Socket01;
            return _loc1_;
         }
         if(CheckCollision(DeckPlayerInHandUI.Socket02))
         {
            _loc1_ = DeckPlayerInHandUI.Socket02;
            return _loc1_;
         }
         if(CheckCollision(DeckPlayerInHandUI.Socket03))
         {
            _loc1_ = DeckPlayerInHandUI.Socket03;
            return _loc1_;
         }
         if(CheckCollision(DeckPlayerInHandUI.Socket04))
         {
            _loc1_ = DeckPlayerInHandUI.Socket04;
            return _loc1_;
         }
         if(CheckCollision(DeckPlayerInHandUI.Socket05))
         {
            _loc1_ = DeckPlayerInHandUI.Socket05;
            return _loc1_;
         }
         if(CheckCollision(DeckPlayerInHandUI.Socket06))
         {
            _loc1_ = DeckPlayerInHandUI.Socket06;
            return _loc1_;
         }
         if(CheckCollision(DeckPlayerInHandUI.Socket07))
         {
            _loc1_ = DeckPlayerInHandUI.Socket07;
            return _loc1_;
         }
      }
   }
   if(CheckCollision(Cemetery.Socket))
   {
      _loc1_ = Cemetery;
      return _loc1_.Socket;
   }
   return _loc1_;
}
function CheckCollision(obj)
{
   var _loc2_ = obj;
   var intersectX = false;
   var _loc3_ = false;
   var _loc1_ = {x:_loc2_._x + _loc2_._parent._x,y:_loc2_._y + _loc2_._parent._y};
   intersectX = _xmouse >= _loc1_.x && _xmouse <= _loc1_.x + _loc2_._width;
   _loc3_ = _ymouse >= _loc1_.y && _ymouse <= _loc1_.y + _loc2_._height;
   var _loc0_ = intersectX && _loc3_;
   _loc3_;
   _loc2_;
   _loc1_;
   return _loc0_;
}
function SetMode(newMode)
{
   CurrentMode = newMode;
   broadcastMessage("onBattleSystemChangeMode");
   switch(CurrentMode)
   {
      case MODE_NONE:
         Console.Write("<mode : NONE");
         break;
      case MODE_INIT:
         broadcastMessage("onBattleSystemInit");
         ActivateButton(false,false);
         Console.Write("<mode : INIT");
         break;
      case MODE_CHOOSE:
         broadcastMessage("onBattleSystemChoose");
         ActivateButton(false,false);
         Console.Write("<mode : CHOOSE");
         break;
      case MODE_NEXT_TURN:
         broadcastMessage("onBattleSystemNextTurn");
         ActivateButton(true,true);
         Console.Write("<mode : NEXT TURN");
         Console.Write("<turn : " + (CurrentPlayer != TURN_PLAYER ? "OPPONENT" : "PLAYER"));
         break;
      case MODE_DRAW:
         broadcastMessage("onBattleSystemDraw");
         ActivateButton(true,true);
         Console.Write("<mode : DRAW");
         break;
      case MODE_DICE_THROW:
         broadcastMessage("onBattleSystemDiceThrow");
         ActivateButton(false,false);
         Console.Write("<mode : DICE_THROW");
         break;
      case MODE_DICE_ANIM_WHITE:
         broadcastMessage("onBattleSystemDiceAnimWhite");
         ActivateButton(false,false);
         Console.Write("<mode : DICE_ANIM_WHITE");
         break;
      case MODE_DICE_ANIM_RED:
         broadcastMessage("onBattleSystemDiceAnimRed");
         ActivateButton(false,false);
         Console.Write("<mode : DICE_ANIM_RED");
         break;
      case MODE_DICE_ANIM_GREEN:
         broadcastMessage("onBattleSystemDiceAnimGreen");
         ActivateButton(false,false);
         Console.Write("<mode : DICE_ANIM_GREEN");
         break;
      case MODE_DICE_ANIM_YELLOW:
         broadcastMessage("onBattleSystemDiceAnimYellow");
         ActivateButton(false,false);
         Console.Write("<mode : DICE_ANIM_YELLOW");
         break;
      case MODE_DICE_ANIM_BLUE:
         broadcastMessage("onBattleSystemDiceAnimBlue");
         ActivateButton(false,false);
         Console.Write("<mode : DICE_ANIM_BLUE");
         break;
      case MODE_CARD:
         broadcastMessage("onBattleSystemCard");
         ActivateButton(false,true);
         Console.Write("<mode : CARD");
         break;
      case MODE_ACTION_ATTACK:
         broadcastMessage("onBattleSystemAttack");
         ActivateButton(false,false);
         Console.Write("<mode : ACTION_ATTACK");
         break;
      case MODE_ACTION_DEFENSE:
         broadcastMessage("onBattleSystemDefense");
         ActivateButton(false,false);
         Console.Write("<mode : ACTION_DEFENSE");
         break;
      case MODE_ACTION_DAMAGE:
         broadcastMessage("onBattleSystemDamage");
         ActivateButton(false,false);
         Console.Write("<mode : ACTION_DAMAGE");
         break;
      case MODE_ACTION_INTERUPT:
         broadcastMessage("onBattleSystemInterupt");
         ActivateButton(false,false);
         Console.Write("<mode : ACTION_INTERUPT");
         break;
      case MODE_ACTION_RETREAT:
         broadcastMessage("onBattleSystemRetreat");
         ActivateButton(false,false);
         Console.Write("<mode : ACTION_RETREAT");
         break;
      case MODE_GAMEOVER:
         broadcastMessage("onBattleSystemGameOver");
         ActivateButton(false,false);
         Console.Write("<mode : GAMEOVER");
         break;
      default:
         broadcastMessage("onBattleSystemError");
         ActivateButton(false,false);
         Console.Write("<mode : UNKNOW");
   }
}
function RemoveDice()
{
   for(var _loc1_ in Dices)
   {
      Dices[_loc1_].removeMovieClip();
   }
   Dices = new Array();
}
function IsYellowCard(card)
{
   return card.CardID >= 500 && card.CardID < 600;
}
function IsGreenCard(card)
{
   var _loc1_ = card;
   var _loc0_ = _loc1_.CardID >= 100 && _loc1_.CardID < 400 && _loc1_.CardID != 302;
   _loc1_;
   return _loc0_;
}
function IsBlueCard(card)
{
   var _loc1_ = card;
   var _loc0_ = _loc1_.CardID >= 400 && _loc1_.CardID < 500 || _loc1_.CardID == 302;
   _loc1_;
   return _loc0_;
}
function IsFusionCard(card)
{
   return card.CardID >= 600 && card.CardID < 700;
}
function IsWeaponCard(card)
{
   return card.CardID >= 100 && card.CardID < 200;
}
function IsShieldCard(card)
{
   return card.CardID >= 200 && card.CardID < 300;
}
function IsItemCard(card)
{
   return card.CardID >= 300 && card.CardID < 400;
}
function IsTypeOfFusion(cardType, card)
{
   var _loc1_ = cardType;
   var _loc2_ = card;
   if(_loc1_ == CARD_WEAPON)
   {
      return IsWeaponCard(_loc2_);
   }
   if(_loc1_ == CARD_SHIELD)
   {
      return IsShieldCard(_loc2_);
   }
   if(_loc1_ == CARD_ITEM)
   {
      return IsItemCard(_loc2_);
   }
   return false;
}
function RemoveOpponentCard()
{
   cardToRemove = VoidCard;
   cardToRemove = !IsBlueCard(BattleSystem.DeckOpponentUI.Socket01.Card) ? cardToRemove : BattleSystem.DeckOpponentUI.Socket01.Card;
   cardToRemove = !IsBlueCard(BattleSystem.DeckOpponentUI.Socket02.Card) ? cardToRemove : BattleSystem.DeckOpponentUI.Socket02.Card;
   cardToRemove = !IsBlueCard(BattleSystem.DeckOpponentUI.Socket03.Card) ? cardToRemove : BattleSystem.DeckOpponentUI.Socket03.Card;
   cardToRemove = !IsBlueCard(BattleSystem.DeckOpponentUI.Socket04.Card) ? cardToRemove : BattleSystem.DeckOpponentUI.Socket04.Card;
   cardToRemove = !IsBlueCard(BattleSystem.DeckOpponentUI.Socket05.Card) ? cardToRemove : BattleSystem.DeckOpponentUI.Socket05.Card;
   cardToRemove = !IsBlueCard(BattleSystem.DeckOpponentUI.Socket06.Card) ? cardToRemove : BattleSystem.DeckOpponentUI.Socket06.Card;
   cardToRemove = !IsBlueCard(BattleSystem.DeckOpponentUI.Socket07.Card) ? cardToRemove : BattleSystem.DeckOpponentUI.Socket07.Card;
   if(cardToRemove != VoidCard)
   {
      if(BattleSystem.CardsIDToKill == "")
      {
         BattleSystem.CardsIDToKill = cardToRemove.CardID + "~" + (!cardToRemove.IsActive ? 0 : 1);
      }
      else
      {
         BattleSystem.CardsIDToKill += "," + (cardToRemove.CardID + "~" + (!cardToRemove.IsActive ? 0 : 1));
      }
      cardToRemove.Socket = CemeteryOpponent.Socket;
      cardToRemove.onEnterFrame = MoveToSocket;
      cardToRemove = VoidCard;
   }
}
function LookUpCard(ID)
{
   var _loc1_ = ID;
   if(_loc1_ >= 100 && _loc1_ < 200)
   {
      return TableCardWeapon[_loc1_ - 100];
   }
   if(_loc1_ >= 200 && _loc1_ < 300)
   {
      return TableCardProtection[_loc1_ - 200];
   }
   if(_loc1_ >= 300 && _loc1_ < 400)
   {
      return TableCardItem[_loc1_ - 300];
   }
   if(_loc1_ >= 400 && _loc1_ < 500)
   {
      return TableCardBattleAction[_loc1_ - 400];
   }
   if(_loc1_ >= 500 && _loc1_ < 600)
   {
      return TableCardBoost[_loc1_ - 500];
   }
   if(_loc1_ >= 600 && _loc1_ < 700)
   {
      return TableCardFusion[_loc1_ - 600];
   }
   return null;
}
function LookUpMonster(ID)
{
   var _loc1_ = ID;
   if(_loc1_ >= 100 && _loc1_ < 200)
   {
      return TableEncounterObject[_loc1_ - 100];
   }
   if(_loc1_ >= 200 && _loc1_ < 300)
   {
      return TableEncounterDanger[_loc1_ - 200];
   }
   if(_loc1_ >= 300 && _loc1_ < 400)
   {
      return TableEncounterMonster[_loc1_ - 300];
   }
   if(_loc1_ >= 400 && _loc1_ < 500)
   {
      return TableEncounterInvectid[_loc1_ - 400];
   }
   if(_loc1_ >= 500 && _loc1_ < 600)
   {
      return TableEncounterSpiderRider[_loc1_ - 500];
   }
   if(_loc1_ >= 600 && _loc1_ < 700)
   {
      return TableEncounterMantisSqad[_loc1_ - 600];
   }
   return null;
}
function ActivateButton(flagDice, flagAction)
{
   var _loc1_ = flagDice;
   var _loc2_ = flagAction;
   if(CurrentPlayer == TURN_PLAYER)
   {
      btnDicePlayer.btn.enabled = _loc1_;
      btnActionPlayer.btn.enabled = _loc2_;
      !!_loc1_ ? btnDicePlayer.anim.gotoAndStop("HIGHLIGHT") : btnDicePlayer.anim.gotoAndStop("DISABLE");
      !!_loc2_ ? btnActionPlayer.anim.gotoAndStop("HIGHLIGHT") : btnActionPlayer.anim.gotoAndStop("DISABLE");
   }
   else
   {
      btnDicePlayer.btn.enabled = false;
      btnActionPlayer.btn.enabled = false;
      !!_loc1_ ? btnDiceOpponent.anim.gotoAndStop("HIGHLIGHT") : btnDiceOpponent.anim.gotoAndStop("DISABLE");
      !!_loc2_ ? btnActionOpponent.anim.gotoAndStop("HIGHLIGHT") : btnActionOpponent.anim.gotoAndStop("DISABLE");
   }
}
function WeaponInGame()
{
   WpnCounter = 0;
   if(DeckPlayerInHandUI.Socket01.Card != VoidCard)
   {
      if(DeckPlayerInHandUI.Socket01.Card.CardID >= 100 && DeckPlayerInHandUI.Socket01.Card.CardID < 200)
      {
         WpnCounter++;
      }
   }
   if(DeckPlayerInHandUI.Socket02.Card != VoidCard)
   {
      if(DeckPlayerInHandUI.Socket02.Card.CardID >= 100 && DeckPlayerInHandUI.Socket02.Card.CardID < 200)
      {
         WpnCounter++;
      }
   }
   if(DeckPlayerInHandUI.Socket03.Card != VoidCard)
   {
      if(DeckPlayerInHandUI.Socket03.Card.CardID >= 100 && DeckPlayerInHandUI.Socket03.Card.CardID < 200)
      {
         WpnCounter++;
      }
   }
   if(DeckPlayerInHandUI.Socket04.Card != VoidCard)
   {
      if(DeckPlayerInHandUI.Socket04.Card.CardID >= 100 && DeckPlayerInHandUI.Socket04.Card.CardID < 200)
      {
         WpnCounter++;
      }
   }
   if(DeckPlayerInHandUI.Socket05.Card != VoidCard)
   {
      if(DeckPlayerInHandUI.Socket05.Card.CardID >= 100 && DeckPlayerInHandUI.Socket05.Card.CardID < 200)
      {
         WpnCounter++;
      }
   }
   if(DeckPlayerInHandUI.Socket06.Card != VoidCard)
   {
      if(DeckPlayerInHandUI.Socket06.Card.CardID >= 100 && DeckPlayerInHandUI.Socket06.Card.CardID < 200)
      {
         WpnCounter++;
      }
   }
   if(DeckPlayerInHandUI.Socket07.Card != VoidCard)
   {
      if(DeckPlayerInHandUI.Socket07.Card.CardID >= 100 && DeckPlayerInHandUI.Socket07.Card.CardID < 200)
      {
         WpnCounter++;
      }
   }
   return WpnCounter;
}
function ShieldInGame()
{
   ShldCounter = 0;
   if(DeckPlayerInHandUI.Socket01.Card != VoidCard)
   {
      if(DeckPlayerInHandUI.Socket01.Card.CardID >= 200 && DeckPlayerInHandUI.Socket01.Card.CardID < 300)
      {
         ShldCounter++;
      }
   }
   if(DeckPlayerInHandUI.Socket02.Card != VoidCard)
   {
      if(DeckPlayerInHandUI.Socket02.Card.CardID >= 200 && DeckPlayerInHandUI.Socket02.Card.CardID < 300)
      {
         ShldCounter++;
      }
   }
   if(DeckPlayerInHandUI.Socket03.Card != VoidCard)
   {
      if(DeckPlayerInHandUI.Socket03.Card.CardID >= 200 && DeckPlayerInHandUI.Socket03.Card.CardID < 300)
      {
         ShldCounter++;
      }
   }
   if(DeckPlayerInHandUI.Socket04.Card != VoidCard)
   {
      if(DeckPlayerInHandUI.Socket04.Card.CardID >= 200 && DeckPlayerInHandUI.Socket04.Card.CardID < 300)
      {
         ShldCounter++;
      }
   }
   if(DeckPlayerInHandUI.Socket05.Card != VoidCard)
   {
      if(DeckPlayerInHandUI.Socket05.Card.CardID >= 200 && DeckPlayerInHandUI.Socket05.Card.CardID < 300)
      {
         ShldCounter++;
      }
   }
   if(DeckPlayerInHandUI.Socket06.Card != VoidCard)
   {
      if(DeckPlayerInHandUI.Socket06.Card.CardID >= 200 && DeckPlayerInHandUI.Socket06.Card.CardID < 300)
      {
         ShldCounter++;
      }
   }
   if(DeckPlayerInHandUI.Socket07.Card != VoidCard)
   {
      if(DeckPlayerInHandUI.Socket07.Card.CardID >= 200 && DeckPlayerInHandUI.Socket07.Card.CardID < 300)
      {
         ShldCounter++;
      }
   }
   return ShldCounter;
}
function BoostInGame()
{
   var _loc1_ = 0;
   if(DeckPlayerInHandUI.Socket01.Card != VoidCard)
   {
      if(DeckPlayerInHandUI.Socket01.Card.CardID >= 500 && DeckPlayerInHandUI.Socket01.Card.CardID < 600)
      {
         _loc1_ = _loc1_ + 1;
      }
   }
   if(DeckPlayerInHandUI.Socket02.Card != VoidCard)
   {
      if(DeckPlayerInHandUI.Socket02.Card.CardID >= 500 && DeckPlayerInHandUI.Socket02.Card.CardID < 600)
      {
         _loc1_ = _loc1_ + 1;
      }
   }
   if(DeckPlayerInHandUI.Socket03.Card != VoidCard)
   {
      if(DeckPlayerInHandUI.Socket03.Card.CardID >= 500 && DeckPlayerInHandUI.Socket03.Card.CardID < 600)
      {
         _loc1_ = _loc1_ + 1;
      }
   }
   if(DeckPlayerInHandUI.Socket04.Card != VoidCard)
   {
      if(DeckPlayerInHandUI.Socket04.Card.CardID >= 500 && DeckPlayerInHandUI.Socket04.Card.CardID < 600)
      {
         _loc1_ = _loc1_ + 1;
      }
   }
   if(DeckPlayerInHandUI.Socket05.Card != VoidCard)
   {
      if(DeckPlayerInHandUI.Socket05.Card.CardID >= 500 && DeckPlayerInHandUI.Socket05.Card.CardID < 600)
      {
         _loc1_ = _loc1_ + 1;
      }
   }
   if(DeckPlayerInHandUI.Socket06.Card != VoidCard)
   {
      if(DeckPlayerInHandUI.Socket06.Card.CardID >= 500 && DeckPlayerInHandUI.Socket06.Card.CardID < 600)
      {
         _loc1_ = _loc1_ + 1;
      }
   }
   if(DeckPlayerInHandUI.Socket07.Card != VoidCard)
   {
      if(DeckPlayerInHandUI.Socket07.Card.CardID >= 500 && DeckPlayerInHandUI.Socket07.Card.CardID < 600)
      {
         _loc1_ = _loc1_ + 1;
      }
   }
   return _loc1_;
}
function RemoveCard()
{
   broadcastMessage("onBattleSystemRemoveCard");
   Cemetery.Card.removeMovieClip();
   Cemetery.Card = VoidCard;
   root.Trace("Carte 1 Flush now ? : " + DeckPlayerInHandUI.Socket01.Card.FlushNow);
   if(DeckPlayerInHandUI.Socket01.Card != VoidCard)
   {
      if(LookUpCard(DeckPlayerInHandUI.Socket01.Card.CardID).Duration == 1 || DeckPlayerInHandUI.Socket01.Card.FlushNow)
      {
         if(DeckPlayerInHandUI.Socket01.Card.IsActive)
         {
            DeckPlayerInHandUI.Socket01.Card.Socket = Cemetery.Socket;
            DeckPlayerInHandUI.Socket01.Card.onEnterFrame = MoveToSocket;
            DeckPlayerInHandUI.Socket01.Card = VoidCard;
         }
      }
      if(LookUpCard(DeckPlayerInHandUI.Socket01.Card.CardID).Duration > 1 && DeckPlayerInHandUI.Socket01.Card.IsActive)
      {
         DeckPlayerInHandUI.Socket01.Card.FlushNow = true;
      }
   }
   if(DeckPlayerInHandUI.Socket02.Card != VoidCard)
   {
      if(LookUpCard(DeckPlayerInHandUI.Socket02.Card.CardID).Duration == 1 || DeckPlayerInHandUI.Socket02.Card.FlushNow)
      {
         if(DeckPlayerInHandUI.Socket02.Card.IsActive)
         {
            DeckPlayerInHandUI.Socket02.Card.Socket = Cemetery.Socket;
            DeckPlayerInHandUI.Socket02.Card.onEnterFrame = MoveToSocket;
            DeckPlayerInHandUI.Socket02.Card = VoidCard;
         }
      }
      if(LookUpCard(DeckPlayerInHandUI.Socket02.Card.CardID).Duration > 1 && DeckPlayerInHandUI.Socket02.Card.IsActive)
      {
         DeckPlayerInHandUI.Socket02.Card.FlushNow = true;
      }
   }
   if(DeckPlayerInHandUI.Socket03.Card != VoidCard)
   {
      if(LookUpCard(DeckPlayerInHandUI.Socket03.Card.CardID).Duration == 1 || DeckPlayerInHandUI.Socket03.Card.FlushNow)
      {
         if(DeckPlayerInHandUI.Socket03.Card.IsActive)
         {
            DeckPlayerInHandUI.Socket03.Card.Socket = Cemetery.Socket;
            DeckPlayerInHandUI.Socket03.Card.onEnterFrame = MoveToSocket;
            DeckPlayerInHandUI.Socket03.Card = VoidCard;
         }
      }
      if(LookUpCard(DeckPlayerInHandUI.Socket03.Card.CardID).Duration > 1 && DeckPlayerInHandUI.Socket03.Card.IsActive)
      {
         DeckPlayerInHandUI.Socket03.Card.FlushNow = true;
      }
   }
   if(DeckPlayerInHandUI.Socket04.Card != VoidCard)
   {
      if(LookUpCard(DeckPlayerInHandUI.Socket04.Card.CardID).Duration == 1 || DeckPlayerInHandUI.Socket04.Card.FlushNow)
      {
         if(DeckPlayerInHandUI.Socket04.Card.IsActive)
         {
            DeckPlayerInHandUI.Socket04.Card.Socket = Cemetery.Socket;
            DeckPlayerInHandUI.Socket04.Card.onEnterFrame = MoveToSocket;
            DeckPlayerInHandUI.Socket04.Card = VoidCard;
         }
      }
      if(LookUpCard(DeckPlayerInHandUI.Socket04.Card.CardID).Duration > 1 && DeckPlayerInHandUI.Socket04.Card.IsActive)
      {
         DeckPlayerInHandUI.Socket04.Card.FlushNow = true;
      }
   }
   if(DeckPlayerInHandUI.Socket05.Card != VoidCard)
   {
      if(LookUpCard(DeckPlayerInHandUI.Socket05.Card.CardID).Duration == 1 || DeckPlayerInHandUI.Socket05.Card.FlushNow)
      {
         if(DeckPlayerInHandUI.Socket05.Card.IsActive)
         {
            DeckPlayerInHandUI.Socket05.Card.Socket = Cemetery.Socket;
            DeckPlayerInHandUI.Socket05.Card.onEnterFrame = MoveToSocket;
            DeckPlayerInHandUI.Socket05.Card = VoidCard;
         }
      }
      if(LookUpCard(DeckPlayerInHandUI.Socket05.Card.CardID).Duration > 1 && DeckPlayerInHandUI.Socket05.Card.IsActive)
      {
         DeckPlayerInHandUI.Socket05.Card.FlushNow = true;
      }
   }
   if(DeckPlayerInHandUI.Socket06.Card != VoidCard)
   {
      if(LookUpCard(DeckPlayerInHandUI.Socket06.Card.CardID).Duration == 1 || DeckPlayerInHandUI.Socket06.Card.FlushNow)
      {
         if(DeckPlayerInHandUI.Socket06.Card.IsActive)
         {
            DeckPlayerInHandUI.Socket06.Card.Socket = Cemetery.Socket;
            DeckPlayerInHandUI.Socket06.Card.onEnterFrame = MoveToSocket;
            DeckPlayerInHandUI.Socket06.Card = VoidCard;
         }
      }
      if(LookUpCard(DeckPlayerInHandUI.Socket06.Card.CardID).Duration > 1 && DeckPlayerInHandUI.Socket06.Card.IsActive)
      {
         DeckPlayerInHandUI.Socket06.Card.FlushNow = true;
      }
   }
   if(DeckPlayerInHandUI.Socket07.Card != VoidCard)
   {
      if(LookUpCard(DeckPlayerInHandUI.Socket07.Card.CardID).Duration == 1 || DeckPlayerInHandUI.Socket07.Card.FlushNow)
      {
         if(DeckPlayerInHandUI.Socket07.Card.IsActive)
         {
            DeckPlayerInHandUI.Socket07.Card.Socket = Cemetery.Socket;
            DeckPlayerInHandUI.Socket07.Card.onEnterFrame = MoveToSocket;
            DeckPlayerInHandUI.Socket07.Card = VoidCard;
         }
      }
      if(LookUpCard(DeckPlayerInHandUI.Socket07.Card.CardID).Duration > 1 && DeckPlayerInHandUI.Socket07.Card.IsActive)
      {
         DeckPlayerInHandUI.Socket07.Card.FlushNow = true;
      }
   }
   if(DeckOpponentUI.Socket01.Card != VoidCard)
   {
      if(LookUpCard(DeckOpponentUI.Socket01.Card.CardID).Duration == 1 || DeckOpponentUI.Socket01.Card.FlushNow)
      {
         if(DeckOpponentUI.Socket01.Card.IsActive)
         {
            DeckOpponentUI.Socket01.Card.Socket = CemeteryOpponent.Socket;
            DeckOpponentUI.Socket01.Card.onEnterFrame = MoveToSocket;
            DeckOpponentUI.Socket01.Card = VoidCard;
         }
      }
      if(LookUpCard(DeckOpponentUI.Socket01.Card.CardID).Duration > 1 && DeckOpponentUI.Socket01.Card.IsActive)
      {
         DeckOpponentUI.Socket01.Card.FlushNow = true;
      }
   }
   if(DeckOpponentUI.Socket02.Card != VoidCard)
   {
      if(LookUpCard(DeckOpponentUI.Socket02.Card.CardID).Duration == 1 || DeckOpponentUI.Socket02.Card.FlushNow)
      {
         if(DeckOpponentUI.Socket02.Card.IsActive)
         {
            DeckOpponentUI.Socket02.Card.Socket = CemeteryOpponent.Socket;
            DeckOpponentUI.Socket02.Card.onEnterFrame = MoveToSocket;
            DeckOpponentUI.Socket02.Card = VoidCard;
         }
      }
      if(LookUpCard(DeckOpponentUI.Socket02.Card.CardID).Duration > 1 && DeckOpponentUI.Socket02.Card.IsActive)
      {
         DeckOpponentUI.Socket02.Card.FlushNow = true;
      }
   }
   if(DeckOpponentUI.Socket03.Card != VoidCard)
   {
      if(LookUpCard(DeckOpponentUI.Socket03.Card.CardID).Duration == 1 || DeckOpponentUI.Socket03.Card.FlushNow)
      {
         if(DeckOpponentUI.Socket03.Card.IsActive)
         {
            DeckOpponentUI.Socket03.Card.Socket = CemeteryOpponent.Socket;
            DeckOpponentUI.Socket03.Card.onEnterFrame = MoveToSocket;
            DeckOpponentUI.Socket03.Card = VoidCard;
         }
      }
      if(LookUpCard(DeckOpponentUI.Socket03.Card.CardID).Duration > 1 && DeckOpponentUI.Socket03.Card.IsActive)
      {
         DeckOpponentUI.Socket03.Card.FlushNow = true;
      }
   }
   if(DeckOpponentUI.Socket04.Card != VoidCard)
   {
      if(LookUpCard(DeckOpponentUI.Socket04.Card.CardID).Duration == 1 || DeckOpponentUI.Socket04.Card.FlushNow)
      {
         if(DeckOpponentUI.Socket04.Card.IsActive)
         {
            DeckOpponentUI.Socket04.Card.Socket = CemeteryOpponent.Socket;
            DeckOpponentUI.Socket04.Card.onEnterFrame = MoveToSocket;
            DeckOpponentUI.Socket04.Card = VoidCard;
         }
      }
      if(LookUpCard(DeckOpponentUI.Socket04.Card.CardID).Duration > 1 && DeckOpponentUI.Socket04.Card.IsActive)
      {
         DeckOpponentUI.Socket04.Card.FlushNow = true;
      }
   }
   if(DeckOpponentUI.Socket05.Card != VoidCard)
   {
      if(LookUpCard(DeckOpponentUI.Socket05.Card.CardID).Duration == 1 || DeckOpponentUI.Socket05.Card.FlushNow)
      {
         if(DeckOpponentUI.Socket05.Card.IsActive)
         {
            DeckOpponentUI.Socket05.Card.Socket = CemeteryOpponent.Socket;
            DeckOpponentUI.Socket05.Card.onEnterFrame = MoveToSocket;
            DeckOpponentUI.Socket05.Card = VoidCard;
         }
      }
      if(LookUpCard(DeckOpponentUI.Socket05.Card.CardID).Duration > 1 && DeckOpponentUI.Socket05.Card.IsActive)
      {
         DeckOpponentUI.Socket05.Card.FlushNow = true;
      }
   }
   if(DeckOpponentUI.Socket06.Card != VoidCard)
   {
      if(LookUpCard(DeckOpponentUI.Socket06.Card.CardID).Duration == 1 || DeckOpponentUI.Socket06.Card.FlushNow)
      {
         if(DeckOpponentUI.Socket06.Card.IsActive)
         {
            DeckOpponentUI.Socket06.Card.Socket = CemeteryOpponent.Socket;
            DeckOpponentUI.Socket06.Card.onEnterFrame = MoveToSocket;
            DeckOpponentUI.Socket06.Card = VoidCard;
         }
      }
      if(LookUpCard(DeckOpponentUI.Socket06.Card.CardID).Duration > 1 && DeckOpponentUI.Socket06.Card.IsActive)
      {
         DeckOpponentUI.Socket06.Card.FlushNow = true;
      }
   }
   if(DeckOpponentUI.Socket07.Card != VoidCard)
   {
      if(LookUpCard(DeckOpponentUI.Socket07.Card.CardID).Duration == 1 || DeckOpponentUI.Socket07.Card.FlushNow)
      {
         if(DeckOpponentUI.Socket07.Card.IsActive)
         {
            DeckOpponentUI.Socket07.Card.Socket = CemeteryOpponent.Socket;
            DeckOpponentUI.Socket07.Card.onEnterFrame = MoveToSocket;
            DeckOpponentUI.Socket07.Card = VoidCard;
         }
      }
      if(LookUpCard(DeckOpponentUI.Socket07.Card.CardID).Duration > 1 && DeckOpponentUI.Socket07.Card.IsActive)
      {
         DeckOpponentUI.Socket07.Card.FlushNow = true;
      }
   }
   if(Deck.Card != VoidCard)
   {
      Deck.Card.Socket = Cemetery.Socket;
      Deck.Card.onEnterFrame = MoveToSocket;
      Deck.Card = VoidCard;
   }
   if(DeckOpponent.Card != VoidCard)
   {
      DeckOpponent.Card.Socket = CemeteryOpponent.Socket;
      DeckOpponent.Card.onEnterFrame = MoveToSocket;
      DeckOpponent.Card = VoidCard;
   }
   waiter_mc.DoAfterWait(15,BattleSystem.NextTurn,"NextTurn",[null]);
}
function Wait()
{
   clearInterval(intervalID);
   intervalID = setInterval(WaitCallback,delayRemoveDice);
   WaitCallback = null;
}
function HasCardToDisarm(CardType)
{
   var _loc2_ = CardType;
   var _loc1_ = 0;
   if(_loc2_ == BattleSystem.CARD_YELLOW)
   {
      _loc1_ += BattleSystem.DeckOpponentUI.Socket01.Card == BattleSystem.VoidCard ? 0 : (!BattleSystem.IsYellowCard(BattleSystem.DeckOpponentUI.Socket01.Card) ? 0 : 1);
      _loc1_ += BattleSystem.DeckOpponentUI.Socket02.Card == BattleSystem.VoidCard ? 0 : (!BattleSystem.IsYellowCard(BattleSystem.DeckOpponentUI.Socket02.Card) ? 0 : 1);
      _loc1_ += BattleSystem.DeckOpponentUI.Socket03.Card == BattleSystem.VoidCard ? 0 : (!BattleSystem.IsYellowCard(BattleSystem.DeckOpponentUI.Socket03.Card) ? 0 : 1);
      _loc1_ += BattleSystem.DeckOpponentUI.Socket04.Card == BattleSystem.VoidCard ? 0 : (!BattleSystem.IsYellowCard(BattleSystem.DeckOpponentUI.Socket04.Card) ? 0 : 1);
      _loc1_ += BattleSystem.DeckOpponentUI.Socket05.Card == BattleSystem.VoidCard ? 0 : (!BattleSystem.IsYellowCard(BattleSystem.DeckOpponentUI.Socket05.Card) ? 0 : 1);
      _loc1_ += BattleSystem.DeckOpponentUI.Socket06.Card == BattleSystem.VoidCard ? 0 : (!BattleSystem.IsYellowCard(BattleSystem.DeckOpponentUI.Socket06.Card) ? 0 : 1);
      _loc1_ += BattleSystem.DeckOpponentUI.Socket07.Card == BattleSystem.VoidCard ? 0 : (!BattleSystem.IsYellowCard(BattleSystem.DeckOpponentUI.Socket07.Card) ? 0 : 1);
   }
   else if(_loc2_ == BattleSystem.CARD_GREEN)
   {
      _loc1_ += BattleSystem.DeckOpponentUI.Socket01.Card == BattleSystem.VoidCard ? 0 : (!BattleSystem.IsGreenCard(BattleSystem.DeckOpponentUI.Socket01.Card) ? 0 : 1);
      _loc1_ += BattleSystem.DeckOpponentUI.Socket02.Card == BattleSystem.VoidCard ? 0 : (!BattleSystem.IsGreenCard(BattleSystem.DeckOpponentUI.Socket02.Card) ? 0 : 1);
      _loc1_ += BattleSystem.DeckOpponentUI.Socket03.Card == BattleSystem.VoidCard ? 0 : (!BattleSystem.IsGreenCard(BattleSystem.DeckOpponentUI.Socket03.Card) ? 0 : 1);
      _loc1_ += BattleSystem.DeckOpponentUI.Socket04.Card == BattleSystem.VoidCard ? 0 : (!BattleSystem.IsGreenCard(BattleSystem.DeckOpponentUI.Socket04.Card) ? 0 : 1);
      _loc1_ += BattleSystem.DeckOpponentUI.Socket05.Card == BattleSystem.VoidCard ? 0 : (!BattleSystem.IsGreenCard(BattleSystem.DeckOpponentUI.Socket05.Card) ? 0 : 1);
      _loc1_ += BattleSystem.DeckOpponentUI.Socket06.Card == BattleSystem.VoidCard ? 0 : (!BattleSystem.IsGreenCard(BattleSystem.DeckOpponentUI.Socket06.Card) ? 0 : 1);
      _loc1_ += BattleSystem.DeckOpponentUI.Socket07.Card == BattleSystem.VoidCard ? 0 : (!BattleSystem.IsGreenCard(BattleSystem.DeckOpponentUI.Socket07.Card) ? 0 : 1);
   }
   else if(_loc2_ == BattleSystem.CARD_BLUE)
   {
      _loc1_ += BattleSystem.DeckOpponentUI.Socket01.Card == BattleSystem.VoidCard ? 0 : (!BattleSystem.IsBlueCard(BattleSystem.DeckOpponentUI.Socket01.Card) ? 0 : 1);
      _loc1_ += BattleSystem.DeckOpponentUI.Socket02.Card == BattleSystem.VoidCard ? 0 : (!BattleSystem.IsBlueCard(BattleSystem.DeckOpponentUI.Socket02.Card) ? 0 : 1);
      _loc1_ += BattleSystem.DeckOpponentUI.Socket03.Card == BattleSystem.VoidCard ? 0 : (!BattleSystem.IsBlueCard(BattleSystem.DeckOpponentUI.Socket03.Card) ? 0 : 1);
      _loc1_ += BattleSystem.DeckOpponentUI.Socket04.Card == BattleSystem.VoidCard ? 0 : (!BattleSystem.IsBlueCard(BattleSystem.DeckOpponentUI.Socket04.Card) ? 0 : 1);
      _loc1_ += BattleSystem.DeckOpponentUI.Socket05.Card == BattleSystem.VoidCard ? 0 : (!BattleSystem.IsBlueCard(BattleSystem.DeckOpponentUI.Socket05.Card) ? 0 : 1);
      _loc1_ += BattleSystem.DeckOpponentUI.Socket06.Card == BattleSystem.VoidCard ? 0 : (!BattleSystem.IsBlueCard(BattleSystem.DeckOpponentUI.Socket06.Card) ? 0 : 1);
      _loc1_ += BattleSystem.DeckOpponentUI.Socket07.Card == BattleSystem.VoidCard ? 0 : (!BattleSystem.IsBlueCard(BattleSystem.DeckOpponentUI.Socket07.Card) ? 0 : 1);
   }
   return _loc1_ > 0;
}
function PlayerFindEmptySlot()
{
   if(DeckPlayerInHandUI.Socket01.Card == VoidCard)
   {
      return DeckPlayerInHandUI.Socket01;
   }
   if(DeckPlayerInHandUI.Socket02.Card == VoidCard)
   {
      return DeckPlayerInHandUI.Socket02;
   }
   if(DeckPlayerInHandUI.Socket03.Card == VoidCard)
   {
      return DeckPlayerInHandUI.Socket03;
   }
   if(DeckPlayerInHandUI.Socket04.Card == VoidCard)
   {
      return DeckPlayerInHandUI.Socket04;
   }
   if(DeckPlayerInHandUI.Socket05.Card == VoidCard)
   {
      return DeckPlayerInHandUI.Socket05;
   }
   if(DeckPlayerInHandUI.Socket06.Card == VoidCard)
   {
      return DeckPlayerInHandUI.Socket06;
   }
   if(DeckPlayerInHandUI.Socket07.Card == VoidCard)
   {
      return DeckPlayerInHandUI.Socket07;
   }
   return null;
}
_global.Console = new Object();
Console.Write = function(str)
{
};
