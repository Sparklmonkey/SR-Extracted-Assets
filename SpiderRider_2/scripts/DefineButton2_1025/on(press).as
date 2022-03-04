on(press){
   armorChange = false;
   typeLegs++;
   if(typeLegs > 4)
   {
      typeLegs = 1;
   }
   oldTypeLegs = typeLegs;
   root.sfx.gotoAndPlay("clic");
   charChange = true;
   refreshPerso();
}
