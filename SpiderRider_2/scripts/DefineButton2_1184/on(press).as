on(press){
   spiderChange = true;
   sprLegs--;
   if(sprLegs < 1)
   {
      sprLegs = 3;
   }
   refreshPerso();
}
