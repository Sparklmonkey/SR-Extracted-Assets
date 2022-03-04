class admin.Panels.Login.Container extends admin.panel
{
   var m = 0;
   function Container()
   {
      super();
      _global.login_container = this;
      this.createEmptyMovieClip("loginBox",0);
      this.attachMovie("graphic_welcomeBG","baseGrfx",2);
      this.createEmptyMovieClip("bMask",3);
      this.attachMovie("head_text","headTxt",4);
      this.attachMovie("Login_BaseBox","baseBox",5);
      this.createEmptyMovieClip("bMask2",6);
      this.sb1 = this._parent._parent.sb1;
      this.sb2 = this._parent._parent.sb2;
      this.light = this.sb1.space3.attachMovie("ConnectionLight","light",0);
      this.light._visible = false;
      this.light._y = 2;
      this.headBox = this._parent._parent.headBox;
      this.sb2.space4._visible = false;
      this.headBox.loginSlide = this;
      this.headBox.light = this.light;
      this.manageClip(0,this.sb1,{x:12,width:"-24",height:270,minHeight:40});
      this.manageClip(0,this.sb2,{x:12,width:"-24",height:291});
      this.manageClip(this.headTxt,{x:"-422"});
      this.manageClip(this.baseBox,{x:17,width:this.bMask,height:this.bMask});
      this.manageClip(this.headBox,{x:17,width:"-34",height:"-418"});
      this.baseGrfx._x = this.bMask._x = this.bMask2._x = this.baseBox._x = 17;
      this.baseGrfx.setMask(this.bMask);
      this.baseBox.setMask(this.bMask2);
   }
   function drawPanels()
   {
      this.headBox.drawTabs(this);
   }
   function onClick(data)
   {
      this.headBox.transitionOut();
   }
   function onActivate()
   {
      _global.tabs.setOrder("Login");
      this.headBox.onActivate();
      _global.tabs.setOrder("Login");
   }
   function onDeactivate()
   {
      var _loc3_ = _global.groupManager.panelGroups[_global.groupManager.currentScreen].container;
      this.headBox.onDeactivate();
      _global.tabs.setOrder("main," + _global.groupManager.currentScreen + "," + _loc3_.PanelSpace.focusedScreen.__tID);
   }
   function transition()
   {
      if(this.m != 0)
      {
         return undefined;
      }
      this.m = 1;
      var _loc2_ = 5;
      var _loc3_ = mx.transitions.easing.Strong.easeOut;
      this.baseGrfx._visible = false;
      this.headTxt._visible = false;
      this.baseBox._visible = false;
      var _loc8_ = new mx.transitions.Tween(this.sb1,"height",_loc3_,this.sb1._height,47,_loc2_,false);
      this.editResize(0,this.sb1).height = 47;
      var _loc7_ = new mx.transitions.Tween(this.sb1,"_y",_loc3_,this.sb1._y,45,_loc2_,false);
      this.editResize(0,this.sb1).y = 45;
      var _loc6_ = new mx.transitions.Tween(this.sb2,"height",_loc3_,this.sb2._height,this.__get__StageHeight() - 105,_loc2_,false);
      this.editResize(0,this.sb2).height = "-105";
      var _loc4_ = new mx.transitions.Tween(this.sb2,"_y",_loc3_,this.sb2._y,98,_loc2_,false);
      this.editResize(0,this.sb2).y = 98;
      var _loc5_ = new mx.transitions.Tween(this.headBox,"_y",_loc3_,this.headBox._y,48,_loc2_,false);
      var owner = this;
      _loc4_.onMotionFinished = function()
      {
         owner.tweenComplete();
      };
   }
   function transitionIn()
   {
      this.m = 0;
      var _loc3_ = 5;
      var _loc4_ = mx.transitions.easing.Strong.easeOut;
      var _loc9_ = new mx.transitions.Tween(this.sb1,"height",_loc4_,this.sb1._height,270,_loc3_,false);
      this.editResize(0,this.sb1).height = 270;
      var _loc2_ = Math.round(this.__get__StageHeight() / 2);
      var _loc8_ = new mx.transitions.Tween(this.sb1,"_y",_loc4_,this.sb1._y,_loc2_ - 272,_loc3_,false);
      this.editResize(0,this.sb1).y = _loc2_ - 272;
      var _loc5_ = new mx.transitions.Tween(this.sb2,"height",_loc4_,this.sb2._height,291,_loc3_,false);
      this.editResize(0,this.sb2).height = 291;
      var _loc7_ = new mx.transitions.Tween(this.sb2,"_y",_loc4_,this.sb2._y,_loc2_ + 2,_loc3_,false);
      this.editResize(0,this.sb2).y = _loc2_ + 2;
      var _loc6_ = new mx.transitions.Tween(this.headBox,"_y",_loc4_,this.headBox._y,_loc2_ - 269,_loc3_,false);
      var o = this;
      _loc5_.onMotionFinished = function()
      {
         o.tweenInComplete();
      };
   }
   function tweenInComplete()
   {
      this.headBox.form._visible = true;
      this.headBox.__state = 0;
      this.headBox.setSize(this.__get__StageWidth() - 34,this.__get__StageHeight() - 418);
      this.setSize(this.__get__StageWidth(),this.__get__StageHeight());
      this.baseGrfx._visible = true;
      this.headTxt._visible = true;
      this.baseBox._visible = true;
      this.loginBox._visible = true;
      _global.am.show();
   }
   function hideLayers()
   {
      this.baseGrfx._visible = false;
      this.headTxt._visible = false;
      this.baseBox._visible = false;
      this.loginBox._visible = false;
   }
   function tweenComplete()
   {
      if(_global.newCluster == true)
      {
         var _loc3_ = "Servers";
      }
      else
      {
         _loc3_ = _global.l_cache.getProp("lastFocus","Apps");
      }
      _global.groupManager.show(_loc3_);
      _global.ResizeManager.setSize(0,this.__get__StageWidth(),this.__get__StageHeight());
      this.headBox.ButtonRef[_loc3_].states.gotoAndStop(3);
      this.headBox.__last = this.headBox.ButtonRef[_loc3_];
      this.light._visible = true;
      _global.am.show();
      _global.admin_head.show();
   }
   function setSize(w, h)
   {
      if(this.m == 0)
      {
         this.bMask.clear();
         this.drawRect(this.bMask,0,0,w - 34,283,0,50,4);
         this.bMask2.clear();
         this.drawRect(this.bMask2,0,0,w - 34,283,0,50,4);
         var _loc2_ = Math.round(h / 2);
         this.sb1._y = _loc2_ - 272;
         this.sb2._y = _loc2_ + 2;
         this.baseGrfx._y = this.bMask._y = this.bMask2._y = this.baseBox._y = this.sb2._y + 3;
         this.headTxt._y = this.sb1._y - 25;
         this.headBox._y = this.sb1._y + 3;
      }
   }
}
