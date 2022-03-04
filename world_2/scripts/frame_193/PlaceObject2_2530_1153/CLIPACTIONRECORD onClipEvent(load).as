onClipEvent(load){
   endFct1 = game.setZone(game.hotspot2,this);
   fct = function()
   {
      game.unregisterWalkZone(this);
      checkFct = function()
      {
         endFct1();
         root.askWindow.closeWindow();
      };
      if(game.hotspot2.eType == "aBattle" || game.hotspot2.eType == "mBattle")
      {
         game.hotspot2.eType != "aBattle" ? (arrTxt = root.getInsName("txtFight",root.parseKitWorld)) : (arrTxt = root.getInsName("txtChallenge",root.parseKitWorld));
         root.askWindow.drawWindow(new Array(arrTxt),checkFct);
      }
      else
      {
         endFct1();
      }
   };
}
