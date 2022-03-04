nScoreFinal = 0;
iPhoto = 0;
oCMG.mcHUD.btnNextENFR.mcNext.onPress = function()
{
   if(oCMG.iPhoto >= oCMG.aPhotoCoor.length - 1)
   {
      oCMG.mcHUD.btnNextENFR.HIDE._visible = true;
      return undefined;
   }
   oCMG.mcHUD.btnPrevENFR.HIDE._visible = false;
   oCMG.mcHUD.btnNextENFR.HIDE._visible = false;
   oCMG.iPhoto = oCMG.iPhoto + 1;
   fCheckPhoto(oCMG.iPhoto);
   oCMG.mcHUD.transit.gotoAndPlay(2);
};
oCMG.mcHUD.btnPrevENFR.mcBack.onPress = function()
{
   if(oCMG.iPhoto <= 0)
   {
      oCMG.mcHUD.btnPrevENFR.HIDE._visible = true;
      return undefined;
   }
   oCMG.mcHUD.btnPrevENFR.HIDE._visible = false;
   oCMG.mcHUD.btnNextENFR.HIDE._visible = false;
   oCMG.iPhoto--;
   fCheckPhoto(oCMG.iPhoto);
   oCMG.mcHUD.transit.gotoAndPlay(2);
};
oCMG.mcHUD.btnRestartENFR.mcRestart.onPress = function()
{
   oCMG.showResults();
};
fCheckPhoto = function(nPhoto)
{
   var _loc2_ = nPhoto;
   var _loc1_ = oCMG.aPhotoCoor[_loc2_];
   tabAnim = new Array();
   nPoints = 0;
   nMonstres = 0;
   strMonstres = "";
   j = 1;
   while(j <= 14)
   {
      oCMG["mcM" + j].gotoAndStop(_loc1_["m" + j]);
      oCMG["mcM" + j].mcMonstre.gotoAndStop(1);
      if(_loc1_["nMul" + j] > 0)
      {
         nPoints += oCMG["mcM" + j + "_nPoints"] * _loc1_["nMul" + j];
         strMonstres += oCMG["mcM" + j + "_strName"] + "\r";
         nMonstres++;
         tabAnim.push(oCMG["mcM" + j]);
      }
      j++;
   }
   if(_loc1_.x <= oCMG.MIN_X)
   {
      mcCam._x = oCMG.MIN_X;
   }
   else if(_loc1_.x >= oCMG.MAX_X)
   {
      mcCam._x = oCMG.MAX_X;
   }
   else
   {
      mcCam._x = _loc1_.x;
   }
   mcCam._x = _loc1_.x;
   mcCam._y = _loc1_.y + 10;
   mcHUD._x = _loc1_.x;
   mcHUD._y = _loc1_.y + 10;
   mcCam.camControl();
   if(nPoints <= 50)
   {
      Greeting = root.getInsName("txtMG4_NotBad",root.parseKitMGames);
   }
   else if(nPoints <= 100)
   {
      Greeting = root.getInsName("txtMG4_GJ",root.parseKitMGames);
   }
   else
   {
      Greeting = root.getInsName("txtMG4_Great",root.parseKitMGames);
   }
   oCMG.mcHUD.mcScore.text = root.getInsName("txtMG4_Photo",root.parseKitMGames) + nPoints;
   oCMG.mcHUD.mcPhoto.text = "" + (_loc2_ + 1);
   oCMG.mcHUD.mcRank.text = Greeting;
   oCMG.mcHUD.mcMonstres.text = "" + nMonstres;
   oCMG.iAnim = 0;
   fAnimNext();
};
fAnimNext = function()
{
   tabAnim[oCMG.iAnim].nFois = 0;
   fFaitAnim(tabAnim[oCMG.iAnim]);
   oCMG.iAnim = oCMG.iAnim + 1;
};
fFaitAnim = function(mcTemp)
{
   var _loc1_ = mcTemp;
   var _loc2_ = this;
   _loc1_.couleur = new Color(_loc1_);
   _loc1_.mytrans = _loc1_.couleur.getTransform();
   _loc1_.rStart = _loc1_.mytrans.rb;
   _loc1_.gStart = _loc1_.mytrans.gb;
   _loc1_.bStart = _loc1_.mytrans.bb;
   _loc1_.onEnterFrame = function()
   {
      var _loc1_ = this;
      var mytrans = _loc1_.couleur.getTransform();
      mytrans.rb += 70;
      mytrans.gb += 70;
      mytrans.bb += 70;
      _loc1_.couleur.setTransform(mytrans);
      if(mytrans.bb >= 200)
      {
         _loc1_.onEnterFrame = function()
         {
            var _loc1_ = this;
            mytrans.rb -= 70;
            mytrans.gb -= 70;
            mytrans.bb -= 70;
            _loc1_.couleur.setTransform(mytrans);
            if(mytrans.bb <= 0)
            {
               _loc1_.nFois = _loc1_.nFois + 1;
               mytrans.rb = rStart;
               mytrans.gb = gStart;
               mytrans.bb = bStart;
               _loc1_.couleur.setTransform(mytrans);
               delete _loc1_.onEnterFrame;
               if(_loc1_.nFois <= oCMG.NB_HIGHLIGHT)
               {
                  oCMG.fFaitAnim(_loc1_);
               }
               else
               {
                  oCMG.fAnimNext();
               }
            }
         };
      }
   };
};
mcCam._xscale = 52;
mcCam._yscale = 50;
mcHUD._xscale = 53;
mcHUD._yscale = 51;
fCheckPhoto(0);
getFinalScore = function()
{
   k = 0;
   while(k < 9)
   {
      var _loc1_ = oCMG.aPhotoCoor[k];
      nPoints = 0;
      j = 1;
      while(j <= 14)
      {
         if(_loc1_["nMul" + j] > 0)
         {
            nPoints += oCMG["mcM" + j + "_nPoints"] * _loc1_["nMul" + j];
         }
         j++;
      }
      nScoreFinal += nPoints;
      k++;
   }
};
getFinalScore();
oCMG.mcHUD.mcFinalScore.text = root.getInsName("txtMG4_TotPts",root.parseKitMGames) + nScoreFinal;
changeScore(nScoreFinal);
stop();
