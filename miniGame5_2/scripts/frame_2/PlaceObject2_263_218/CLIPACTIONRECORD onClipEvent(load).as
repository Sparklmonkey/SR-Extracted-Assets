onClipEvent(load){
   speed = 5;
   health = 15;
   succes = false;
   fct = function()
   {
      this.gotoAndStop("collect");
      mg5.msgTxt = "+ " + health + root.getInsName("txtMG5_Health",root.parseKitMGames);
      if(mg5.health._currentframe - health <= 0)
      {
         mg5.health.gotoAndStop(1);
      }
      else
      {
         mg5.health.gotoAndStop(mg5.health._currentframe - health);
      }
   };
}
