on(press){
   armorChange = false;
   typeSkin++;
   if(typeSkin > 4)
   {
      typeSkin = 1;
   }
   root.sfx.gotoAndPlay("clic");
   charChange = true;
   refreshPerso();
}
