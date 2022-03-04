onClipEvent(load){
   function endFct()
   {
      root.nextFrame();
   }
   missionTxt = root.getInsName("nameMis6",root.parseKitMissions);
   goalTxt = root.getInsName("nameMis6Goal",root.parseKitMissions);
   root.victoryPtsOffset = root.playerStats.victory;
   root.playerStats.mission = 6;
   root.updateMission();
   root.updatePlayer();
   root.updateCard();
}
