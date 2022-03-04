this._visible = false;
this.onEnterFrame = function()
{
   if(oCMG.bCheckPhoto)
   {
      this._parent.stop();
   }
   else
   {
      oCMG.fSaveHitTest(mcX1,mcX2,mcX3,this._parent._parent._name);
   }
};
