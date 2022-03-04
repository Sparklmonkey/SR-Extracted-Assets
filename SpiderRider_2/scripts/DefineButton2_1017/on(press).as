on(press){
   armorChange = false;
   typeHair++;
   if(typeHair > 4)
   {
      typeHair = 1;
   }
   root.sfx.gotoAndPlay("clic");
   charChange = true;
   refreshPerso();
}
