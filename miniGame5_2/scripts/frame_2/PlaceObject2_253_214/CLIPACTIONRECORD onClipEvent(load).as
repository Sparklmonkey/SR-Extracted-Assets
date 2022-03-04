onClipEvent(load){
   speed = 6;
   score = 300;
   succes = false;
   fct = function()
   {
      this.gotoAndStop("collect");
      mg5.score += score;
      mg5.msgTxt = "+ " + score + root.getInsName("txtMG5_Pts",root.parseKitMGames);
      mg5.score_mc.scoreTxt.text = mg5.score;
   };
}
