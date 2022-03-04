function getNewDepth(typeDepth)
{
   var _loc1_ = typeDepth;
   ldepth++;
   ldepth %= 50;
   if(_loc1_ == "bridge")
   {
      return ldepth + depthBridge;
   }
   if(_loc1_ == "spider")
   {
      return ldepth + depthSpider;
   }
   if(_loc1_ == "spiderOver")
   {
      return ldepth + depthSpider2;
   }
   if(_loc1_ == "event")
   {
      return ldepth + depthEvent;
   }
   if(_loc1_ == "flag")
   {
      return ldepth + depthFlag;
   }
   return ldepth + depthOverAll;
}
function computeTrack(letter, array1, array2)
{
   trace("computeTrack :" + letter);
   i = 0;
   while(i < numCheckPoint)
   {
      angle = 6.283185307179586 / numCheckPoint * i;
      array2[i] = eval(letter + i);
      array1[i] = {};
      i++;
   }
   i = 0;
   while(i < numCheckPoint - 1)
   {
      array1[i].x = (array2[i]._x + array2[i + 1]._x) / 2;
      array1[i].y = (array2[i]._y + array2[i + 1]._y) / 2;
      i++;
   }
   array1[i].x = (array2[i]._x + array2[0]._x) / 2;
   array1[i].y = (array2[i]._y + array2[0]._y) / 2;
}
function affectTrack(crntRaceTrack, player)
{
   var _loc1_ = player;
   var _loc2_ = crntRaceTrack;
   if(_loc2_ == 0 || _loc2_ == 2)
   {
      _loc1_.crntRaceTrack = 1;
   }
   else
   {
      _loc1_.crntRaceTrack = random(2) >= 1 ? 2 : 0;
   }
   if(_loc2_ == 0)
   {
      _loc1_.points = mg2.points0;
      _loc1_.mid = mg2.mid0;
   }
   else if(_loc2_ == 1)
   {
      _loc1_.points = mg2.points1;
      _loc1_.mid = mg2.mid1;
   }
   else
   {
      _loc1_.points = mg2.points2;
      _loc1_.mid = mg2.mid2;
   }
}
function launchEvent(typeEvent, ranPoint)
{
   var pointMC = eval("p" + ranPoint);
   var pointMC2 = ranPoint >= 1 ? eval("p" + (ranPoint - 1)) : p17;
   var newDepth = getNewDepth("event");
   if(typeEvent == 0)
   {
      var eventMC = arrow.duplicateMovieClip("arrow" + newDepth,newDepth);
      eventMC.type = "arrow";
   }
   else if(typeEvent == 1)
   {
      var eventMC = web.duplicateMovieClip("web" + newDepth,newDepth);
      eventMC.type = "web";
   }
   else
   {
      var eventMC = health.duplicateMovieClip("health" + newDepth,newDepth);
      eventMC.type = "health";
   }
   eventMC.Name = "e" + newDepth;
   eventMC._x = pointMC._x;
   eventMC._y = pointMC._y;
   eventMC._rotation = Math.atan2(pointMC2._y - pointMC._y,pointMC2._x - pointMC._x) * 180 / 3.141592653589793 - 90;
   eventMC.timeLeft = 250;
   eventArr.push(eventMC);
}
function run()
{
   var _loc3_ = this;
   if(!PAUSE)
   {
      if(timeNextEvent < 1)
      {
         if(hasToken)
         {
            selectAndSendEvent();
         }
         timeNextEvent = 50 + random(70);
      }
      else
      {
         timeNextEvent--;
      }
      for(var i in raceData)
      {
         var _loc2_ = raceData[i].MC;
         if(raceData[i] != undefined && raceData[i] != "" && raceData[i].type != "p2")
         {
            if(raceData[i].type == "cpu")
            {
               robotCtrl(_loc2_);
            }
            else
            {
               playerCtrl(_loc2_);
            }
            for(var j in eventArr)
            {
               var _loc1_ = eventArr[j];
               _loc1_.timeLeft = _loc1_.timeLeft - 1;
               if(_loc1_.timeLeft <= 0 && _loc1_.state == "idle")
               {
                  if(_loc3_.gameType == "multi")
                  {
                     root.gameSO.send("removeEvent",_loc1_.Name);
                  }
                  clearEvent(_loc1_);
               }
               else if(_loc2_.hitZone.hitTest(_loc1_))
               {
                  if(_loc1_.state == "idle")
                  {
                     if(_loc1_.type == "arrow")
                     {
                        _loc2_.modifier = 1.05;
                        _loc2_.specialTime = 50;
                     }
                     else if(_loc1_.type == "web")
                     {
                        _loc2_.modifier = 0.8;
                        _loc2_.specialTime = 70;
                     }
                     else if(_loc2_.damage != 0)
                     {
                        _loc2_.damage = 0;
                        energy.refillBar();
                     }
                     if(_loc3_.gameType == "multi")
                     {
                        root.gameSO.send("removeEvent",_loc1_.Name);
                     }
                     clearEvent(_loc1_);
                  }
               }
            }
            if(startLine.hitTest(_loc2_))
            {
               if(raceData[i].gate == gatesTotal)
               {
                  raceData[i].lap = raceData[i].lap + 1;
                  if(raceData[i].type == "me")
                  {
                     if(raceData[i].lap > lapTotal)
                     {
                        trace("FINISH");
                        PAUSE = true;
                        stopTimer();
                        setRaceData();
                        delete _loc3_.onEnterFrame;
                        for(var j in eventArr)
                        {
                           eventArr[j].removeMovieClip();
                        }
                        if(i == 0)
                        {
                           if(_loc3_.gameType == "multi")
                           {
                              root.gameSO.send("setEndScreen");
                           }
                           else
                           {
                              win.gotoAndPlay(2);
                           }
                        }
                        else
                        {
                           lose.gotoAndPlay(2);
                        }
                     }
                     else
                     {
                        setLapText(raceData[i].lap);
                     }
                  }
                  else if(raceData[i].lap > lapTotal)
                  {
                     raceData[i].MC.isDone = true;
                  }
                  raceData[i].gate = 0;
               }
            }
            var nextGate = _loc3_["g" + raceData[i].gate];
            if(nextGate.hitTest(_loc2_))
            {
               nextGate.fct(_loc2_);
               if(raceData[i].gate != gatesTotal)
               {
                  raceData[i].gate = raceData[i].gate + 1;
               }
            }
            if(raceData[i].type == "me")
            {
               setPosFlag(posMarker,_loc2_);
               myPos = i;
               posMarker.gotoAndStop(Number(i) + Number(1));
            }
         }
      }
   }
   if(refreshFlag < 1)
   {
      refreshFlag = 10;
      raceData.sort(compare);
      setRaceData();
   }
   else
   {
      refreshFlag--;
   }
}
function incSeg(player)
{
   var _loc1_ = player;
   _loc1_.seg = _loc1_.seg + 1;
   _loc1_.seg2 = _loc1_.seg + 1;
   if(_loc1_.seg >= numCheckPoint - 1)
   {
      _loc1_.seg2 = 0;
   }
   if(_loc1_.seg >= numCheckPoint)
   {
      _loc1_.seg = 0;
      _loc1_.seg2 = 1;
   }
}
function cleanAllScreen()
{
   var _loc2_ = this;
   for(var _loc1_ in eventArr)
   {
      eventArr[_loc1_].removeMovieClip();
   }
   _loc1_ = 0;
   while(_loc1_ < 4)
   {
      _loc2_["s" + _loc1_].removeMovieClip();
      _loc1_ = _loc1_ + 1;
   }
   posMarker.removeMovieClip();
   bridge.removeMovieClip();
   win.removeMovieClip();
   lose.removeMovieClip();
   init.removeMovieClip();
   posInterval.clearInterval();
}
blocker.useHandCursor = false;
intId = setInterval(fpsFCT,1000);
radVal = 0.017453292519943295;
ldepth = 0;
eventArr = new Array();
depthSpider = 0;
depthSpider2 = 200;
depthEvent = 300;
depthBridge = 100;
depthFlag = 400;
depthOverAll = 500;
myPos = 4;
PAUSE = false;
sec = 0;
min = 0;
raceData = new Array("","","","");
var i = 0;
while(i < gameDesc.length)
{
   raceData[i] = gameDesc[i];
   raceData[i].MC = "";
   raceData[i].pos = 0;
   raceData[i].gate = 1;
   raceData[i].lap = 1;
   i++;
}
setLapText = function(lapUpdate)
{
   lapTxt.text = lapUpdate + "/" + lapTotal;
};
incTime = function()
{
   sec++;
   if(sec == 60)
   {
      sec = 0;
      min++;
   }
   sec >= 10 ? (strSec = sec) : (strSec = "0" + sec);
   min >= 10 ? (strMin = min) : (strMin = "0" + min);
   minTxt.text = strMin;
   secTxt.text = strSec;
};
startTimer = function()
{
   timeInt = setInterval(incTime,1000);
};
stopTimer = function()
{
   clearInterval(timeInt);
};
setRaceData = function()
{
   var i = 0;
   while(i < 4)
   {
      if(raceData[i] != undefined && raceData[i] != "")
      {
         if(raceData[i].n == "Igneous" || raceData[i].n == "Magma" || raceData[i].n == "Hunter" && gameType == "single")
         {
            this["charDesc" + i].charFace.gotoAndStop(raceData[i].n);
            this["charDesc" + i].charFace.char.desc = raceData[i];
            this["charDesc" + i].nameTxt.text = raceData[i].n;
            this["charDesc" + i]._visible = true;
            this["charDesc" + i].mc_myself._visible = false;
            if(!hasInit)
            {
               this["s" + i].gotoAndStop(raceData[i].n);
               raceData[i].MC = this["s" + i];
               raceData[i].MC.swapDepths(getNewDepth("spider"));
               raceData[i].type = "cpu";
               affectTrack(random(2),this["s" + i]);
            }
         }
         else
         {
            if(raceData[i].sx == "male")
            {
               this["charDesc" + i].charFace.gotoAndStop("charBoy");
            }
            else
            {
               this["charDesc" + i].charFace.gotoAndStop("charGirl");
            }
            this["charDesc" + i].charFace.char.desc = raceData[i];
            this["charDesc" + i].nameTxt.text = raceData[i].n;
            this["charDesc" + i].mc_myself._visible = true;
            if(!hasInit)
            {
               var mySpiderCar = eval("s" + i);
               raceData[i].MC = mySpiderCar;
               raceData[i].MC.swapDepths(getNewDepth("spider"));
               if(raceData[i].n == root.playerStats.Name)
               {
                  mySpiderCar.gotoAndStop(mySpider);
                  if(this.gameType == "multi")
                  {
                     posInterval = setInterval(sendPosition,500);
                  }
                  raceData[i].type = "me";
               }
               else
               {
                  mySpiderCarC = new Color(mySpiderCar);
                  switchColor = new Object();
                  switchColor = {ra:"20",rb:"0",ga:"100",gb:"0",ba:"100",bb:"0",aa:"100",ab:"0"};
                  mySpiderCarC.setTransform(switchColor);
                  mySpiderCar.gotoAndStop(mySpider);
                  raceData[i].type = "p2";
                  mySpiderCar.swapDepths(getNewDepth("overAll"));
               }
               setLapText(1);
            }
         }
         this["maskDesc" + i]._visible = false;
      }
      else
      {
         if(!hasInit)
         {
            this["s" + i]._visible = false;
         }
         this["charDesc" + i]._visible = false;
         this["maskDesc" + i]._visible = true;
      }
      i++;
   }
   if(!hasInit)
   {
      this.onEnterFrame = run;
      trace("run Fct affected");
      hasInit = true;
   }
};
selectAndSendEvent = function()
{
   var _loc1_ = random(3);
   var _loc2_ = random(17);
   if(this.gameType == "single")
   {
      launchEvent(_loc1_,_loc2_);
   }
   else
   {
      root.gameSO.send("sendEvent",_loc1_,_loc2_);
   }
};
removeEvent = function(Name)
{
   var _loc1_ = Name;
   for(var _loc2_ in eventArr)
   {
      if(eventArr[_loc2_].Name == _loc1_)
      {
         clearEvent(eventArr[_loc2_]);
         break;
      }
   }
};
clearEvent = function(eMC)
{
   var _loc1_ = eMC;
   if(_loc1_.state == "idle")
   {
      _loc1_.state = "hide";
      _loc1_.gotoAndPlay("hide");
   }
};
setPosFlag = function(mc, plyr)
{
   mc._x = plyr._x;
   mc._y = plyr._y;
};
setStartFlag = function(crntNumber)
{
   if(!hasToken)
   {
      init.gotoAndPlay("nbr" + crntNumber);
   }
};
setStartFlagTo = function(crntNumber)
{
   var _loc1_ = crntNumber;
   if(_loc1_ >= 0)
   {
      if(hasToken)
      {
         init.gotoAndPlay("nbr" + _loc1_);
         if(this.gameType == "multi")
         {
            root.gameSO.send("setStartFlag",_loc1_);
         }
         init.play();
      }
   }
   else
   {
      PAUSE = false;
      startTimer();
      init.gotoAndStop(1);
   }
};
compare = function(a, b)
{
   var _loc1_ = b;
   var _loc2_ = a;
   if(_loc2_.lap > _loc1_.lap)
   {
      return -1;
   }
   if(_loc2_.lap == _loc1_.lap)
   {
      if(_loc2_.gate > _loc1_.gate)
      {
         return -1;
      }
      if(_loc2_.gate == _loc1_.gate)
      {
         return 0;
      }
      return 1;
   }
   return 1;
};
playerCtrl = function(player)
{
   var _loc1_ = player;
   if(_loc1_.specialTime > 0)
   {
      _loc1_.specialTime = _loc1_.specialTime - 1;
      if(_loc1_.specialTime <= 0)
      {
         _loc1_.modifier = 1;
      }
   }
   var _loc2_ = Key.isDown(39);
   var _loc3_ = Key.isDown(37);
   var kyU = Key.isDown(38);
   if(_loc2_)
   {
      if(_loc1_.crntAngle < _loc1_.maxAngle)
      {
         _loc1_.crntAngle += _loc1_.turnRate;
      }
      else
      {
         _loc1_.crntAngle = 0;
      }
      _loc1_.xSpeed *= _loc1_.decay2;
      _loc1_.ySpeed *= _loc1_.decay2;
      _loc1_._rotation = _loc1_.crntAngle;
   }
   if(_loc3_)
   {
      if(_loc1_.crntAngle > 0)
      {
         _loc1_.crntAngle -= _loc1_.turnRate;
      }
      else
      {
         _loc1_.crntAngle = _loc1_.maxAngle;
      }
      _loc1_.xSpeed *= _loc1_.decay2;
      _loc1_.ySpeed *= _loc1_.decay2;
      _loc1_._rotation = _loc1_.crntAngle;
   }
   if(kyU)
   {
      _loc1_.xSpeed += _loc1_.trust * Math.sin(_loc1_.crntAngle * radVal);
      _loc1_.ySpeed += _loc1_.trust * Math.cos(_loc1_.crntAngle * radVal);
   }
   else if(!_loc2_ && !_loc3_)
   {
      _loc1_.xSpeed *= _loc1_.decay;
      _loc1_.ySpeed *= _loc1_.decay;
   }
   _loc1_.xSpeed *= _loc1_.modifier;
   _loc1_.ySpeed *= _loc1_.modifier;
   _loc1_.speed = Math.sqrt(_loc1_.xSpeed * _loc1_.xSpeed + _loc1_.ySpeed * _loc1_.ySpeed);
   if(_loc1_.modifier <= 1)
   {
      if(_loc1_.speed > _loc1_.maxSpeed)
      {
         _loc1_.xSpeed *= _loc1_.maxSpeed / _loc1_.speed;
         _loc1_.ySpeed *= _loc1_.maxSpeed / _loc1_.speed;
      }
   }
   else if(_loc1_.speed > _loc1_.maxSpeed2)
   {
      _loc1_.xSpeed *= _loc1_.maxSpeed2 / _loc1_.speed;
      _loc1_.ySpeed *= _loc1_.maxSpeed2 / _loc1_.speed;
   }
   if(myTrack == 3)
   {
      if(_loc1_.mcBlocker.hitTest(_loc1_._x + _loc1_.xSpeed,_loc1_._y - _loc1_.ySpeed,true))
      {
         _loc1_.spider.gotoAndStop("bump");
         _loc1_.xSpeed *= _loc1_.speedRebound;
         _loc1_.ySpeed *= _loc1_.speedRebound;
         _loc1_._x += _loc1_.xSpeed / _loc1_.decRebound;
         _loc1_._y -= _loc1_.ySpeed / _loc1_.decRebound;
         _loc1_.damage += _loc1_.resistance;
         if(_loc1_.damage >= _loc1_.totalEnergy)
         {
            energy.gotoAndPlay("empty");
            _loc1_.damage = 0;
            _loc1_.modifier = 0;
            _loc1_.specialTime = 50;
         }
         if(energy._currentframe == 1)
         {
            energy.refreshBar(_loc1_.totalEnergy - _loc1_.damage,_loc1_.totalEnergy);
         }
      }
   }
   if(hitZone.hitTest(_loc1_._x + _loc1_.xSpeed,_loc1_._y - _loc1_.ySpeed,true))
   {
      _loc1_.spider.gotoAndStop("bump");
      _loc1_.xSpeed *= _loc1_.speedRebound;
      _loc1_.ySpeed *= _loc1_.speedRebound;
      _loc1_._x += _loc1_.xSpeed / _loc1_.decRebound;
      _loc1_._y -= _loc1_.ySpeed / _loc1_.decRebound;
      _loc1_.damage += _loc1_.resistance;
      if(_loc1_.damage >= _loc1_.totalEnergy)
      {
         energy.gotoAndPlay("empty");
         _loc1_.damage = 0;
         _loc1_.modifier = 0;
         _loc1_.specialTime = 50;
      }
      if(energy._currentframe == 1)
      {
         energy.refreshBar(_loc1_.totalEnergy - _loc1_.damage,_loc1_.totalEnergy);
      }
   }
   else
   {
      _loc1_._x += _loc1_.xSpeed;
      _loc1_._y -= _loc1_.ySpeed;
   }
};
sendPosition = function()
{
   for(var _loc1_ in raceData)
   {
      if(raceData[_loc1_].n == root.playerStats.Name)
      {
         root.gameSO.send("sendPosition",root.playerStats.Name,raceData[_loc1_].MC._x,raceData[_loc1_].MC._y,raceData[_loc1_].MC._rotation,raceData[_loc1_].gate,raceData[_loc1_].lap);
         break;
      }
   }
};
setRemotePosition = function(Name, nx, ny, nr, ng, nl)
{
   var _loc1_ = Name;
   var _loc2_ = nr;
   var _loc3_ = nl;
   for(var j in raceData)
   {
      if(raceData[j].n == _loc1_)
      {
         raceData[j].MC._x = Number(nx);
         raceData[j].MC._y = Number(ny);
         raceData[j].MC._rotation = Number(_loc2_);
         raceData[j].gate = Number(ng);
         raceData[j].lap = Number(_loc3_);
         break;
      }
   }
};
robotCtrl = function(player)
{
   var _loc1_ = player;
   if(_loc1_.isDone != true)
   {
      if(_loc1_.specialTime > 0)
      {
         _loc1_.specialTime = _loc1_.specialTime - 1;
         if(_loc1_.specialTime <= 0)
         {
            _loc1_.modifier = 1;
         }
      }
      if(_loc1_.timeSpdModify < 0)
      {
         if(_loc1_.vSpeed > _loc1_.vSpeedMax)
         {
            _loc1_.vSpeed -= 0.01;
         }
         else if(_loc1_.vSpeed < _loc1_.vSpeedMin)
         {
            _loc1_.vSpeed += 0.01;
         }
         else
         {
            random(2) >= 1 ? (_loc1_.vSpeed -= 0.01) : (_loc1_.vSpeed += 0.01);
         }
         _loc1_.timeSpdModify = 50 + random(100);
      }
      else
      {
         _loc1_.timeSpdModify = _loc1_.timeSpdModify - 1;
      }
      _loc1_.t += _loc1_.speed;
      if(_loc1_.t > 0.99)
      {
         _loc1_.t = 0;
         incSeg(_loc1_);
         _loc1_.speed = _loc1_.vSpeed * _loc1_.modifier;
         if(random(7) < 1)
         {
            affectTrack(_loc1_.crntRaceTrack,_loc1_);
         }
         _loc1_.mid1.x = _loc1_.projectedX != undefined ? _loc1_.projectedX : _loc1_.mid[_loc1_.seg].x;
         _loc1_.mid1.y = _loc1_.projectedY != undefined ? _loc1_.projectedY : _loc1_.mid[_loc1_.seg].y;
         _loc1_.point2.x = _loc1_.points[_loc1_.seg2]._x;
         _loc1_.point2.y = _loc1_.points[_loc1_.seg2]._y;
         _loc1_.mid2.x = _loc1_.projectedX = _loc1_.mid[_loc1_.seg2].x;
         _loc1_.mid2.y = _loc1_.projectedY = _loc1_.mid[_loc1_.seg2].y;
      }
      _loc1_._x = _loc1_.mid1.x * (1 - _loc1_.t) * (1 - _loc1_.t) + 2 * _loc1_.point2.x * (1 - _loc1_.t) * _loc1_.t + _loc1_.mid2.x * _loc1_.t * _loc1_.t;
      _loc1_._y = _loc1_.mid1.y * (1 - _loc1_.t) * (1 - _loc1_.t) + 2 * _loc1_.point2.y * (1 - _loc1_.t) * _loc1_.t + _loc1_.mid2.y * _loc1_.t * _loc1_.t;
      _loc1_.vx = _loc1_._x - _loc1_.oldx;
      _loc1_.vy = _loc1_._y - _loc1_.oldy;
      _loc1_.oldx = _loc1_._x;
      _loc1_.oldy = _loc1_._y;
      _loc1_.trot = Math.atan2(_loc1_.vy,_loc1_.vx) * 180 / 3.141592653589793 + _loc1_.rotOffset;
      _loc1_.diff = _loc1_.trot - _loc1_._rotation;
      if(_loc1_.diff < 1 && _loc1_.diff > -1)
      {
         _loc1_.diff = 0;
      }
      else
      {
         if(_loc1_.diff > 180)
         {
            _loc1_.diff -= 360;
         }
         if(_loc1_.diff < -180)
         {
            _loc1_.diff += 360;
         }
         _loc1_.vrot = _loc1_.diff / 2;
      }
      _loc1_._rotation += _loc1_.vrot;
   }
};
trace("gotoAndPlay  " + myTrack);
gotoAndPlay("track" + myTrack);
