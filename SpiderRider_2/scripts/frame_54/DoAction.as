stop();
inWorld = false;
killNetConnection();
if(root.playerStats.mission != "")
{
   gotoAndStop("level" + root.playerStats.mission);
}
else
{
   gotoAndStop("level1");
}
