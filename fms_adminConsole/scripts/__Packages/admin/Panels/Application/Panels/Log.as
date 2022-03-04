class admin.Panels.Application.Panels.Log extends admin.panel
{
   static var weekDays = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
   function Log()
   {
      super();
      this.createEmptyMovieClip("backing",0);
      this.attachMovie("TextArea","log",1);
      this.attachMovie("TextInput","criteria",3);
      this.attachMovie("Button","nextBtn",4);
      this.attachMovie("Button","prevBtn",5);
      this.attachMovie("Button","pauseBtn",8);
      this.attachMovie("Button","clearBtn",6);
      this.addControl("Label","l1",7,{autoSize:"left",text:"Find:"});
      this.startPosition = new admin.Panels.Application.Panels.SearchObject(0,0);
      this.log.onKillFocus = function()
      {
         this._parent.setStartPosition();
      };
      this.manageClip(this.l1,{xMin:0});
      this.manageClip(this.criteria,{xMin:0});
      this.manageClip(this.clearBtn,{xMin:0});
      this.manageClip(this.pauseBtn,{xMin:0});
      this.addToolTip("Find next result",this.nextBtn);
      this.addToolTip("Find previous result",this.prevBtn);
      this.addToolTip("Pause/Unpause logging",this.pauseBtn);
      this.addToolTip("Clear log history",this.clearBtn);
      this.nextBtn.label = "Find Next";
      this.nextBtn.setSize(68,24);
      this.nextBtn.addListener("click",this.findNext,this);
      this.prevBtn.label = "Find Previous";
      this.prevBtn.setSize(87,24);
      this.prevBtn.addListener("click",this.findPrev,this);
      this.pauseBtn.label = "Pause";
      this.pauseBtn.setSize(60,24);
      this.pauseBtn.addListener("click",this.onPause,this);
      this.clearBtn.label = "Clear Log";
      this.clearBtn.setSize(68,24);
      this.clearBtn.addListener("click",this.onClear,this);
      this.criteria.setSize(120,22);
      this.criteria.addListener("enter",this.findNext,this);
      this.lines = new Array();
   }
   function firstDraw()
   {
      this.nextTab(this.log);
      this.nextTab(this.criteria);
      this.nextTab(this.nextBtn);
      this.nextTab(this.prevBtn);
      this.nextTab(this.pauseBtn);
      this.nextTab(this.clearBtn);
   }
   function onPause()
   {
      var _loc2_ = this.sendToProfile("AppsLog",this.__server,"pauseLog",this.__get__app());
      this.pauseBtn.label = !_loc2_ ? "Unpause" : "Pause";
   }
   function onClear()
   {
      this.lines.splice(0,this.lines.length);
      this.onHistory({lines:this.lines});
      this.startPosition.__set__startPt(0);
      this.startPosition.__set__endPt(0);
   }
   function setStartPosition()
   {
      var _loc3_ = Selection.getBeginIndex();
      var _loc2_ = Selection.getEndIndex();
      this.startPosition.__set__startPt(!(_loc3_ != undefined && _loc3_ != -1) ? this.startPosition.__get__startPt() : _loc3_);
      this.startPosition.__set__endPt(!(_loc2_ != undefined && _loc2_ != -1) ? this.startPosition.__get__endPt() : _loc2_);
   }
   function findNext()
   {
      var _loc3_ = 0;
      var _loc2_ = this.log.text;
      if(_loc2_.length > this.startPosition.__get__endPt())
      {
         _loc2_ = _loc2_.slice(this.startPosition.__get__endPt());
      }
      _loc2_ = _loc2_.toLowerCase();
      _loc3_ = _loc2_.indexOf(this.criteria.text.toLowerCase());
      if(_loc3_ == -1)
      {
         _loc2_ = this.log.text.slice(0,this.startPosition.__get__startPt());
         _loc2_ = _loc2_.toLowerCase();
         _loc3_ = _loc2_.indexOf(this.criteria.text.toLowerCase());
         if(_loc3_ == -1)
         {
            this.onInfo("Could not find string: " + this.criteria.text);
            return undefined;
         }
         this.startPosition.__set__startPt(0);
         this.startPosition.__set__endPt(0);
      }
      this.startPosition.__set__startPt(this.startPosition.__get__endPt() + _loc3_);
      this.startPosition.__set__endPt(this.startPosition.__get__startPt() + this.criteria.text.length);
      Selection.setFocus(this.log.__text);
      Selection.setSelection(this.startPosition.__get__startPt(),this.startPosition.__get__endPt());
   }
   function findPrev()
   {
      var _loc3_ = 0;
      var _loc2_ = this.log.text;
      if(_loc2_.length > this.startPosition.__get__startPt())
      {
         _loc2_ = _loc2_.slice(0,this.startPosition.__get__startPt());
      }
      _loc2_ = _loc2_.toLowerCase();
      _loc3_ = _loc2_.lastIndexOf(this.criteria.text.toLowerCase());
      if(_loc3_ == -1)
      {
         _loc2_ = this.log.text.slice(this.startPosition.__get__endPt());
         _loc2_ = _loc2_.toLowerCase();
         _loc3_ = _loc2_.lastIndexOf(this.criteria.text.toLowerCase());
         if(_loc3_ == -1)
         {
            this.onInfo("Could not find string: " + this.criteria.text);
            return undefined;
         }
         _loc3_ += this.startPosition.endPt;
      }
      this.startPosition.__set__startPt(_loc3_);
      this.startPosition.__set__endPt(this.startPosition.__get__startPt() + this.criteria.text.length - 1);
      Selection.setFocus(this.log.__text);
      Selection.setSelection(this.startPosition.__get__startPt(),this.startPosition.__get__endPt() + 1);
   }
   function onActivate()
   {
      this.onSetServer(this.owner.__server);
      this.onSetApp(this.owner.selectedApplication);
   }
   function onDeactivate()
   {
      this.deactivateDataProfile("AppsLog",this.__server,this.onNewData,this);
   }
   function onSetServer(id)
   {
      this.deactivateDataProfile("AppsLog",this.__server,this.onNewData,this);
      this.__server = id;
      var _loc2_ = this.activateDataProfile("AppsLog",id,this.onNewData,this);
   }
   function onSetApp(app)
   {
      var _loc2_ = this.sendToProfile("AppsLog",this.__server,"onSetApp",app);
      this.pauseBtn.label = !_loc2_ ? "Unpause" : "Pause";
   }
   function onAppsReset(id)
   {
      this.sendToProfile("AppsLog",this.__server,"onAppsReset");
   }
   function onNewData(data)
   {
      this[data.method](data);
   }
   function onLogout()
   {
   }
   function onLog(data)
   {
      this.drawLine(this.lines.length - 1);
   }
   function onHistory(data)
   {
      this.lines = data.lines;
      this.log.text = "";
      this.drawLines(0,this.lines.length);
   }
   function drawLines(s, t)
   {
      var _loc2_ = s;
      while(_loc2_ < t)
      {
         this.drawLine(_loc2_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function drawLine(i)
   {
      var _loc2_ = this.log.getVScrollPosition() == this.log.getMaxVScrollPosition();
      if(this.lines[i].ignore != true)
      {
         var _loc3_ = "";
         this.log.text += _loc3_ + this.lines[i].msg + "\n";
         if(_loc2_)
         {
            this.log.setVScrollPosition(this.log.getMaxVScrollPosition());
         }
      }
   }
   function padTime(n)
   {
      if(n.toString().length == 1)
      {
         return "0" + n;
      }
      return n.toString();
   }
   function getHoursAmPm(hour24)
   {
      var _loc3_ = new Object();
      _loc3_.ampm = hour24 >= 12 ? "PM" : "AM";
      var _loc2_ = hour24 % 12;
      if(_loc2_ == 0)
      {
         _loc2_ = 12;
      }
      _loc3_.hours = this.padTime(_loc2_);
      return _loc3_;
   }
   function setSize(w, h)
   {
      this.log.setSize(w,h - 30);
      var _loc2_ = h - 28;
      this.l1._x = 2;
      this.l1._y = _loc2_ + 4;
      this.criteria._x = this.l1._x + this.l1.width + 2;
      this.criteria._y = _loc2_ + 1;
      this.nextBtn._x = this.criteria._x + 120 + 2;
      this.nextBtn._y = _loc2_;
      this.prevBtn._x = this.nextBtn._x + 68 + 2;
      this.prevBtn._y = _loc2_;
      this.clearBtn._x = w - 75;
      this.clearBtn._y = _loc2_;
      this.pauseBtn._x = w - 75 - this.pauseBtn._width - 2;
      this.pauseBtn._y = _loc2_;
      if(this.l1._x < 0)
      {
         this.l1._visible = false;
      }
      else
      {
         this.l1._visible = true;
      }
      if(this.criteria._x < 0)
      {
         this.criteria._visible = false;
      }
      else
      {
         this.criteria._visible = true;
      }
      if(this.nextBtn._x < 0)
      {
         this.nextBtn._visible = false;
      }
      else
      {
         this.nextBtn._visible = true;
      }
      if(this.prevBtn._x < 0)
      {
         this.prevBtn._visible = false;
      }
      else
      {
         this.prevBtn._visible = true;
      }
      if(this.clearBtn._x < 0)
      {
         this.clearBtn._visible = false;
      }
      else
      {
         this.clearBtn._visible = true;
      }
      if(w < 12)
      {
         this.log._visible = false;
      }
      else
      {
         this.log._visible = true;
      }
   }
}
