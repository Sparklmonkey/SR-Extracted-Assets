onClipEvent(load){
   function drawWindow(id, fct, txt, other, ammount)
   {
      var _loc1_ = this;
      cardId = id;
      _loc1_.fct = fct;
      _loc1_.addTxt = txt;
      _loc1_.other = other;
      _loc1_.ammount = ammount;
      _visible = true;
      gotoAndStop("show");
      play();
      _loc1_;
   }
}
