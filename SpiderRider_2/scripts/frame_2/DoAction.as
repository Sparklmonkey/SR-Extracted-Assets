infoArr = new Array();
dictArr = new Array();
guildArr = new Array();
victoryPtsOffset = 0;
scoreGuild = 0;
inWorld = undefined;
regularLetter = "abcdefghijklmnopqrstuvwxyz1234567890";
badWordsArray = ["anal","anus","bander","bat","bite","bite","bordel","boule","burne","caca","calice","chatte","chiasse","chienne","ciboir","clito","con","couille","crack","crisse","cross","crotte","cul","drogue","encule","esti","etron","fag","fecale","fesse","fife","fourre","gai","gay","gland","gosse","hash","homo","lesbi","marde","merde","nichon","noune","orgasm","ostie","pd","pedo","penis","pet","phalus","pipe","pipi","pisse","plotte","poil","pot","prout","pubis","putain","pute","putin","queue","rectum","sale","salope","satan","sein","sexe","sodom","suce","sucer","tapette","teton","toton","turlute","vagin","verge","viarge","vulve","xxx","zizi","ass","barf","bitch","bimbo","cock","cunt","cum","dick","facial","fag","fart","fuck","jerk","sex","suck","slut","tits","sonofabitch","doggiestyle","doggystyle","jackasses","wetbacks","fucktard","biotchin","anal","sex","oralsex","jackass","analsex","blowjob","fucking","asshole","wetback","fisting","bitches","niggers","fucker","fucked","faggot","biotch","nigger","niggas","biatch","bitchy","bitch!","nigga","shitty","bitch","chink","pussy","fuck","dick","cunt","shit","cock","fags","fag","cum"];
§§push(function formatChar(charToFormat)
{
   var _loc1_ = charToFormat;
   _loc1_ = _loc1_.toLowerCase();
   var _loc0_ = _loc1_ == "à" || _loc1_ == "ä" || _loc1_ == "â" || _loc1_ == "á"?"a":_loc1_ == "è" || _loc1_ == "ë" || _loc1_ == "ê" || _loc1_ == "é"?"e":_loc1_ == "ì" || _loc1_ == "ï" || _loc1_ == "î" || _loc1_ == "í"?"i":_loc1_ == "ò" || _loc1_ == "ö" || _loc1_ == "ô" || _loc1_ == "ó"?"o":_loc1_ == "ù" || _loc1_ == "ü" || _loc1_ == "û" || _loc1_ == "ú"?"u":_loc1_ == "ÿ" || _loc1_ == "ý"?"y":_loc1_ == "ç"?"c":regularLetter.indexOf(_loc1_) < 0?"":_loc1_;
   _loc1_;
   return _loc0_;
});
§§push(function formatString(stringToFormat)
{
   var _loc3_ = stringToFormat;
   _loc3_ = _loc3_.split(" ").join("");
   var _loc2_ = _loc3_.split("");
   var _loc1_ = 0;
   while(_loc1_ < _loc2_.length)
   {
      _loc2_[_loc1_] = formatChar(_loc2_[_loc1_]);
      _loc1_ = _loc1_ + 1;
   }
   var _loc0_ = _loc2_.join("");
   _loc3_;
   _loc2_;
   _loc1_;
   return _loc0_;
});
§§push(function testBadWord(cleanedLogin)
{
   var _loc2_ = cleanedLogin;
   var _loc1_ = false;
   for(var _loc3_ in badWordsArray)
   {
      if(_loc2_.indexOf(badWordsArray[_loc3_]) >= 0)
      {
         _loc1_ = true;
      }
   }
   _loc0_ = _loc1_;
   _loc3_;
   _loc2_;
   _loc1_;
   return _loc0_;
});
§§push(function googleAnalytic(url)
{
   if(!GAMEDEBUG)
   {
      getURL(url,"");
   }
});
§§push(function xmlLoaded()
{
   trace("LOADING XML");
   xmlIsLoaded = true;
   var _loc1_ = this.firstChild;
   var _loc2_ = 0;
   while(_loc2_ < _loc1_.childNodes.length)
   {
      switch(_loc1_.childNodes[_loc2_].nodeName)
      {
         case "scriptLink":
            scriptLink = _loc1_.childNodes[_loc2_].firstChild.nodeValue;
            break;
         case "serverLink":
            serverLink = String(_loc1_.childNodes[_loc2_].firstChild.nodeValue);
            break;
         case "serverLink2":
            serverLink2 = String(_loc1_.childNodes[_loc2_].firstChild.nodeValue);
            break;
         case "serverLink3":
            serverLink3 = String(_loc1_.childNodes[_loc2_].firstChild.nodeValue);
            break;
         case "mainVolume":
            basedVolume = Number(_loc1_.childNodes[_loc2_].firstChild.nodeValue);
            break;
         case "webcodes":
            webcodeArray = _loc1_.childNodes[_loc2_].firstChild.nodeValue.split(",");
            break;
         case "bonusDate":
            bonusArray = _loc1_.childNodes[_loc2_].firstChild.nodeValue.split(",");
            bonusDate = new Array();
            z = 0;
            while(z < bonusArray.length)
            {
               bonusDate[z] = bonusArray[z].split("-");
               z++;
            }
            break;
         case "infoPanel":
            infoArr = _loc1_.childNodes[_loc2_].firstChild.nodeValue.split("|");
            break;
         case "locKitConnect":
            locKitConnectArr = new Array();
            locKitConnectArr = _loc1_.childNodes[_loc2_].firstChild.nodeValue.split("*");
            parseKitConnect = new Array();
            z = 0;
            while(z < locKitConnectArr.length)
            {
               parseKitConnect[z] = locKitConnectArr[z].split("~");
               z++;
            }
            break;
         case "kitConnectMulti":
            locKitConnectArr = new Array();
            locKitConnectArr = _loc1_.childNodes[_loc2_].firstChild.nodeValue.split("*");
            parseMultiConnect = new Array();
            z = 0;
            while(z < locKitConnectArr.length)
            {
               parseMultiConnect[z] = locKitConnectArr[z].split("~");
               z++;
            }
            break;
         case "locKitCards":
            locKitConnectArr = new Array();
            locKitConnectArr = _loc1_.childNodes[_loc2_].firstChild.nodeValue.split("*");
            parseKitCards = new Array();
            z = 0;
            while(z < locKitConnectArr.length)
            {
               parseKitCards[z] = locKitConnectArr[z].split("~");
               z++;
            }
            break;
         case "locKitEvents":
            locKitConnectArr = new Array();
            locKitConnectArr = _loc1_.childNodes[_loc2_].firstChild.nodeValue.split("*");
            parseKitEvents = new Array();
            z = 0;
            while(z < locKitConnectArr.length)
            {
               parseKitEvents[z] = locKitConnectArr[z].split("~");
               z++;
            }
            break;
         case "locKitMiniGames":
            locKitConnectArr = new Array();
            locKitConnectArr = _loc1_.childNodes[_loc2_].firstChild.nodeValue.split("*");
            parseKitMGames = new Array();
            z = 0;
            while(z < locKitConnectArr.length)
            {
               parseKitMGames[z] = locKitConnectArr[z].split("~");
               z++;
            }
            break;
         case "locKitMultiEvents":
            locKitConnectArr = new Array();
            locKitConnectArr = _loc1_.childNodes[_loc2_].firstChild.nodeValue.split("*");
            parseKitMEvents = new Array();
            z = 0;
            while(z < locKitConnectArr.length)
            {
               parseKitMEvents[z] = locKitConnectArr[z].split("~");
               z++;
            }
            break;
         case "locKitMissions":
            locKitConnectArr = new Array();
            locKitConnectArr = _loc1_.childNodes[_loc2_].firstChild.nodeValue.split("*");
            parseKitMissions = new Array();
            z = 0;
            while(z < locKitConnectArr.length)
            {
               parseKitMissions[z] = locKitConnectArr[z].split("~");
               z++;
            }
            break;
         case "locKitVisual":
            locKitConnectArr = new Array();
            locKitConnectArr = _loc1_.childNodes[_loc2_].firstChild.nodeValue.split("*");
            parseKitVisual = new Array();
            z = 0;
            while(z < locKitConnectArr.length)
            {
               parseKitVisual[z] = locKitConnectArr[z].split("~");
               z++;
            }
            break;
         case "locKitSheets":
            locKitConnectArr = new Array();
            locKitConnectArr = _loc1_.childNodes[_loc2_].firstChild.nodeValue.split("*");
            parseKitSheets = new Array();
            z = 0;
            while(z < locKitConnectArr.length)
            {
               parseKitSheets[z] = locKitConnectArr[z].split("~");
               z++;
            }
            break;
         case "locKitWorld":
            locKitConnectArr = new Array();
            locKitConnectArr = _loc1_.childNodes[_loc2_].firstChild.nodeValue.split("*");
            parseKitWorld = new Array();
            z = 0;
            while(z < locKitConnectArr.length)
            {
               parseKitWorld[z] = locKitConnectArr[z].split("~");
               z++;
            }
            break;
         case "locKitBSystem":
            locKitConnectArr = new Array();
            locKitConnectArr = _loc1_.childNodes[_loc2_].firstChild.nodeValue.split("*");
            parseKitBSystem = new Array();
            z = 0;
            while(z < locKitConnectArr.length)
            {
               parseKitBSystem[z] = locKitConnectArr[z].split("~");
               z++;
            }
            break;
         case "locKitChat":
            locKitConnectArr = new Array();
            locKitConnectArr = _loc1_.childNodes[_loc2_].firstChild.nodeValue.split("*");
            parseKitChat = new Array();
            z = 0;
            while(z < locKitConnectArr.length)
            {
               parseKitChat[z] = locKitConnectArr[z].split("~");
               z++;
            }
            break;
         case "locKitMGames":
            locKitConnectArr = new Array();
            locKitConnectArr = _loc1_.childNodes[_loc2_].firstChild.nodeValue.split("*");
            parseKitMGames = new Array();
            z = 0;
            while(z < locKitConnectArr.length)
            {
               parseKitMGames[z] = locKitConnectArr[z].split("~");
               z++;
            }
            break;
      }
      _loc2_ = _loc2_ + 1;
   }
   _loc2_ = 0;
   while(_loc2_ < root.infoArr.length)
   {
      var _loc3_ = root.infoArr[_loc2_].split("*");
      root.infoArr[_loc2_] = {txt:String(_loc3_[2]),icon:String(_loc3_[1]),trans:String(_loc3_[0])};
      _loc2_ = _loc2_ + 1;
   }
   play();
   _loc3_;
   _loc2_;
   _loc1_;
});
§§push(function getInsName(instance, crntArray)
{
   var _loc1_ = crntArray;
   var _loc2_ = instance;
   i = 0;
   while(i < _loc1_.length)
   {
      if(_loc2_ == _loc1_[i][0])
      {
         output = String(_loc1_[i][1]);
         break;
      }
      i++;
   }
   indx = output.indexOf("|");
   §§push(_loc1_);
   §§push(_loc2_);
   if(indx != -1)
   {
      temp = output.split("|");
      output = temp.join("\n");
   }
   if(output == "" || output == undefined)
   {
      output = "Instance name not found";
   }
   var _loc0_ = output;
   _loc2_ = §§pop();
   _loc1_ = §§pop();
   return _loc0_;
});
§§push(function getNewDepth()
{
   return ++depthNb;
});
§§push(function getRankValue2(victoryPts)
{
   var _loc1_ = victoryPts;
   trace("getRankValue2");
   §§push(_loc1_);
   if(_loc1_ < 200)
   {
      rankData = {rank:0,titleName:"-",dice:3,defense:4,action:0,ptsLife:10,ptsVictory:_loc1_};
   }
   else if(_loc1_ < 1000)
   {
      rankData = {rank:1,titleName:getInsName("rankName1",parseKitConnect),dice:4,defense:5,action:0,ptsLife:15,ptsVictory:_loc1_};
   }
   else if(_loc1_ < 2600)
   {
      rankData = {rank:2,titleName:getInsName("rankName2",parseKitConnect),dice:5,defense:5,action:0,ptsLife:20,ptsVictory:_loc1_};
   }
   else if(_loc1_ < 4000)
   {
      rankData = {rank:3,titleName:getInsName("rankName3",parseKitConnect),dice:5,defense:6,action:0,ptsLife:20,ptsVictory:_loc1_};
   }
   else if(_loc1_ < 7000)
   {
      rankData = {rank:4,titleName:getInsName("rankName4",parseKitConnect),dice:5,defense:6,action:0,ptsLife:25,ptsVictory:_loc1_};
   }
   else if(_loc1_ < 12000)
   {
      rankData = {rank:5,titleName:getInsName("rankName5",parseKitConnect),dice:6,defense:6,action:0,ptsLife:30,ptsVictory:_loc1_};
   }
   else if(_loc1_ < 19500)
   {
      rankData = {rank:6,titleName:getInsName("rankName6",parseKitConnect),dice:6,defense:7,action:0,ptsLife:30,ptsVictory:_loc1_};
   }
   else if(_loc1_ < 30000)
   {
      rankData = {rank:7,titleName:getInsName("rankName7",parseKitConnect),dice:7,defense:7,action:0,ptsLife:35,ptsVictory:_loc1_};
   }
   else if(_loc1_ < 43500)
   {
      rankData = {rank:8,titleName:getInsName("rankName8",parseKitConnect),dice:7,defense:8,action:0,ptsLife:35,ptsVictory:_loc1_};
   }
   else if(_loc1_ < 58000)
   {
      rankData = {rank:9,titleName:getInsName("rankName9",parseKitConnect),dice:8,defense:8,action:0,ptsLife:35,ptsVictory:_loc1_};
   }
   else
   {
      rankData = {rank:10,titleName:getInsName("rankName10",parseKitConnect),dice:9,defense:8,action:0,ptsLife:40,ptsVictory:_loc1_};
   }
   var _loc0_ = rankData;
   _loc1_ = §§pop();
   return _loc0_;
});
§§push(function loadSwf(mc, version, fct, insName, kitArr)
{
   var _loc1_ = mc;
   _loc1_.loadMovie(version);
   §§push(_loc1_);
   if(insName != null)
   {
      loadWindow.setLoader(_loc1_,fct,root.getInsName(insName,kitArr));
   }
   else
   {
      loadWindow.setLoader(_loc1_,fct,undefined);
   }
   _loc1_ = §§pop();
});
§§push(function parseDictionnary(dictStr)
{
   dictWord = dictStr.split("*");
   return dictWord;
});
§§push(function pushCard(ID)
{
   var _loc2_ = ID;
   trace("pushCard");
   §§push(_loc1_);
   §§push(_loc2_);
   if(root.playerStats.card.length < 100)
   {
      root.playerStats.card.push({id:_loc2_,deck:7,spc:0});
      missionCard.push({id:_loc2_,deck:7,spc:0});
   }
   else
   {
      root.tempCardSetID = _loc2_;
      var _loc1_ = function()
      {
         root.playerStats.card.push({id:root.tempCardSetID,deck:7,spc:0});
         root.missionCard.push({id:root.tempCardSetID,deck:7,spc:0});
         delete root.tempCardSetID;
      };
      root.swapCardWindow.drawWindow(_loc2_,_loc1_);
   }
   _loc2_ = §§pop();
   _loc1_ = §§pop();
});
§§push(function updateWords(wordArr)
{
   var _loc1_ = wordArr;
   trace("updateWords");
   callObj.callType = "updateWords";
   strBuilder = "";
   for(var _loc2_ in _loc1_)
   {
      strBuilder = strBuilder + (_loc1_[_loc2_] + "*");
   }
   callObj.words = strBuilder;
   callArray.push(callObj);
   §§push(_loc1_);
   §§push(_loc2_);
   if(!waitingForReply)
   {
      processCall();
   }
   _loc2_ = §§pop();
   _loc1_ = §§pop();
});
§§push(function addGils(ammount)
{
   trace("addGils");
   root.playerStats.gils = Number(root.playerStats.gils) + Number(ammount);
   callObj.callType = "updateuser";
   callObj.id = playerStats.id;
   callObj.statName = "gils";
   callObj.toAdd = ammount;
   callArray.push(callObj);
   if(!waitingForReply)
   {
      processCall();
   }
});
§§push(function updateGuildScore(toAdd)
{
   trace("updateGuildScore");
   callObj.callType = "updatescore";
   callObj.id = playerStats.id;
   callObj.toAdd = toAdd;
   playerStats.guildScore = playerStats.guildScore + toAdd;
   callArray.push(callObj);
   if(!waitingForReply)
   {
      processCall();
   }
});
§§push(function cancelReward(rewardKind)
{
   trace("cancelReward");
   callObj.callType = rewardKind != "reward"?"setRewardAccess":"setReward";
   callObj.id = playerStats.id;
   callArray.push(callObj);
   if(!waitingForReply)
   {
      processCall();
   }
});
§§push(function processCall()
{
   §§push(_loc1_);
   if(callScriptEnable)
   {
      loadMc.removeMovieClip();
      if(callArray.length > 0)
      {
         callObj = callArray.shift();
         slObj = new LoadVars();
         for(var _loc1_ in callObj)
         {
            set("slObj." + _loc1_,callObj[_loc1_]);
         }
         lastCallType = callObj.callType;
         criticMsgWindow.drawWindow();
         depthLoadMc = getNewDepth();
         loadMc = this.createEmptyMovieClip("loadMc" + depthLoadMc,depthLoadMc);
         loadMc.onData = handleReply;
         trace("SEND = " + scriptLink + "?" + unescape(slObj));
         loadVariables(scriptLink + "?" + unescape(slObj),loadMc,"POST");
         waitingForReply = true;
      }
      else
      {
         waitingForReply = false;
      }
   }
   _loc1_ = §§pop();
});
§§push(function setUpgrade(obj)
{
   var _loc1_ = obj;
   trace("obj.rank = " + _loc1_.rank);
   playerStats.dice = Number(_loc1_.dice);
   playerStats.defense = Number(_loc1_.defense);
   playerStats.action = Number(_loc1_.action);
   playerStats.life = Number(_loc1_.ptsLife);
   playerStats.rank = Number(_loc1_.rank);
   _loc1_;
});
if(xmlNbr == undefined)
{
   xmlNbr = "01";
}
waitingForReply = false;
callScriptEnable = true;
depthNb = 0;
callArray = new Array();
paused = false;
spiderData = {dice:3,defense:3,action:3};
updateMission = function()
{
   trace("updateMission");
   callObj = new Object();
   callObj.callType = "updatestat";
   callObj.id = playerStats.id;
   callObj.statName = "mission";
   callObj.toAdd = playerStats.mission;
   callArray.push(callObj);
   if(!waitingForReply)
   {
      processCall();
   }
};
getNextEventDate = function()
{
   trace("getNextEventDate::" + root.crntEvent.id);
   callObj = new Object();
   callObj.callType = "nextEvent";
   callObj.id = root.crntEvent.id;
   callArray.push(callObj);
   if(!waitingForReply)
   {
      processCall();
   }
};
tryLogin = function(userName, passWord)
{
   trace("tryLogin");
   root.ssUserLogin = userName;
   if(root.callScriptEnable)
   {
      callObj = new Object();
      callObj.callType = "login";
      callObj.username = userName;
      callObj.password = passWord;
      callObj.lang = userLang;
      callArray.push(callObj);
      if(!waitingForReply)
      {
         processCall();
      }
      criticMsgWindow.drawWindow("tryLogin");
   }
   else
   {
      loginWindow.gotoAndPlay("close");
   }
};
questionAnswer = function(quesNum, answer)
{
   trace("questionAnswer quesNum = " + quesNum + "  answer = " + answer);
   callObj = new Object();
   callObj.callType = "updatesurvey";
   callObj.id = playerStats.id;
   callObj.quest = quesNum;
   callObj.answer = answer;
   callArray.push(callObj);
   if(!waitingForReply)
   {
      processCall();
   }
};
subscribeUser = function(userName, passWord, age)
{
   trace("subscribeUser");
   callObj = new Object();
   callObj.callType = "subscribeuser";
   callObj.username = userName;
   callObj.password = passWord;
   callObj.age = age;
   trace("age = " + age);
   callArray.push(callObj);
   showText1 = showText2 = showText3 = true;
   trace("waitingForReply = " + waitingForReply);
   if(!waitingForReply)
   {
      processCall();
   }
   criticMsgWindow.drawWindow("tryRegister");
};
upgradeDeck = function()
{
   trace("upgradeDeck");
   for(var _loc1_ in root.playerStats.card)
   {
      root.playerStats.card[_loc1_].deck = 0;
      root.playerStats.card[_loc1_].spc = 0;
   }
   updateAllCards();
   _loc1_;
};
setDeckOrder = function()
{
   trace("SET DECK ORDER");
   var _loc3_ = new Array();
   var _loc2_ = 0;
   while(_loc2_ < root.playerStats.card.length)
   {
      var pushStr = String(root.playerStats.card[_loc2_].id) + String(root.playerStats.card[_loc2_].deck) + String(root.playerStats.card[_loc2_].spc);
      _loc3_.push(Number(pushStr));
      _loc2_ = _loc2_ + 1;
   }
   _loc3_.sort(Array.NUMERIC);
   root.playerStats.card = new Array();
   _loc2_ = 0;
   while(_loc2_ < _loc3_.length)
   {
      var _loc1_ = String(_loc3_[_loc2_]);
      root.playerStats.card.push({id:Number(_loc1_.slice(0,3)),deck:Number(_loc1_.slice(3,4)),spc:Number(_loc1_.slice(4,5))});
      _loc2_ = _loc2_ + 1;
   }
   false;
   _loc3_;
   _loc2_;
   _loc1_;
};
updateCard = function(specificCard)
{
   var _loc1_ = specificCard;
   trace("updateCard");
   §§push(_loc1_);
   §§push(_loc2_);
   if(_loc1_ == undefined)
   {
      if(missionCard.length > 0)
      {
         root.refreshDeck("add",missionCard[0]);
      }
   }
   else if(root.playerStats.card.length < 100)
   {
      root.playerStats.card.push({id:_loc1_,deck:7,spc:0});
      root.refreshDeck("add",{id:_loc1_,deck:7,spc:0});
      root.cardInfoWindow.drawWindow(_loc1_);
   }
   else
   {
      root.tempCardSetID = _loc1_;
      var _loc2_ = function()
      {
         trace("swappin\'");
         root.playerStats.card.splice(root.tempCardSetPos,1);
         root.playerStats.card.push({id:root.tempCardSetID,deck:7,spc:0});
         root.refreshDeck("replace",{id:root.tempCardSetID,deck:7,spc:0},{id:root.tempCardSetID2,deck:7,spc:0});
         delete root.tempCardSetID;
         delete root.tempCardSetID2;
         delete root.tempCardSetPos;
      };
      root.swapCardWindow.drawWindow(_loc1_,_loc2_);
   }
   _loc2_ = §§pop();
   _loc1_ = §§pop();
};
refreshDeck = function(typeUpdate, cardDesc1, cardDesc2, isSpecial)
{
   var _loc1_ = cardDesc1;
   var _loc2_ = typeUpdate;
   trace("refreshDeck");
   var _loc3_ = isSpecial != undefined?"1":"0";
   callObj = new Object();
   callObj.callType = "refreshCard";
   callObj.id = playerStats.id;
   callObj.card1 = _loc2_ != "add"?String(_loc1_.id):String(_loc1_.id) + String(_loc1_.deck) + _loc3_;
   callObj.card2 = !(_loc2_ == "replace" || _loc2_ == "delete")?String(_loc1_.id) + String(_loc1_.deck) + _loc3_:String(cardDesc2.id);
   callObj.typeUpdate = _loc2_;
   callArray.push(callObj);
   §§push(_loc1_);
   §§push(_loc2_);
   §§push(_loc3_);
   if(!waitingForReply)
   {
      processCall();
   }
   criticMsgWindow.drawWindow("changenbcard");
   _loc3_ = §§pop();
   _loc2_ = §§pop();
   _loc1_ = §§pop();
};
updateAllCards = function()
{
   setDeckOrder();
   trace("updateAllCards");
   callObj = new Object();
   callObj.callType = "updateDeck";
   callObj.id = playerStats.id;
   var _loc2_ = new String();
   var _loc1_ = 0;
   while(_loc1_ < 100)
   {
      if(_loc1_ < root.playerStats.card.length)
      {
         _loc2_ = _loc2_ + ("card" + (_loc1_ + 1) + "=" + String(root.playerStats.card[_loc1_].id) + String(root.playerStats.card[_loc1_].deck) + String(root.playerStats.card[_loc1_].spc) + ",");
      }
      else if(root.playerStats.card.length >= 99)
      {
         _loc2_ = _loc2_ + ("card" + (_loc1_ + 1) + "=" + String(root.playerStats.card[_loc1_].id) + String(root.playerStats.card[_loc1_].deck) + String(root.playerStats.card[_loc1_].spc));
      }
      else if(_loc1_ < 99)
      {
         _loc2_ = _loc2_ + ("card" + (_loc1_ + 1) + "=0,");
      }
      else
      {
         _loc2_ = _loc2_ + ("card" + (_loc1_ + 1) + "=0");
      }
      _loc1_ = _loc1_ + 1;
   }
   callObj.cardArr = _loc2_;
   callArray.push(callObj);
   §§push(_loc1_);
   §§push(_loc2_);
   if(!waitingForReply)
   {
      processCall();
   }
   criticMsgWindow.drawWindow("changenbcard");
   _loc2_ = §§pop();
   _loc1_ = §§pop();
};
setGuild = function(newGuild)
{
   trace("setGuild ");
   root.playerStats.rewardAccess = false;
   root.playerStats.reward = false;
   game.eventAccess = false;
   var _loc2_ = 0;
   var _loc3_ = root.playerStats.card.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      if(root.playerStats.card[_loc1_ + _loc2_].spc != undefined && root.playerStats.card[_loc1_ + _loc2_].spc != "")
      {
         if(Number(root.playerStats.card[_loc1_ + _loc2_].spc) > 0)
         {
            root.playerStats.card.splice(_loc1_ + _loc2_,1);
            _loc2_ = _loc2_ - 1;
         }
      }
      _loc1_ = _loc1_ + 1;
   }
   §§push(_loc1_);
   §§push(_loc2_);
   §§push(_loc3_);
   if(newGuild == 1)
   {
      genCardsArr = new Array(503,506,104,201,401);
   }
   else if(newGuild == 2)
   {
      genCardsArr = new Array(502,503,504,100,101,300,104);
   }
   else if(newGuild == 3)
   {
      genCardsArr = new Array(505,201,207,405,404);
   }
   else if(newGuild == 4)
   {
      genCardsArr = new Array(503,103,300,304,405,405,410);
   }
   cardGenFct = function()
   {
      trace("cardGenFct ");
      if(root.playerStats.card.length < 100)
      {
         root.playerStats.card.push({id:root.cardInfoWindow.cardId,deck:7,spc:1});
         if(root.genCardsArr.length > 0)
         {
            root.cardInfoWindow.drawWindow(root.genCardsArr.shift(),root.cardGenFct,getInsName("gldCrdNm",parseKitConnect));
         }
         else
         {
            endGuildFct = function()
            {
               root.textWindow.closeWindow();
               delete endGuildFct;
               delete root.genCardsArr;
               delete root.cardGenFct;
               root.updateAllCards();
            };
            root.textWindow.drawWindow([getInsName("txtEndGuild",parseKitConnect)],0,endGuildFct);
         }
      }
      else
      {
         root.swapCardWindow.drawWindow(root.cardInfoWindow.cardId);
      }
   };
   cardInfoWindow.drawWindow(genCardsArr.shift(),cardGenFct,getInsName("gldCrdNm",parseKitConnect));
   callObj = new Object();
   callObj.callType = "setGuild";
   callObj.id = playerStats.id;
   callObj.newGuild = newGuild;
   callArray.push(callObj);
   if(!waitingForReply)
   {
      processCall();
   }
   criticMsgWindow.drawWindow("changewebcode");
   _loc3_ = §§pop();
   _loc2_ = §§pop();
   _loc1_ = §§pop();
};
setTopTen = function(score, mGameName)
{
   trace("setTopTen ");
   callObj = new Object();
   callObj.callType = "setTopTen";
   callObj.username = root.playerStats.Name;
   callObj.score = score;
   callObj.table = mGameName;
   callArray.push(callObj);
   if(!waitingForReply)
   {
      processCall();
   }
   criticMsgWindow.drawWindow("changewebcode");
};
returnTopTen = function(mGameName)
{
   trace("returnTopTen ");
   callObj = new Object();
   callObj.callType = "returnTopTen";
   callObj.table = mGameName;
   callArray.push(callObj);
   if(!waitingForReply)
   {
      processCall();
   }
   criticMsgWindow.drawWindow("changewebcode");
};
returnGuildsLeader = function()
{
   trace("returnGuildsLeader ");
   callObj = new Object();
   callObj.callType = "returnGuildsLeader";
   callArray.push(callObj);
   if(!waitingForReply)
   {
      processCall();
   }
   criticMsgWindow.drawWindow("changewebcode");
};
checkReward = function()
{
   trace("checkReward ");
   callObj = new Object();
   callObj.callType = "checkReward";
   callObj.id = playerStats.id;
   callArray.push(callObj);
   if(!waitingForReply)
   {
      processCall();
   }
   criticMsgWindow.drawWindow("changewebcode");
};
changewebcode = function(typeWebCode)
{
   trace("changewebcode ");
   callObj = new Object();
   callObj.callType = "changewebcode";
   callObj.id = playerStats.id;
   callObj.typewebcode = typeWebCode;
   callArray.push(callObj);
   if(!waitingForReply)
   {
      processCall();
   }
   criticMsgWindow.drawWindow("changewebcode");
};
initPlayer = function(nameTxt)
{
   trace("initPlayer");
   playerStats = new Object();
   playerStats.Name = nameTxt;
   playerStats.rank = 1;
   playerStats.card = [];
   playerStats.dice = 3;
   playerStats.defense = 4;
   playerStats.action = 3;
   playerStats.life = 10;
   playerStats.victory = 0;
   playerStats.mission = 1;
   tempSex = 1;
   typeSex = "male";
   typeHair = 1;
   typeEyes = 1;
   typeSkin = 1;
   typeBody = 1;
   typeLegs = 1;
   typeArmor = 0;
   typeManacle = 2;
   playerStats.spider = null;
   sprSex = 1;
   sprname = "";
   sprHead = 1;
   sprBody = 1;
   sprLegs = 1;
};
updatePlayer = function()
{
   trace("updatePlayer ");
   updateAllCards();
   callObj = new Object();
   callObj.callType = "newplayer";
   callObj.id = playerStats.id;
   callObj.name = playerStats.Name;
   callObj.sex = tempSex;
   callObj.hair = typeHair;
   callObj.eyes = typeEyes;
   callObj.skin = typeSkin;
   callObj.upper = typeBody;
   callObj.lower = typeLegs;
   callObj.outfit = typeArmor;
   callObj.rank = victoryPtsOffset;
   callObj.attack = playerStats.dice;
   callObj.armor = playerStats.defense;
   callObj.action = playerStats.action;
   callObj.newGuild = playerStats.guild;
   callObj.gils = playerStats.gils;
   callObj.sprname = sprName;
   callObj.sprsex = sprSex;
   callObj.sprupper = sprBody;
   callObj.sprhead = sprHead;
   callObj.sprlegs = sprLegs;
   callArray.push(callObj);
   if(!waitingForReply)
   {
      processCall();
   }
   criticMsgWindow.drawWindow("updatePlayer");
};
doHandleReply = function()
{
   trace("doHandleReply ");
   loadMc.ssError = 10;
};
handleReply = function()
{
   trace("RECEIVE = ");
   for(var i in loadMc)
   {
      trace("  " + i + "=" + loadMc[i]);
   }
   waitingForReply = false;
   clearInterval(processInt);
   if(loadMc.ssError == undefined || loadMc.ssError == "" || Number(loadMc.ssError) == 0)
   {
      criticMsgWindow.closeWindow();
      switch(lastCallType)
      {
         case "login":
            root.googleAnalytic("javascript:urchinTracker(\'/login/" + scriptLink + "\');");
            playerStats = new Object();
            playerStats.id = Number(loadMc.id);
            victoryPtsOffset = _loc0_ = Number(loadMc.rank);
            playerStats.victory = _loc0_;
            playerStats.Name = root.ssUserLogin;
            rankObj = getRankValue2(playerStats.victory);
            setUpgrade(rankObj);
            playerStats.survey = loadMc.survey == "TRUE";
            playerStats.guild = Number(loadMc.guild);
            playerStats.reward = loadMc.reward;
            playerStats.rewardAccess = _loc0_ = loadMc.rewardAccess;
            root.rewardAccess = _loc0_;
            playerStats.gils = Number(loadMC.gils);
            playerStats.nbvisit = Number(loadMC.nbvisit);
            playerStats.guildScore = Number(loadMC.score);
            if(Number(loadMc.mission) == 0)
            {
               loadMc.mission = 1;
            }
            if(Number(loadMc.mission) < 6)
            {
               playerStats.spider = new Object();
               sprAccess = false;
            }
            else
            {
               PlayerStats.spider = spiderData;
               sprAccess = true;
            }
            playerStats.mission = !(loadMc.mission != undefined && loadMc.mission != "")?1:Number(loadMc.mission);
            showText2 = playerStats.mission < 5;
            showText3 = Number(loadMc.nbcards) > 0;
            playerStats.card = new Array();
            trace("CARD SHIFTING");
            var i = 1;
            while(i <= 100)
            {
               var crntString = String(eval("loadMc.card" + i));
               trace(i + " : " + crntString);
               if(crntString != undefined && crntString != "")
               {
                  playerStats.card.push({id:Number(crntString.slice(0,3)),deck:Number(crntString.slice(3,4)),spc:Number(crntString.slice(4,5))});
                  if(crntString.length <= 3)
                  {
                     mustUpgradeDeck = true;
                  }
                  i++;
                  continue;
               }
               break;
            }
            trace("CARD SHIFTING done");
            dictArr = parseDictionnary(loadMC.dictionnary);
            tempSex = Number(loadMc.sex);
            typeSex = tempSex != 1?"female":"male";
            typeHair = Number(loadMc.hair);
            typeEyes = Number(loadMc.eyes);
            typeSkin = Number(loadMc.skin);
            playerStats.tempSex = loadMc.sex;
            playerStats.typeHair = loadMc.hair;
            playerStats.typeEyes = loadMc.eyes;
            playerStats.typeSkin = loadMc.skin;
            typeBody = Number(loadMc.upper);
            typeLegs = Number(loadMc.lower);
            typeArmor = Math.max(Number(loadMc.outfit),1);
            typeManacle = Number(loadMc.mission) <= 3?1:2;
            sprSex = Number(loadMc.sprsex);
            sproffSet = sprSex != 1?4:0;
            sprName = _loc0_ = loadMc.sprname;
            playerStats.spider.Name = _loc0_;
            sprHead = Number(loadMc.sprhead);
            sprBody = Number(loadMc.sprupper);
            sprLegs = Number(loadMc.sprlegs);
            soPopup.data.user_id = playerStats.id;
            soPopup.data.completed = String(playerStats.survey);
            uDay = Number(loadMc.dateServerDay);
            uMonth = Number(loadMc.dateServerMonth);
            uYear = Number(loadMc.dateServerYear);
            uId = Number(loadMc.eventId);
            uState = String(loadMc.eventState);
            loginWindow.gotoAndPlay("close");
            processCall();
            break;
         case "subscribeuser":
            initPlayer(loginWindow.registerWindow.user_txt.text);
            playerStats.id = loadMc.id;
            loginWindow.user_txt.text = loginWindow.registerWindow.user_txt.text;
            loginWindow.pass_txt.text = loginWindow.registerWindow.pass_txt.text;
            loginWindow.registerWindow.closeWindow();
            updatePlayer();
            break;
         case "returnTopTen":
            var slArray = new Array();
            var i = 1;
            while(i <= 10)
            {
               slArray.push(eval("loadMc.score" + i));
               delete "loadMc.score" + i;
               i++;
            }
            trace(slArray);
            trace(root.mGameWindow);
            trace(root.mGameWindow.drawHighScores);
            root.mGameWindow.drawHighScores(slArray);
            delete slArray;
            processCall();
            break;
         case "returnGuildsLeader":
            guildArr = new Array({gScore:"",score1:"",score2:"",score3:"",score4:"",score5:""},{gScore:"",score1:"",score2:"",score3:"",score4:"",score5:""},{gScore:"",score1:"",score2:"",score3:"",score4:"",score5:""},{gScore:"",score1:"",score2:"",score3:"",score4:"",score5:""});
            var i = 1;
            while(i <= 4)
            {
               guildArr[i - 1].gScore = eval("loadMc.guild" + i);
               delete "loadMc.guild" + i;
               var scoreID = 5 * (i - 1);
               guildArr[i - 1].score1 = eval("loadMc.player" + (scoreID + 1));
               delete "loadMc.player" + (scoreID + 1);
               guildArr[i - 1].score2 = eval("loadMc.player" + (scoreID + 2));
               delete "loadMc.player" + (scoreID + 2);
               guildArr[i - 1].score3 = eval("loadMc.player" + (scoreID + 3));
               delete "loadMc.player" + (scoreID + 3);
               guildArr[i - 1].score4 = eval("loadMc.player" + (scoreID + 4));
               delete "loadMc.player" + (scoreID + 4);
               guildArr[i - 1].score5 = eval("loadMc.player" + (scoreID + 5));
               delete "loadMc.player" + (scoreID + 5);
               i++;
            }
            var tempPosArr = new Array();
            var i = 0;
            while(i < root.guildArr.length)
            {
               trace(guildArr[i].gScore);
               tempPosArr.push(parseInt(guildArr[i].gScore));
               i++;
            }
            tempPosArr.sort(Array.NUMERIC);
            var i = 0;
            while(i < tempPosArr.length)
            {
               if(tempPosArr[i] == Number(guildArr[scoreGuild - 1].gScore))
               {
                  charWindow.posTxt.text = 4 - i + " / 4";
                  break;
               }
               i++;
            }
            cleanScore = function(rawScore)
            {
               var _loc2_ = rawScore;
               §§push(_loc1_);
               §§push(_loc2_);
               if(_loc2_ != undefined && _loc2_ != "")
               {
                  var _loc1_ = _loc2_.split("~");
                  §§push(" - " + _loc1_[1] + " - " + _loc1_[2]);
               }
               else
               {
                  §§push("");
               }
               var _loc0_ = §§pop();
               _loc2_ = §§pop();
               _loc1_ = §§pop();
               return _loc0_;
            };
            charWindow.pointsTxt.text = String(guildArr[scoreGuild - 1].gScore);
            charWindow.score0.text = cleanScore(String(guildArr[scoreGuild - 1].score1));
            charWindow.score1.text = cleanScore(String(guildArr[scoreGuild - 1].score2));
            charWindow.score2.text = cleanScore(String(guildArr[scoreGuild - 1].score3));
            charWindow.score3.text = cleanScore(String(guildArr[scoreGuild - 1].score4));
            charWindow.score4.text = cleanScore(String(guildArr[scoreGuild - 1].score5));
            processCall();
            break;
         case "refreshCard":
            missionCard.shift();
            updateCard();
            break;
         case "nextEvent":
            nextEventDate = String(loadMc.nextStartDate);
            introMission.goalTxt = getInsName("nextEventDate",parseKitEvents) + nextEventDate;
            break;
         case "checkReward":
            playerStats.reward = loadMc.reward;
            trace("My Actual Reward = " + loadMc.reward);
            break;
         default:
            processCall();
      }
      this.ssError = "";
   }
   else
   {
      criticMsgWindow.closeWindow();
      switch(lastCallType)
      {
         case "updatestat":
            askWindow.drawWindow2([getInsName("errorUpdt",parseKitConnect)],updateMission,processCall);
            break;
         case "login":
            switch(Number(loadMc.ssError))
            {
               case 3:
                  askWindow.drawWindow2([getInsName("errorLgnUsrnm",parseKitConnect)],loginWindow.registerWindow.openWindow,null);
                  break;
               case 2:
                  textWindow.drawWindow([getInsName("errorLgnPsswrd",parseKitConnect)],0,processCall);
                  break;
               case 1:
                  askWindow.drawWindow2([getInsName("errorLgnUsrnm",parseKitConnect)],loginWindow.registerWindow.openWindow,null);
                  break;
               case 10:
                  textWindow.drawWindow([getInsName("errorLgnAnswr",parseKitConnect)],0,processCall);
                  break;
               default:
                  textWindow.drawWindow([getInsName("errorLgnSrvr",parseKitConnect) + loadMc.msg + " ?"],0,processCall);
            }
            break;
         case "subscribeuser":
            switch(Number(loadMc.ssError))
            {
               case 2:
                  textWindow.drawWindow([getInsName("errorSbscrbInvld1",parseKitConnect)],[getInsName("errorSbscrbInvld2",parseKitConnect)],0,processCall);
                  break;
               case 1:
                  textWindow.drawWindow([getInsName("errorSbscrbUsd",parseKitConnect)],0,processCall);
                  break;
               default:
                  textWindow.drawWindow([getInsName("errorSbscrbSrvr",parseKitConnect) + loadMc.msg],0,processCall);
            }
            break;
         case "refreshCard":
            if(loadMc.ssError == 10)
            {
               askWindow.drawWindow2([getInsName("errorRfrshCnnct",parseKitConnect)],updateCard,processCall);
            }
            else
            {
               askWindow.drawWindow2([getInsName("errorRfrshSrvr1",parseKitConnect) + loadMc.msg + getInsName("errorRfrshSrvr2",parseKitConnect)],updateCard,processCall);
            }
            break;
         case "changewebcode":
            break;
         case "newplayer":
            if(loadMc.ssError == 10)
            {
               askWindow.drawWindow2([getInsName("errorNwPlrCnnct",parseKitConnect)],updateCard,processCall);
            }
            else
            {
               askWindow.drawWindow2([getInsName("errorNwPlrSrv1",parseKitConnect) + loadMc.msg + getInsName("errorNwPlrSrv2",parseKitConnect)],updateCard,processCall);
            }
            break;
      }
      loadMc.ssError = _loc0_ = "";
      this.ssError = _loc0_;
   }
};
if(xmlIsLoaded != true)
{
   thisXML = new XML();
   thisXML.ignoreWhite = true;
   thisXML.onLoad = xmlLoaded;
   thisXML.load("sprSettings" + xmlNbr + "_" + userLang + ".xml");
}
else
{
   trace("doplay ");
   play();
}
