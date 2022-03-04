on(press){
   armorChange = false;
   typeSkin--;
   if(typeSkin < 1)
   {
      typeSkin = 4;
   }
   root.sfx.gotoAndPlay("clic");
   charChange = true;
   refreshPerso();
}
