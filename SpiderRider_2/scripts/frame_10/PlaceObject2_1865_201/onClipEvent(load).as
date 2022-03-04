onClipEvent(load){
   _global.mainChar = this;
   _global.charSpider = this;
   helpWordArr = new Array();
   helpWordIndx = 0;
   trace("LOAD CHAR SHEET");
   §§push(function drawWindow()
   {
      trace("char draw window");
      copytempSex = tempSex;
      copytypeSex = typeSex;
      copytypeHair = typeHair;
      copytypeEyes = typeEyes;
      copytypeSkin = typeSkin;
      copytypeBody = typeBody;
      copytypeLegs = typeLegs;
      copytypeArmor = typeArmor;
      copytypeManacle = typeManacle;
      copySprName = typeSprName;
      copySprSex = sprSex;
      copySprOffSet = sproffSet;
      copySprHead = sprHead;
      copySprBody = sprBody;
      copySprLegs = sprLegs;
      gotoAndStop("charSheet");
      openWindow();
   });
   §§push(function drawWindow2()
   {
      trace("char draw window2");
      copytempSex = tempSex;
      copytypeSex = typeSex;
      copytypeHair = typeHair;
      copytypeEyes = typeEyes;
      copytypeSkin = typeSkin;
      copytypeBody = typeBody;
      copytypeLegs = typeLegs;
      copytypeArmor = typeArmor;
      copytypeManacle = typeManacle;
      copySprName = typeSprName;
      copySprSex = sprSex;
      copySprOffSet = sproffSet;
      copySprHead = sprHead;
      copySprBody = sprBody;
      copySprLegs = sprLegs;
      gotoAndStop("spiderSheet");
      openWindow();
   });
   §§push(function drawWindow3()
   {
      trace("char draw window3");
      copytempSex = tempSex;
      copytypeSex = typeSex;
      copytypeHair = typeHair;
      copytypeEyes = typeEyes;
      copytypeSkin = typeSkin;
      copytypeBody = typeBody;
      copytypeLegs = typeLegs;
      copytypeArmor = typeArmor;
      copytypeManacle = typeManacle;
      copySprName = typeSprName;
      copySprSex = sprSex;
      copySprOffSet = sproffSet;
      copySprHead = sprHead;
      copySprBody = sprBody;
      copySprLegs = sprLegs;
      gotoAndStop("options");
      openWindow();
   });
   §§push(function openWindow()
   {
      _visible = true;
   });
   §§push(function getArrayWordBy(letter)
   {
      var _loc1_ = letter;
      helpWordArr = new Array();
      letterTxt.text = String(_loc1_);
      for(var _loc2_ in root.dictArr)
      {
         if(root.dictArr[_loc2_].charAt(0) == _loc1_.toLowerCase())
         {
            helpWordArr.push(root.dictArr[_loc2_]);
         }
      }
      helpWordIndx = 0;
      refreshWord();
      _loc2_;
      _loc1_;
   });
   §§push(function refreshWord()
   {
      var _loc2_ = 1;
      wordText1.text = "";
      wordText2.text = "";
      var _loc1_ = helpWordIndx;
      while(_loc1_ <= helpWordArr.length)
      {
         _loc2_ = _loc2_ + 1;
         if(_loc2_ <= 15)
         {
            wordText1.text = wordText1.text + (helpWordArr[_loc1_] + "\n");
         }
         else
         {
            wordText2.text = wordText2.text + (helpWordArr[_loc1_] + "\n");
         }
         if(_loc2_ == 29)
         {
            break;
         }
         _loc1_ = _loc1_ + 1;
      }
      _loc2_;
      _loc1_;
   });
   §§push(function closeWindow()
   {
      trace("char closeWindow");
      charChange = false;
      spiderChange = false;
      tempSex = copytempSex;
      typeSex = copytypeSex;
      typeHair = copytypeHair;
      typeEyes = copytypeEyes;
      typeSkin = copytypeSkin;
      typeBody = copytypeBody;
      typeLegs = copytypeLegs;
      typeArmor = copytypeArmor;
      typeManacle = copytypeManacle;
      typeSprSex = copySprSex;
      typeSprName = copySprName;
      typeSprOffSet = copySprOffSet;
      typeSprHead = copySprHead;
      typeSprBody = copySprBody;
      typeSprLegs = copySprLegs;
      gotoAndStop("closed");
      _visible = false;
   });
   §§push(function refreshPerso()
   {
      trace("refreshPerso");
      if(!armorChange)
      {
         if(armorCheck._currentframe == 2)
         {
            armorCheck.gotoAndStop(1);
            resetPerso();
         }
      }
      emptyClip.play();
   });
   §§push(function resetPerso()
   {
      trace("resetPerso");
      root.sfx.gotoAndPlay("clic");
      typeManacle = oldTypeManacle;
      typeBody = oldTypeBody;
      typeLegs = oldTypeLegs;
   });
   §§push(function saveInfoChar()
   {
      trace("saveInfoChar");
      charChange = false;
      copytempSex = root.tempSex = tempSex;
      copytypeSex = root.typeSex = typeSex;
      copytypeHair = root.typeHair = typeHair;
      copytypeEyes = root.typeEyes = typeEyes;
      copytypeSkin = root.typeSkin = typeSkin;
      copytypeBody = root.typeBody = oldTypeBody = typeBody;
      copytypeLegs = root.typeLegs = oldTypeLegs = typeLegs;
      copytypeArmor = root.typeArmor = typeArmor;
      copytypeManacle = root.typeManacle = oldTypeManacle = typeManacle;
      game.char.play();
      if(root.inWorld == true)
      {
         root.callChangeDesc();
      }
   });
   §§push(function saveInfoSpider()
   {
      trace("saveInfoSpider");
      spiderChange = false;
      copySprSex = root.sprSex = sprSex;
      copySprName = root.sprName = sprName = nameTxt.text;
      copySprOffSet = root.sproffSet = sproffSet;
      copySprHead = root.sprHead = sprHead;
      copySprBody = root.sprBody = sprBody;
      copySprLegs = root.sprLegs = sprLegs;
      root.playerStats.spider.Name = sprName;
   });
   if(root.typeSex == 0 || root.typeSex == undefined || root.typeSex == null)
   {
      tempSex = 1;
      typeSex = "male";
      typeHair = 1;
      typeEyes = 1;
      typeSkin = 1;
      typeBody = 1;
      typeLegs = 1;
      typeArmor = 1;
      typeManacle = 2;
      saveInfoChar();
   }
   else
   {
      tempSex = root.tempSex;
      typeSex = root.typeSex;
      typeHair = root.typeHair;
      typeEyes = root.typeEyes;
      typeSkin = root.typeSkin;
      typeBody = oldTypeBody = root.typeBody;
      typeLegs = oldTypeLegs = root.typeLegs;
      typeArmor = oldTypeArmor = root.typeArmor;
      typeManacle = oldTypeManacle = root.typeManacle;
   }
   if(root.sprSex == 0 || root.sprSex == undefined || root.sprSex == null)
   {
      sprSex = 1;
      sprName = "";
      sproffSet = 0;
      sprHead = 1;
      sprBody = 1;
      sprLegs = 1;
      saveInfoSpider();
   }
   else
   {
      sprSex = root.sprSex;
      sprName = root.sprName;
      sproffSet = root.sproffSet;
      sprHead = root.sprHead;
      sprBody = root.sprBody;
      sprLegs = root.sprLegs;
   }
}
