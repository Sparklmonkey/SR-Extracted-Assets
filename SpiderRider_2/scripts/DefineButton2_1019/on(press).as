on(press){
   armorChange = false;
   typeEyes++;
   if(typeEyes > 4)
   {
      typeEyes = 1;
   }
   root.sfx.gotoAndPlay("clic");
   charChange = true;
   refreshPerso();
}
