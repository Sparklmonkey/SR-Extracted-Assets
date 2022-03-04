onClipEvent(load){
   speed = 7;
   succes = false;
   fct = function()
   {
      this.gotoAndStop("collect");
      mg5.charInv += 60;
      mg5.msgTxt = root.getInsName("txtMG5_Invincible",root.parseKitMGames);
      if(!mg5.flashStarted)
      {
         mg5.flashInt = setInterval(mg5.flashChar,40);
      }
      mg5.flashStarted = true;
   };
}
