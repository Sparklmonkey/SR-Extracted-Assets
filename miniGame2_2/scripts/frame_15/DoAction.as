txtTrack.text = root.getInsName("txtMG2_TrckCity",root.parseKitMGames);
txtLap.text = root.getInsName("txtMG2_Lap",root.parseKitMGames);
txtTime.text = root.getInsName("txtMG2_Time",root.parseKitMGames);
txtEnergy.text = root.getInsName("txtMG2_Energy",root.parseKitMGames);
hasInit = false;
numCheckPoint = 15;
mg2.mid0 = new Array();
mg2.points0 = new Array();
mg2.mid1 = new Array();
mg2.points1 = new Array();
mg2.mid2 = new Array();
mg2.points2 = new Array();
lapTotal = 5;
gatesTotal = 9;
PAUSE = true;
init.gotoAndPlay(2);
computeTrack("o",mg2.mid0,mg2.points0);
computeTrack("p",mg2.mid1,mg2.points1);
computeTrack("q",mg2.mid2,mg2.points2);
setRaceData();
init.swapDepths(getNewDepth("overAll"));
if(gameType == "multi")
{
   exit.enabled = false;
   exit._visible = false;
}
stop();
