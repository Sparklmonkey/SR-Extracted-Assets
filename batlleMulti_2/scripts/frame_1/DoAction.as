function initBattle(battleOpponent, battlePlayer, param)
{
   clearInterval(BattleSystem.intervalID);
   clearInterval(BattleSystem.intervalIDDepecheToi);
   clearInterval(BattleSystem.intervalIDFGSO);
   clearInterval(BattleSystem.intervalIDInitFGSO);
   clearInterval(BattleSystem.intervalIDAttackFGSO);
   game._visible = false;
   FromEnginePlayer = battlePlayer;
   FromEngineOpponent = battleOpponent;
   FromEngineParam = param;
   if(bDebugGiveAllActionCard)
   {
      FromEnginePlayer.dice = 7;
      FromEnginePlayer.defense = 8;
      FromEngineOpponent.dice = 7;
      FromEngineOpponent.defense = 8;
      tabCard = new Array(107,108,302,302,303,408,600,601);
      FromEnginePlayer.card = new Array();
      var _loc1_ = 0;
      while(_loc1_ < tabCard.length)
      {
         var _loc2_ = new Object();
         _loc2_ = {id:tabCard[_loc1_],deck:1};
         FromEnginePlayer.card.push(_loc2_);
         _loc1_ = _loc1_ + 1;
      }
   }
   if(FromEnginePlayer.card.length > 7)
   {
      if(cardQty < 8)
      {
         cardQty = FromEnginePlayer.card.length;
         if(root.inWorld != true)
         {
            if(root.playerStats.mission > 1)
            {
               showTutorial = true;
            }
         }
      }
   }
   gotoAndStop(2);
}
function clearBattle()
{
   root.optionBar.scoreTxt.text = root.playerStats.victory + BattleSystem.VictoryPoint;
   root.typeBody = mainChar.typeBody = mainChar.oldTypeBody;
   root.typeLegs = mainChar.typeLegs = mainChar.oldTypeLegs;
   game._visible = true;
   game.char.play();
   clearInterval(intervalID);
   var _loc2_ = false;
   var _loc1_ = false;
   var obj1 = new Object();
   var _loc3_ = new Object();
   BattleSystem.Destroy();
   if(BattleSystem.bPlayerDisconnect)
   {
      _loc2_ = true;
      _loc1_ = "disconnect";
      obj1 = {Name:FromEnginePlayer.Name,Pts:200,Misc:"",winner:_loc2_};
      _loc3_ = {Name:FromEngineOpponent.Name,Pts:0,Misc:"",winner:_loc1_};
   }
   else if(BattleSystem.bIsDraw)
   {
      _loc2_ = "draw";
      _loc1_ = "draw";
      obj1 = {Name:FromEnginePlayer.Name,Pts:0,Misc:"",winner:_loc2_};
      _loc3_ = {Name:FromEngineOpponent.Name,Pts:0,Misc:"",winner:_loc1_};
   }
   else
   {
      _loc2_ = BattleSystem.IsWinner;
      _loc1_ = !BattleSystem.IsWinner;
      if(_loc2_)
      {
         obj1 = {Name:FromEnginePlayer.Name,Pts:200,Misc:"",winner:_loc2_};
         _loc3_ = {Name:FromEngineOpponent.Name,Pts:0,Misc:"",winner:_loc1_};
      }
      else if(_loc1_)
      {
         obj1 = {Name:FromEnginePlayer.Name,Pts:0,Misc:"",winner:_loc2_};
         _loc3_ = {Name:FromEngineOpponent.Name,Pts:200,Misc:"",winner:_loc1_};
      }
   }
   clearInterval(BattleSystem.intervalID);
   clearInterval(BattleSystem.intervalIDDepecheToi);
   clearInterval(BattleSystem.intervalIDFGSO);
   clearInterval(BattleSystem.intervalIDInitFGSO);
   clearInterval(BattleSystem.intervalIDAttackFGSO);
   root.mGameEndWindow.drawWindow(new Array(obj1,_loc3_),7,undefined);
   gotoAndStop(1);
}
function setBattle(objP1, objP2)
{
   root.tradeWindow.gotoAndStop(1);
   root.sfx.gotoAndPlay("battleRider");
   var _loc1_ = 2;
   initBattle(objP2,objP1,_loc1_);
   game._visible = false;
   CallbackEndBattle = function(battleResult, ptsVictory)
   {
      game._visible = true;
      clearBattle();
      if(!battleResult)
      {
      }
      root.sfx.gotoAndPlay(game.ContxtMusic);
   };
}
_global.BATTLESYSTEM_DEBUG = false;
_global.DEBUG_MULTI = this;
bDebugGiveAllActionCard = false;
bDebugGiveAlwaysBlueDice = false;
bDebugGiveCardNotInRandom = false;
bDebugEcoute = true;
var FromEnginePlayer = null;
var FromEngineOpponent = null;
var FromEngineParam = null;
if(battleInitCard == undefined)
{
   cardQty = root.playerStats.card.length;
   battleInitCard = true;
}
showTutorial = false;
stop();
drawBattle = function()
{
   root.playerStats.myTurn = !random(2) ? false : true;
   var _loc1_ = new Object();
   var _loc2_ = new Object();
   _loc1_ = {deckActive:root.deckActive,typeSex:mainChar.typeSex,typeBody:mainChar.typeBody,typeArmor:mainChar.typeArmor,typeHair:mainChar.typeHair,typeSkin:mainChar.typeSkin,typeEyes:mainChar.typeEyes,typeManacle:mainChar.typeManacle};
   _loc2_ = {SpiderAccess:root.sprAccess,SpiderLegs:charSpider.sprLegs,SpiderHead:charSpider.sprHead,SpiderBody:charSpider.sprBody,SpiderOffset:charSpider.sproffSet};
   setBattleCards(root.playerStats.Name,root.playerStats,_loc1_,charSpider.sprName,root.spiderData,_loc2_);
   root.gameSO.send("setBattleCards",root.playerStats.Name,root.playerStats,_loc1_,root.sprName,root.spiderData,_loc2_);
   root.tradeWindow.gotoAndStop("loading");
};
closeGame = function()
{
   gotoAndStop(1);
};
unPause = function()
{
};
disconnect = function(playerName)
{
   clearInterval(intervalID);
   BattleSystem.Destroy();
   root.Trace("DISCONNECT !");
   root.mGameEndWindow.drawWindow(new Array(obj1,obj2),8);
   BattleSystem.GameOver(true);
   BattleSystem.bPlayerDisconnect = true;
   CallbackEndBattle(true,0);
};
setGameDesc = function(gameDesc)
{
   var _loc1_ = this;
   _loc1_.gameDesc = gameDesc;
   _loc1_.gameDesc[0].card = new Array("null");
   _loc1_.gameDesc[1].card = new Array("null");
};
setBattleCards = function(Name, pStats, pAvatar, pSpiderName, pSpiderStats, pSpiderDesc)
{
   var _loc1_ = this;
   var _loc3_ = pAvatar;
   var _loc2_ = _loc1_.gameDesc[0].n != Name ? 1 : 0;
   _loc1_.gameDesc[_loc2_].Name = Name;
   _loc1_.gameDesc[_loc2_].card = pStats.card;
   _loc1_.gameDesc[_loc2_].rank = pStats.rank;
   _loc1_.gameDesc[_loc2_].dice = pStats.dice;
   _loc1_.gameDesc[_loc2_].defense = pStats.defense;
   _loc1_.gameDesc[_loc2_].life = pStats.life;
   _loc1_.gameDesc[_loc2_].victory = pStats.victory;
   _loc1_.gameDesc[_loc2_].deckActive = _loc3_.deckActive;
   _loc1_.gameDesc[_loc2_].typeSex = _loc3_.typeSex;
   _loc1_.gameDesc[_loc2_].typeBody = 4 + _loc3_.typeArmor;
   _loc1_.gameDesc[_loc2_].typeLegs = 4 + _loc3_.typeArmor;
   _loc1_.gameDesc[_loc2_].typeArmor = 4 + _loc3_.typeArmor;
   _loc1_.gameDesc[_loc2_].typeHair = _loc3_.typeHair;
   _loc1_.gameDesc[_loc2_].typeSkin = _loc3_.typeSkin;
   _loc1_.gameDesc[_loc2_].typeEyes = _loc3_.typeEyes;
   _loc1_.gameDesc[_loc2_].typeManacle = _loc3_.typeManacle;
   _loc1_.gameDesc[_loc2_].SpiderName = pSpiderName;
   _loc1_.gameDesc[_loc2_].SpiderDice = pSpiderStats.dice;
   _loc1_.gameDesc[_loc2_].SpiderDefence = pSpiderStats.defense;
   _loc1_.gameDesc[_loc2_].SpiderAction = pSpiderStats.action;
   _loc1_.gameDesc[_loc2_].SpiderAccess = pSpiderDesc.SpiderAccess;
   _loc1_.gameDesc[_loc2_].SpiderLegs = pSpiderDesc.SpiderLegs;
   _loc1_.gameDesc[_loc2_].SpiderHead = pSpiderDesc.SpiderHead;
   _loc1_.gameDesc[_loc2_].SpiderBody = pSpiderDesc.SpiderBody;
   _loc1_.gameDesc[_loc2_].SpiderOffset = pSpiderDesc.SpiderOffset;
   if(_loc1_.gameDesc[0].myTurn != undefined)
   {
      _loc1_.gameDesc[1].myTurn = !_loc1_.gameDesc[0].myTurn;
   }
   else
   {
      _loc1_.gameDesc[0].myTurn = !_loc1_.gameDesc[1].myTurn;
   }
   if(_loc1_.gameDesc[0].card[0] != "null" && _loc1_.gameDesc[1].card[0] != "null")
   {
      if(_loc1_.gameDesc[0].n == Name)
      {
         setBattle(gameDesc[1],gameDesc[0]);
      }
      else
      {
         setBattle(gameDesc[0],gameDesc[1]);
      }
   }
};
confirmTradeStart = function(Name)
{
   this.gameDesc[0].n != Name ? (p2Confirmed = true) : (p1Confirmed = true);
   if(p1Confirmed && p2Confirmed)
   {
      p1Confirmed = p2Confirmed = false;
      setToken();
   }
};
OpponentHaveRetreated = function()
{
   root.Trace("OpponentHave retreated");
   SetMode(MODE_ACTION_RETREAT);
   root.sfx.gotoAndPlay("Interupt");
   BattleSystem.GameOver(true);
   CallbackEndBattle(true,0);
};
OpponentNoMoreCard = function()
{
   root.textWindow.drawWindow([root.getInsName("txtNoMoreCards",root.parseKitBSystem)],0,OpponentHaveRetreated);
};
GameDraw = function()
{
   root.Trace("OpponentHave retreated");
   SetMode(MODE_ACTION_RETREAT);
   root.sfx.gotoAndPlay("Interupt");
   BattleSystem.bIsDraw = true;
   BattleSystem.GameOver(true);
   CallbackEndBattle(true,0);
};
stop();
