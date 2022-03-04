_global.root = this;
_focusrect = false;
so = null;
so = SharedObject.getLocal("spiderSo");
Stage.align = "TL";
Stage.showMenu = false;
_quality = "MEDIUM";
root.storesOpen = true;
var i = 1;
while(i <= 15)
{
   if(eval("ep" + i + "version") == undefined)
   {
      set("ep" + i + "version",2);
   }
   i++;
}
§§push(function setNewVolume(newV, mute)
{
   var _loc1_ = mute;
   mainMute = _loc1_;
   §§push(_loc1_);
   if(!_loc1_)
   {
      currentV = newV;
   }
   sVol.setVolume(!_loc1_?newV:0);
   _loc1_ = §§pop();
});
if(chatVersion == undefined)
{
   chatVersion = 2;
}
if(charVersion == undefined)
{
   charVersion = 2;
}
if(spiderVersion == undefined)
{
   spiderVersion = 2;
}
if(battleVersion == undefined)
{
   battleVersion = 2;
}
if(worldVersion == undefined)
{
   worldVersion = 2;
}
if(mGame1Version == undefined)
{
   mGame1Version = 2;
}
if(mGame2Version == undefined)
{
   mGame2Version = 2;
}
if(mGame3Version == undefined)
{
   mGame3Version = 2;
}
if(mGame4Version == undefined)
{
   mGame4Version = 2;
}
if(mGame5Version == undefined)
{
   mGame5Version = 2;
}
if(mGame6Version == undefined)
{
   mGame6Version = 2;
}
if(GAMEDEBUG == undefined)
{
   GAMEDEBUG = true;
}
if(userLang == undefined || userLang == "")
{
   userLang = "EN";
}
if(xmlNbr == undefined)
{
   xmlNbr = "01";
}
FirstEnter = true;
inWorld = undefined;
inCamp = false;
_quality = "MEDIUM";
sVol = new Sound();
trace("GAMEDEBUG = " + GAMEDEBUG);
if(!GAMEDEBUG)
{
   currentV = 50;
}
else
{
   currentV = 0;
}
setNewVolume(currentV,false);
rewardAccess = false;
idleFrq = 200;
stop();
