onClipEvent(load){
   endFct1 = game.setZone(game.hotspot1,this);
   fct = function()
   {
      game.unregisterWalkZone(this);
      checkFct = function()
      {
         endFct1();
         root.askWindow.closeWindow();
      };
      if(game.hotspot1.eType == "aBattle" || game.hotspot1.eType == "mBattle")
      {
         game.hotspot1.eType != "aBattle" ? (arrTxt = root.getInsName("txtFight",root.parseKitWorld)) : (arrTxt = root.getInsName("txtChallenge",root.parseKitWorld));
         root.askWindow.drawWindow(new Array(arrTxt),checkFct);
      }
      else
      {
         endFct1();
      }
   };
}
