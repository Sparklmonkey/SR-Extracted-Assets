class UI.data.profiles.AppsLog extends UI.core.events implements UI.data.dataProfile
{
   var __maxArrayLength = 500;
   var logsPerPage = 30;
   var keywordColor = "#000084";
   static var keywords = ["true","false","Infinity","-Infinity","undefined","null","NaN","[object Object]","Object","object","[object Global]","[object Client]","[object Stream]","[object SharedObject]"];
   static var strPre = "<font face=\'verdana\' size=\'11\' color=\'#";
   function AppsLog()
   {
      super();
      this._dat = new Object();
      this.byApp = new Object();
      this.blockFocus();
      this.newPage();
      this.setPage(0);
      this.appStreams = new Array();
   }
   function clearApplication(a)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.appStreams.length)
      {
         if(this.appStreams[_loc2_].app == a)
         {
            this.appStreams.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      delete this._dat[a];
   }
   function onClear()
   {
      this._dat[this.__app].data.splice(0,this._dat[this.__app].data.length);
      this._dat[this.__app].data.push(new Array());
      this._dat[this.__app].activePage = 0;
      this.setPage(0);
      this.sendHistory();
   }
   function onAppsReset()
   {
      this.byApp = {};
      var _loc2_ = 0;
      while(_loc2_ < this.appStreams.length)
      {
         this.appStreams.pop();
         _loc2_ = _loc2_ + 1;
      }
   }
   function onRefresh()
   {
   }
   function newPage()
   {
   }
   function sendHistory()
   {
      var _loc3_ = _global.appsContainer.appList.selectedItems;
      this.dispatchEvent(this.__event,{method:"onHistory",lines:this._dat[_loc3_[0].name]});
   }
   function start(sID, event_name)
   {
      this.__server = sID;
      this.__event = event_name;
      this.sendHistory();
   }
   function pauseLog(app)
   {
      var _loc2_ = this.byApp[app];
      if(_loc2_)
      {
         if(_loc2_.logging = !_loc2_.logging)
         {
            _loc2_.play("logs/application/" + _loc2_.app,-1);
         }
         else
         {
            _loc2_.play(false);
         }
         var _loc3_ = {};
         _loc3_.description = "*** App log " + (!_loc2_.logging ? "paused" : "unpaused") + " ***";
         _loc2_.onLog(_loc3_);
         return _loc2_.logging;
      }
      return false;
   }
   function onSetApp(app)
   {
      var _loc3_ = _global.appsContainer.appList.selectedItems;
      this.appList = ",";
      this.appList += _loc3_[0].name + ",";
      if(this._dat[app] == undefined)
      {
         this._dat[app] = new Array();
      }
      this.__app = app;
      this.pages = this._dat[app];
      this.sendHistory();
      if(!this.byApp[app])
      {
         this.appStreams.push(new NetStream(this.fc.nc));
         this.logStream = this.appStreams[this.appStreams.length - 1];
         this.byApp[app] = this.logStream;
         var owner = this;
         this.logStream.onLog = function(info)
         {
            owner.onLog(info,app);
         };
         this.logStream.app = app;
         this.logStream.logging = true;
         this.logStream.play("logs/application/" + app,-1);
      }
      return this.byApp[app].logging;
   }
   function setPage(i)
   {
      this.activePage = i;
   }
   function processLog(msg)
   {
      return msg;
   }
   function replaceKeyword(str, kw, col)
   {
      str = str.split(kw).join("<font color=\'" + col + "\'>" + kw + "</font>");
      return str;
   }
   function onLog(info, app)
   {
      if(_global.groupManager.prVisible != true)
      {
         var _loc3_ = this._dat[app];
         var _loc4_ = 300;
         var _loc6_ = 200;
         _loc3_.push({msg:this.processLog(info.description),time:info.time});
         if(_loc3_.length > _loc4_)
         {
            _loc3_.splice(0,_loc3_.length - _loc6_);
            if(this.appList.indexOf("," + app + ",") != -1)
            {
               this.dispatchEvent(this.__event,{method:"onHistory",lines:_loc3_});
            }
         }
         if(this.appList.indexOf("," + app + ",") != -1)
         {
            this.dispatchEvent(this.__event,{method:"onLog"});
         }
      }
   }
}
