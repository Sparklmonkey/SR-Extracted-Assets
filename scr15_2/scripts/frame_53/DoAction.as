initMapHeight();
setBtn();
setScr();
placeObject(2,7,15,"lument",1);
placeObject(2,7,13,"chamberlain",1);
placeObject(0,11,12,"corona",1);
placeObject(0,13,12,"igneous",1);
placeObject(0,11,19,"sparkle",1);
if(game.KeyA == 0)
{
   placeObject(0,14,15,"Key1",1);
}
if(game.popup == 0)
{
   game.popup = 1;
   endFct = function()
   {
      root.textWindow.closeWindow();
      root.textWindow.drawWindow([root.getInsName("txtM15Z0_p1",root.parseKitMissions)],0,endFct2);
      delete endFct;
   };
   endFct2 = function()
   {
      root.textWindow.closeWindow();
      delete endFct2;
   };
   root.textWindow.drawWindow([root.getInsName("txtM15Z0_p2",root.parseKitMissions),root.getInsName("txtM15Z0_p3",root.parseKitMissions),root.getInsName("txtM15Z0_p4",root.parseKitMissions),root.getInsName("txtM15Z0_p5",root.parseKitMissions),root.getInsName("txtM15Z0_p6",root.parseKitMissions),root.getInsName("txtM15Z0_p7",root.parseKitMissions)],26,endFct);
}
stop();
