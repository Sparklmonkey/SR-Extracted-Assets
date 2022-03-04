stop();
mcOnPress.onPress = function()
{
   if(oCMG.mcClic._currentframe == 1)
   {
      if(bPeutAttraperSablier and mcObjectif.camera.focus.hitTest(mcSablier))
      {
         mcSablier.frame = NB_FRAMES_DUREE_SABLIER;
         bPeutAttraperSablier = false;
         initTime += 10;
      }
      else
      {
         var _loc1_ = new Object();
         _loc1_ = {x:oCMG.mcObjectif._x,y:oCMG.mcObjectif._y,m1:oCMG.mcM1._currentframe,m2:oCMG.mcM2._currentframe,m3:oCMG.mcM3._currentframe,m4:oCMG.mcM4._currentframe,m5:oCMG.mcM5._currentframe,m6:oCMG.mcM6._currentframe,m7:oCMG.mcM7._currentframe,m8:oCMG.mcM8._currentframe,m9:oCMG.mcM9._currentframe,m10:oCMG.mcM10._currentframe,m11:oCMG.mcM11._currentframe,m12:oCMG.mcM12._currentframe,m13:oCMG.mcM13._currentframe,m14:oCMG.mcM14._currentframe,nMul1:oCMG.aMonsterPos.mcM1,nMul2:oCMG.aMonsterPos.mcM2,nMul3:oCMG.aMonsterPos.mcM3,nMul4:oCMG.aMonsterPos.mcM4,nMul5:oCMG.aMonsterPos.mcM5,nMul6:oCMG.aMonsterPos.mcM6,nMul7:oCMG.aMonsterPos.mcM7,nMul8:oCMG.aMonsterPos.mcM8,nMul9:oCMG.aMonsterPos.mcM9,nMul10:oCMG.aMonsterPos.mcM10,nMul11:oCMG.aMonsterPos.mcM11,nMul12:oCMG.aMonsterPos.mcM12,nMul13:oCMG.aMonsterPos.mcM13,nMul14:oCMG.aMonsterPos.mcM14};
         oCMG.aPhotoCoor.push(_loc1_);
         if(oCMG.aPhotoCoor.length >= 9)
         {
            fEndGame();
         }
         else
         {
            oCMG.mcCam.nPhoto.text = 9 - oCMG.aPhotoCoor.length;
            oCMG.mcClic.play();
         }
      }
   }
};
fMoveCam = function(bLeft, vitesse)
{
   if(bLeft)
   {
      xTempMov = mcCam._x - vitesse;
      if(xTempMov <= oCMG.MIN_X)
      {
         xTempMov = oCMG.MIN_X;
      }
   }
   else
   {
      xTempMov = mcCam._x + vitesse;
      if(xTempMov >= oCMG.MAX_X)
      {
         xTempMov = oCMG.MAX_X;
      }
   }
   mcCam._x = xTempMov;
   oCMG.mcCam.camControl();
};
this.onEnterFrame = function()
{
   var _loc1_ = this;
   if(!gamePause)
   {
      CAM_WIDTH = 640;
      xTemp = _loc1_.mcCam._xmouse + CAM_WIDTH / 2;
      oCMG.mcObjectif._x = _loc1_._xmouse;
      if(xTemp <= oCMG.mcObjectif.camera.focus._width / 2)
      {
         oCMG.mcObjectif._x = oCMG.mcObjectif.camera.focus._width / 2 + _loc1_.mcCam._x - CAM_WIDTH / 2;
      }
      else if(xTemp + 20 >= CAM_WIDTH - oCMG.mcObjectif.camera.focus._width / 2)
      {
         oCMG.mcObjectif._x -= xTemp - (CAM_WIDTH - oCMG.mcObjectif.camera.focus._width / 2);
      }
      oCMG.mcObjectif._y = _loc1_._ymouse;
      if(oCMG.mcObjectif._y >= _loc1_.mcCam._height - oCMG.mcObjectif.camera.focus._height / 2 - _loc1_.mcCam._y)
      {
         oCMG.mcObjectif._y = _loc1_.mcCam._height - oCMG.mcObjectif.camera.focus._height / 2 - _loc1_.mcCam._y;
      }
      else if(oCMG.mcObjectif._y <= oCMG.mcObjectif.camera.focus._height / 2 + 20)
      {
         oCMG.mcObjectif._y = oCMG.mcObjectif.camera.focus._height / 2 + 20;
      }
      if(xTemp <= oCMG.RANGE_MOVE_X)
      {
         fMoveCam(true,(oCMG.RANGE_MOVE_X - xTemp) / oCMG.RANGE_MOVE_X * oCMG.VITESSE_MOVE);
      }
      if(xTemp >= CAM_WIDTH - oCMG.RANGE_MOVE_X)
      {
         fMoveCam(false,(oCMG.RANGE_MOVE_X - (CAM_WIDTH - xTemp)) / oCMG.RANGE_MOVE_X * oCMG.VITESSE_MOVE);
      }
      iFrame++;
      if(iFrame >= NB_FRAMES_LAUNCH_MONSTRES)
      {
         if(fLaunchMonstre())
         {
            iFrame = 0;
         }
      }
      if(!bSablierShown)
      {
         iFrameSablier++;
      }
      if(iFrameSablier >= NB_FRAMES_LAUNCH_SABLIER)
      {
         iFrameSablier = 0;
         fLaunchSablier();
      }
      crntTime = Math.floor(getTimer() / 1000);
      nSec = crntTime - initTime;
      oCMG.mcCam.mcTimer.text = fSecToTime(60 - nSec);
      if(nSec == 60)
      {
         fEndGame();
      }
   }
};
fLaunchSablier = function()
{
   var _loc1_ = this;
   spotRnd = random(5) + 1;
   mcSablier._x = _loc1_["mcSpot" + spotRnd]._x;
   mcSablier._y = _loc1_["mcSpot" + spotRnd]._y;
   mcSablier.gotoAndPlay("show");
   mcSablier.frame = 0;
   bSablierShown = true;
   bPeutAttraperSablier = true;
   mcSablier.onEnterFrame = function()
   {
      var _loc1_ = this;
      _loc1_.frame = _loc1_.frame + 1;
      if(_loc1_.frame >= oCMG.NB_FRAMES_DUREE_SABLIER)
      {
         _loc1_.gotoAndPlay("hide");
         oCMG.bSablierShown = false;
         delete _loc1_.onEnterFrame;
      }
   };
};
fEndGame = function()
{
   delete oCMG.onEnterFrame;
   delete mcOnPress.onPress;
   mcCam.endGame.gotoAndPlay("start");
   oCMG.bCheckPhoto = true;
};
fLaunchMonstre = function()
{
   pourcentage = random(100);
   if(pourcentage <= 10)
   {
      mcTemp = aTresRare[random(aTresRare.length)];
      if(mcTemp._currentframe != 1)
      {
         return false;
      }
      mcTemp.play();
      return true;
   }
   if(pourcentage <= 40)
   {
      mcTemp = aRare[random(aRare.length)];
      if(mcTemp._currentframe != 1)
      {
         return false;
      }
      mcTemp.play();
      return true;
   }
   mcTemp = aCommun[random(aCommun.length)];
   if(mcTemp._currentframe != 1)
   {
      return false;
   }
   mcTemp.play();
   return true;
};
fSaveHitTest = function(mcX1, mcX2, mcX3, mcName)
{
   var _loc1_ = _global;
   if(!oCMG.bCheckPhoto)
   {
      if(mcX1.hitTest(_loc1_.oCMG.mcObjectif.camera.focus))
      {
         nToucheObs = fToucheObstacle(mcX1,mcX3,mcName);
         if(nToucheObs != -1)
         {
            nMultiply = nToucheObs;
         }
         else
         {
            nMultiply = 1;
            if(mcX2.hitTest(_loc1_.oCMG.mcObjectif.camera.mcJaune))
            {
               nMultiply = 2;
               if(mcX3.hitTest(_loc1_.oCMG.mcObjectif.camera.mcRouge))
               {
                  nMultiply = 3;
               }
            }
         }
      }
      else
      {
         nMultiply = 0;
      }
      _loc1_.oCMG.aMonsterPos[mcName] = nMultiply;
   }
};
fToucheObstacle = function(mcHit, mcHitCritique, mcName)
{
   var _loc1_ = _global;
   var _loc2_ = mcHitCritique;
   var _loc3_ = mcHit;
   if(oCMG[mcName].nProfond >= 2)
   {
      if(_loc2_.hitTest(_loc1_.oCMG.mcObs11))
      {
         return 0;
      }
      if(_loc2_.hitTest(_loc1_.oCMG.mcObs12))
      {
         return 0;
      }
      if(_loc2_.hitTest(_loc1_.oCMG.mcObs13))
      {
         return 0;
      }
      if(_loc2_.hitTest(_loc1_.oCMG.mcObs14))
      {
         return 0;
      }
      if(_loc2_.hitTest(_loc1_.oCMG.mcObs21))
      {
         return 0;
      }
      if(_loc2_.hitTest(_loc1_.oCMG.mcObs22))
      {
         return 0;
      }
      if(_loc3_.hitTest(_loc1_.oCMG.mcObs11))
      {
         return 1;
      }
      if(_loc3_.hitTest(_loc1_.oCMG.mcObs12))
      {
         return 1;
      }
      if(_loc3_.hitTest(_loc1_.oCMG.mcObs13))
      {
         return 1;
      }
      if(_loc3_.hitTest(_loc1_.oCMG.mcObs14))
      {
         return 1;
      }
      if(_loc3_.hitTest(_loc1_.oCMG.mcObs21))
      {
         return 1;
      }
      if(_loc3_.hitTest(_loc1_.oCMG.mcObs22))
      {
         return 1;
      }
   }
   else if(oCMG[mcName].nProfond >= 1)
   {
      if(_loc2_.hitTest(_loc1_.oCMG.mcObs11))
      {
         return 0;
      }
      if(_loc2_.hitTest(_loc1_.oCMG.mcObs12))
      {
         return 0;
      }
      if(_loc2_.hitTest(_loc1_.oCMG.mcObs13))
      {
         return 0;
      }
      if(_loc2_.hitTest(_loc1_.oCMG.mcObs14))
      {
         return 0;
      }
      if(_loc3_.hitTest(_loc1_.oCMG.mcObs11))
      {
         return 1;
      }
      if(_loc3_.hitTest(_loc1_.oCMG.mcObs12))
      {
         return 1;
      }
      if(_loc3_.hitTest(_loc1_.oCMG.mcObs13))
      {
         return 1;
      }
      if(_loc3_.hitTest(_loc1_.oCMG.mcObs14))
      {
         return 1;
      }
   }
   return -1;
};
fSecToTime = function(nSec)
{
   var _loc1_ = nSec;
   return Math.floor(_loc1_ / 60) + ":" + (_loc1_ % 60 >= 10 ? _loc1_ % 60 : "0" + _loc1_ % 60);
};
oCMG.mcCam.mcTimer.text = fSecToTime(NB_SECONDES_TIMER_DEPART);
