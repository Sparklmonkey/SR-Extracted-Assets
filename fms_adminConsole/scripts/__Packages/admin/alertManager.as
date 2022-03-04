class admin.alertManager extends UI.core.movieclip
{
   var timeOutInt = 3000;
   function alertManager()
   {
      super();
      _global.am = this;
      this.attachMovie("Tray","tray",0);
      this.attachMovie("infoAlert","iBox",1);
      this.attachMovie("errorAlert","eBox",2);
      this.iBox._visible = this.eBox._visible = false;
      this.regError = false;
      this.regError2 = false;
      this.iCount = 0;
      this.iData = new Object();
      var owner = this;
      this.eBox.onClose = function()
      {
         owner.onClose(0);
      };
      this.iBox.onClose = function()
      {
         owner.closeIBox();
      };
      this.eOpen = false;
      this.iOpen = false;
      this.tray.onPressEvt = function(data)
      {
         owner.doRollOver(data);
      };
   }
   function clear()
   {
      this.tray.clear();
      this.regError = false;
      this.regError2 = false;
      this.iData = new Object();
      this.onClose(0);
      this.onClose(1);
      this.eBox.clear();
      this.iBox.clear();
   }
   function hide()
   {
      this._visible = false;
   }
   function show()
   {
      this.setSize(this.__get__StageWidth(),this.__get__StageHeight());
      this._visible = true;
   }
   function closeIBox()
   {
      this.onClose(1);
      this.setSize(this.__get__StageWidth(),this.__get__StageHeight());
   }
   function refreshData()
   {
      this.__get__Cache().__si.flush();
      this.__get__Cache().__si.clear();
   }
   function doRollOver(data)
   {
      this.__selectedID = data.target.id;
      this.__selectedBtn = data.target;
      if(data.target.id == "eID")
      {
         if(this.eBox._visible == false)
         {
            this.iBox._visible = false;
            this.iOpen = false;
            this.alphaTween(this.eBox,0,100);
            this.eOpen = true;
            this.timeOut(this.timeOutInt,0);
            this.repositionItem(0);
         }
         else
         {
            this.onClose(0);
         }
      }
      else if(data.target.id == "iID")
      {
         if(this.iBox._visible == false)
         {
            this.eBox._visible = false;
            this.eOpen = false;
            this.alphaTween(this.iBox,0,100);
            this.iOpen = true;
            this.timeOut(this.timeOutInt,1);
            this.repositionItem(1);
         }
         else
         {
            this.onClose(1);
         }
      }
   }
   function repositionItem(t)
   {
      this.__lastType = t;
      var _loc2_ = this.iBox;
      if(t == 0)
      {
         _loc2_ = this.eBox;
      }
      _loc2_._y = this.tray._y + 19;
      _loc2_._x = this.tray._x + this.tray.getItem(this.__selectedID)._x - _loc2_.width + 20;
   }
   function onClose(type)
   {
      clearInterval(this.toInt);
      if(type == 0)
      {
         this.eBox._visible = false;
         this.eOpen = false;
      }
      else
      {
         this.iBox._visible = false;
         this.iOpen = false;
      }
   }
   function showInfo(id, t)
   {
      this.__selectedID = "iID";
      this.eBox._visible = false;
      this.eOpen = false;
      if(this.iBox._visible == false)
      {
         this.alphaTween(this.iBox,0,100);
      }
      this.iOpen = true;
      this.repositionItem(1);
      if(t)
      {
         this.timeOut(t,1);
      }
      else
      {
         this.timeOut(this.timeOutInt,1);
      }
   }
   function onInfo(msg)
   {
      var _loc2_ = "i" + this.iCount;
      this.iCount = this.iCount + 1;
      if(this.regError2 == false)
      {
         this.tray.addItem("iID","info_ico");
         this.regError2 = true;
      }
      this.iBox.push(msg,!this.iOpen);
      this.__selectedID = "iID";
      if(this.iOpen == false)
      {
         this.alphaTween(this.iBox,0,100);
         this.iOpen = true;
      }
      this.timeOut(this.timeOutInt,1);
      this.repositionItem(1);
      this.setSize(this.__get__StageWidth(),this.__get__StageHeight());
   }
   function onError(msg)
   {
      if(this.regError == false)
      {
         this.tray.addItem("eID","error_ico");
         this.regError = true;
      }
      this.iBox._visible = false;
      this.iOpen = false;
      this.eBox.push(msg,!this.eOpen);
      this.__selectedID = "eID";
      if(this.eOpen == false)
      {
         this.alphaTween(this.eBox,0,100);
         this.eOpen = true;
      }
      this.timeOut(this.timeOutInt,0);
      this.repositionItem(0);
      this.setSize(this.__get__StageWidth(),this.__get__StageHeight());
   }
   function timeOut(num, type)
   {
      clearInterval(this.toInt);
      this.toInt = setInterval(this.onTimeOut,num,this,num,type);
   }
   function onTimeOut(owner, __to, type)
   {
      var _loc2_ = owner.eBox;
      if(type != 0)
      {
         _loc2_ = owner.iBox;
      }
      if(!(_loc2_.hitTest(_root._xmouse,_root._ymouse,false) || owner.__selectedBtn.isOver == true))
      {
         owner.onClose(type);
      }
   }
   function alphaTween(mc, start, end)
   {
      var _loc1_ = 5;
      var _loc2_ = mx.transitions.easing.Strong.easeOut;
      mc._visible = true;
      var _loc4_ = new mx.transitions.Tween(mc,"_alpha",_loc2_,start,end,_loc1_,false);
   }
   function setSize(w, h)
   {
      if(_global.groupManager.currentScreen == "Login")
      {
         this.tray._x = 160;
         var _loc3_ = Math.round(h / 2);
         this.tray._y = _loc3_ - 259;
      }
      else
      {
         this.tray._x = w - (150 + this.tray.width);
         this.tray._y = 58;
      }
      this.repositionItem(this.__lastType);
   }
}
