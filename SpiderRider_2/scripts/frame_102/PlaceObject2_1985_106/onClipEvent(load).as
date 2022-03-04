onClipEvent(load){
   function endFct()
   {
      root.nextFrame();
   }
   missionTxt = root.getInsName("nameMis8",root.parseKitMissions);
   goalTxt = root.getInsName("nameMis8Goal",root.parseKitMissions);
   root.victoryPtsOffset = root.playerStats.victory;
   root.playerStats.mission = 8;
   root.updateMission();
   root.updatePlayer();
   root.updateCard();
}
