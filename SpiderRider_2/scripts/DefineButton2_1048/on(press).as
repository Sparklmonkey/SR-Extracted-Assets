on(press){
   if(armorCheck._currentframe < 2)
   {
      oldTypeBody = typeBody;
      typeBody = 4 + typeArmor;
      oldTypeLegs = typeLegs;
      typeLegs = 4 + typeArmor;
      oldTypeManacle = typeManacle;
      typeManacle = 1;
      armorChange = true;
      refreshPerso();
      armorCheck.gotoAndStop(2);
   }
   else
   {
      armorChange = false;
      resetPerso();
      refreshPerso();
   }
   root.sfx.gotoAndPlay("clic");
}
