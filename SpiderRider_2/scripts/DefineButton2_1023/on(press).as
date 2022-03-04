on(press){
   armorChange = false;
   typeBody++;
   if(typeBody > 4)
   {
      typeBody = 1;
   }
   oldTypeBody = typeBody;
   root.sfx.gotoAndPlay("clic");
   charChange = true;
   refreshPerso();
}
