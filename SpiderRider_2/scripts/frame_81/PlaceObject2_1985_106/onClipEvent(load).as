onClipEvent(load){
   function endFct()
   {
      root.nextFrame();
   }
   missionTxt = root.getInsName("nameMis5",root.parseKitMissions);
   goalTxt = root.getInsName("nameMis5Goal",root.parseKitMissions);
   root.victoryPtsOffset = root.playerStats.victory;
   root.playerStats.mission = 5;
   root.updateMission();
   root.updatePlayer();
   root.updateCard();
}
