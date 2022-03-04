onClipEvent(load){
   function endFct()
   {
      root.nextFrame();
   }
   missionTxt = root.getInsName("nameMis9",root.parseKitMissions);
   goalTxt = root.getInsName("nameMis9Goal",root.parseKitMissions);
   root.victoryPtsOffset = root.playerStats.victory;
   root.playerStats.mission = 9;
   root.updateMission();
   root.updatePlayer();
   root.updateCard();
}
