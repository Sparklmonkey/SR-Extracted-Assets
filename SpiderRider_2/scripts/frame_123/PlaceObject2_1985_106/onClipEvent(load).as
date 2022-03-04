onClipEvent(load){
   function endFct()
   {
      root.nextFrame();
   }
   missionTxt = root.getInsName("nameMis11",root.parseKitMissions);
   goalTxt = root.getInsName("nameMis11Goal",root.parseKitMissions);
   root.victoryPtsOffset = root.playerStats.victory;
   root.playerStats.mission = 11;
   root.updateMission();
   root.updatePlayer();
   root.updateCard();
}
