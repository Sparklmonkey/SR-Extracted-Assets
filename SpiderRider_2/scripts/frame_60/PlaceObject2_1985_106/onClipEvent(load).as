onClipEvent(load){
   function endFct()
   {
      root.nextFrame();
   }
   missionTxt = root.getInsName("nameMis2",root.parseKitMissions);
   goalTxt = root.getInsName("nameMis2Goal",root.parseKitMissions);
   root.victoryPtsOffset = root.playerStats.victory;
   root.playerStats.mission = 2;
   root.updateMission();
   root.updatePlayer();
   root.updateCard();
}
