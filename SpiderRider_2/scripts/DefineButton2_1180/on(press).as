on(press){
   spiderChange = true;
   sprBody--;
   if(sprBody < 1)
   {
      sprBody = 4;
   }
   refreshPerso();
}
