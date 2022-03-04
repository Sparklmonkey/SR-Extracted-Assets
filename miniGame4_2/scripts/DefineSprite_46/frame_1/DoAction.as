this.onEnterFrame = function()
{
   if(_global.oCMG.bCheckPhoto)
   {
      this.stop();
      this.onEnterFrame = Void;
   }
};
