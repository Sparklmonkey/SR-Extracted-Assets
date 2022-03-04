onClipEvent(load){
   function endFct()
   {
      root.nextFrame();
   }
   missionTxt = root.getInsName("nameMis4",root.parseKitMissions);
   goalTxt = root.getInsName("nameMis4Goal",root.parseKitMissions);
   root.victoryPtsOffset = root.playerStats.victory;
   root.playerStats.mission = 4;
   root.updateMission();
   root.updatePlayer();
   root.updateCard();
}
