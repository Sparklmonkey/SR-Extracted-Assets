onClipEvent(load){
   function drawWindow(ID)
   {
      _quality = "MEDIUM";
      this.concernedGame = eval("root.miniGame" + ID);
      this.ID = ID;
      _visible = true;
      this.gotoAndPlay("open");
   }
   function drawGame(fName)
   {
      waitScrn.txtName = fName;
      waitScrn.gotoAndStop("Match");
   }
   function closeWindow()
   {
      this.gotoAndPlay("close");
   }
   function setToDark(btnToSet)
   {
      var _loc2_ = {ra:"50",rb:"0",ga:"50",gb:"0",ba:"50",bb:"0",aa:"100",ab:"0"};
      var _loc1_ = new Color(btnToSet);
      _loc1_.setTransform(_loc2_);
      btnToSet.enabled = false;
      _loc2_;
      _loc1_;
   }
}
