onClipEvent(load){
   function endFct()
   {
      root.nextFrame();
   }
   missionTxt = root.getInsName("nameMis12",root.parseKitMissions);
   goalTxt = root.getInsName("nameMis12Goal",root.parseKitMissions);
   root.victoryPtsOffset = root.playerStats.victory;
   root.playerStats.mission = 12;
   root.updateMission();
   root.updatePlayer();
   root.updateCard();
}
