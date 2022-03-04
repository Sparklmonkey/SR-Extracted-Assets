on(press){
   armorChange = false;
   typeLegs--;
   if(typeLegs < 1)
   {
      typeLegs = 4;
   }
   oldTypeLegs = typeLegs;
   root.sfx.gotoAndPlay("clic");
   charChange = true;
   refreshPerso();
}
