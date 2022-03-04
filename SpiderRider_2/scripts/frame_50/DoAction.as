trace(root.crntEvent);
for(var i in root.crntEvent)
{
   trace(i + "   " + root.crntEvent[i]);
}
var myPos = 0;
var tempPosArr = new Array();
var i = 0;
while(i < guildArr.length)
{
   trace(guildArr[i].gScore);
   tempPosArr.push(parseInt(guildArr[i].gScore));
   i++;
}
tempPosArr.sort(Array.NUMERIC);
var i = 0;
while(i < tempPosArr.length)
{
   if(tempPosArr[i] == Number(guildArr[playerStats.guild - 1].gScore))
   {
      myPos = 4 - i;
      break;
   }
   i++;
}
myGuild = playerStats.guild - 1;
var scoreName1 = root.guildArr[myGuild].score1;
var scoreName2 = root.guildArr[myGuild].score2;
var scoreName3 = root.guildArr[myGuild].score3;
var scoreName4 = root.guildArr[myGuild].score4;
var scoreName5 = root.guildArr[myGuild].score5;
topFive = false;
var n = 1;
while(n <= 5)
{
   crntScore = this["scoreName" + n];
   scoreNameArr = getName(String(crntScore));
   if(scoreNameArr == playerStats.Name)
   {
      topFive = true;
      break;
   }
   n++;
}
trace("topFive = " + topFive);
trace("myPos = " + myPos);
delete tempPosArr;
trace("reward = " + root.playerStats.reward);
§§push(function getName(rawScore)
{
   var _loc1_ = rawScore;
   §§push(_loc1_);
   §§push(_loc2_);
   if(_loc1_ != undefined && _loc1_ != "")
   {
      var _loc2_ = _loc1_.split("~");
      §§push(_loc2_[1]);
   }
   else
   {
      §§push("");
   }
   var _loc0_ = §§pop();
   _loc2_ = §§pop();
   _loc1_ = §§pop();
   return _loc0_;
});
if(root.playerStats.reward == "true" || root.playerStats.reward == true || root.playerStats.reward == 1)
{
   root.playerStats.reward = false;
   root.cancelReward("reward");
   throwTopFive = function()
   {
      trace(topFive + " PASSS1");
      if(topFive == true || topFive == "true")
      {
         trace(topFive + " PASSS2");
         cardTextFct = function()
         {
            trace(topFive + " PASSS3");
            root.genCardsArr = new Array(106,109,301,406,408,414,415,416,419,420,412,509);
            randCard = root.genCardsArr[random(root.genCardsArr.length - 1)];
            root.cardGenFct = function()
            {
               trace(topFive + " PASSS4");
               if(root.playerStats.card.length < 100)
               {
                  root.playerStats.card.push({id:root.cardInfoWindow.cardId,deck:0,spc:0});
                  root.updateAllCards();
                  delete root.genCardsArr;
                  delete root.cardGenFct;
               }
               else
               {
                  root.swapCardWindow.drawWindow(root.cardInfoWindow.cardId);
               }
            };
            trace(topFive + " PASSS5");
            root.cardInfoWindow.drawWindow(randCard,root.cardGenFct,getInsName("topFiveCard",parseKitConnect));
         };
         trace(topFive + " PASSS6");
         textWindow.drawWindow(new Array(getInsName("msgEventTop5",parseKitEvents)),0,cardTextFct);
      }
   };
   tempGenFct4 = function()
   {
      §§push(_loc1_);
      §§push(_loc2_);
      §§push(_loc3_);
      if(myPos == 1)
      {
         var _loc3_ = function()
         {
            var _loc1_ = function()
            {
               trace("PASS");
               §§push(_loc1_);
               if(root.crntEvent.id == 1)
               {
                  var _loc1_ = function()
                  {
                     root.addGils(200);
                     root.cardInfoWindow.drawWindow(null,root.throwTopFive,getInsName("infoReward",parseKitConnect),"gold",200);
                  };
                  textWindow2.drawWindow(new Array(getInsName("msgEventId1",parseKitEvents)),1,_loc1_);
               }
               else if(root.crntEvent.id == 2)
               {
                  _loc1_ = function()
                  {
                     genCardsArr = new Array();
                     genCardsArr.push(504);
                     genCardsArr.push(102);
                     genCardsArr.push(402);
                     root.cardGenFct = function()
                     {
                        if(root.playerStats.card.length < 100)
                        {
                           root.playerStats.card.push({id:root.cardInfoWindow.cardId,deck:0,spc:0});
                           if(root.genCardsArr.length > 0)
                           {
                              root.cardInfoWindow.drawWindow(root.genCardsArr.shift(),root.cardGenFct,getInsName("gldCrdNm",parseKitConnect));
                           }
                           else
                           {
                              root.throwTopFive();
                              root.updateAllCards();
                              delete root.genCardsArr;
                              delete root.cardGenFct;
                           }
                        }
                        else
                        {
                           root.swapCardWindow.drawWindow(root.cardInfoWindow.cardId);
                        }
                     };
                     root.cardInfoWindow.drawWindow(root.genCardsArr.shift(),root.cardGenFct,getInsName("gldCrdNm",parseKitConnect));
                  };
                  textWindow2.drawWindow(new Array(getInsName("msgEventId2",parseKitEvents)),1,_loc1_);
               }
               else if(root.crntEvent.id == 3)
               {
                  _loc1_ = function()
                  {
                     root.addGils(150);
                     root.cardInfoWindow.drawWindow(null,root.throwTopFive,getInsName("infoReward",parseKitConnect),"gold",150);
                  };
                  textWindow2.drawWindow(new Array(getInsName("msgEventId3",parseKitEvents)),1,_loc1_);
               }
               else if(root.crntEvent.id == 4)
               {
                  _loc1_ = function()
                  {
                     genCardsArr = new Array();
                     genCardsArr.push(408);
                     cardGenFct = function()
                     {
                        if(root.playerStats.card.length < 100)
                        {
                           root.playerStats.card.push({id:root.cardInfoWindow.cardId,deck:0,spc:0});
                           if(genCardsArr.length > 0)
                           {
                              trace(root.genCardsArr.length);
                              root.cardInfoWindow.drawWindow(genCardsArr.shift(),cardGenFct,getInsName("gldCrdNm",parseKitConnect));
                           }
                           else
                           {
                              root.throwTopFive();
                              delete genCardsArr;
                              delete cardGenFct;
                              root.updateAllCards();
                           }
                        }
                        else
                        {
                           root.swapCardWindow.drawWindow(root.cardInfoWindow.cardId);
                        }
                     };
                     root.cardInfoWindow.drawWindow(genCardsArr.shift(),cardGenFct,getInsName("gldCrdNm",parseKitConnect));
                  };
                  textWindow2.drawWindow(new Array(getInsName("msgEventId4",parseKitEvents)),1,_loc1_);
               }
               else if(root.crntEvent.id == 5)
               {
                  _loc1_ = function()
                  {
                     root.playerStats.victory = root.playerStats.victory + 120;
                     root.cardInfoWindow.drawWindow(null,root.throwTopFive,getInsName("infoReward",parseKitConnect),"xp",120);
                  };
                  textWindow2.drawWindow(new Array(getInsName("msgEventId5",parseKitEvents)),1,_loc1_);
               }
               else if(root.crntEvent.id == 6)
               {
                  _loc1_ = function()
                  {
                     genCardsArr = new Array();
                     genCardsArr.push(418);
                     root.cardGenFct = function()
                     {
                        if(root.playerStats.card.length < 100)
                        {
                           root.playerStats.card.push({id:root.cardInfoWindow.cardId,deck:0,spc:0});
                           if(root.genCardsArr.length > 0)
                           {
                              root.cardInfoWindow.drawWindow(root.genCardsArr.shift(),root.cardGenFct,getInsName("gldCrdNm",parseKitConnect));
                           }
                           else
                           {
                              root.throwTopFive();
                              delete root.genCardsArr;
                              delete root.cardGenFct;
                              root.updateAllCards();
                           }
                        }
                        else
                        {
                           root.swapCardWindow.drawWindow(root.cardInfoWindow.cardId);
                        }
                     };
                     root.cardInfoWindow.drawWindow(root.genCardsArr.shift(),root.cardGenFct,getInsName("gldCrdNm",parseKitConnect));
                  };
                  textWindow2.drawWindow(new Array(getInsName("msgEventId6",parseKitEvents)),1,_loc1_);
               }
               else if(root.crntEvent.id == 7)
               {
                  _loc1_ = function()
                  {
                     root.addGils(200);
                     root.cardInfoWindow.drawWindow(null,root.throwTopFive,getInsName("infoReward",parseKitConnect),"gold",200);
                  };
                  textWindow2.drawWindow(new Array(getInsName("msgEventId7",parseKitEvents)),1,_loc1_);
               }
               else if(root.crntEvent.id == 8)
               {
                  _loc1_ = function()
                  {
                     root.playerStats.victory = root.playerStats.victory + 180;
                     root.cardInfoWindow.drawWindow(null,root.throwTopFive,getInsName("infoReward",parseKitConnect),"xp",180);
                  };
                  textWindow2.drawWindow(new Array(getInsName("msgEventId8",parseKitEvents)),1,_loc1_);
               }
               else if(root.crntEvent.id == 9)
               {
                  _loc1_ = function()
                  {
                     root.addGils(150);
                     root.cardInfoWindow.drawWindow(null,root.throwTopFive,getInsName("infoReward",parseKitConnect),"gold",150);
                  };
                  textWindow2.drawWindow(new Array(getInsName("msgEventId9",parseKitEvents)),1,_loc1_);
               }
               else if(root.crntEvent.id == 10)
               {
                  _loc1_ = function()
                  {
                     genCardsArr = new Array();
                     genCardsArr.push(413);
                     root.cardGenFct = function()
                     {
                        if(root.playerStats.card.length < 100)
                        {
                           root.playerStats.card.push({id:root.cardInfoWindow.cardId,deck:0,spc:0});
                           if(root.genCardsArr.length > 0)
                           {
                              root.cardInfoWindow.drawWindow(root.genCardsArr.shift(),root.cardGenFct,getInsName("gldCrdNm",parseKitConnect));
                           }
                           else
                           {
                              root.throwTopFive();
                              delete root.genCardsArr;
                              delete root.cardGenFct;
                              root.updateAllCards();
                           }
                        }
                        else
                        {
                           root.swapCardWindow.drawWindow(root.cardInfoWindow.cardId);
                        }
                     };
                     root.cardInfoWindow.drawWindow(root.genCardsArr.shift(),root.cardGenFct,getInsName("gldCrdNm",parseKitConnect));
                  };
                  textWindow2.drawWindow(new Array(getInsName("msgEventId10",parseKitEvents)),1,_loc1_);
               }
               else if(root.crntEvent.id == 11)
               {
                  _loc1_ = function()
                  {
                     root.genCardsArr = new Array();
                     genCardsArr.push(403);
                     genCardsArr.push(402);
                     root.cardGenFct = function()
                     {
                        if(root.playerStats.card.length < 100)
                        {
                           root.playerStats.card.push({id:root.cardInfoWindow.cardId,deck:0,spc:0});
                           if(root.genCardsArr.length > 0)
                           {
                              root.cardInfoWindow.drawWindow(root.genCardsArr.shift(),root.cardGenFct,getInsName("gldCrdNm",parseKitConnect));
                           }
                           else
                           {
                              root.throwTopFive();
                              delete root.genCardsArr;
                              delete root.cardGenFct;
                              root.updateAllCards();
                           }
                        }
                        else
                        {
                           root.swapCardWindow.drawWindow(root.cardInfoWindow.cardId);
                        }
                     };
                     root.cardInfoWindow.drawWindow(root.genCardsArr.shift(),root.cardGenFct,getInsName("gldCrdNm",parseKitConnect));
                  };
                  textWindow2.drawWindow(new Array(getInsName("msgEventId11",parseKitEvents)),1,_loc1_);
               }
               else if(root.crntEvent.id == 12)
               {
                  _loc1_ = function()
                  {
                     root.playerStats.victory = root.playerStats.victory + 180;
                     root.cardInfoWindow.drawWindow(null,root.throwTopFive,getInsName("infoReward",parseKitConnect),"xp",180);
                  };
                  textWindow2.drawWindow(new Array(getInsName("msgEventId12",parseKitEvents)),1,_loc1_);
               }
               _loc1_ = §§pop();
            };
            root.addGils(1000);
            root.cardInfoWindow.drawWindow(null,_loc1_,getInsName("infoReward",parseKitConnect),"gold",1000);
            _loc2_;
            _loc1_;
         };
         textWindow2.drawWindow(new Array(getInsName("msgEventPos1",parseKitEvents)),1,_loc3_);
      }
      else if(myPos == 2)
      {
         _loc3_ = function()
         {
            root.addGils(500);
            root.cardInfoWindow.drawWindow(null,root.throwTopFive,getInsName("infoReward",parseKitConnect),"gold",500);
         };
         textWindow2.drawWindow(new Array(getInsName("msgEventPos2",parseKitEvents)),1,_loc3_);
      }
      else if(myPos == 3)
      {
         _loc3_ = function()
         {
            textWindow2.closeWindow();
            root.throwTopFive();
         };
         textWindow2.drawWindow(new Array(getInsName("msgEventPos3",parseKitEvents)),1,_loc3_);
      }
      else
      {
         _loc3_ = function()
         {
            textWindow2.closeWindow();
            root.throwTopFive();
         };
         textWindow2.drawWindow(new Array(getInsName("msgEventPos4",parseKitEvents)),1,_loc3_);
      }
      _loc3_ = §§pop();
      var _loc2_ = §§pop();
      var _loc1_ = §§pop();
   };
   tempGenFct4();
}
stop();
