onClipEvent(load){
   this.onPress = function()
   {
      var _loc1_ = _parent;
      this.gotoAndStop("down");
      root.sfx.gotoAndPlay("clic1");
      §§push(_loc1_);
      if(_loc1_.confirmPass_txt.text == _loc1_.pass_txt.text)
      {
         if(root.testBadWord(_loc1_.user_txt.text))
         {
            eraseUserFct = function()
            {
               _parent.user_txt.text = "";
            };
            root.textWindow.drawWindow([root.getInsName("txtErrorRegis1",root.parseMultiConnect)],eraseUserFct);
         }
         else
         {
            root.subscribeUser(_loc1_.user_txt.text,_loc1_.pass_txt.text,_loc1_.age);
         }
      }
      else
      {
         root.textWindow.drawWindow([root.getInsName("txtErrorRegis2",root.parseMultiConnect)],null);
      }
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
