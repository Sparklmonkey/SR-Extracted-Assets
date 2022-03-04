onClipEvent(load){
   function endFct()
   {
      root.nextFrame();
   }
   missionTxt = root.getInsName("nameMis15",root.parseKitMissions);
   goalTxt = root.getInsName("nameMis15Goal",root.parseKitMissions);
   root.victoryPtsOffset = root.playerStats.victory;
   root.playerStats.mission = 15;
   root.updateMission();
   root.updatePlayer();
   root.updateCard();
}
