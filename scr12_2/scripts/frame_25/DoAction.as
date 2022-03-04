initMapHeight();
setBtn();
setScr();
placeObject(2,12,15,"officier",1);
if(game.action1 == 1)
{
   placeObject(2,18,20,"manB",1);
}
if(game.action2 == 1)
{
   placeObject(2,7,16,"blacksmith",1);
}
if(game.action3 == 1)
{
   placeObject(2,11,19,"chamberlain",1);
}
if(game.action4 == 1)
{
   placeObject(2,15,20,"craftsman",1);
}
if(game.action5 == 1)
{
   placeObject(2,21,16,"womanC",1);
}
if(game.trigger5 == 1 || game.trigger6 == 1)
{
   placeObject(2,15,15,"igneous",1);
}
stop();
