onClipEvent(load){
   timeInterval = 80000;
   getGuildLeader = function()
   {
      var _loc3_ = 0;
      var _loc1_ = 0;
      while(_loc1_ < root.guildArr.length)
      {
         if(Number(root.guildArr[_loc1_].gScore) > _loc3_)
         {
            var _loc2_ = _loc1_;
            _loc3_ = Number(root.guildArr[_loc1_].gScore);
         }
         _loc1_ = _loc1_ + 1;
      }
      if(_loc2_ < 1)
      {
         return "Hunter";
      }
      if(_loc2_ < 2)
      {
         return "Lumen";
      }
      if(_loc2_ < 3)
      {
         return "Igneous";
      }
      return "Magma";
   };
   getCrntEvent = function()
   {
      var _loc1_ = new Array();
      if(root.crntEvent.id == 1)
      {
         if(root.crntEvent.state == "collect")
         {
            _loc1_.push({txt:root.getInsName("info_ev1_collect_1",root.parseKitWorld),icon:"sparkle",trans:"WhipeUp"},{txt:root.getInsName("info_ev1_collect_2",root.parseKitWorld),icon:"woodsman",trans:"WhipeDown"},{txt:root.getInsName("info_ev1_collect_3",root.parseKitWorld),icon:"logosr",trans:"TweenIn"},{txt:root.getInsName("info_ev1_collect_4",root.parseKitWorld),icon:"corona",trans:"BurstIn"},{txt:root.getInsName("info_ev1_collect_5",root.parseKitWorld),icon:"logosr",trans:"FadeToStar"});
         }
         else if(root.crntEvent.state == "sprint")
         {
            _loc1_.push({txt:root.getInsName("info_ev1_sprint_1",root.parseKitWorld),icon:"woodsman",trans:"WhipeDown"},{txt:root.getInsName("info_ev1_sprint_2",root.parseKitWorld),icon:"corona",trans:"TweenIn"},{txt:root.getInsName("info_ev1_sprint_3",root.parseKitWorld),icon:"sparkle",trans:"BurstIn"});
         }
         else if(root.crntEvent.state == "result" || root.crntEvent.state == "done")
         {
            _loc1_.push({txt:root.getInsName("info_ev1_result_1",root.parseKitWorld),icon:"logosr",trans:"WhipeUp"},{txt:root.getInsName("info_ev1_result_2",root.parseKitWorld) + getGuildLeader() + root.getInsName("info_ev1_result_3",root.parseKitWorld),icon:"woodsman",trans:"WhipeDown"},{txt:root.getInsName("info_ev1_result_4",root.parseKitWorld),icon:"corona",trans:"TweenIn"});
         }
      }
      else if(root.crntEvent.id == 2)
      {
         if(root.crntEvent.state == "collect")
         {
            _loc1_.push({txt:root.getInsName("info_ev2_collect_1",root.parseKitWorld),icon:"igneous",trans:"WhipeUp"},{txt:root.getInsName("info_ev2_collect_2",root.parseKitWorld),icon:"cathy",trans:"WhipeDown"},{txt:root.getInsName("info_ev2_collect_3",root.parseKitWorld),icon:"healer",trans:"TweenIn"},{txt:root.getInsName("info_ev2_collect_4",root.parseKitWorld),icon:"logosr",trans:"BurstIn"},{txt:root.getInsName("info_ev2_collect_5",root.parseKitWorld),icon:"magma",trans:"FadeToStar"});
         }
         else if(root.crntEvent.state == "sprint")
         {
            _loc1_.push({txt:root.getInsName("info_ev2_sprint_1",root.parseKitWorld),icon:"igneous",trans:"WhipeDown"},{txt:root.getInsName("info_ev2_sprint_2",root.parseKitWorld),icon:"logosr",trans:"TweenIn"},{txt:root.getInsName("info_ev2_sprint_3",root.parseKitWorld),icon:"logosr",trans:"BurstIn"});
         }
         else if(root.crntEvent.state == "result" || root.crntEvent.state == "done")
         {
            _loc1_.push({txt:root.getInsName("info_ev2_result_1",root.parseKitWorld),icon:"igneous",trans:"WhipeUp"},{txt:root.getInsName("info_ev2_result_2",root.parseKitWorld) + getGuildLeader() + root.getInsName("info_ev2_result_3",root.parseKitWorld),icon:"logosr",trans:"WhipeDown"},{txt:root.getInsName("info_ev2_result_4",root.parseKitWorld),icon:"corona",trans:"TweenIn"});
         }
      }
      else if(root.crntEvent.id == 3)
      {
         if(root.crntEvent.state == "collect")
         {
            _loc1_.push({txt:root.getInsName("info_ev3_collect_1",root.parseKitWorld),icon:"chamberlain",trans:"WhipeUp"},{txt:root.getInsName("info_ev3_collect_2",root.parseKitWorld),icon:"lumens",trans:"WhipeDown"},{txt:root.getInsName("info_ev3_collect_3",root.parseKitWorld),icon:"igneous",trans:"TweenIn"},{txt:root.getInsName("info_ev3_collect_4",root.parseKitWorld),icon:"logosr",trans:"BurstIn"},{txt:root.getInsName("info_ev3_collect_5",root.parseKitWorld),icon:"sparkle",trans:"FadeToStar"});
         }
         else if(root.crntEvent.state == "sprint")
         {
            _loc1_.push({txt:root.getInsName("info_ev3_sprint_1",root.parseKitWorld),icon:"lumens",trans:"WhipeDown"},{txt:root.getInsName("info_ev3_sprint_2",root.parseKitWorld),icon:"lumens",trans:"TweenIn"},{txt:root.getInsName("info_ev3_sprint_3",root.parseKitWorld),icon:"lumens",trans:"BurstIn"});
         }
         else if(root.crntEvent.state == "result" || root.crntEvent.state == "done")
         {
            _loc1_.push({txt:root.getInsName("info_ev3_result_1",root.parseKitWorld),icon:"lumens",trans:"WhipeUp"},{txt:root.getInsName("info_ev3_result_2",root.parseKitWorld) + getGuildLeader() + root.getInsName("info_ev3_result_3",root.parseKitWorld),icon:"logosr",trans:"WhipeDown"},{txt:root.getInsName("info_ev3_result_4",root.parseKitWorld),icon:"lumens",trans:"TweenIn"});
         }
      }
      else if(root.crntEvent.id == 4)
      {
         if(root.crntEvent.state == "collect")
         {
            _loc1_.push({txt:root.getInsName("info_ev4_collect_1",root.parseKitWorld),icon:"lumens",trans:"WhipeUp"},{txt:root.getInsName("info_ev4_collect_2",root.parseKitWorld),icon:"officer",trans:"WhipeDown"},{txt:root.getInsName("info_ev4_collect_3",root.parseKitWorld),icon:"hunter",trans:"BurstIn"},{txt:root.getInsName("info_ev4_collect_4",root.parseKitWorld),icon:"sparkle",trans:"FadeToStar"},{txt:root.getInsName("info_ev4_collect_5",root.parseKitWorld),icon:"corona",trans:"TweenIn"});
         }
         else if(root.crntEvent.state == "sprint")
         {
            _loc1_.push({txt:root.getInsName("info_ev4_sprint_1",root.parseKitWorld),icon:"sparkle",trans:"WhipeDown"},{txt:root.getInsName("info_ev4_sprint_2",root.parseKitWorld),icon:"hunter",trans:"TweenIn"},{txt:root.getInsName("info_ev4_sprint_3",root.parseKitWorld),icon:"corona",trans:"BurstIn"});
         }
         else if(root.crntEvent.state == "result" || root.crntEvent.state == "done")
         {
            _loc1_.push({txt:root.getInsName("info_ev4_result_1",root.parseKitWorld),icon:"hunter",trans:"WhipeUp"},{txt:root.getInsName("info_ev4_result_2",root.parseKitWorld) + getGuildLeader() + root.getInsName("info_ev4_result_3",root.parseKitWorld),icon:"logosr",trans:"WhipeDown"},{txt:root.getInsName("info_ev4_result_4",root.parseKitWorld),icon:"sparkle",trans:"TweenIn"});
         }
      }
      else if(root.crntEvent.id == 5)
      {
         if(root.crntEvent.state == "collect")
         {
            _loc1_.push({txt:root.getInsName("info_ev5_collect_1",root.parseKitWorld),icon:"venus",trans:"WhipeUp"},{txt:root.getInsName("info_ev5_collect_2",root.parseKitWorld),icon:"corona",trans:"WhipeDown"},{txt:root.getInsName("info_ev5_collect_3",root.parseKitWorld),icon:"logosr",trans:"TweenIn"},{txt:root.getInsName("info_ev5_collect_4",root.parseKitWorld),icon:"corona",trans:"BurstIn"},{txt:root.getInsName("info_ev5_collect_5",root.parseKitWorld),icon:"forge",trans:"FadeToStar"});
         }
         else if(root.crntEvent.state == "sprint")
         {
            _loc1_.push({txt:root.getInsName("info_ev5_sprint_1",root.parseKitWorld),icon:"logosr",trans:"WhipeDown"},{txt:root.getInsName("info_ev5_sprint_2",root.parseKitWorld),icon:"corona",trans:"TweenIn"},{txt:root.getInsName("info_ev5_sprint_3",root.parseKitWorld),icon:"logosr",trans:"BurstIn"});
         }
         else if(root.crntEvent.state == "result" || root.crntEvent.state == "done")
         {
            _loc1_.push({txt:root.getInsName("info_ev5_result_1",root.parseKitWorld),icon:"corona",trans:"WhipeUp"},{txt:root.getInsName("info_ev5_result_2",root.parseKitWorld) + getGuildLeader() + root.getInsName("info_ev5_result_3",root.parseKitWorld),icon:"logosr",trans:"WhipeDown"},{txt:root.getInsName("info_ev5_result_4",root.parseKitWorld),icon:"venus",trans:"TweenIn"});
         }
      }
      else if(root.crntEvent.id == 6)
      {
         if(root.crntEvent.state == "collect")
         {
            _loc1_.push({txt:root.getInsName("info_ev6_collect_1",root.parseKitWorld),icon:"lumens",trans:"WhipeUp"},{txt:root.getInsName("info_ev6_collect_2",root.parseKitWorld),icon:"healer",trans:"WhipeDown"},{txt:root.getInsName("info_ev6_collect_3",root.parseKitWorld),icon:"lumens",trans:"TweenIn"},{txt:root.getInsName("info_ev6_collect_4",root.parseKitWorld),icon:"beerain",trans:"BurstIn"},{txt:root.getInsName("info_ev6_collect_5",root.parseKitWorld),icon:"logosr",trans:"FadeToStar"});
         }
         else if(root.crntEvent.state == "sprint")
         {
            _loc1_.push({txt:root.getInsName("info_ev6_sprint_1",root.parseKitWorld),icon:"lumens",trans:"WhipeDown"},{txt:root.getInsName("info_ev6_sprint_2",root.parseKitWorld),icon:"healer",trans:"TweenIn"},{txt:root.getInsName("info_ev6_sprint_3",root.parseKitWorld),icon:"cathy",trans:"BurstIn"});
         }
         else if(root.crntEvent.state == "result" || root.crntEvent.state == "done")
         {
            _loc1_.push({txt:root.getInsName("info_ev6_result_1",root.parseKitWorld),icon:"lumens",trans:"WhipeUp"},{txt:root.getInsName("info_ev6_result_2",root.parseKitWorld) + getGuildLeader() + root.getInsName("info_ev6_result_3",root.parseKitWorld),icon:"logosr",trans:"WhipeDown"},{txt:root.getInsName("info_ev6_result_4",root.parseKitWorld),icon:"healer",trans:"TweenIn"});
         }
      }
      else if(root.crntEvent.id == 7)
      {
         if(root.crntEvent.state == "collect")
         {
            _loc1_.push({txt:root.getInsName("info_ev7_collect_1",root.parseKitWorld),icon:"logosr",trans:"WhipeUp"},{txt:root.getInsName("info_ev7_collect_2",root.parseKitWorld),icon:"man2",trans:"WhipeDown"},{txt:root.getInsName("info_ev7_collect_3",root.parseKitWorld),icon:"merchant",trans:"TweenIn"},{txt:root.getInsName("info_ev7_collect_4",root.parseKitWorld),icon:"magma",trans:"BurstIn"},{txt:root.getInsName("info_ev7_collect_5",root.parseKitWorld),icon:"woman1",trans:"FadeToStar"});
         }
         else if(root.crntEvent.state == "sprint")
         {
            _loc1_.push({txt:root.getInsName("info_ev7_sprint_1",root.parseKitWorld),icon:"merchant",trans:"WhipeDown"},{txt:root.getInsName("info_ev7_sprint_2",root.parseKitWorld),icon:"magma",trans:"TweenIn"},{txt:root.getInsName("info_ev7_sprint_3",root.parseKitWorld),icon:"logosr",trans:"BurstIn"});
         }
         else if(root.crntEvent.state == "result" || root.crntEvent.state == "done")
         {
            _loc1_.push({txt:root.getInsName("info_ev7_result_1",root.parseKitWorld),icon:"woman1",trans:"WhipeUp"},{txt:root.getInsName("info_ev7_result_2",root.parseKitWorld) + getGuildLeader() + root.getInsName("info_ev7_result_3",root.parseKitWorld),icon:"logosr",trans:"WhipeDown"},{txt:root.getInsName("info_ev7_result_4",root.parseKitWorld),icon:"merchant",trans:"TweenIn"});
         }
      }
      else if(root.crntEvent.id == 8)
      {
         if(root.crntEvent.state == "collect")
         {
            _loc1_.push({txt:root.getInsName("info_ev8_collect_1",root.parseKitWorld),icon:"aquine",trans:"WhipeUp"},{txt:root.getInsName("info_ev8_collect_2",root.parseKitWorld),icon:"igneous",trans:"WhipeDown"},{txt:root.getInsName("info_ev8_collect_3",root.parseKitWorld),icon:"corona",trans:"TweenIn"},{txt:root.getInsName("info_ev8_collect_4",root.parseKitWorld),icon:"sparkle",trans:"BurstIn"},{txt:root.getInsName("info_ev8_collect_5",root.parseKitWorld),icon:"lumens",trans:"FadeToStar"});
         }
         else if(root.crntEvent.state == "sprint")
         {
            _loc1_.push({txt:root.getInsName("info_ev8_sprint_1",root.parseKitWorld),icon:"igneous",trans:"WhipeDown"},{txt:root.getInsName("info_ev8_sprint_2",root.parseKitWorld),icon:"lumens",trans:"TweenIn"},{txt:root.getInsName("info_ev8_sprint_3",root.parseKitWorld),icon:"corona",trans:"BurstIn"});
         }
         else if(root.crntEvent.state == "result" || root.crntEvent.state == "done")
         {
            _loc1_.push({txt:root.getInsName("info_ev8_result_1",root.parseKitWorld),icon:"igneous",trans:"WhipeUp"},{txt:root.getInsName("info_ev8_result_2",root.parseKitWorld) + getGuildLeader() + root.getInsName("info_ev8_result_3",root.parseKitWorld),icon:"logosr",trans:"WhipeDown"},{txt:root.getInsName("info_ev8_result_4",root.parseKitWorld),icon:"lumens",trans:"TweenIn"});
         }
      }
      else if(root.crntEvent.id == 9)
      {
         if(root.crntEvent.state == "collect")
         {
            _loc1_.push({txt:root.getInsName("info_ev9_collect_1",root.parseKitWorld),icon:"logosr",trans:"WhipeUp"},{txt:root.getInsName("info_ev9_collect_2",root.parseKitWorld),icon:"sparkle",trans:"WhipeDown"},{txt:root.getInsName("info_ev9_collect_3",root.parseKitWorld),icon:"lumens",trans:"TweenIn"},{txt:root.getInsName("info_ev9_collect_4",root.parseKitWorld),icon:"logosr",trans:"BurstIn"},{txt:root.getInsName("info_ev9_collect_5",root.parseKitWorld),icon:"man1",trans:"FadeToStar"});
         }
         else if(root.crntEvent.state == "sprint")
         {
            _loc1_.push({txt:root.getInsName("info_ev9_sprint_1",root.parseKitWorld),icon:"lumens",trans:"WhipeDown"},{txt:root.getInsName("info_ev9_sprint_2",root.parseKitWorld),icon:"sparkle",trans:"TweenIn"},{txt:root.getInsName("info_ev9_sprint_3",root.parseKitWorld),icon:"magma",trans:"BurstIn"});
         }
         else if(root.crntEvent.state == "result" || root.crntEvent.state == "done")
         {
            _loc1_.push({txt:root.getInsName("info_ev9_result_1",root.parseKitWorld),icon:"igneous",trans:"WhipeUp"},{txt:root.getInsName("info_ev9_result_2",root.parseKitWorld) + getGuildLeader() + root.getInsName("info_ev9_result_3",root.parseKitWorld),icon:"logosr",trans:"WhipeDown"},{txt:root.getInsName("info_ev9_result_4",root.parseKitWorld),icon:"sparkle",trans:"TweenIn"});
         }
      }
      else if(root.crntEvent.id == 10)
      {
         if(root.crntEvent.state == "collect")
         {
            _loc1_.push({txt:root.getInsName("info_ev10_collect_1",root.parseKitWorld),icon:"lumens",trans:"WhipeUp"},{txt:root.getInsName("info_ev10_collect_2",root.parseKitWorld),icon:"sparkle",trans:"WhipeDown"},{txt:root.getInsName("info_ev10_collect_3",root.parseKitWorld),icon:"hunter",trans:"TweenIn"},{txt:root.getInsName("info_ev10_collect_4",root.parseKitWorld),icon:"lumens",trans:"BurstIn"},{txt:root.getInsName("info_ev10_collect_5",root.parseKitWorld),icon:"corona",trans:"FadeToStar"});
         }
         else if(root.crntEvent.state == "sprint")
         {
            _loc1_.push({txt:root.getInsName("info_ev10_sprint_1",root.parseKitWorld),icon:"lumens",trans:"WhipeDown"},{txt:root.getInsName("info_ev10_sprint_2",root.parseKitWorld),icon:"magma",trans:"TweenIn"},{txt:root.getInsName("info_ev10_sprint_3",root.parseKitWorld),icon:"igneous",trans:"BurstIn"});
         }
         else if(root.crntEvent.state == "result" || root.crntEvent.state == "done")
         {
            _loc1_.push({txt:root.getInsName("info_ev10_result_1",root.parseKitWorld),icon:"lumens",trans:"WhipeUp"},{txt:root.getInsName("info_ev10_result_2",root.parseKitWorld) + getGuildLeader() + root.getInsName("info_ev10_result_3",root.parseKitWorld),icon:"logosr",trans:"WhipeDown"},{txt:root.getInsName("info_ev10_result_4",root.parseKitWorld),icon:"igneous",trans:"TweenIn"});
         }
      }
      else if(root.crntEvent.id == 11)
      {
         if(root.crntEvent.state == "collect")
         {
            _loc1_.push({txt:root.getInsName("info_ev11_collect_1",root.parseKitWorld),icon:"igneous",trans:"WhipeUp"},{txt:root.getInsName("info_ev11_collect_2",root.parseKitWorld),icon:"man1",trans:"WhipeDown"},{txt:root.getInsName("info_ev11_collect_3",root.parseKitWorld),icon:"grasshop",trans:"TweenIn"},{txt:root.getInsName("info_ev11_collect_4",root.parseKitWorld),icon:"sparkle",trans:"BurstIn"},{txt:root.getInsName("info_ev11_collect_5",root.parseKitWorld),icon:"igneous",trans:"FadeToStar"});
         }
         else if(root.crntEvent.state == "sprint")
         {
            _loc1_.push({txt:root.getInsName("info_ev11_sprint_1",root.parseKitWorld),icon:"igneous",trans:"WhipeDown"},{txt:root.getInsName("info_ev11_sprint_2",root.parseKitWorld),icon:"sparkle",trans:"TweenIn"},{txt:root.getInsName("info_ev11_sprint_3",root.parseKitWorld),icon:"woman1",trans:"BurstIn"});
         }
         else if(root.crntEvent.state == "result" || root.crntEvent.state == "done")
         {
            _loc1_.push({txt:root.getInsName("info_ev11_result_1",root.parseKitWorld),icon:"igneous",trans:"WhipeUp"},{txt:root.getInsName("info_ev11_result_2",root.parseKitWorld) + getGuildLeader() + root.getInsName("info_ev11_result_3",root.parseKitWorld),icon:"logosr",trans:"WhipeDown"},{txt:root.getInsName("info_ev11_result_4",root.parseKitWorld),icon:"grasshop",trans:"TweenIn"});
         }
      }
      else if(root.crntEvent.id == 12)
      {
         if(root.crntEvent.state == "collect")
         {
            _loc1_.push({txt:root.getInsName("info_ev12_collect_1",root.parseKitWorld),icon:"stag",trans:"WhipeUp"},{txt:root.getInsName("info_ev12_collect_2",root.parseKitWorld),icon:"teacher",trans:"WhipeDown"},{txt:root.getInsName("info_ev12_collect_3",root.parseKitWorld),icon:"logosr",trans:"TweenIn"},{txt:root.getInsName("info_ev12_collect_4",root.parseKitWorld),icon:"magma",trans:"BurstIn"},{txt:root.getInsName("info_ev12_collect_5",root.parseKitWorld),icon:"logosr",trans:"FadeToStar"});
         }
         else if(root.crntEvent.state == "sprint")
         {
            _loc1_.push({txt:root.getInsName("info_ev12_sprint_1",root.parseKitWorld),icon:"logosr",trans:"WhipeDown"},{txt:root.getInsName("info_ev12_sprint_2",root.parseKitWorld),icon:"cathy",trans:"TweenIn"},{txt:root.getInsName("info_ev12_sprint_3",root.parseKitWorld),icon:"stag",trans:"BurstIn"});
         }
         else if(root.crntEvent.state == "result" || root.crntEvent.state == "done")
         {
            _loc1_.push({txt:root.getInsName("info_ev12_result_1",root.parseKitWorld),icon:"stag",trans:"WhipeUp"},{txt:root.getInsName("info_ev12_result_2",root.parseKitWorld) + getGuildLeader() + root.getInsName("info_ev12_result_3",root.parseKitWorld),icon:"logosr",trans:"WhipeDown"},{txt:root.getInsName("info_ev12_result_4",root.parseKitWorld),icon:"cathy",trans:"TweenIn"});
         }
      }
      return _loc1_[random(_loc1_.length)];
   };
   getCrntInvectidState = function()
   {
      var _loc3_ = random(4);
      var _loc1_ = 0;
      if(_loc3_ < 1)
      {
         for(var _loc2_ in root.zone3Arr1)
         {
            if(root.zone3Arr1[_loc2_][0] != undefined)
            {
               _loc1_ = _loc1_ + 1;
            }
         }
         for(_loc2_ in root.zone3Arr2)
         {
            if(root.zone3Arr2[_loc2_][0] != undefined)
            {
               _loc1_ = _loc1_ + 1;
            }
         }
         if(_loc1_ < 5)
         {
            return {txt:root.getInsName("info_invPlain_1",root.parseKitWorld),icon:"lumens",trans:"WhipeDown"};
         }
         if(_loc1_ < 9)
         {
            return {txt:root.getInsName("info_invPlain_2",root.parseKitWorld),icon:"corona",trans:"WhipeUp"};
         }
         if(_loc1_ < 13)
         {
            return {txt:root.getInsName("info_invPlain_3",root.parseKitWorld),icon:"magma",trans:"TweenIn"};
         }
         return {txt:root.getInsName("info_invPlain_4",root.parseKitWorld),icon:"magma",trans:"FadeToStar"};
      }
      if(_loc3_ < 2)
      {
         for(_loc2_ in root.zone4Arr1)
         {
            if(root.zone4Arr1[_loc2_][0] != undefined)
            {
               _loc1_ = _loc1_ + 1;
            }
         }
         for(_loc2_ in root.zone4Arr2)
         {
            if(root.zone4Arr2[_loc2_][0] != undefined)
            {
               _loc1_ = _loc1_ + 1;
            }
         }
         if(_loc1_ < 5)
         {
            return {txt:root.getInsName("info_invForest_1",root.parseKitWorld),icon:"magma",trans:"WhipeDown"};
         }
         if(_loc1_ < 9)
         {
            return {txt:root.getInsName("info_invForest_2",root.parseKitWorld),icon:"teacher",trans:"WhipeUp"};
         }
         if(_loc1_ < 13)
         {
            return {txt:root.getInsName("info_invForest_3",root.parseKitWorld),icon:"igneous",trans:"TweenIn"};
         }
         return {txt:root.getInsName("info_invForest_4",root.parseKitWorld),icon:"hunter",trans:"FadeToStar"};
      }
      if(_loc3_ < 3)
      {
         for(_loc2_ in root.zone5Arr)
         {
            if(root.zone5Arr[_loc2_][0] != undefined)
            {
               _loc1_ = _loc1_ + 1;
            }
         }
         if(_loc1_ < 5)
         {
            return {txt:root.getInsName("info_invMountain_1",root.parseKitWorld),icon:"igneous",trans:"WhipeDown"};
         }
         if(_loc1_ < 9)
         {
            return {txt:root.getInsName("info_invMountain_2",root.parseKitWorld),icon:"corona",trans:"WhipeUp"};
         }
         if(_loc1_ < 13)
         {
            return {txt:root.getInsName("info_invMountain_3",root.parseKitWorld),icon:"hunter",trans:"TweenIn"};
         }
         return {txt:root.getInsName("info_invMountain_4",root.parseKitWorld),icon:"igneous",trans:"FadeToStar"};
      }
      for(_loc2_ in root.zone6Arr)
      {
         if(root.zone6Arr[_loc2_][0] != undefined)
         {
            _loc1_ = _loc1_ + 1;
         }
      }
      if(_loc1_ < 5)
      {
         return {txt:root.getInsName("info_invMarshe_1",root.parseKitWorld),icon:"sparkle",trans:"WhipeDown"};
      }
      if(_loc1_ < 9)
      {
         return {txt:root.getInsName("info_invMarshe_2",root.parseKitWorld),icon:"magma",trans:"WhipeUp"};
      }
      if(_loc1_ < 13)
      {
         return {txt:root.getInsName("info_invMarshe_3",root.parseKitWorld),icon:"corona",trans:"TweenIn"};
      }
      return {txt:root.getInsName("info_invMarshe_4",root.parseKitWorld),icon:"igneous",trans:"FadeToStar"};
   };
   var pos = random(root.infoArr.length);
   loadNextTxt = function()
   {
      trace("LOAD");
      pos++;
      if(pos >= root.infoArr.length)
      {
         pos = 0;
      }
      if(random(10) < 2)
      {
         if(root.crntEvent != undefined && root.crntEvent != "" && root.crntEvent.state != "done")
         {
            var _loc1_ = getCrntEvent();
         }
         else
         {
            _loc1_ = root.infoArr[pos];
         }
      }
      else if(random(10) < 3)
      {
         _loc1_ = getCrntInvectidState();
      }
      else
      {
         _loc1_ = root.infoArr[pos];
      }
      crntTxt = _loc1_.txt;
      crntIcon = _loc1_.icon;
      trace("SWITCH MESSBOARD FOR : \n " + crntTxt + " \n " + crntIcon + " \n " + _loc1_.trans);
      gotoAndPlay(_loc1_.trans);
      if(_currentframe == 1)
      {
         gotoAndStop("WhipeUp");
         play();
      }
   };
}
