function resetVar()
{
   totalKill = 0;
   screenWindow = false;
   sent = false;
   initGameTime = getTimer();
   gameTimeLimit = 60000;
   firstPlyrCmplt = false;
   secondPlyrCmplt = false;
}
function checkSceneColl(zone)
{
   if(playerArrow.level >= zone.level)
   {
      point = new Object({x:playerArrow.hitzone._x,y:playerArrow.hitzone._y});
      playerArrow.hitzone.localToGlobal(point);
      if(zone.hitTest(point.x,point.y,true))
      {
         combo = 0;
         playerArrow.gotoAndStop(1);
      }
   }
}
function checkTimerColl(timer)
{
   if(playerArrow.hitTest(timer))
   {
      switch(powerUp)
      {
         case "BronzeT":
            gameTimeLimit += 10000;
            break;
         case "SilverT":
            gameTimeLimit += 20000;
            break;
         case "GoldT":
            gameTimeLimit += 30000;
      }
      timer.gotoAndPlay("powerUp");
      resetEnnemy(false);
      powerUp = "";
      playerArrow.gotoAndStop(1);
   }
}
function checkCrateColl(crate)
{
   var _loc1_ = crate;
   if(playerArrow.level >= _loc1_.level)
   {
      if(playerArrow.hitTest(_loc1_.hitzone))
      {
         _loc1_.gotoAndPlay("explose");
         playerArrow.gotoAndStop(1);
      }
   }
}
function leftToKill()
{
   totalKill--;
   if(varGame == "multi")
   {
      root.gameSO.send("updateStat",totalKill,root.playerStats.Name);
   }
   playerTextBox.output = root.getInsName("txtLeftToGo",root.parseKitMGames) + totalKill;
}
function checkEnnemyColl(crntEnnemy, ennemyArr)
{
   var _loc1_ = crntEnnemy;
   if(playerArrow.level == _loc1_.level)
   {
      if(playerArrow.hitzone.hitTest(_loc1_.bug.hitzone))
      {
         comboAdd = true;
         ennemyArr.splice(randIndex,1);
         _loc1_.stop();
         crntName = "" + _loc1_;
         tempsVar = "" + this;
         substrInit = tempsVar.length + 7;
         tempName = crntName.substr(substrInit,crntName.length);
         bugName = tempName.substr(0,tempName.length - 1);
         if(bugName != "Farmer")
         {
            combo++;
            if(combo >= 2)
            {
               playerCombo._x = playerArrow._x;
               playerCombo._y = _loc1_._y;
               playerCombo.gotoAndPlay(2);
            }
            if(combo > biggestCombo)
            {
               biggestCombo = combo;
            }
         }
         switch(bugName)
         {
            case "Hopfopper":
               bugValue = 10;
               leftToKill();
               break;
            case "DarkHopfopper":
               bugValue = 25;
               leftToKill();
               break;
            case "Gasplash":
               bugValue = 40;
               leftToKill();
               break;
            case "Bee":
               bugValue = 30;
               leftToKill();
               break;
            case "ClampRay":
               bugValue = 20;
               leftToKill();
               break;
            default:
               if(varGame == "single")
               {
                  bugValue = 0;
                  comboAdd = false;
                  combo = 0;
                  gameTimeLimit -= 10000;
               }
         }
         if(combo == 1)
         {
            combo = 0;
         }
         score += bugValue + combo * 10;
         sfx.gotoAndPlay("stopAttack");
         sfx.gotoAndPlay("hit");
         playerScoreBox.output = score;
         if(combo == 0)
         {
            combo = 1;
         }
         numKill++;
         if(totalKill > 0)
         {
            _loc1_.bug.gotoAndStop("dead");
            resetEnnemy(false);
         }
         else
         {
            _loc1_.gotoAndStop("hide");
         }
         if(varGame == "multi")
         {
            root.gameSO.send("updateChar","dead",root.playerStats.Name,null);
            root.gameSO.send("updateChar","score",root.playerStats.Name,score);
         }
         playerArrow.gotoAndStop(1);
      }
   }
}
function resetEnnemy(hideEn)
{
   crntEnnemy = undefined;
   onScreen = false;
}
function showEnnemy(ennemyArr)
{
   if(crntEnnemy == undefined)
   {
      randIndex = random(ennemyArr.length);
      crntEnnemy = ennemyArr[randIndex];
      if(crntEnnemy != undefined)
      {
         if(!onScreen)
         {
            onScreen = true;
            randShow = random(4) + 1;
            if(lastRand == randShow)
            {
               randShow != 4 ? randShow++ : (randShow = 1);
            }
            lastRand = randShow;
            if(varGame == "multi")
            {
               root.gameSO.send("sendChar",crntEnnemy + lastRand,root.playerStats.Name);
            }
            powerUp = crntEnnemy;
            crntEnnemy = eval(crntEnnemy + randShow);
            crntEnnemy.bug.gotoAndStop("idle");
            crntEnnemy.gotoAndPlay("show");
            if(powerUp == "BronzeT" || powerUp == "SilverT" || powerUp == "GoldT" || powerUp == "playerFarmer")
            {
               ennemyArr.splice(randIndex,1);
            }
         }
      }
   }
   return crntEnnemy;
}
function closeWindow(type)
{
   screenWindow = false;
   eval("player" + type + "Window").gotoAndStop("hide");
}
function drawWindow(type)
{
   if(!screenWindow)
   {
      screenWindow = true;
      eval("player" + type + "Window").gotoAndStop("show");
   }
}
function updateFriend(newX, newY, fired, playerName)
{
   if(playerName != root.playerStats.Name)
   {
      friend._x = newX;
      friend._y = newY;
      if(fired)
      {
         friend.gotoAndPlay("fire");
         friendArrow._x = friend._x;
         friendArrow._y = friend._y;
         friendArrow.gotoAndPlay("fire");
      }
   }
}
function updateScore(score, playerName)
{
   if(playerName != root.playerStats.Name)
   {
      friendTextBox.output = root.getInsName("txtLeftToGo",root.parseKitMGames) + score;
   }
}
function updateChar(action, playerName, friendScore)
{
   if(playerName != root.playerStats.Name)
   {
      if(action == "hide")
      {
         friendCrntEnnemy.gotoAndStop("hide");
      }
      else if(action == "dead")
      {
         friendCrntEnnemy.stop();
         friendCrntEnnemy.bug.gotoAndStop("dead");
      }
      else
      {
         friendScoreBox.output = friendScore;
      }
   }
}
function showChar(ennemy, playerName)
{
   if(playerName != root.playerStats.Name)
   {
      friendCrntEnnemy.gotoAndStop(1);
      friendCrntEnnemy = ennemy.substr(6,ennemy.length);
      friendCrntEnnemy = eval("friend" + friendCrntEnnemy);
      friendCrntEnnemy.friend = true;
      friendCrntEnnemy.gotoAndPlay("show");
   }
}
function playerLose()
{
   if(playerName != root.playerStats.Name)
   {
      setGameEnd(false);
   }
}
function createTime(time)
{
   var _loc1_ = time;
   min = 0;
   while(_loc1_ >= 60)
   {
      _loc1_ -= 60;
      min++;
   }
   if(_loc1_ < 10)
   {
      _loc1_ = "0" + _loc1_;
   }
   if(_loc1_ <= 0)
   {
      _loc1_ = "00";
   }
   return min + " : " + _loc1_;
}
function checkTime()
{
   gameTime = getTimer();
   tempTime = Math.floor((initGameTime + gameTimeLimit - gameTime) / 1000);
   timeLeft = createTime(tempTime);
   playerTimeBox.output = timeLeft;
   if(gameTime >= initGameTime + gameTimeLimit)
   {
      setGameEnd(false);
   }
}
function showCrate(crateNum)
{
   tempArr = new Array();
   i = 1;
   while(i <= 3)
   {
      tempArr.push("crate" + i);
      i++;
   }
   i = 0;
   while(i < crateNum)
   {
      randShow = random(tempArr.length);
      if(randShow != 0)
      {
         randShow + 1;
      }
      crateShown = tempArr.splice(randShow,1);
      crateShown = eval(crateShown);
      crateShown.gotoAndStop("show");
      i++;
   }
}
function runCrntWave()
{
   playerTextBox.output = root.getInsName("txtLeftToGo",root.parseKitMGames) + totalKill;
   crntEnnemy = showEnnemy(ennemyArr);
   checkEnnemyColl(crntEnnemy,ennemyArr);
   checkSceneColl(zone1);
   checkSceneColl(zone2);
   checkSceneColl(zone3);
   if(varGame == "single")
   {
      checkTime();
      i = 1;
      while(i <= 3)
      {
         checkCrateColl(eval("crate" + i));
         i++;
      }
      if(powerUp == "BronzeT" || powerUp == "SilverT" || powerUp == "GoldT" || powerUp == "Shield")
      {
         checkTimerColl(crntEnnemy);
      }
   }
}
function setWave(crntWave)
{
   switch(crntWave)
   {
      case "wave1":
         if(varGame == "single")
         {
            waveHopNum = 15;
            waveClampNum = 2;
            waveDarkHopNum = 1;
            waveBeeNum = 1;
            waveGasNum = 0;
            waveFarmerNum = 2;
            waveSheildNum = 0;
            waveBTimerNum = 2;
            waveSTimerNum = 0;
            waveGTimerNum = 0;
            waveCrateNum = 0;
         }
         else
         {
            waveHopNum = 5;
            waveClampNum = 2;
            waveDarkHopNum = 0;
            waveBeeNum = 1;
            waveGasNum = 2;
         }
         scnTransit = 2;
         break;
      case "wave2":
         if(varGame == "single")
         {
            waveHopNum = 15;
            waveClampNum = 4;
            waveDarkHopNum = 2;
            waveBeeNum = 2;
            waveGasNum = 0;
            waveFarmerNum = 3;
            waveSheildNum = 0;
            waveBTimerNum = 2;
            waveSTimerNum = 1;
            waveGTimerNum = 0;
            waveCrateNum = 0;
         }
         else
         {
            waveHopNum = 12;
            waveClampNum = 5;
            waveDarkHopNum = 5;
            waveBeeNum = 3;
            waveGasNum = 3;
         }
         scnTransit = 3;
         break;
      case "wave3":
         if(varGame == "single")
         {
            waveHopNum = 15;
            waveClampNum = 6;
            waveDarkHopNum = 4;
            waveBeeNum = 3;
            waveGasNum = 1;
            waveFarmerNum = 4;
            waveSheildNum = 0;
            waveBTimerNum = 3;
            waveSTimerNum = 1;
            waveGTimerNum = 0;
            waveCrateNum = 0;
         }
         else
         {
            waveHopNum = 15;
            waveClampNum = 7;
            waveDarkHopNum = 7;
            waveBeeNum = 5;
            waveGasNum = 5;
         }
         scnTransit = 1;
         break;
      case "wave4":
         if(varGame == "single")
         {
            waveHopNum = 15;
            waveClampNum = 8;
            waveDarkHopNum = 6;
            waveBeeNum = 4;
            waveGasNum = 3;
            waveFarmerNum = 4;
            waveSheildNum = 0;
            waveBTimerNum = 3;
            waveSTimerNum = 2;
            waveGTimerNum = 1;
            waveCrateNum = 1;
         }
         else
         {
            waveHopNum = 17;
            waveClampNum = 9;
            waveDarkHopNum = 9;
            waveBeeNum = 7;
            waveGasNum = 7;
         }
         scnTransit = 2;
         break;
      case "wave5":
         if(varGame == "single")
         {
            waveHopNum = 15;
            waveClampNum = 10;
            waveDarkHopNum = 8;
            waveBeeNum = 5;
            waveGasNum = 4;
            waveFarmerNum = 5;
            waveSheildNum = 1;
            waveBTimerNum = 4;
            waveSTimerNum = 2;
            waveGTimerNum = 2;
            waveCrateNum = 1;
         }
         else
         {
            waveHopNum = 20;
            waveClampNum = 10;
            waveDarkHopNum = 10;
            waveBeeNum = 9;
            waveGasNum = 9;
         }
         scnTransit = 3;
         break;
      default:
         setGameEnd(false);
   }
   ennemyArr = new Array();
   if(waveHopNum != 0)
   {
      i = 0;
      while(i < waveHopNum)
      {
         totalKill++;
         ennemyArr.push("playerHopfopper");
         i++;
      }
   }
   if(waveClampNum != 0)
   {
      i = 0;
      while(i < waveClampNum)
      {
         totalKill++;
         ennemyArr.push("playerClampRay");
         i++;
      }
   }
   if(waveDarkHopNum != 0)
   {
      i = 0;
      while(i < waveDarkHopNum)
      {
         totalKill++;
         ennemyArr.push("playerDarkHopfopper");
         i++;
      }
   }
   if(waveBeeNum != 0)
   {
      i = 0;
      while(i < waveBeeNum)
      {
         totalKill++;
         ennemyArr.push("playerBee");
         i++;
      }
   }
   if(waveGasNum != 0)
   {
      i = 0;
      while(i < waveGasNum)
      {
         totalKill++;
         ennemyArr.push("playerGasplash");
         i++;
      }
   }
   if(varGame == "single")
   {
      if(waveFarmerNum != 0)
      {
         i = 0;
         while(i < waveFarmerNum)
         {
            ennemyArr.push("playerFarmer");
            i++;
         }
      }
      if(waveBTimerNum != 0)
      {
         i = 0;
         while(i < waveBTimerNum)
         {
            ennemyArr.push("BronzeT");
            i++;
         }
      }
      if(waveSTimerNum != 0)
      {
         i = 0;
         while(i < waveSTimerNum)
         {
            ennemyArr.push("SilverT");
            i++;
         }
      }
      if(waveGTimerNum != 0)
      {
         i = 0;
         while(i < waveGTimerNum)
         {
            ennemyArr.push("GoldT");
            i++;
         }
      }
      if(waveCrateNum != 0)
      {
         showCrate(waveCrateNum);
      }
   }
   else
   {
      root.gameSO.send("updateStat",totalKill,root.playerStats.Name);
   }
   crntEnnemy = undefined;
}
function checkWaveEnd()
{
   if(totalKill == 0)
   {
      if(varGame == "single")
      {
         waveArr.shift();
         resetVar();
         eval("transit" + scnTransit).gotoAndPlay(2);
         setWave(waveArr[0]);
      }
      else
      {
         setGameEnd(false);
      }
   }
}
sceneWidth = 640;
sceneHeight = 480;
_quality = "LOW";
halfSceneHeight = sceneHeight / 2;
randIndex = 0;
totalKill = 0;
onScreen = false;
screenWindow = false;
comboAdd = false;
sent = false;
firstPlyrCmplt = false;
secondPlyrCmplt = false;
levelReady = true;
crntEnnemy = undefined;
initGameTime = 0;
gameTime = 0;
combo = 0;
powerUp = new MovieClip();
accuracy = 0;
numShot = 0;
numKill = 0;
score = 0;
biggestCombo = 0;
friendWaitTime = 20000;
gameTimeLimit = 60000;
friendCrntEnnemy = new String();
if(varGame == "single")
{
   waveArr = new Array("wave1","wave2","wave3","wave4","wave5");
}
else
{
   waveArr = new Array("wave1");
}
delay = 1000;
lastTimer = getTimer();
mouseListener = new Object();
mouseListener.onMouseDown = function()
{
   if(player.state == "idle")
   {
      if(!comboAdd)
      {
         combo = 0;
      }
      player.gotoAndPlay("fire");
      playerArrow._x = player._x;
      playerArrow._y = player._y;
      playerArrow.gotoAndPlay("fire");
      root.gameSO.send("sendCoor",player._x,player._y,true,root.playerStats.Name);
      numShot++;
   }
};
Mouse.addListener(mouseListener);
Mouse.hide();
this.onEnterFrame = function()
{
   if(varGame == "single")
   {
      yLimitTop = halfSceneHeight - 200;
      yLimitBottom = sceneHeight;
   }
   else if(firstPlyr)
   {
      yLimitTop = 20;
      yLimitBottom = halfSceneHeight;
   }
   else
   {
      yLimitTop = halfSceneHeight + 20;
      yLimitBottom = sceneHeight;
   }
   _ymouse <= yLimitBottom ? (player._y = _ymouse) : (player._y = yLimitBottom);
   _ymouse >= yLimitTop ? null : (player._y = yLimitTop);
   _xmouse <= sceneWidth ? (player._x = _xmouse) : (player._x = sceneWidth);
   _xmouse >= 0 ? null : (player._x = 0);
   if(varGame == "multi")
   {
      timerUpdateCoor = getTimer();
      if(timerUpdateCoor >= lastTimer + delay)
      {
         lastTimer = getTimer();
         root.gameSO.send("sendCoor",player._x,player._y,false,root.playerStats.Name);
      }
   }
   checkWaveEnd();
   if(levelReady)
   {
      runCrntWave();
   }
};
gotoAndStop(varGame + "Game");
