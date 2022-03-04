gapEdge = 0;
sValue = 100;
mc_cursor._y = mc_slider._y - Math.floor(sValue / 100 * mc_slider._height);
if(mc_cursor._y < mc_slider._y - mc_slider._height + gapEdge)
{
   mc_cursor._y = mc_slider._y - mc_slider._height + gapEdge;
}
else if(mc_cursor._y > mc_slider._y - gapEdge)
{
   mc_cursor._y = mc_slider._y - gapEdge;
}
mc_cursor.onPress = function()
{
   mc_cursor.gotoAndStop(2);
   mc_cursor.onEnterFrame = function()
   {
      if(_ymouse <= mc_slider._y && _ymouse >= mc_slider._y - mc_slider._height)
      {
         mc_cursor._y = _ymouse;
      }
      if(_ymouse >= mc_slider._y - gapEdge)
      {
         mc_cursor._y = mc_slider._y - gapEdge;
      }
      if(_ymouse <= mc_slider._y - mc_slider._height + gapEdge)
      {
         mc_cursor._y = mc_slider._y - mc_slider._height + gapEdge;
      }
      scrPercent = Math.floor((mc_slider._y - mc_cursor._y) / mc_slider._height * 100);
      lastSValue = sValue;
      sValue = scrPercent;
      if(sValue < lastSValue || sValue > lastSValue)
      {
         if(sValue <= 5)
         {
            _parent.indx = 8;
            sValue = 5;
         }
         else if(sValue >= 95)
         {
            _parent.indx = _parent.lastNbrWordHighlight - 8;
            sValue = 95;
         }
         _parent.indx = _parent.lastNbrWordHighlight - Math.ceil(sValue * _parent.lastNbrWordHighlight / 100) - 1;
         var wordInProcess = _parent.crntMessageArr[_parent.wordPosition];
         _parent.resetWordHighlightFrame();
         if(_parent.indx < 0)
         {
            wordHighlighted = _parent.indx;
            crntBtn = eval("_parent.wordBtn" + wordHighlighted);
            crntBtn.btnMC.gotoAndStop(2);
         }
         else if(_parent.indx > _parent.lastNbrWordHighlight - 5)
         {
            wordHighlighted = 5 + (_parent.indx - _parent.lastNbrWordHighlight);
            crntBtn = eval("_parent.wordBtn" + wordHighlighted);
            crntBtn.btnMC.gotoAndStop(2);
         }
         else
         {
            _parent.setWordsHighlight(wordInProcess,_parent.indx);
         }
      }
   };
};
mc_cursor.onRelease = function()
{
   mc_cursor.gotoAndStop(1);
   delete mc_cursor.onEnterFrame;
};
mc_cursor.onReleaseOutside = function()
{
   mc_cursor.gotoAndStop(1);
   delete mc_cursor.onEnterFrame;
};
