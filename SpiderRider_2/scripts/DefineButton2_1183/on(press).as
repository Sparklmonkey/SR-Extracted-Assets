on(press){
   spiderChange = true;
   sprHead++;
   if(sprHead > 4)
   {
      sprHead = 1;
   }
   refreshPerso();
}
