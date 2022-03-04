function Launch()
{
   Console.Write("<launch>");
   Init();
}
function Init()
{
   SetMode(MODE_INIT);
   broadcastMessage("onBattleSystemInit");
   broadcastMessage("onBattleSystemUpdate");
   IsStarted = true;
   CardInHandPlayer = Math.min(Math.min(Player.CardDeck.length,PlayerActionTotal()),7);
   CardInHandOpponent = Math.min(Math.min(Opponent.CardDeck.length,OpponentActionTotal()),7);
   bFinishToDrawMyself = false;
   root.Trace("CardInHandPlayer : " + CardInHandPlayer);
   IndexCardDeal = 1;
   waiter_mc.DoAfterWait(8,DealPlayer,"DealPlayer");
}
function DealPlayer()
{
   var card = null;
   CardDrawer = DRAW_PLAYER;
   DeckCardCounterPlayer.Update();
   if(CardInHandPlayer > 0)
   {
      card = Generate(GENERATE_CARD_PLAYER);
      socketTarget = eval("DeckPlayerInHandUI.Socket0" + IndexCardDeal);
      PickInPlayerArray = true;
      InitCard(card.CardCloner);
      card._x = Deck._x;
      card._y = Deck._y;
      card._visible = true;
      card.Socket = socketTarget;
      card.isPlayerCard = true;
      socketTarget.Card = card;
      IndexCardDeal++;
      card.onEnterFrame = MoveToSocket;
   }
   if(IndexCardDeal > CardInHandPlayer)
   {
      clearInterval(intervalIDInitFGSO);
      bFinishToDrawMyself = true;
      CallUpdateDeckToGSO(false);
      root.Trace("bFinishToDrawMyself : " + IndexCardDeal + "/" + CardInHandPlayer);
      waiter_mc.DoAfterWait(300,CallUpdateDeckToGSO,"Renvoyer mon deck",[false],"BattleSystem.bHaveReceiveReceipt",true,true);
   }
   else
   {
      waiter_mc.DoAfterWait(8,DealPlayer,"DealPlayer");
   }
}
function AccuseReceptionInit()
{
   root.Trace("Reception");
   if(!bHaveReceiveReceipt)
   {
      root.Trace("Mon opponent a recu l\'initiation, j\'attend");
      bHaveReceiveReceipt = true;
      InitAfterDraw();
   }
}
function AccuseReceptionAttack()
{
   if(!bHaveReceiveReceiptAttack)
   {
      root.Trace("Mon opponent a recu l\'attack, j\'attend");
      bHaveReceiveReceiptAttack = true;
   }
}
function InitAfterDraw()
{
   SetMode(MODE_CHOOSE);
   root.Trace("Player.myTurn : " + Player.myTurn);
   CurrentPlayer = !Player.myTurn ? TURN_OPPONENT : TURN_PLAYER;
   broadcastMessage("onBattleSystemChoosePlayer");
   if(CurrentPlayer == TURN_PLAYER)
   {
      if(Player.CardDeck.length > CardInHand)
      {
         DrawCardPlayer();
         Deck.gotoAndStop("NORMAL");
         CardOnTop = true;
      }
      else
      {
         Deck.gotoAndStop("EMPTY");
         CardOnTop = false;
      }
      statPlayerTotal.Dice.gotoAndStop("HIGHLIGHT");
      statPlayerTotal.Defence.gotoAndStop("DISABLE");
      statOpponentTotal.Dice.gotoAndStop("DISABLE");
      statOpponentTotal.Defence.gotoAndStop("HIGHLIGHT");
      clearInterval(intervalIDDepecheToi);
      waitingTimer.reset();
      intervalIDDepecheToi = setInterval(waitingTimer.update,1000);
   }
   else
   {
      Dices = new Array();
      statPlayerTotal.Dice.gotoAndStop("DISABLE");
      statPlayerTotal.Defence.gotoAndStop("HIGHLIGHT");
      statOpponentTotal.Dice.gotoAndStop("HIGHLIGHT");
      statOpponentTotal.Defence.gotoAndStop("DISABLE");
      if(Player.CardDeck.length > CardInHand)
      {
         Deck.gotoAndStop("NORMAL");
      }
      else
      {
         Deck.gotoAndStop("EMPTY");
      }
   }
   if(IsFirstBattle)
   {
      if(root.inWorld != true)
      {
         Tutorial.gotoAndPlay("open");
      }
   }
   SetMode(MODE_NEXT_TURN);
}
function Update()
{
   if(IsStarted)
   {
      if(HasMouseReleased)
      {
         if(IsDraging)
         {
            Release();
         }
      }
      frame % 30 != 0 ? null : broadcastMessage("onBattleSystemUpdate");
   }
}
function Destroy()
{
   clearInterval(intervalID);
   SetMode(MODE_NONE);
   broadcastMessage("onBattleSystemDestroy");
   IsStarted = false;
}
function NextTurn()
{
   clearInterval(intervalID);
   DiceRed = 0;
   DiceBlue = 0;
   DefPlus = 0;
   BattleSystem.WhiteDice = 0;
   BattleSystem.YellowDicesUsed = 0;
   if(CurrentPlayer == TURN_PLAYER)
   {
      CurrentPlayer = TURN_OPPONENT;
      if(Opponent.CardDeck.length > 0)
      {
      }
      root.Trace("\n**** FIN ATTAQUE ****\n");
      statPlayerTotal.Dice.gotoAndStop("DISABLE");
      statPlayerTotal.Defence.gotoAndStop("HIGHLIGHT");
      statOpponentTotal.Dice.gotoAndStop("HIGHLIGHT");
      statOpponentTotal.Defence.gotoAndStop("DISABLE");
   }
   else
   {
      var _loc1_ = PlayerGetAllCard() - PlayerHaveActivatedAllGreenCardInGame();
      if(_loc1_ <= 0)
      {
         root.textWindow.drawWindow([root.getInsName("txtNoMoreCardsDraw",root.parseKitBSystem)],0,NoMoreCard);
      }
      else
      {
         if(_loc1_ <= 2 && !bHaveSaidTwoCardRemaining)
         {
            bHaveSaidTwoCardRemaining = true;
            root.textWindow.drawWindow([root.getInsName("txtAlmostEmpty",root.parseKitBSystem)],0,null);
         }
         CurrentPlayer = TURN_PLAYER;
         if(Player.CardDeck.length > 0)
         {
            DrawCardPlayer();
            clearInterval(intervalID);
            slot = PlayerFindEmptySlot();
            if(slot != null)
            {
               Deck.Card.Socket = slot;
               Deck.Card.onEnterFrame = MoveToSocket;
               Deck.Card = VoidCard;
               CardOnTop = false;
            }
            else
            {
               CardOnTop = true;
            }
         }
         statPlayerTotal.Dice.gotoAndStop("HIGHLIGHT");
         statPlayerTotal.Defence.gotoAndStop("DISABLE");
         statOpponentTotal.Dice.gotoAndStop("DISABLE");
         statOpponentTotal.Defence.gotoAndStop("HIGHLIGHT");
         bHaveReceiveAttack = false;
         clearInterval(intervalIDDepecheToi);
         waitingTimer.reset();
         intervalIDDepecheToi = setInterval(waitingTimer.update,1000);
      }
   }
   root.sfx.gotoAndPlay("NextTurn");
   SetMode(MODE_NEXT_TURN);
}
function DrawCardPlayer()
{
   if(Player.CardDeck.length > 0)
   {
      if(!CutiePieEq && !blessingCardEq)
      {
         SetMode(MODE_DRAW);
         CardDrawer = DRAW_PLAYER;
      }
      var _loc1_ = Generate(GENERATE_CARD_PLAYER);
      _loc1_.isPlayerCard = true;
      InitCard(_loc1_.CardCloner);
      _loc1_._x = Deck._x + Deck.Socket._x;
      _loc1_._y = Deck._y + Deck.Socket._y;
      _loc1_._visible = true;
      Deck.Card = _loc1_;
      root.sfx.gotoAndPlay("Draw");
   }
}
function DrawCardOpponent()
{
   if(Opponent.CardDeck.length > 0)
   {
      SetMode(MODE_DRAW);
      CardDrawer = DRAW_OPPONENT;
      var _loc1_ = Generate(GENERATE_CARD_OPPONENT);
      _loc1_.isPlayerCard = false;
      InitCard(_loc1_.CardCloner);
      _loc1_.symbol.btn.enabled = false;
      _loc1_._x = DeckOpponent._x + DeckOpponent.Socket._x;
      _loc1_._y = DeckOpponent._y + DeckOpponent.Socket._y;
      _loc1_._visible = true;
      DeckOpponent.Card = _loc1_;
      root.sfx.gotoAndPlay("Draw");
   }
}
function ThrowDice()
{
   clearInterval(intervalID);
   SetMode(MODE_DICE_THROW);
   column = 0;
   row = 0;
   Dices = new Array();
   waiter_mc.DoAfterWait(5,NewDice,"ThrowDice",[null]);
   strDicesToShow = "";
}
function NewDice()
{
   var _loc1_ = this;
   dice = Generate(GENERATE_DICE);
   dice._x = 178 + column * 32;
   dice._y = 215 + row * 32;
   dice.Socket = Deck.Socket;
   dice.indexDices = Dices.length - 1;
   dice.IsReady = false;
   if(column >= 8)
   {
      column = 0;
      row++;
   }
   else
   {
      column++;
   }
   Shake(dice);
   if(DEBUG_MULTI.bDebugGiveAlwaysBlueDice)
   {
      dice.Type = DICE_BLUE;
   }
   Dices.push(dice);
   strDicesToShow += strDicesToShow != "" ? "," + dice.Type : dice.Type;
   if(Dices.length >= CurrentAttack.Dice || Dices.length >= BattleSystem.MAX_ATTACK)
   {
      root.gameSO.send("showDicesFGSO",strDicesToShow,root.playerStats.Name);
      dice.onEnterFrame = function()
      {
         var _loc1_ = this;
         if(_loc1_.IsReady)
         {
            _loc1_.IsReady = false;
            delete _loc1_.onEnterFrame;
            waiter_mc.DoAfterWait(5,BattleSystem.RemoveWhiteDice,"RemoveWhiteDice",[null]);
            BattleSystem.SetMode(BattleSystem.MODE_DICE_ANIM_WHITE);
         }
      };
   }
   else
   {
      waiter_mc.DoAfterWait(5,NewDice,"ThrowDice",[null]);
   }
   root.sfx.gotoAndPlay("ThrowDice");
}
function showDicesShown(dicesRef)
{
   RemoveDice();
   DicesThrown = new Array();
   DicesThrown = dicesRef.split(",");
   iDice = 0;
   waiter_mc.DoAfterWait(5,NewDiceFromArray,"ThrowDiceOfOpponent",[null]);
   column = 0;
   row = 0;
   root.Trace("Dés reçu de l\'opponent : " + dicesRef);
}
function NewDiceFromArray()
{
   var _loc1_ = this;
   dice = Generate(GENERATE_DICE);
   dice._x = 178 + column * 32;
   dice._y = 215 + row * 32;
   dice.Socket = Deck.Socket;
   dice.indexDices = Dices.length - 1;
   if(column >= 8)
   {
      column = 0;
      row++;
   }
   else
   {
      column++;
   }
   dice.Type = Number(DicesThrown[iDice]);
   dice.gotoAndStop("SHUFFLE");
   Dices.push(dice);
   iDice++;
   root.Trace("DICE DE L\'OPPONENT : " + iDice + "/" + DicesThrown.length);
   if(iDice >= DicesThrown.length || iDice >= BattleSystem.MAX_ATTACK)
   {
      dice.onEnterFrame = function()
      {
         var _loc1_ = this;
         if(_loc1_.IsReady)
         {
            root.Trace("Call le retirement des dés blanc");
            _loc1_.IsReady = false;
            delete _loc1_.onEnterFrame;
            BattleSystem.WaitCallback = BattleSystem.RemoveWhiteDice;
            waiter_mc.DoAfterWait(15,BattleSystem.WaitCallback,"RemoveWhiteDice",[null]);
            BattleSystem.SetMode(BattleSystem.MODE_DICE_ANIM_WHITE);
         }
      };
   }
   else
   {
      waiter_mc.DoAfterWait(5,NewDiceFromArray,"ThrowDiceOfOpponent",[null]);
   }
   root.sfx.gotoAndPlay("ThrowDice");
}
function RemoveWhiteDice()
{
   for(var _loc1_ in Dices)
   {
      if(Dices[_loc1_].Type == DICE_WHITE)
      {
         BattleSystem.WhiteDice = BattleSystem.WhiteDice + 1;
         Dices[_loc1_].gotoAndStop("REMOVE");
         Dices[_loc1_].splice(_loc1_,1);
      }
   }
   waiter_mc.DoAfterWait(30,BattleSystem.CumulateRedDice,"CumulateRedDice",[null]);
   root.sfx.gotoAndPlay("DiceRemove");
   SetMode(MODE_DICE_ANIM_RED);
}
function CumulateRedDice()
{
   §§enumerate(Dices);
   while(true)
   {
      var _loc0_ = null;
      if((_loc0_ = §§enumeration()) == null)
      {
         waiter_mc.DoAfterWait(30,BattleSystem.CumulateBlueDice,"CumulateBlueDice",[null]);
         SetMode(MODE_DICE_ANIM_BLUE);
      }
      var _loc1_ = §§enum_assign();
      if(Dices[_loc1_].Type == DICE_RED)
      {
         Dices[_loc1_].Socket = CurrentPlayer != TURN_PLAYER ? targetRedOpponent : targetRedPlayer;
         Dices[_loc1_].onEnterFrame = MoveTo;
         Dices[_loc1_].halo.gotoAndPlay("GLOW");
         Dices.splice(_loc1_,1);
         root.sfx.gotoAndPlay("DiceMove");
         break;
      }
   }
}
function CumulateBlueDice()
{
   SetMode(MODE_CARD);
   var _loc1_ = 0;
   while(_loc1_ < Dices.length)
   {
      Dices[_loc1_].halo.gotoAndPlay("GLOW_IN_OUT");
      _loc1_ = _loc1_ + 1;
   }
   if(CurrentPlayer == TURN_PLAYER && IsFirstBattle)
   {
      if(root.inWorld != true)
      {
         Tutorial.gotoAndPlay("attack");
      }
   }
}
function OpponentAttackFGSO(nDices, nDef, strCardIDOpponent, strCardsToKill)
{
   if(!bHaveReceiveAttack)
   {
      bHaveReceiveAttack = true;
      root.Trace("\n**** DEFEND ****\n");
      BattleSystem.DefPlusOpponent = Number(nDef);
      BattleSystem.DefendMalusOpponent -= BattleSystem.DefPlusOpponent;
      BattleSystem.DiceRed = nDices;
      BattleSystem.strCardsToKill = strCardsToKill;
      updateDeckFGSO(false,null,strCardIDOpponent,false);
      OpponentUseCard();
   }
   EnvoieAccuseReceptionAttack();
}
function EnvoieAccuseReceptionAttack()
{
   root.gameSO.send("AccuseReceptionAttack",root.playerStats.Name);
}
function OpponentUseCard()
{
   if(useNextCard())
   {
      LaunchAttackOpponent();
   }
}
function LaunchAttackOpponent()
{
   KillCards(strCardsToKill);
   strCardsToKill = "";
   root.Trace("BattleSystem.DiceRed : " + BattleSystem.DiceRed);
   statPlayerTotal.Update();
   statOpponentTotal.Update();
   statCurrentAttack.Update();
   broadcastMessage("onBattleSystemAttack");
   ActivateButton(false,false);
   root.Trace("\n**** END DEFEND ****\n");
}
function KillCards(strCard, bMyDeck)
{
   if(strCard != "")
   {
      if(bMyDeck == undefined)
      {
         bMyDeck = true;
      }
      root.Trace("strCard : " + strCard);
      var tabCard = new Array();
      var tabCardToKill = new Array();
      var _loc2_ = false;
      var theDeck = !bMyDeck ? DeckOpponentUI : DeckPlayerInHandUI;
      tabCard = strCard.split(",");
      var i = 0;
      while(i < tabCard.length)
      {
         tabCardToKill = tabCard[i].split("~");
         _loc2_ = false;
         var _loc1_ = 1;
         while(_loc1_ <= 7 && !_loc2_)
         {
            _loc2_ = tabCardToKill[0] == theDeck["Socket0" + _loc1_].Card.CardID && tabCardToKill[1] == (!theDeck["Socket0" + _loc1_].Card.IsActive ? 0 : 1);
            _loc1_ = _loc1_ + 1;
         }
         if(_loc2_)
         {
            _loc1_ = _loc1_ - 1;
            var _loc3_ = theDeck["Socket0" + _loc1_].Card;
            _loc3_.Socket.Card = BattleSystem.VoidCard;
            _loc3_.Socket = !bMyDeck ? BattleSystem.CemeteryOpponent.Socket : BattleSystem.Cemetery.Socket;
            _loc3_.onEnterFrame = BattleSystem.MoveToSocket;
            _loc3_ = BattleSystem.VoidCard;
            root.Trace("");
         }
         else
         {
            root.Trace("OUPS ! DÉSYNCHROMNISATION TOTALE ");
         }
         i++;
      }
   }
}
function Attack()
{
   clearInterval(intervalID);
   RemoveDice();
   LastActionDamage = BattleSystem.CurrentAttack.Action;
   if(LastActionDamage > 0)
   {
      if(CurrentPlayer == TURN_PLAYER)
      {
         HurtOpponent(LastActionDamage);
      }
      else
      {
         HurtPlayer(LastActionDamage);
      }
      Console.Write("<attack : " + LastActionDamage + ">");
   }
   else
   {
      root.sfx.gotoAndPlay("Block");
      Console.Write("<attack : FAIL>");
   }
   if(CurrentPlayer == TURN_PLAYER)
   {
      root.Trace("\n**** ATTAQUE ****\n");
      SetAndSendAttackToOpponent();
      BattleSystem.CardsIDToKill = "";
      ResetActivatedCard();
      AnimPlayer.Avatar.gotoAndStop("ATTACK0" + (random(4) + 1));
      bHaveReceiveReceiptAttack = false;
   }
   else
   {
      AnimOpponent.Avatar.gotoAndStop("ATTACK0" + (random(4) + 1));
   }
   root.sfx.gotoAndPlay("Attack");
}
function SetAndSendAttackToOpponent()
{
   root.Trace("Je lance l\'attack");
   objCurrentAttack = new Object();
   objCurrentAttack.DiceRed = BattleSystem.DiceRed;
   objCurrentAttack.DefPlusPlayer = BattleSystem.DefPlusPlayer;
   objCurrentAttack.StrCardDesc = GetStringCardIDInDeckWithCode(true,true);
   objCurrentAttack.StrCardToKill = BattleSystem.CardsIDToKill;
   root.gameSO.send("playerAttack",root.playerStats.Name,objCurrentAttack.DiceRed,objCurrentAttack.DefPlusPlayer,objCurrentAttack.StrCardDesc,objCurrentAttack.StrCardToKill);
   waiter_mc.DoAfterWait(300,SendAttackToOpponent,"Envoie l\'attack à l\'opponent",[null],"BattleSystem.bHaveReceiveReceiptAttack",true,true);
}
function SendAttackToOpponent()
{
   root.Trace("J\'envoie mon attack");
   root.gameSO.send("playerAttack",root.playerStats.Name,objCurrentAttack.DiceRed,objCurrentAttack.DefPlusPlayer,objCurrentAttack.StrCardDesc,objCurrentAttack.StrCardToKill);
}
function Defend()
{
   if(CurrentPlayer == TURN_PLAYER)
   {
      AnimPlayer.Avatar.gotoAndStop("IDLE");
      if(LastActionDamage > 0)
      {
         if(OpponentHitPointTotal() <= 0)
         {
            statPlayerTotal.Update();
            statOpponentTotal.Update();
            meterLifePointOpponent._visible = false;
            AnimOpponent.Avatar.gotoAndStop("DEAD");
         }
         else
         {
            AnimOpponent.Avatar.gotoAndStop("HURT");
         }
      }
      else if(LastActionDamage <= 0)
      {
         AnimOpponent.Avatar.gotoAndStop("BLOCK");
      }
   }
   else
   {
      AnimOpponent.Avatar.gotoAndStop("IDLE");
      if(LastActionDamage > 0)
      {
         if(PlayerHitPointTotal() <= 0)
         {
            meterLifePointPlayer._visible = false;
            statPlayerTotal.Update();
            statOpponentTotal.Update();
            AnimPlayer.Avatar.gotoAndStop("DEAD");
         }
         else
         {
            AnimPlayer.Avatar.gotoAndStop("HURT");
         }
      }
      else if(LastActionDamage <= 0)
      {
         AnimPlayer.Avatar.gotoAndStop("BLOCK");
      }
   }
   SetMode(MODE_ACTION_DEFENSE);
   root.sfx.gotoAndPlay("Defend");
}
function CallbackDefenseIsDone()
{
   if(CurrentPlayer == TURN_PLAYER)
   {
      AnimPlayer.Avatar.gotoAndStop("IDLE");
      if(OpponentHitPointTotal() > 0)
      {
         AnimOpponent.Avatar.gotoAndStop("IDLE");
      }
   }
   else
   {
      AnimPlayer.Avatar.gotoAndStop("IDLE");
      if(OpponentHitPointTotal() > 0)
      {
         AnimOpponent.Avatar.gotoAndStop("IDLE");
      }
   }
   AttackIsDone();
}
function AttackIsDone()
{
   SetMode(MODE_ACTION_DAMAGE);
   if(IsGameOver)
   {
      GameOver();
   }
   else
   {
      RemoveCard();
   }
}
function Interupt()
{
   SetMode(MODE_ACTION_INTERUPT);
   if(CurrentPlayer == TURN_PLAYER)
   {
   }
   root.sfx.gotoAndPlay("Interupt");
}
function AskForRetreat()
{
   root.askWindow.drawWindow2([root.getInsName("txtQuestRetreat",root.parseKitBSystem)],retreat,null);
}
function Retreat()
{
   SetMode(MODE_ACTION_RETREAT);
   root.sfx.gotoAndPlay("Interupt");
   root.Trace("J\'Ai retreaté !");
   root.gameSO.send("playerRetreat",root.playerStats.Name);
   GameOver(false);
   BattleSystem._parent.CallbackEndBattle(false,0);
}
function NoMoreCard()
{
   SetMode(MODE_ACTION_RETREAT);
   root.sfx.gotoAndPlay("Interupt");
   root.Trace("J\'Ai pude cartes !");
   root.gameSO.send("playerNoMoreCard",root.playerStats.Name);
   GameOver(false);
   BattleSystem._parent.CallbackEndBattle(false,0);
}
function Activate(card, nPlayer)
{
   var _loc1_ = card;
   var _loc2_ = nPlayer;
   root.Trace("\nJ\'active la carte : " + _loc1_.CardID);
   var _loc3_ = CurrentPlayer;
   if(_loc2_ != undefined)
   {
      CurrentPlayer = _loc2_;
   }
   _loc1_.CardCloner.Halo.gotoAndStop("ACTIVE");
   _loc1_.IsActive = true;
   if(IsBlueCard(_loc1_))
   {
      BattleSystem.MalusOpponent = Number(BattleSystem.MalusOpponent);
      BattleSystem.MalusPlayer = Number(BattleSystem.MalusPlayer);
      BattleSystem.DefendMalusOpponent = Number(BattleSystem.DefendMalusOpponent);
      BattleSystem.DefendMalusPlayer = Number(BattleSystem.DefendMalusPlayer);
      LookUpCard(_loc1_.CardID).Activate();
   }
   if(IsGreenCard(_loc1_))
   {
      if(_loc1_.CardID == 302)
      {
         if(CurrentPlayer == TURN_PLAYER)
         {
            Player.LifePointReserve += 5;
         }
         else
         {
            Opponent.LifePointReserve += 5;
         }
      }
      if(_loc1_.CardID == 303)
      {
         BattleSystem.MalusOpponent = Number(BattleSystem.MalusOpponent);
         BattleSystem.MalusPlayer = Number(BattleSystem.MalusPlayer);
         BattleSystem.DefendMalusOpponent = Number(BattleSystem.DefendMalusOpponent);
         BattleSystem.DefendMalusPlayer = Number(BattleSystem.DefendMalusPlayer);
      }
      LookUpCard(_loc1_.CardID).Activate();
   }
   if(BattleSystem.SprklHelpEq || BattleSystem.blessingEq || BattleSystem.yellowManacle)
   {
      if(CurrentPlayer == TURN_PLAYER)
      {
         Player.LifePointReserve += BattleSystem.addLifePoint;
      }
      else
      {
         Opponent.LifePointReserve += BattleSystem.addLifePoint;
      }
      BattleSystem.addLifePoint = 0;
   }
   if(BattleSystem.giftOracleEq)
   {
      if(CurrentPlayer == TURN_PLAYER)
      {
         BattleSystem.addLifePoint = Player.LifePointDup - BattleSystem.PlayerHitPointTotal();
         if(BattleSystem.addLifePoint < 0)
         {
            BattleSystem.addLifePoint = 0;
         }
         Player.LifePointReserve += BattleSystem.addLifePoint;
      }
      else
      {
         BattleSystem.addLifePoint = Opponent.LifePointDup - BattleSystem.OpponentHitPointTotal();
         if(BattleSystem.addLifePoint < 0)
         {
            BattleSystem.addLifePoint = 0;
         }
         Opponent.LifePointReserve += BattleSystem.addLifePoint;
      }
      BattleSystem.addLifePoint = 0;
   }
   if(_loc2_ != undefined)
   {
      CurrentPlayer = _loc3_;
   }
   statCurrentAttack.Update();
   statPlayerTotal.Update();
   statOpponentTotal.Update();
   broadcastMessage("onBattleSystemActivateCard");
   root.sfx.gotoAndPlay("CardActivation");
}
function GameOver(bWin)
{
   if(bWin != undefined)
   {
      IsWinner = bWin;
   }
   clearInterval(intervalIDInitFGSO);
   clearInterval(intervalIDAttackFGSO);
   SetMode(MODE_GAMEOVER);
   Console.Write("<gameover>");
   statPlayerTotal.Update();
   statOpponentTotal.Update();
   if(IsWinner)
   {
      AnimPlayer.Avatar.gotoAndStop("WIN");
      root.sfx.gotoAndPlay("Win");
      VictoryPoint = LookUpMonster(Opponent.ID).VictoryPoint;
      Console.Write("<win>");
      Console.Write("<victory " + VictoryPoint + ">");
      WaitCallback = function()
      {
         BattleSystem._parent.CallbackEndBattle(BattleSystem.IsWinner,Number(BattleSystem.LookUpMonster(BattleSystem.Opponent.ID).VictoryPoint));
      };
      waiter_mc.DoAfterWait(30,WaitCallback,"GameOver",[null]);
   }
   else
   {
      root.sfx.gotoAndPlay("Loose");
      Console.Write("<loose>");
   }
}
