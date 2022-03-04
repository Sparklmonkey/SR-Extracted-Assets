onClipEvent(load){
   function drawWindow(cardID, fct)
   {
      this.acquiredCardID = Number(cardID);
      this.fct = fct;
      gotoAndStop("show");
   }
}
