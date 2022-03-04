function setToolTip(phrase, callerMC)
{
   toolTip.wordTxt.text = phrase;
   toolTip._x = callerMC._x;
   toolTip._y = callerMC._y;
   toolTip._visible = true;
   toolTip._alpha = 0;
   toolTip.onEnterFrame = function()
   {
      if(toolTip._alpha < 100)
      {
         toolTip._alpha += 10;
      }
      else
      {
         delete toolTip.onEnterFrame;
      }
   };
}
function killToolTip()
{
   toolTip.wordTxt.text = "";
   toolTip._visible = false;
   delete toolTip.onEnterFrame;
}
function resetEmoticonSelection()
{
   emoSelected = 0;
   var i = 0;
   while(i <= 7)
   {
      var emoConcerned = eval("this.emoticons.emo0" + i);
      emoConcerned.contour._visible = false;
      i++;
   }
}
function resetIconSelection()
{
   iconSelected = 0;
   var i = 1;
   while(i <= 5)
   {
      var btnConcerned = eval("this.iconBtn" + i);
      btnConcerned.gotoAndStop(1);
      i++;
   }
}
function resetWordHighlight()
{
   var i = 0;
   while(i < 5)
   {
      var wordBtn = eval("this.wordBtn" + i);
      wordBtn._visible = false;
      i++;
   }
   wordHighlighted = -1;
}
function resetWordHighlightFrame()
{
   var i = 0;
   while(i < 5)
   {
      var wordBtn = eval("this.wordBtn" + i);
      wordBtn.btnMC.gotoAndStop(1);
      i++;
   }
   this["wordBtn" + wordHighlighted].btnMC.gotoAndStop(2);
}
function switchLetter(letter)
{
   clearInterval(parseID);
   parseDict(chat.allDictionnaries[parseIndx]);
}
function parseDict(letter)
{
   trace("parseDict");
   j = 0;
   while(j < newDictionnary.length)
   {
      if(letter != "SYMBOL")
      {
         if(newDictionnary[j].charAt(0) == letter.toLowerCase())
         {
            thisWord = newDictionnary.splice(j,1);
            j--;
            eval("chat.dictBy" + letter).push(thisWord);
         }
      }
      else
      {
         thisWord = newDictionnary.splice(j,1);
         eval("chat.dictBy" + letter).push(thisWord);
         j--;
      }
      j++;
   }
   parseIndx++;
   if(chat.allDictionnaries[parseIndx] != undefined)
   {
      chat.mc_load.loadTxt.loadTxt.text = chat.allDictionnaries[parseIndx];
      parseID = setInterval(switchLetter,100,chat.allDictionnaries[parseIndx]);
   }
   else
   {
      chat.mc_load._visible = false;
      this._visible = true;
   }
}
function getCrntDict(myLetter)
{
   myDict = eval("chat.dictBy" + myLetter);
   if(myDict == undefined)
   {
      myDict = chat.dictBySYMBOL;
   }
   return myDict;
}
function setWordsHighlight(crntWord, indx)
{
   var returnWords = new Array();
   var cleanWord = returnCleanString(crntWord);
   crntDict = getCrntDict(crntWord.charAt(0));
   var i = 0;
   while(i < crntDict.length)
   {
      var dictWord = String(crntDict[i]);
      var cleanDictWord = returnCleanString(dictWord);
      if(crntWord.charAt(0) == dictWord.charAt(0) || crntWord.charAt(0) == cleanDictWord.charAt(0))
      {
         if(storeFlag)
         {
            wordsStored.push(crntDict[i]);
         }
         if(dictWord.indexOf(crntWord) != -1 || cleanDictWord.indexOf(crntWord) != -1)
         {
            returnWords.push(crntDict[i]);
         }
         if(scroller._currentframe == 1)
         {
            scroller.drawScroller();
         }
      }
      i++;
   }
   for(var i in returnWords)
   {
      if(String(returnWords[i]) == String(crntWord))
      {
         returnWords.splice(i,1);
         returnWords.unshift(crntWord);
         break;
      }
   }
   var i = 0;
   while(i < 5)
   {
      newIndx = i + indx;
      var wordBtn = eval("wordBtn" + i);
      wordBtn._x = initWordX + this.msgTxt.text.length * wordMultiplier;
      if(returnWords[newIndx] == undefined)
      {
         wordBtn._visible = false;
      }
      else
      {
         wordBtn.wordTxt.text = returnWords[newIndx];
         wordBtn._visible = true;
         if(i == 0)
         {
            if(newIndx == 0)
            {
               wordHighlighted = newIndx;
            }
            resetWordHighlightFrame();
            this["wordBtn" + wordHighlighted].btnMC.gotoAndStop(2);
         }
         else if(newIndx == 0)
         {
            wordBtn.btnMC.gotoAndStop(1);
         }
      }
      i++;
   }
   scroller._x = wordBtn0._x + wordBtn0._width;
   lastNbrWordHighlight = returnWords.length;
}
function returnCleanString(StringToClean)
{
   var _loc2_ = StringToClean;
   newWordArr = _loc2_.split("");
   for(var _loc1_ in newWordArr)
   {
      newWordArr[_loc1_] = root.formatChar(newWordArr[_loc1_]);
   }
   return newWordArr.join("");
}
function addWord(wordToAdd)
{
   var _loc1_ = crntMessageArr.join(" ");
   if(_loc1_.length - 1 + wordToAdd.length < maxLetters)
   {
      crntMessageArr[wordPosition] = wordToAdd;
      crntMessageArr[++wordPosition] = "";
   }
   else
   {
      crntMessageArr[wordPosition] = "";
   }
   i = 0;
   while(i < crntMessageArr[0].length)
   {
      if(i == 0)
      {
         toUpperWord = crntMessageArr[0].charAt(i).toUpperCase();
      }
      else
      {
         toUpperWord += crntMessageArr[0].charAt(i);
      }
      i++;
   }
   crntMessageArr[0] = toUpperWord;
   scroller.closeScroller();
   this.msgTxt.text = "";
   resetWordHighlight();
}
function removeWord()
{
   var _loc1_ = crntMessageArr[crntMessageArr.length - 1];
   if(_loc1_ == "")
   {
      crntMessageArr.splice(crntMessageArr.length - 1,1);
      wordPosition = crntMessageArr.length <= 0 ? 0 : crntMessageArr.length - 1;
   }
   crntMessageArr[wordPosition] = "";
   this.msgTxt.text = "";
   resetWordHighlight();
}
function doSendChatMessage()
{
   var _loc1_ = this;
   scroller.closeScroller();
   crntMessageArr.splice(crntMessageArr.length - 1,1);
   var _loc3_ = crntMessageArr.join(" ");
   if(_loc3_ == "")
   {
      if(_loc1_.emoSelected > 0)
      {
         root.userSO.send("setChatMessage",root.playerStats.Name,"",_loc1_.emoSelected);
      }
      else if(_loc1_.iconSelected > 0)
      {
         root.userSO.send("setChatMessage",root.playerStats.Name,0,_loc1_.iconSelected);
      }
   }
   else
   {
      root.userSO.send("setChatMessage",root.playerStats.Name,_loc3_,_loc1_.emoSelected);
   }
   for(var _loc2_ in crntMessageArr)
   {
      if(crntMessageArr[_loc2_] != "")
      {
         wordsUsed.push(crntMessageArr[_loc2_]);
      }
   }
   if(wordsUsed.length > 10)
   {
      root.updateWords(wordsUsed);
      wordsUsed = new Array();
   }
   crntMessageArr = new Array("");
   wordPosition = 0;
   lastRecord = _loc1_.msgTxt.text = "";
   resetIconSelection();
   resetEmoticonSelection();
   resetWordHighlight();
}
stop();
maxLetters = 44;
emoSelected = iconSelected = 0;
wordHighlighted = -1;
timeCheck = -1;
initWordX = wordBtn0._x;
initTimeCheck = 4;
wordMultiplier = 4.9;
crntMessageArr = new Array("");
wordPosition = 0;
lastRecord = this.msgTxt.text;
wordsUsed = new Array();
parseIndx = 0;
newDictArr = new Array();
iconReleaseFct = function(iconID)
{
   msgTxt.text = "";
   resetEmoticonSelection();
   resetIconSelection();
   iconSelected = iconID;
   btnConcerned = eval("this.iconBtn" + iconID);
   btnConcerned.gotoAndStop(2);
   doSendChatMessage();
   killToolTip();
};
setEmoticon = function(emoID)
{
   resetEmoticonSelection();
   resetIconSelection();
   emoSelected = emoID;
   var emoConcerned = eval("this.emoticons.emo0" + (emoID - 1));
   doSendChatMessage();
   killToolTip();
};
this.onEnterFrame = function()
{
   if(--timeCheck <= 0)
   {
      if(Key.isDown(40) && lastNbrWordHighlight > 0)
      {
         if(wordHighlighted < 4)
         {
            if(this["wordBtn" + (wordHighlighted + 1)]._visible)
            {
               timeCheck = initTimeCheck;
               wordHighlighted++;
               resetWordHighlightFrame();
               this["wordBtn" + wordHighlighted].btnMC.gotoAndStop(2);
            }
         }
         else
         {
            timeCheck = initTimeCheck;
            if(indx < lastNbrWordHighlight - 5)
            {
               indx++;
            }
            resetWordHighlightFrame();
            wordHighlighted = 4;
            percentInd = Math.ceil(indx / lastNbrWordHighlight * 100);
            trace(percentInd);
            scroller.mc_cursor._y = Math.floor(percentInd / 100 * scroller.mc_slider._height) - scroller.mc_slider._height / 2;
            this["wordBtn" + wordHighlighted].btnMC.gotoAndStop(2);
            var wordInProcess = crntMessageArr[wordPosition];
            setWordsHighlight(wordInProcess,indx);
         }
         Selection.setFocus("msgTxt");
         Selection.setSelection(lastRecord.length,lastRecord.length);
      }
      else if(Key.isDown(38) && lastNbrWordHighlight > 0)
      {
         if(wordHighlighted > 0)
         {
            if(this["wordBtn" + (wordHighlighted - 1)]._visible)
            {
               timeCheck = initTimeCheck;
               wordHighlighted--;
               resetWordHighlightFrame();
               this["wordBtn" + wordHighlighted].btnMC.gotoAndStop(2);
            }
         }
         else
         {
            timeCheck = initTimeCheck;
            if(indx > 0)
            {
               indx--;
            }
            percentInd = Math.ceil(indx / lastNbrWordHighlight * 100);
            trace(percentInd);
            scroller.mc_cursor._y = Math.floor(percentInd / 100 * scroller.mc_slider._height) - scroller.mc_slider._height / 2;
            resetWordHighlightFrame();
            wordHighlighted = 0;
            this["wordBtn" + wordHighlighted].btnMC.gotoAndStop(2);
            var wordInProcess = crntMessageArr[wordPosition];
            setWordsHighlight(wordInProcess,indx);
         }
         Selection.setFocus("msgTxt");
         Selection.setSelection(lastRecord.length,lastRecord.length);
      }
      else if(Key.isDown(8))
      {
         scroller.closeScroller();
         timeCheck = initTimeCheck;
         removeWord();
      }
      else if(Key.isDown(32))
      {
         scroller.closeScroller();
         timeCheck = initTimeCheck;
         var wordBtnConcerned = eval("wordBtn" + wordHighlighted);
         trace(wordBtnConcerned.wordTxt.text);
         addWord(wordBtnConcerned.wordTxt.text);
         wordBtnConcerned.btnMC.gotoAndStop(1);
         wordHighlighted = -1;
      }
      else if(Key.isDown(13))
      {
         scroller.closeScroller();
         timeCheck = initTimeCheck;
         if(wordHighlighted >= 0)
         {
            var wordBtnConcerned = eval("wordBtn" + wordHighlighted);
            addWord(wordBtnConcerned.wordTxt.text);
            wordBtnConcerned.btnMC.gotoAndStop(1);
            wordHighlighted = -1;
         }
         else
         {
            doSendChatMessage();
         }
      }
      else if(lastRecord != this.msgTxt.text)
      {
         var wordSet = this.msgTxt.text;
         var lastLetterOf = wordSet.charAt(wordSet.length - 1);
         lastLetterOf = lastLetterOf.toLowerCase();
         if(lastLetterOf != "")
         {
            var wordInProcess = crntMessageArr[wordPosition];
            wordInProcess = wordInProcess != "" ? wordInProcess + lastLetterOf : lastLetterOf;
            indx = 0;
            setWordsHighlight(wordInProcess,indx);
            if(lastNbrWordHighlight > 0)
            {
               crntMessageArr[wordPosition] = wordInProcess;
            }
            else
            {
               wordInProcess = crntMessageArr[wordPosition];
               setWordsHighlight(wordInProcess,indx);
            }
         }
         lastRecord = this.msgTxt.text = crntMessageArr.join(" ");
         Selection.setFocus("msgTxt");
         Selection.setSelection(lastRecord.length,lastRecord.length);
         resetIconSelection();
         killToolTip();
      }
   }
};
if(chat.dictByA[0] == undefined || chat.dictByA[0] == "")
{
   newDictionnary = root.dictArr.slice();
   parseDict(chat.allDictionnaries[parseIndx]);
   Selection.setFocus("msgTxt");
}
else
{
   chat.mc_load._visible = false;
   this._visible = true;
}
resetWordHighlight();
Selection.setFocus("msgTxt");
stop();
