function setWaveMeter()
{
   var _loc1_ = this[playerID + "_info"];
   _loc1_.timeClearWave = _loc1_.timeClearWave - 1;
   if(_loc1_.timeClearWave + _loc1_.penaltyTime > initTimeClearWave)
   {
      _loc1_.timeClearWave = initTimeClearWave;
      _loc1_.penaltyTime = 0;
   }
   _loc1_.meter.meter.adjust(_loc1_.timeClearWave + _loc1_.penaltyTime);
   if(_loc1_.timeClearWave + _loc1_.penaltyTime <= 0)
   {
      showResults();
   }
}
function keyCheck(arrPos)
{
   var _loc1_ = parseInt(arrPos) + 1;
   if(_loc1_ == 1)
   {
      return Key.isDown(97);
   }
   if(_loc1_ == 2)
   {
      return Key.isDown(98);
   }
   if(_loc1_ == 3)
   {
      return Key.isDown(99);
   }
   if(_loc1_ == 4)
   {
      return Key.isDown(100);
   }
   if(_loc1_ == 6)
   {
      return Key.isDown(102);
   }
   if(_loc1_ == 7)
   {
      return Key.isDown(103);
   }
   if(_loc1_ == 8)
   {
      return Key.isDown(104);
   }
   if(_loc1_ == 9)
   {
      return Key.isDown(105);
   }
}
function keyCheckLaptop(arrPos)
{
   var _loc1_ = parseInt(arrPos) + 1;
   if(_loc1_ == 1)
   {
      return Key.isDown(90);
   }
   if(_loc1_ == 2)
   {
      return Key.isDown(88);
   }
   if(_loc1_ == 3)
   {
      return Key.isDown(67);
   }
   if(_loc1_ == 4)
   {
      return Key.isDown(65);
   }
   if(_loc1_ == 6)
   {
      return Key.isDown(68);
   }
   if(_loc1_ == 7)
   {
      return Key.isDown(81);
   }
   if(_loc1_ == 8)
   {
      return Key.isDown(87);
   }
   if(_loc1_ == 9)
   {
      return Key.isDown(69);
   }
}
function getNextWave()
{
   var _loc1_ = this;
   if(getTimer() - initTimer < 5000)
   {
      score += 2450;
   }
   else if(getTimer() - initTimer < 15000)
   {
      score += 1250;
   }
   else
   {
      score += 450;
   }
   _loc1_[playerID + "_info"].scoreTxt.text = score;
   initTimer = getTimer();
   if(crntWave == 1)
   {
      diffLvl = 5;
      initAtckRate = 18;
   }
   else if(crntWave == 2)
   {
      diffLvl = 2;
      initAtckRate = 13;
   }
   crntWave++;
   _loc1_[playerID + "_info"].timeClearWave = initTimeClearWave;
   _loc1_[playerID + "_info"].penaltyTime = 0;
}
function adjustDifficulty()
{
   diffLvl -= 4;
   initAtckRate -= 6;
   if(initAtckRate < -10)
   {
      initAtckRate = -10;
   }
   if(diffLvl < 2)
   {
      diffLvl = 2;
   }
}
function setAnim(senderID, charID, typeAnim, mWidth, score)
{
   var _loc1_ = senderID;
   var _loc2_ = this;
   var _loc3_ = typeAnim;
   if(_loc3_ != "death")
   {
      if(_loc1_ != playerID)
      {
         _loc2_[_loc1_ + "_info"].meter.meter._width = mWidth;
         _loc2_[_loc1_ + "_info"].scoreTxt.text = score;
         if(_loc3_ == "hurt")
         {
            _loc2_[_loc1_ + "_" + charID].gotoAndPlay(_loc3_);
            _loc2_["t" + _loc1_ + "_" + charID].gotoAndStop(1);
         }
         else
         {
            _loc2_[_loc1_ + "_" + charID].char.gotoAndPlay(_loc3_);
            _loc2_["t" + _loc1_ + "_" + charID].gotoAndPlay(_loc3_);
         }
      }
   }
   else
   {
      var otherPlayerID = _loc1_ != 1 ? 1 : 2;
      _loc2_[otherPlayerID + "_info"].scoreTxt.text = score;
      _loc2_[_loc1_ + "_5"].gotoAndStop("death");
      textWindow.drawWindow(mWidth);
      getNextWave();
      _loc2_[_loc1_ + "_5"].gotoAndStop("death");
      resetTile(9);
      delete _loc2_.onEnterFrame;
   }
}
function work()
{
   var _loc1_ = this;
   var k1 = Key.isDown(97);
   var k2 = Key.isDown(98);
   var k3 = Key.isDown(99);
   var k4 = Key.isDown(100);
   var k6 = Key.isDown(102);
   var k7 = Key.isDown(103);
   var k8 = Key.isDown(104);
   var k9 = Key.isDown(105);
   var k1_2 = Key.isDown(90);
   var k2_2 = Key.isDown(88);
   var k3_2 = Key.isDown(67);
   var k4_2 = Key.isDown(65);
   var k6_2 = Key.isDown(68);
   var k7_2 = Key.isDown(81);
   var k8_2 = Key.isDown(87);
   var k9_2 = Key.isDown(69);
   if(k1 || k1_2)
   {
      _loc1_["t" + playerID + "_1"].highLight.play();
   }
   else if(k2 || k2_2)
   {
      _loc1_["t" + playerID + "_2"].highLight.play();
   }
   else if(k3 || k3_2)
   {
      _loc1_["t" + playerID + "_3"].highLight.play();
   }
   else if(k4 || k4_2)
   {
      _loc1_["t" + playerID + "_4"].highLight.play();
   }
   else if(k6 || k6_2)
   {
      _loc1_["t" + playerID + "_6"].highLight.play();
   }
   else if(k7 || k7_2)
   {
      _loc1_["t" + playerID + "_7"].highLight.play();
   }
   else if(k8 || k8_2)
   {
      _loc1_["t" + playerID + "_8"].highLight.play();
   }
   else if(k9 || k9_2)
   {
      _loc1_["t" + playerID + "_9"].highLight.play();
   }
   var _loc2_ = 0;
   while(_loc2_ < guardsArr.length)
   {
      if(_loc2_ != 4)
      {
         if(guardsArr[_loc2_].char._currentframe > 1)
         {
            if(keyCheck(_loc2_) || keyCheckLaptop(_loc2_))
            {
               if(guardsArr[_loc2_].available)
               {
                  var _loc3_ = _loc1_[playerID + "_info"];
                  _loc3_.penaltyTime -= penaltyRate;
                  guardsArr[_loc2_].available = false;
                  score += 75;
                  _loc1_[playerID + "_info"].scoreTxt.text = score;
                  guardsArr[_loc2_].gotoAndStop("hurt");
                  _loc1_["t" + playerID + "_" + (_loc2_ + 1)].gotoAndStop(1);
                  if(score >= goalArr[0] && goalArr.length > 0)
                  {
                     goalArr.shift();
                     adjustDifficulty();
                  }
               }
               else
               {
                  _loc1_[playerID + "_info"].penaltyTime += penaltyRate / 10;
               }
            }
         }
      }
      _loc2_ = _loc2_ + 1;
   }
   atckRate--;
   if(atckRate <= 0)
   {
      var ranGuard = random(9) + 1;
      var nbGuardAtck = 0;
      _loc2_ = 0;
      while(_loc2_ < guardsArr.length)
      {
         if(guardsArr[_loc2_].char._currentframe > 1)
         {
            nbGuardAtck++;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(ranGuard != 5 && nbGuardAtck < 3)
      {
         if(_loc1_[playerID + "_" + ranGuard].char._currentframe < 2)
         {
            atckRate = initAtckRate + random(30);
            _loc1_[playerID + "_" + ranGuard].char.gotoAndPlay("atck");
            _loc1_["t" + playerID + "_" + ranGuard].gotoAndPlay("atck");
         }
      }
   }
   setWaveMeter();
}
function resetTile(forLength)
{
   var _loc2_ = this;
   var _loc3_ = forLength;
   var _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      _loc2_["t1_" + _loc1_].gotoAndStop(1);
      _loc2_["1_" + _loc1_].gotoAndStop(1);
      _loc2_["t2_" + _loc1_].gotoAndStop(1);
      _loc2_["2_" + _loc1_].gotoAndStop(1);
      _loc1_ = _loc1_ + 1;
   }
}
function showResults(showEndWindow)
{
   var _loc1_ = this;
   delete _loc1_.onEnterFrame;
   resetTile(9);
   if(showEndWindow != false)
   {
      if(Number(_loc1_["1_info"].scoreTxt.text) > 0)
      {
         var _loc2_ = {Name:root.playerStats.name,Pts:_loc1_["1_info"].scoreTxt.text,Misc:"",winner:true};
      }
      else
      {
         _loc2_ = {Name:root.playerStats.name,Pts:_loc1_["1_info"].scoreTxt.text,Misc:"",winner:false};
      }
      root.mGameEndWindow.drawWindow(new Array(_loc2_),1);
   }
}
function setEnterFrame()
{
   atckRate = 30;
   resetTile(9);
   this.onEnterFrame = function()
   {
      if(!gameOver)
      {
         work();
      }
      else
      {
         showResults(false);
      }
   };
}
_quality = "LOW";
initTimer = getTimer();
penaltyRate = -50;
goalArr = new Array("200","450","700","1100","1450","2000","2800","3400","4000","5000","6000","7000","8000","9000","10000","14000","22000","30000","40000","50000","60000","70000","80000","90000","100000");
this["1_info"].penaltyTime = 0;
this["1_info"].timeClearWave = initTimeClearWave;
guardsArr = new Array(this[playerID + "_1"],this[playerID + "_2"],this[playerID + "_3"],this[playerID + "_4"],"",this[playerID + "_6"],this[playerID + "_7"],this[playerID + "_8"],this[playerID + "_9"]);
this[playerID + "_info"].scoreTxt.text = score;
setEnterFrame();
stop();
