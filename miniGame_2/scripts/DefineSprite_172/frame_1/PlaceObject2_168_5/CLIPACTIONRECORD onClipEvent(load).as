onClipEvent(load){
   wBar = 108;
   adjust = function(newTime)
   {
      _width = newTime * wBar / _parent._parent._parent.initTimeClearWave;
   };
}
