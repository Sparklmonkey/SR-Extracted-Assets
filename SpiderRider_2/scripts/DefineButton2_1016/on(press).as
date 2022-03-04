on(press){
   armorChange = false;
   typeHair--;
   if(typeHair < 1)
   {
      typeHair = 4;
   }
   root.sfx.gotoAndPlay("clic");
   charChange = true;
   refreshPerso();
}
