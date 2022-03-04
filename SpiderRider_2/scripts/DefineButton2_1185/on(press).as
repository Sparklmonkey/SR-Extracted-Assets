on(press){
   spiderChange = true;
   sprLegs++;
   if(sprLegs > 3)
   {
      sprLegs = 1;
   }
   refreshPerso();
}
