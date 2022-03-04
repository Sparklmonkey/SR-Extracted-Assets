function camControl()
{
   var _loc2_ = _parent;
   var _loc3_ = this;
   parentColor.setTransform(camColor.getTransform());
   var _loc1_ = sX / _loc3_._width;
   var scaleY = sY / _loc3_._height;
   _loc2_._x = cX - _loc3_._x * _loc1_;
   _loc2_._y = cY - _loc3_._y * scaleY;
   _loc2_._xscale = 100 * _loc1_;
   _loc2_._yscale = 100 * scaleY;
}
function resetStage()
{
   var _loc1_ = _parent;
   var §resetTrans:Object§ = {ra:100,rb:0,ga:100,gb:0,ba:100,bb:0,aa:100,ab:0};
   parentColor.setTransform(resetTrans);
   _loc1_._xscale = 100;
   _loc1_._yscale = 100;
   _loc1_._x = 0;
   _loc1_._y = 0;
}
this.mcCadre._visible = false;
var oldMode = Stage.scaleMode;
Stage.scaleMode = "exactFit";
var cX = Stage.width / 2;
var cY = Stage.height / 2;
var sX = Stage.width;
var sY = Stage.height;
var camWidth = this.width;
var camHeight = this.height;
Stage.scaleMode = oldMode;
var camColor = new Color(this);
var parentColor = new Color(_parent);
this.onUnload = resetStage;
