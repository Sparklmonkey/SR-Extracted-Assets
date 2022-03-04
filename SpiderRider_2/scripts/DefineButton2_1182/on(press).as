on(press){
   spiderChange = true;
   sprHead--;
   if(sprHead < 1)
   {
      sprHead = 4;
   }
   refreshPerso();
}
