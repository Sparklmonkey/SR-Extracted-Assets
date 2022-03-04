on(press){
   inWorld = false;
   killNetConnection();
   root.playerStats.mission = level.text;
   gotoAndStop("level1");
   play();
}
