onClipEvent(load){
   function endFct()
   {
      root.nextFrame();
   }
   missionTxt = root.getInsName("nameMis10",root.parseKitMissions);
   goalTxt = root.getInsName("nameMis10Goal",root.parseKitMissions);
   root.victoryPtsOffset = root.playerStats.victory;
   root.playerStats.mission = 10;
   root.updateMission();
   root.updatePlayer();
   root.updateCard();
}
