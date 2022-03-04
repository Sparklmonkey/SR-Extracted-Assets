onClipEvent(load){
   function addGuildObj(guildObjAdd, guildObjName, numObj)
   {
      var _loc2_ = guildObjAdd;
      var _loc3_ = numObj;
      var _loc1_ = 0;
      while(_loc1_ < _loc3_)
      {
         root.emptyClip.addObject(_loc2_);
         _loc1_ = _loc1_ + 1;
      }
      root.textWindow.drawWindow([root.getInsName("msgCongrats1",root.parseKitEvents) + guildObjName + root.getInsName("msgCongrats2",root.parseKitEvents)],0,root.textWindow.closeWindow);
      _loc3_;
      _loc2_;
      _loc1_;
   }
   function drawWindow(resultsArr, gameID, fct)
   {
      var _loc1_ = resultsArr;
      var _loc3_ = this;
      _quality = "MEDIUM";
      for(var _loc2_ in _loc1_[0])
      {
         trace(_loc2_ + "    " + _loc1_[0][_loc2_]);
      }
      for(var _loc2_ in _loc1_[1])
      {
         trace(_loc2_ + "    " + _loc1_[1][_loc2_]);
      }
      _loc3_.gameID = gameID;
      _loc3_.fct = fct;
      _loc3_.resultsArr = _loc1_;
      §§push(_loc1_);
      §§push(_loc2_);
      §§push(_loc3_);
      if(_loc3_.resultsArr.length > 1)
      {
         root.callKillGame();
      }
      _visible = true;
      _loc3_.gotoAndPlay("open");
      _loc3_ = §§pop();
      _loc2_ = §§pop();
      _loc1_ = §§pop();
   }
   function closeWindow()
   {
      var _loc1_ = this;
      trace("rewardAccess = " + root.rewardAccess);
      §§push(_loc1_);
      if(root.rewardAccess == "true" || root.rewardAccess == true)
      {
         trace("id = " + root.crntEvent.id);
         if(root.crntEvent.id == 3 || root.crntEvent.id == 6 || root.crntEvent.id == 9 || root.crntEvent.id == 12)
         {
            trace("state = " + root.crntEvent.state);
            if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
            {
               trace("gameID = " + _loc1_.gameID);
               if(root.crntEvent.id == 3 && _loc1_.gameID == 1)
               {
                  numToken = 3;
                  root.emptyClip.lumensHeadInv = root.emptyClip.lumensHeadInv + numToken;
                  addGuildObj("lumens_head",root.getInsName("txt_ev3",root.parseKitEvents),numToken);
               }
               else if(root.crntEvent.id == 6 && _loc1_.gameID == 5)
               {
                  numToken = 3;
                  root.emptyClip.flowerInv = root.emptyClip.flowerInv + numToken;
                  addGuildObj("purple_flower",root.getInsName("txt_ev6",root.parseKitEvents),numToken);
               }
               else if(root.crntEvent.id == 9 && _loc1_.gameID == 2)
               {
                  numToken = 1;
                  root.emptyClip.starInv = root.emptyClip.starInv + numToken;
                  addGuildObj("stars",root.getInsName("txt_ev9",root.parseKitEvents),numToken);
               }
               else if(root.crntEvent.id == 12 && _loc1_.gameID == 6)
               {
                  numToken = 3;
                  root.emptyClip.humanHeadInv = root.emptyClip.humanHeadInv + numToken;
                  addGuildObj("objHuman",root.getInsName("txt_ev12",root.parseKitEvents),numToken);
               }
            }
         }
      }
      switch(_loc1_.gameID)
      {
         case 1:
            dividFactor = 20;
            break;
         case 2:
            dividFactor = 20;
            break;
         case 3:
            dividFactor = 10;
            break;
         case 4:
            dividFactor = 20;
            break;
         case 5:
            dividFactor = 50;
            break;
         case 6:
            dividFactor = 20;
            break;
         case 7:
            dividFactor = 10;
            break;
         default:
            dividFactor = 20;
      }
      _loc1_.resultsArr[0].Name != root.playerStats.Name?root.addGils(Math.floor(_loc1_.resultsArr[1].Pts / dividFactor)):root.addGils(Math.floor(_loc1_.resultsArr[0].Pts / dividFactor));
      if(_loc1_.resultsArr[0].Name == root.playerStats.Name)
      {
         if(Math.floor(_loc1_.resultsArr[0].Pts / dividFactor) > 0)
         {
            root.cardInfoWindow.drawWindow(null,null,getInsName("infoReward",parseKitConnect),"gold",Math.floor(_loc1_.resultsArr[0].Pts / dividFactor));
         }
      }
      else if(Math.floor(_loc1_.resultsArr[1].Pts / dividFactor) > 0)
      {
         root.cardInfoWindow.drawWindow(null,null,getInsName("infoReward",parseKitConnect),"gold",Math.floor(_loc1_.resultsArr[1].Pts / dividFactor));
      }
      root["miniGame" + gameID].closeGame();
      _loc1_.gotoAndPlay("close");
      _loc1_ = §§pop();
   }
}
