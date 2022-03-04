onClipEvent(load){
   function endFct()
   {
      root.nextFrame();
   }
   missionTxt = root.getInsName("nameMis14",root.parseKitMissions);
   goalTxt = root.getInsName("nameMis14Goal",root.parseKitMissions);
   root.victoryPtsOffset = root.playerStats.victory;
   root.playerStats.mission = 14;
   root.updateMission();
   root.updatePlayer();
   root.updateCard();
}
