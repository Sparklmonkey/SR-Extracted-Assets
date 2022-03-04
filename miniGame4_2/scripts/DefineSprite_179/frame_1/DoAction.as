this.onEnterFrame = function()
{
   if(_global.oCMG.bCheckPhoto)
   {
      this.stop();
   }
   else
   {
      this.play();
   }
};
