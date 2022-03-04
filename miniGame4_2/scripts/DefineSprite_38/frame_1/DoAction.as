function toStop()
{
   if(_global.oCMG.bCheckPhoto)
   {
      this.stop();
      this.onEnterFrame = toPlay;
   }
}
function toPlay()
{
   if(!_global.oCMG.bCheckPhoto)
   {
      this.play();
      this.onEnterFrame = toStop;
   }
}
this.onEnterFrame = toStop;
