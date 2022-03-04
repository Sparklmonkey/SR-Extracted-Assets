class admin.general.Common_Header extends UI.core.movieclip
{
   function Common_Header()
   {
      super();
      this.createEmptyMovieClip("UISpace",0);
      this.createEmptyMovieClip("mask",1);
      this.createEmptyMovieClip("space4",2);
      this.UISpace.setMask(this.mask);
      this.space4.attachMovie("SB_S1","p1",9);
      this.space4.attachMovie("SB_S2","p2",10);
      this.space4.attachMovie("SB_S3","p3",11);
      this.space4.p1._x = this.space4.p2._x = this.space4.p3._x = 2;
      this.space4.p1._y = this.space4.p2._y = this.space4.p3._y = 2;
      this.space4.p2._x = 2 + this.space4.p1._width;
      this.space4._yscale = 75;
   }
   function setSize(w)
   {
      this.UISpace.clear();
      var _loc8_ = 45;
      var _loc5_ = 30;
      var _loc6_ = 5;
      var _loc3_ = [7243172,7243172];
      var _loc4_ = [100,55];
      var _loc9_ = [0,255];
      var _loc7_ = {matrixType:"box",x:0,y:0,w:w,h:_loc5_,r:1.5707963267948966};
      this.UISpace.beginGradientFill("linear",_loc3_,_loc4_,_loc9_,_loc7_);
      this.drawRect(this.UISpace,0,0,w,_loc8_,null,100,_loc6_);
      this.UISpace.endFill();
      _loc4_ = [100,100];
      _loc3_ = [16777215,14145495];
      this.UISpace.beginGradientFill("linear",_loc3_,_loc4_,_loc9_,_loc7_);
      this.drawRect(this.UISpace,1,1,w - 2,_loc8_ - 2,null,100,_loc6_);
      this.UISpace.endFill();
      _loc3_ = [13755117,10667227];
      this.UISpace.beginGradientFill("linear",_loc3_,_loc4_,_loc9_,_loc7_);
      this.drawRect(this.UISpace,2,2,w - 4,_loc8_ - 4,null,100,_loc6_);
      this.UISpace.endFill();
      this.drawRect(this.UISpace,1,_loc5_ - 1,w - 2,1,7243172,55);
      this.drawRect(this.UISpace,1,_loc5_ - 2,w - 2,1,14145495,100);
      this.mask.clear();
      this.drawRect(this.mask,0,0,w,_loc5_,0,100);
      var _loc10_ = w - 4;
      this.space4.p2._width = _loc10_ - (this.space4.p1._width + this.space4.p3._width);
      this.space4.p3._x = _loc10_ - this.space4.p3._width + 2;
   }
}
