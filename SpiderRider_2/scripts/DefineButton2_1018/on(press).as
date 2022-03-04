on(press){
   armorChange = false;
   typeEyes--;
   if(typeEyes < 1)
   {
      typeEyes = 4;
   }
   root.sfx.gotoAndPlay("clic");
   charChange = true;
   refreshPerso();
}
