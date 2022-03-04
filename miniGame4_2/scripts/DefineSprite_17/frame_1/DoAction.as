this.onEnterFrame = function()
{
   var _loc1_ = this;
   var §myPoint:Object§ = {x:_loc1_._x,y:_loc1_._y};
   _loc1_.localToGlobal(myPoint);
   oCMG.fSaveHitTest(myPoint.x,myPoint.y,_loc1_._width,_loc1_.height,_loc1_._parent._parent._name,1);
};
