on(press){
   _parent.muteCtrl.gotoAndStop(1);
   maskVolume.onEnterFrame = function()
   {
      maskVolume._x = Math.min(_xmouse - maskVolume._width,gradeBar._x);
      newV = Math.max(Math.min(_xmouse / gradeBar._width * 100,100),0);
      root.setNewVolume(newV,false);
      _parent._parent.gotoAndPlay("close");
   };
}
