function TraceFPS()
{
   FPS = frame;
   frame = 0;
}
_quality = "MEDIUM";
root.sfx.gotoAndPlay("battleMonster");
PAUSE = false;
roundNum = 1;
charGap = 60;
top = 0;
left = 0;
sceneWidth = 640;
sceneHeight = 480;
groundLvl = 550;
vx = 0;
vy = 0;
friction = 0.99;
bounce = -0.8;
gravity = 2.1;
charHitDelay = -100;
uppercutTimer = 0;
atkUppercut = false;
charSpeed = 0;
cVictory = 0;
crntSpeed = 0;
initCharXScale = char._xscale;
initCharX = char._x;
initCharY = char._y;
lastCombo = "";
comboArray = new Array("","","");
comboTimer = 0;
initAnim = false;
comboAvaible = false;
comboMove = false;
liftAtk = false;
charEasingDelay = 50;
charEasing = false;
jmpAtkAvaible = false;
ennHitDelay = -100;
ennSpeed = 0;
sideDrop = 140;
playerGap = 100;
eVictory = 0;
hitInRow = 0;
aiAction1Gap = 80;
aiAction2Gap = 50;
aiAction3Gap = 40;
minDelay = 20;
maxDelay = 35;
initEnnXScale = enn._xscale;
initEnnX = enn._x;
initEnnY = enn._y;
ennInitAnim = false;
jmpEnnAtkAvaible = false;
ennLiftAtk = false;
ennGrabAtk = false;
ennBlock = false;
action = false;
spearAtk = true;
ennInvincible = false;
showScore = false;
lifeScore = 0;
roundScore = 0;
totalScore = 0;
crntScore = 0;
FPS = 0;
minFrameEyeCandy = 20;
frame = 0;
repDelay = random(maxDelay) + minDelay;
bounceFct = function(hit_mc, path)
{
   var _loc1_ = hit_mc;
   var _loc2_ = path;
   bW = _loc2_._width / 2;
   bH = _loc2_._height / 2;
   vy += gravity;
   vx *= friction;
   vy *= friction;
   _loc1_._x += vx;
   _loc1_._y += vy;
   if(_loc1_._x + bW > sceneWidth)
   {
      _loc1_._x = sceneWidth - bW;
      vx *= bounce;
   }
   else if(_loc1_._x - bW < left)
   {
      _loc1_._x = left + bW;
      vx *= bounce;
   }
   if(_loc1_._y + bH > groundLvl)
   {
      setMiddle = - _loc1_._width / 2;
      if(_loc1_._xscale < 0)
      {
         setMiddle = _loc1_._width / 2;
      }
      groundHit._x = _loc1_._x + setMiddle;
      groundHit._y = groundLvl - 160;
      groundHit.gotoAndPlay(2);
      if(FPS >= minFrameEyeCandy)
      {
         ShakeCamera(5);
      }
      callSnd("hit1");
      _loc2_.gotoAndPlay(2);
      _loc1_._y = groundLvl - bH;
      vy *= bounce;
   }
   else if(_loc1_._y - bH < top)
   {
      _loc1_._y = top + bH;
      vy *= bounce;
   }
};
callSnd = function(snd)
{
   sfx.gotoAndPlay(snd);
};
throwEndGame = function(winner)
{
   obj1 = new Object();
   obj1.Name = root.playerStats.Name;
   obj1.Pts = crntScore;
   obj1.Misc = "";
   obj1.winner = winner;
   gameID = 6;
   closeGame();
   root.mGameEndWindow.drawWindow(new Array(obj1),gameID);
};
checkEndRound = function()
{
   startNextRound = false;
   roundNum++;
   PAUSE = true;
   upPanel.gotoAndPlay("close");
   init.round_mc.gotoAndStop("round" + roundNum);
   init._visible = false;
};
checkCharPauseGame = function()
{
   charHitDelay--;
   if(charHitDelay > 0)
   {
      PAUSE = true;
   }
   else if(charHitDelay >= -10)
   {
      char.char.play();
      enn.enn.play();
      PAUSE = false;
   }
};
checkEnnPauseGame = function()
{
   ennHitDelay--;
   if(ennHitDelay > 0)
   {
      PAUSE = true;
   }
   else if(ennHitDelay >= -30)
   {
      char.char.play();
      enn.enn.play();
      PAUSE = false;
   }
};
ShakeCamera = function(n)
{
   var _loc1_ = this;
   shakeur_mc = _loc1_.createEmptyMovieClip("shakeur_mc",_loc1_.getNextHighestDepth());
   shakeur_mc.n = n;
   shakeur_mc.dim = n / 25;
   shakeur_mc.onEnterFrame = function()
   {
      var _loc1_ = this;
      _loc1_.n -= _loc1_.dim;
      bkg._x = random(_loc1_.n) - _loc1_.n / 2;
      bkg._y = random(_loc1_.n) - _loc1_.n / 2;
      if(_loc1_.n <= 0)
      {
         bkg._x = 0;
         bkg._y = 0;
         delete _loc1_.onEnterFrame;
         false;
      }
   };
};
getScore = function(mc)
{
   mc.scorePanel.showRoundScore.text = root.getInsName("txtMG6Fr3_p1",root.parseKitMGames) + lifeScore * 2 + root.getInsName("txtMG6Fr3_p2",root.parseKitMGames) + totalScore + root.getInsName("txtMG6Fr3_p3",root.parseKitMGames) + crntScore;
};
checkColl = function()
{
   if(enn.state != "block")
   {
      if(char.char.weapon.hitTest(enn.enn.hitzone))
      {
         hitInRow++;
         if(hitInRow == 2)
         {
            hitInRow = 0;
            action = true;
         }
         callSnd("hit2");
         crntFrame = hud.enn._currentframe;
         score;
         if(crntFrame >= 100)
         {
            cVictory++;
            showScore = true;
            lifeScore = hud.char._totalframes - hud.char._currentframe;
            roundScore = 1000;
            totalScore = roundScore + lifeScore * 2;
            crntScore += totalScore;
            if(FPS >= minFrameEyeCandy)
            {
               ShakeCamera(40);
            }
            if(cVictory >= 2)
            {
               win.gotoAndPlay(2);
               getScore(win);
               startNextRound = false;
            }
            else
            {
               getScore(init);
               startNextRound = true;
            }
            hud.charWin.nextFrame();
            PAUSE = true;
            charHitDelay = -100;
            enn.gotoAndStop("fall_lift");
         }
         else
         {
            hud.enn.gotoAndStop(crntFrame + char.damage);
            charHitDelay = 10;
            if(liftAtk)
            {
               if(FPS >= minFrameEyeCandy)
               {
                  ShakeCamera(40);
               }
               liftAtk = false;
               enn.gotoAndStop("fall_lift");
            }
            else
            {
               enn.gotoAndStop("hurt");
            }
            hitEnn._x = enn._x;
            hitEnn.gotoAndPlay(2);
         }
      }
   }
};
checkEnnColl = function()
{
   if(char.state != "block")
   {
      if(enn.enn.weapon.hitTest(char.char.hitzone))
      {
         callSnd("hit1");
         crntFrame = hud.char._currentframe;
         if(crntFrame >= 100)
         {
            eVictory++;
            if(FPS >= minFrameEyeCandy)
            {
               ShakeCamera(40);
            }
            hud.ennWin.nextFrame();
            PAUSE = true;
            ennHitDelay = -100;
            char.gotoAndStop("fall_lift");
            startNextRound = true;
         }
         else
         {
            hud.char.gotoAndStop(crntFrame + enn.damage);
            ennHitDelay = 5;
            uppercutTimer = 0;
            comboMove = false;
            vx = ennSpeed;
            vy = ennSpeed;
            if(ennLiftAtk)
            {
               if(FPS >= minFrameEyeCandy)
               {
                  ShakeCamera(40);
               }
               ennLiftAtk = false;
               char.gotoAndStop("fall_lift");
            }
            else if(ennGrabAtk)
            {
               char._visible = false;
               char.gotoAndStop("hurt_throw");
               enn.gotoAndStop("throw");
            }
            else
            {
               char.gotoAndStop("hurt");
            }
            hitChar._x = char._x;
            hitChar.gotoAndPlay(2);
         }
      }
   }
};
runCombo = function()
{
   if(KEYFOWARD)
   {
      if(!fowDown)
      {
         addComboKey("foward");
      }
      fowDown = true;
   }
   else
   {
      fowDown = false;
   }
   if(KEYBACKWARD)
   {
      if(!backDown)
      {
         addComboKey("backward");
      }
      backDown = true;
   }
   else
   {
      backDown = false;
   }
   if(KEYDOWN)
   {
      if(!downDown)
      {
         addComboKey("down");
      }
      downDown = true;
   }
   else
   {
      downDown = false;
   }
   if(KEYUP)
   {
      if(!upDown)
      {
         addComboKey("up");
      }
      upDown = true;
   }
   else
   {
      upDown = false;
   }
   if(KEYSPACE)
   {
      if(!hitDown)
      {
         addComboKey("hit");
      }
      hitDown = true;
   }
   else
   {
      hitDown = false;
   }
   checkCombo();
};
checkCombo = function()
{
   combo = "";
   combo += comboArray[0] + ",";
   combo += comboArray[1] + ",";
   combo += comboArray[2];
   if(lastCombo == combo)
   {
      if(comboTimer == 15)
      {
         for(var _loc1_ in comboArray)
         {
            comboArray[_loc1_] = "";
         }
         comboTimer = 0;
      }
      comboTimer++;
   }
   else
   {
      if(comboAvaible)
      {
         switch(combo)
         {
            case "foward,foward,hit":
               char.gotoAndStop("spear");
               break;
            case "down,down,hit":
               char.gotoAndStop("high_attack");
         }
      }
      lastCombo = combo;
   }
   if(comboMove)
   {
      crntSpeed = charSpeed * 4;
   }
};
addComboKey = function(key)
{
   comboArray[0] = comboArray[1];
   comboArray[1] = comboArray[2];
   comboArray[2] = key;
};
runEnnAI = function()
{
   if(!PAUSE)
   {
      if(enn.state != "attack" && enn.state != "hurt")
      {
         if(enn._x <= char._x - 25)
         {
            ennSpeed = 8;
            sideDrop = -140;
            enn._xscale = - initEnnXScale;
         }
         else if(enn._x > char._x + 25)
         {
            ennSpeed = -8;
            sideDrop = 140;
            enn._xscale = initEnnXScale;
         }
      }
      repDelay--;
      if(repDelay == 0)
      {
         action = true;
         walkBack = false;
         repDelay = random(maxDelay) + minDelay;
         randMove = random(100);
      }
      if(action)
      {
         if(char.state == "attack" && enn.state != "jump" && enn.state != "walk" && enn.state != "still" && enn.state != "hurt" && enn.state != "attack")
         {
            if(randMove >= 30)
            {
               if(randMove >= 50)
               {
                  enn.gotoAndStop("jump");
               }
               else
               {
                  enn.gotoAndStop("block");
               }
            }
            ennBlock = true;
         }
         else
         {
            ennBlock = false;
         }
         if(!ennBlock)
         {
            if(enn.state != "jump" && enn.state != "walk" && enn.state != "still" && enn.state != "attack")
            {
               if(enn._x >= char._x + playerGap + aiAction1Gap || enn._x <= char._x - playerGap + aiAction1Gap)
               {
                  if(randMove <= 30)
                  {
                     enn.gotoAndStop("spear");
                  }
                  else if(randMove <= 70)
                  {
                     enn.gotoAndStop("walk");
                  }
                  else
                  {
                     walkBack = true;
                     enn.gotoAndStop("walk");
                  }
               }
               else if(enn._x >= char._x + playerGap + aiAction2Gap || enn._x <= char._x - playerGap + aiAction2Gap)
               {
                  if(randMove <= 25)
                  {
                     enn.gotoAndStop("spear");
                  }
                  else if(randMove <= 50)
                  {
                     enn.gotoAndStop("punch");
                  }
                  else if(randMove <= 75)
                  {
                     enn.gotoAndStop("high_attack");
                  }
                  else
                  {
                     enn.gotoAndStop("grab");
                  }
               }
               else if(enn.state != "hurt")
               {
                  if(randMove <= 10)
                  {
                     enn.gotoAndStop("grab");
                  }
                  else if(randMove <= 40)
                  {
                     enn.gotoAndStop("high_attack");
                  }
                  else if(randMove <= 60)
                  {
                     enn.gotoAndStop("down");
                  }
                  else if(randMove <= 80)
                  {
                     enn.gotoAndStop("jump");
                  }
                  else
                  {
                     walkBack = true;
                     enn.gotoAndStop("walk");
                  }
               }
            }
         }
         action = false;
      }
      if(enn.state == "jump")
      {
         if(jmpEnnAtkAvaible)
         {
            if(enn._x <= char._x + playerGap - aiAction3Gap || enn._x >= char._x - playerGap + aiAction3Gap)
            {
               enn.gotoAndStop("jump_attack");
            }
         }
      }
      if(ennInitAnim || enn.state == "attack" || enn.state == "hurt")
      {
         if(!spearAtk)
         {
            crntEnnSpeed = 0;
         }
         else
         {
            crntEnnSpeed = ennSpeed * 3;
         }
      }
      if(enn.state == "walk" || enn.state == "jump")
      {
         if(walkBack)
         {
            crntEnnSpeed = - ennSpeed;
         }
         else
         {
            crntEnnSpeed = ennSpeed;
         }
      }
      if(enn._x - 1 <= 100)
      {
         enn._x = 100;
      }
      if(enn._x - charGap <= char._x)
      {
         crntEnnSpeed /= 2;
         enn._x = char._x + charGap;
      }
      if(enn._x + charGap + 1 >= sceneWidth)
      {
         enn._x = sceneWidth - charGap;
      }
      enn._x += crntEnnSpeed;
   }
};
intID = setInterval(TraceFPS,1000);
this.onEnterFrame = function()
{
   frame++;
   KEYUP = Key.isDown(38);
   KEYDOWN = Key.isDown(40);
   if(!comboMove)
   {
      if(char.state != "hurt")
      {
         charSpeed = 8;
         tweenGap = -150;
         switchSide = true;
         char._xscale = initCharXScale;
         KEYBACKWARD = Key.isDown(37);
         KEYFOWARD = Key.isDown(39);
      }
   }
   KEYSPACE = Key.isDown(32);
   if(!PAUSE)
   {
      if(char.state != "still" && char.state != "crounch" && char.state != "hurt" && char.state != "attack")
      {
         if(KEYFOWARD)
         {
            if(!KEYBACKWARD && !KEYSPACE)
            {
               if(char.state != "block")
               {
                  crntSpeed = charSpeed;
               }
               if(!KEYUP && char.state == "idle" || char.state == "walk")
               {
                  char.gotoAndStop("walk");
               }
            }
         }
         if(KEYBACKWARD)
         {
            if(!KEYFOWARD && !KEYSPACE)
            {
               crntSpeed = (- charSpeed) / 2;
               if(!KEYUP && char.state == "idle" || char.state == "block" || char.state == "walk")
               {
                  char.gotoAndStop("back");
               }
               else if(char.state == "jump")
               {
                  charSpeed = - charSpeed;
               }
            }
         }
         if(KEYDOWN)
         {
            if(char.state == "idle" && !KEYBACKWARD && !KEYFOWARD)
            {
               crntSpeed = 0;
               char.gotoAndStop("down");
            }
         }
         if(KEYUP)
         {
            if(KEYBACKWARD || KEYFOWARD)
            {
               crntSpeed = charSpeed * 2;
            }
            else
            {
               crntSpeed = 0;
            }
            if(char.state != "jump" && char.state != "attack" && !KEYSPACE)
            {
               char.gotoAndStop("jump");
            }
         }
         if(KEYSPACE)
         {
            uppercutTimer++;
            if(!spacePress)
            {
               spacePress = true;
               if(char.state != "jump")
               {
                  if(char.state != "attack" && !KEYBACKWARD)
                  {
                     if(!KEYFOWARD)
                     {
                        char.gotoAndStop("punch");
                     }
                     crntSpeed = 0;
                  }
               }
               else if(jmpAtkAvaible)
               {
                  char.gotoAndStop("jump_attack");
               }
            }
         }
         if(!KEYSPACE)
         {
            if(uppercutTimer >= 20)
            {
               atkUppercut = true;
               char.gotoAndStop("high_attack");
            }
            uppercutTimer = 0;
            spacePress = false;
         }
      }
      else if(char.state == "crounch")
      {
         if(KEYSPACE)
         {
            if(!spacePress)
            {
               spacePress = true;
               char.gotoAndStop("low_attack");
            }
         }
         if(!KEYSPACE)
         {
            spacePress = false;
         }
         if(!KEYDOWN)
         {
            char.gotoAndStop("get_up");
         }
         crntSpeed = 0;
      }
      if(!KEYUP && !KEYFOWARD && !KEYBACKWARD && !KEYDOWN && !KEYSPACE)
      {
         if(char.state != "attack" && char.state != "still" && char.state != "jump" && char.state != "hurt")
         {
            if(!atkUppercut)
            {
               char.gotoAndStop("idle");
            }
            atkUppercut = false;
         }
         crntSpeed = 0;
      }
      if(char._x - charGap <= 0)
      {
         char._x = charGap;
      }
      if(char._x + 1 >= sceneWidth)
      {
         char._x = sceneWidth;
      }
      if(char._x + charGap + 30 >= enn._x)
      {
         crntSpeed /= 2;
         if(crntSpeed != 0)
         {
            enn._x += crntSpeed;
         }
         char._x = enn._x - charGap - 30;
      }
      if(initAnim || char.state == "attack" || char.state == "hurt")
      {
         crntSpeed = 0;
      }
      runEnnAI();
      runCombo();
      checkColl();
      checkEnnColl();
      if(!charEasing)
      {
         char._x += crntSpeed;
      }
   }
   if(charEasing)
   {
      charEasingDelay--;
      if(charEasingDelay >= 0)
      {
         bounceFct(char,char.char);
      }
      else
      {
         charEasingDelay = 50;
         if(!startNextRound)
         {
            charEasing = false;
            char.gotoAndStop("recover");
            char._y = groundLvl - 210;
         }
         else if(eVictory < 2)
         {
            mg6.checkEndRound();
         }
         else
         {
            lose.gotoAndPlay(2);
         }
         charEasing = false;
      }
   }
   checkCharPauseGame();
   checkEnnPauseGame();
};
PAUSE = true;
init.scorePanel._visible = false;
stop();
