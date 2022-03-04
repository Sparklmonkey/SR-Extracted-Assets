onClipEvent(load){
   function endFct()
   {
      root.nextFrame();
   }
   missionTxt = root.getInsName("nameMis13",root.parseKitMissions);
   goalTxt = root.getInsName("nameMis13Goal",root.parseKitMissions);
   root.victoryPtsOffset = root.playerStats.victory;
   root.playerStats.mission = 13;
   root.updateMission();
   root.updatePlayer();
   root.updateCard();
}
