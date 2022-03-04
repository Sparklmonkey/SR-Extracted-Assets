on(press){
   spiderChange = true;
   sprBody++;
   if(sprBody > 4)
   {
      sprBody = 1;
   }
   refreshPerso();
}
