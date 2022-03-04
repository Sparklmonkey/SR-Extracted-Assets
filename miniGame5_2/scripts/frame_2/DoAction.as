function callSfx(sound)
{
   sfx.gotoAndPlay(sound);
}
function testBoss()
{
   initBoss = true;
   introBoss.gotoAndPlay(2);
}
function moveBkg(mc_1, mc_2, speed)
{
   var _loc1_ = mc_2;
   var _loc2_ = mc_1;
   if(_loc2_._x < _loc1_._x)
   {
      crntFirstFloor = _loc2_;
      crntScndFloor = _loc1_;
   }
   else
   {
      crntFirstFloor = _loc1_;
      crntScndFloor = _loc2_;
   }
   if(crntFirstFloor._x >= - crntFirstFloor._width - 25)
   {
      crntFirstFloor._x -= speed;
      crntScndFloor._x = crntFirstFloor._x + crntFirstFloor._width - 10;
   }
   else
   {
      crntFirstFloor._x = _parent._x + crntFirstFloor._width - 50;
   }
}
function throwAmmo(mc, array)
{
   ammo_depth = getNewDepth();
   mc.duplicateMovieClip("a" + ammo_depth,ammo_depth);
   crnt_mc = eval("a" + ammo_depth);
   array.push(crnt_mc);
   crnt_mc.gotoAndPlay(2);
   return crnt_mc;
}
function removeMC(target, n, array)
{
   target.stop();
   target.removeMovieClip();
   array.splice(n,1);
}
function intervalFireRate()
{
   var intervalFireRate = setInterval(function()
   {
      throwLightballAvailable = true;
      clearInterval(intervalFireRate);
   }
   ,100,this);
}
stageW = 640;
stageH = 480;
_quality = "LOW";
PAUSE = false;
root.sfx.gotoAndPlay("battleMonster");
depth = 2000;
myAmmoArr = new Array();
ammoObj = new Object();
throwLightballAvailable = true;
enemyArr = new Array("flying","darkflying","talonpole","soldier","driver");
powerArr = new Array("cheapFlower","normalFlower","goodFlower","diamond","ruby");
maxWaitValue = 30;
minWaitValue = 30;
maxAtkValue = 20;
minAtkValue = 20;
waitDelay = random(maxWaitValue) + minWaitValue;
mouseDirection = 0;
initPos = char._x;
slowPos = initPos - 30;
slowSpeed = 2;
runPos = initPos + 200;
runSpeed = 4;
initbkgSpeed = 8;
bkgSpeed = initbkgSpeed;
restartFloor = floor._x + floor.floor1._width - 50;
decay = 0.3;
BossDelay = 60;
sentBoss = false;
initBoss = false;
sentFlying = false;
sentDark = false;
sentTalonpole = false;
sentSoldier = false;
sentDriver = false;
sentCFlower = false;
sentNFlower = false;
sentGFlower = false;
entDiamond = false;
sentRuby = false;
flash = {ra:"30",rb:"200",ga:"30",gb:"200",ba:"30",bb:"200",aa:"90",ab:"0"};
restore = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"0",aa:"100",ab:"0"};
bossColor1 = {ra:"100",rb:"0",ga:"-100",gb:"137",ba:"100",bb:"0",aa:"100",ab:"0"};
bossColor2 = {ra:"100",rb:"20",ga:"-100",gb:"137",ba:"100",bb:"0",aa:"100",ab:"0"};
bossColor3 = {ra:"100",rb:"40",ga:"-100",gb:"137",ba:"100",bb:"0",aa:"100",ab:"0"};
bossColor4 = {ra:"100",rb:"60",ga:"-100",gb:"137",ba:"100",bb:"0",aa:"100",ab:"0"};
bossColor5 = {ra:"100",rb:"100",ga:"-100",gb:"137",ba:"100",bb:"0",aa:"100",ab:"0"};
bossTransform = new Color(boss);
bossTransform.setTransform(bossColor1);
charInv = 0;
flashInt = 0;
playExp = true;
flashStarted = false;
msgTxt = "";
score = 0;
score_mc.scoreTxt.text = score;
getNewDepth = function()
{
   depth++;
   return depth;
};
getRandom = function(lowNumber, highNumber)
{
   var _loc3_ = highNumber - lowNumber;
   var _loc2_ = Math.random() * _loc3_;
   var _loc1_ = Math.round(_loc2_);
   _loc1_ += lowNumber;
   return _loc1_;
};
mouseListener = new Object();
mouseListener.onMouseDown = function()
{
   if(!KEYDOWN && char.state != "block")
   {
      if(throwLightballAvailable)
      {
         throwLightballAvailable = false;
         intervalFireRate();
         callSfx("lazer");
         myAmmo = throwAmmo(igneouSparkle,myAmmoArr);
         myAmmo._x = char._x + char.arm._x;
         myAmmo._y = char._y + char.arm._y + 10;
         myAmmo._rotation = char.arm._rotation;
         char.arm.gotoAndPlay(2);
      }
   }
};
hitTarget = function(obj, type)
{
   var _loc1_ = type;
   var _loc2_ = obj;
   if(sentBoss)
   {
      if(_loc2_.crntAmmo.hitzone.hitTest(_loc1_.boss.boss.hitzone))
      {
         _loc1_.hit = _loc1_.hit + 1;
         colorStep = Math.round(_loc1_.health / 5);
         if(_loc1_.hit >= _loc1_.health - colorStep)
         {
            if(bossTransform.getTransform().ra == bossColor4.ra)
            {
               bossTransform.setTransform(bossColor5);
            }
         }
         else if(_loc1_.hit >= _loc1_.health - colorStep * 2)
         {
            if(bossTransform.getTransform().ra == bossColor3.ra)
            {
               bossTransform.setTransform(bossColor4);
            }
         }
         else if(_loc1_.hit >= _loc1_.health - colorStep * 3)
         {
            if(bossTransform.getTransform().ra == bossColor2.ra)
            {
               bossTransform.setTransform(bossColor3);
            }
         }
         else if(_loc1_.hit >= _loc1_.health - colorStep * 4)
         {
            if(bossTransform.getTransform().ra == bossColor1.ra)
            {
               bossTransform.setTransform(bossColor2);
            }
         }
         removeMC(_loc2_.crntAmmo,_loc2_.indx,myAmmoArr);
         mc_Explosion = throwAmmo(gExplo);
         mc_Explosion._x = _loc1_.boss.boss._x + _loc1_.boss._x + _loc1_._x;
         mc_Explosion._y = _loc1_.boss.boss._y + _loc1_.boss._y + _loc1_._y;
         if(_loc1_.hit >= _loc1_.health)
         {
            score += _loc1_.score;
            score_mc.scoreTxt.text = score;
            _loc1_.boss.boss.gotoAndStop("dead");
            _loc1_.hit = 0;
         }
      }
   }
   else if(_loc2_.crntAmmo.hitzone.hitTest(_loc1_.hitzone))
   {
      _loc1_.hit = _loc1_.hit + 1;
      removeMC(_loc2_.crntAmmo,_loc2_.indx,myAmmoArr);
      mc_Explosion = throwAmmo(gExplo);
      mc_Explosion._x = _loc1_._x;
      mc_Explosion._y = _loc1_._y;
      if(_loc1_.hit >= _loc1_.health)
      {
         score += _loc1_.score;
         score_mc.scoreTxt.text = score;
         _loc1_.gotoAndStop("dead");
         _loc1_.hit = 0;
      }
      else
      {
         _loc1_.gotoAndStop("hurt");
      }
   }
};
runMG = function()
{
   cursor._x = mg5._xmouse;
   cursor._y = mg5._ymouse;
   xDist = mg5._xmouse - (char._x + char.arm._x);
   yDist = mg5._ymouse - (char._y + char.arm._y);
   char.arm._x = char.char._x + char.char.shoulder._x;
   char.arm._y = char.char._y + char.char.shoulder._y;
   normalise = Math.abs(xDist) + Math.abs(yDist);
   if(xDist <= 0 && yDist >= 0)
   {
      mouseDirection = 90;
   }
   else if(xDist <= 0 && yDist <= 0)
   {
      mouseDirection = Math.floor(-90 + 90 * (xDist / normalise));
   }
   else if(yDist >= 0)
   {
      mouseDirection = Math.floor(90 - 90 * (xDist / normalise));
   }
   else
   {
      mouseDirection = Math.floor(-90 + 90 * (xDist / normalise));
   }
   char.arm._rotation = mouseDirection;
   KEYUP = Key.isDown(38);
   moveBkg(floor.floor1,floor.floor2,bkgSpeed);
   moveBkg(front.front1,front.front2,bkgSpeed / 2);
   moveBkg(back.back1,back.back2,bkgSpeed / 3);
   if(KEYUP)
   {
      if(char.state != "jump" && char.state != "block")
      {
         char.gotoAndStop("jump");
      }
   }
   if(char.state != "jump")
   {
      char._x += crntSpeed;
   }
   if(charDamage > 0)
   {
      charDamage--;
      health.nextFrame();
   }
   if(charInv > 0)
   {
      charInv--;
   }
   else if(flashInt != 0)
   {
      flashStarted = false;
      charColor.setTransform(restore);
      clearInterval(flashInt);
      flashInt = 0;
   }
   for(var _loc1_ in myAmmoArr)
   {
      ammoObj.crntAmmo = myAmmoArr[_loc1_];
      ammoObj.indx = _loc1_;
      if(sentBoss)
      {
         hitTarget(ammoObj,boss);
      }
      else
      {
         hitTarget(ammoObj,soldier);
         hitTarget(ammoObj,flying);
         hitTarget(ammoObj,darkflying);
         hitTarget(ammoObj,driver);
         hitTarget(ammoObj,talonpole);
      }
      if(myAmmoArr[_loc1_]._currentframe == myAmmoArr[_loc1_]._totalframes)
      {
         removeMC(myAmmoArr[_loc1_],_loc1_,myAmmoArr);
      }
   }
};
sendEnemy = function(enemy)
{
   switch(enemy)
   {
      case "flying":
         if(!sentFlying)
         {
            sentFlying = true;
            flying._visible = true;
            flying._x = stageW + 100;
            flying._y = random(100) + 100;
            flying.hit = 0;
            flying.gotoAndStop("idle");
         }
         break;
      case "darkflying":
         if(!sentDark)
         {
            sentDark = true;
            darkflying._visible = true;
            darkflying._x = stageW + 100;
            darkflying._y = random(100) + 100;
            darkflying.hit = 0;
            darkflying.gotoAndStop("idle");
         }
         break;
      case "talonpole":
         if(!sentTalonpole)
         {
            sentTalonpole = true;
            talonpole._visible = true;
            talonpole._x = stageW + 100;
            talonpole.hit = 0;
            talonpole.gotoAndStop("idle");
         }
         break;
      case "soldier":
         if(!sentSoldier)
         {
            sentSoldier = true;
            soldier._visible = true;
            soldier._x = stageW + 100;
            soldier.hit = 0;
            soldier.gotoAndStop("idle");
         }
         break;
      case "driver":
         if(!sentDriver)
         {
            sentDriver = true;
            driver._visible = true;
            driver._x = stageW + 100;
            driver.hit = 0;
            driver.gotoAndStop("idle");
         }
         break;
      case "cheapFlower":
         if(!sentCFlower)
         {
            sentCFlower = true;
            cheapFlower._x = stageW + 100;
            cheapFlower._y = getRandom(200,400);
            cheapFlower.gotoAndStop("idle");
         }
         break;
      case "normalFlower":
         if(!sentNFlower)
         {
            sentNFlower = true;
            normalFlower._x = stageW + 100;
            normalFlower._y = getRandom(200,400);
            normalFlower.gotoAndStop("idle");
         }
         break;
      case "goodFlower":
         if(!sentGFlower)
         {
            sentGFlower = true;
            goodFlower._x = stageW + 100;
            goodFlower._y = getRandom(200,400);
            goodFlower.gotoAndStop("idle");
         }
         break;
      case "diamond":
         if(!sentDiamond)
         {
            sentDiamond = true;
            diamond._x = stageW + 100;
            diamond._y = getRandom(200,400);
            diamond.gotoAndStop("idle");
         }
         break;
      case "ruby":
         if(!sentRuby)
         {
            sentRuby = true;
            ruby._x = stageW + 100;
            ruby._y = getRandom(200,400);
            ruby.gotoAndStop("idle");
         }
   }
};
runEnemyAI = function(mc)
{
   var _loc1_ = mc;
   if(!initBoss)
   {
      if(_loc1_._visible == false)
      {
         _loc1_._visible = true;
      }
      _loc1_._x -= bkgSpeed + _loc1_.speed;
      if(charInv <= 0)
      {
         if(_loc1_.ammo.hitzone.hitTest(char.char.hitzone))
         {
            if(!_loc1_.succes)
            {
               _loc1_.succes = true;
               charDamage += _loc1_.damage;
               if(_loc1_.ammoType == "bullet")
               {
                  _loc1_.ammo.gotoAndStop(1);
               }
               mc_Explosion = throwAmmo(gExplo);
               mc_Explosion._x = char._x;
               mc_Explosion._y = char._y;
            }
         }
         else
         {
            _loc1_.succes = false;
         }
      }
      _loc1_.fct();
      if(_loc1_.state != "dead")
      {
         if(_loc1_.atkDelay <= 0)
         {
            if(_loc1_.attack == false)
            {
               _loc1_.attack = true;
               _loc1_.gotoAndStop("attack");
            }
         }
         else
         {
            _loc1_.atkDelay = _loc1_.atkDelay - 1;
         }
         if(_loc1_._x + _loc1_._width <= 0)
         {
            _loc1_.onStage = false;
            clearInterval(_loc1_.intID);
            _loc1_.gotoAndStop("dead");
         }
      }
   }
   else if(_loc1_.state != "dead")
   {
      _loc1_.gotoAndStop("dead");
   }
};
runBoss = function()
{
   if(charInv <= 0)
   {
      if(boss.boss.boss.ammo.hitzone.hitTest(char.char.hitzone))
      {
         if(!boss.succes)
         {
            boss.succes = true;
            charDamage += boss.damage;
            if(boss.ammoType == "bullet")
            {
               boss.ammo.gotoAndStop(1);
            }
            mc_Explosion = throwAmmo(gExplo);
            mc_Explosion._x = char._x;
            mc_Explosion._y = char._y;
         }
      }
      else
      {
         boss.succes = false;
      }
   }
   boss.fct();
   if(boss.boss.boss.state != "dead")
   {
      if(boss.boss.boss.atkDelay <= 0)
      {
         if(boss.boss.boss.attack == false)
         {
            boss.boss.boss.attack = true;
            boss.boss.boss.gotoAndStop("attack");
         }
      }
      else
      {
         boss.boss.boss.atkDelay--;
      }
   }
};
runPowerUp = function(mc)
{
   var _loc1_ = mc;
   _loc1_._x -= bkgSpeed + _loc1_.speed;
   if(_loc1_._x + _loc1_._width <= 0)
   {
      _loc1_.gotoAndStop("collect");
   }
   if(_loc1_.hitTest(char.char.hitzone))
   {
      if(!_loc1_.succes)
      {
         callSfx("power");
         _loc1_.succes = true;
         _loc1_.fct();
         powerUpDetail._x = _loc1_._x;
         powerUpDetail.gotoAndPlay(1);
      }
   }
   else
   {
      _loc1_.succes = false;
   }
};
runLVL = function()
{
   ennDelay--;
   if(!initBoss)
   {
      if(ennDelay <= 0)
      {
         ennDelay = random(maxWaitValue) + minWaitValue;
         enemyIndex = random(enemyArr.length);
         sendEnemy(enemyArr[enemyIndex]);
      }
   }
   if(sentFlying)
   {
      runEnemyAI(flying);
   }
   if(sentDark)
   {
      runEnemyAI(darkflying);
   }
   if(sentTalonpole)
   {
      runEnemyAI(talonpole);
   }
   if(sentSoldier)
   {
      runEnemyAI(soldier);
   }
   if(sentDriver)
   {
      runEnemyAI(driver);
   }
   powerDelay--;
   if(powerDelay <= 0)
   {
      powerDelay = random(maxWaitValue + 100) + minWaitValue + 50;
      powerIndex = random(powerArr.length);
      if(powerIndex > 3)
      {
         if(random(100) > 50)
         {
            powerIndex = -1;
         }
      }
      sendEnemy(powerArr[powerIndex]);
   }
   if(sentCFlower)
   {
      runPowerUp(cheapFlower);
   }
   if(sentNFlower)
   {
      runPowerUp(normalFlower);
   }
   if(sentGFlower)
   {
      runPowerUp(goodFlower);
   }
   if(sentDiamond)
   {
      runPowerUp(diamond);
   }
   if(sentRuby)
   {
      runPowerUp(ruby);
   }
};
