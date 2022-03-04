onClipEvent(load){
   function endFct()
   {
      root.nextFrame();
   }
   missionTxt = root.getInsName("nameMis3",root.parseKitMissions);
   goalTxt = root.getInsName("nameMis3Goal",root.parseKitMissions);
   root.victoryPtsOffset = root.playerStats.victory;
   root.playerStats.mission = 3;
   root.updateMission();
   root.updatePlayer();
   root.updateCard();
}
