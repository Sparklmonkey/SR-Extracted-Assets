onClipEvent(load){
   this.onPress = function()
   {
      var _loc1_ = _parent;
      this.gotoAndStop("down");
      _loc1_.charChange = true;
      _loc1_.tempSex = random(2);
      _loc1_.typeSex = !_loc1_.tempSex?"female":"male";
      _loc1_.typeHair = random(4) + 1;
      _loc1_.typeEyes = random(4) + 1;
      _loc1_.typeSkin = random(4) + 1;
      _loc1_.typeBody = random(4) + 1;
      _loc1_.typeLegs = random(4) + 1;
      _loc1_.typeArmor = random(4) + 1;
      root.sfx.gotoAndPlay("clic");
      _loc1_.refreshPerso();
      _loc1_;
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
