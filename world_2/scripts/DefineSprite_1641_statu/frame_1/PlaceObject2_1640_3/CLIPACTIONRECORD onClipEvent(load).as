onClipEvent(load){
   crntScore = 0;
   crntLeader = 1;
   var i = 0;
   while(i < 4)
   {
      if(crntScore < root.guildArr[i].gScore)
      {
         crntScore = root.guildArr[i - 1].gScore;
         crntLeader = i + 1;
      }
      i++;
   }
   this.gotoAndStop(crntLeader);
}
