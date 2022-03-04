on(press){
   armorChange = true;
   charChange = true;
   if(crntArmorShown <= 0)
   {
      crntArmorShown = armorSelectArr.length - 1;
   }
   else
   {
      crntArmorShown--;
   }
   typeArmor = armorSelectArr[crntArmorShown];
   root.sfx.gotoAndPlay("clic");
   charChange = true;
   typeBody = 4 + typeArmor;
   typeLegs = 4 + typeArmor;
   typeManacle = 1;
   refreshPerso();
   armorCheck.gotoAndStop(2);
}
