on(press){
   armorChange = false;
   typeBody--;
   if(typeBody < 1)
   {
      typeBody = 4;
   }
   oldTypeBody = typeBody;
   root.sfx.gotoAndPlay("clic");
   charChange = true;
   refreshPerso();
}
