function CallbackButtonPiger()
{
   root.sfx.gotoAndPlay("drawCard");
   if(Player.CardDeck.length < 1)
   {
      root.textWindow.drawWindow([root.getInsName("txtOops",root.parseKitBSystem)],0,root.textWindow.closeWindow);
      clearInterval(intervalIDDepecheToi);
   }
   else
   {
      Draw();
   }
}
function CallbackButtonDice()
{
   root.sfx.gotoAndPlay("throwDice");
   ThrowDice();
   clearInterval(intervalIDDepecheToi);
   waitingTimer.reset();
   intervalIDDepecheToi = setInterval(waitingTimer.update,1000);
}
function CallbackButtonAction()
{
   root.sfx.gotoAndPlay("clic2");
   SetMode(MODE_ACTION_ATTACK);
   clearInterval(intervalIDDepecheToi);
   root.Trace("CACA");
}
function CallbackButtonInterupt()
{
   root.sfx.gotoAndPlay("interupt");
   Interupt();
   Console.Write("<interupt>");
}
function Register()
{
   var _loc1_ = this;
   AsBroadcaster.initialize(_loc1_);
   BattleSystem.addListener(statPlayerTotal);
   BattleSystem.addListener(statOpponentTotal);
   BattleSystem.addListener(statCurrentAttack);
   BattleSystem.addListener(imagePlayer);
   BattleSystem.addListener(imagePlayerHighlight);
   BattleSystem.addListener(imagePlayerShader);
   BattleSystem.addListener(imageOpponent);
   BattleSystem.addListener(imageOpponentHighlight);
   BattleSystem.addListener(imageOpponentShader);
   BattleSystem.addListener(btnDice);
   BattleSystem.addListener(btnAction);
   BattleSystem.addListener(MeterDamagePlayer);
   BattleSystem.addListener(MeterDamageOpponent);
   BattleSystem.addListener(NamePlayer);
   BattleSystem.addListener(NameOpponent);
   BattleSystem.addListener(PlayerHandShader);
   BattleSystem.addListener(RankPlayer);
   BattleSystem.addListener(DeckCardCounterPlayer);
   BattleSystem.addListener(DeckCardCounterOpponent);
   BattleSystem.addListener(mcDebug);
   Mouse.addListener(_loc1_);
   Key.addListener(_loc1_);
}
onKeyDown = function()
{
};
onMouseUp = function()
{
   HasMouseReleased = true;
};
onKeyUp = function()
{
   Key.getCode() != 32 ? null : null;
   Key.getCode() != 13 ? null : null;
   Key.getCode() != 17 ? null : null;
   Key.getCode() != 38 ? null : null;
   Key.getCode() != 40 ? null : null;
   Key.getCode() != 37 ? null : null;
   Key.getCode() != 39 ? null : null;
};
onEnterFrame = function()
{
   if(frame == 0)
   {
      Console.Write("<spiderider>");
      Console.Write("<battlesystem " + version + ">");
      Register();
      Launch();
   }
   else
   {
      Update();
   }
   frame++;
};
