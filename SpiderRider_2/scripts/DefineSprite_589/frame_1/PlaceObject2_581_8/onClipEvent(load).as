onClipEvent(load){
   this.onPress = function()
   {
      var _loc1_ = _parent;
      this.gotoAndStop("down");
      root.sfx.gotoAndPlay("clic");
      §§push(_loc1_);
      if(_loc1_._parent._parent.fct == undefined)
      {
         if(_loc1_._parent._parent.cardID != undefined)
         {
            root.playerStats.card[root.tempCardSetPos] = {id:_loc1_._parent._parent.aquiredCardID,deck:0,spc:0};
         }
         if(root.genCardsArr.length > 0)
         {
            root.cardInfoWindow.drawWindow(root.genCardsArr.shift(),root.cardGenFct,root.getInsName("gldCrdNm",root.parseKitConnect));
         }
         else
         {
            delete root.genCardsArr;
            delete root.cardGenFct;
            root.setDeckOrder();
            root.updateAllCards();
         }
      }
      else
      {
         trace(_loc1_._parent._parent.cardID);
         trace(root.tempCardSetPos);
         if(_loc1_._parent._parent.cardID != undefined)
         {
            root.playerStats.card.splice(root.tempCardSetPos,1);
            _loc1_._parent._parent.fct();
         }
         delete root.tempCardSetID;
         delete root.tempCardSetID2;
         delete root.tempCardSetPos;
      }
      root.swapCardWindow.gotoAndStop("hide");
      _loc1_ = §§pop();
   };
   this.onRollOver = function()
   {
      this.gotoAndStop("over");
   };
   this.onRollOut = function()
   {
      this.gotoAndStop("up");
   };
   this.onRelease = function()
   {
      this.gotoAndStop("up");
   };
   this.onReleaseOutside = function()
   {
      this.gotoAndStop("up");
   };
}
