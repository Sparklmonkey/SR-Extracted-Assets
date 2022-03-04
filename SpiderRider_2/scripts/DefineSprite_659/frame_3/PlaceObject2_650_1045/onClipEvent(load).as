onClipEvent(load){
   drawWindow = function(senderName)
   {
      this.msg = senderName;
      gotoAndPlay(2);
   };
   drawMsg = function(newMsg)
   {
      root.tradeInterval = setInterval(function()
      {
         trace("CALL KILL GAME");
         root.emptyClip.char.bubble.hideBubble();
         root.emptyClip.char.action.hideAction();
         root.callKillGame();
         _parent.gotoAndStop(1);
         clearInterval(root.tradeInterval);
      }
      ,5000,this);
      this.msg = newMsg;
      gotoAndStop(_totalframes);
   };
}
