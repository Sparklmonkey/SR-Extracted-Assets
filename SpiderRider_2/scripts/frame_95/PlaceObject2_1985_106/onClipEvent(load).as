onClipEvent(load){
   function endFct()
   {
      root.nextFrame();
   }
   missionTxt = root.getInsName("nameMis7",root.parseKitMissions);
   goalTxt = root.getInsName("nameMis7Goal",root.parseKitMissions);
   root.victoryPtsOffset = root.playerStats.victory;
   root.playerStats.mission = 7;
   root.updateMission();
   root.updatePlayer();
   root.updateCard();
}
