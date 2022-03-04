class UI.data.profiles.ServerLog extends UI.core.events implements UI.data.dataProfile
{
   var __maxArrayLength = 500;
   var logsPerPage = 30;
   var keywordColor = "#000084";
   static var keywords = ["true","false","Infinity","-Infinity","undefined","null","NaN","[object Object]","Object","object","[object Global]","[object Client]","[object Stream]","[object SharedObject]"];
   static var strPre = "<font face=\'verdana\' size=\'11\' color=\'#";
   function ServerLog()
   {
      super();
      this._dat = new Object();
      this._dat.data = new Array();
      this.blockFocus();
      this.newPage();
      this.setPage(0);
   }
   function onClear()
   {
      this._dat.data.splice(0,this._dat.data.length);
      this._dat.data.push(new Array());
      this._dat.activePage = 0;
      this.setPage(0);
      this.sendHistory();
   }
   function onRefresh()
   {
   }
   function newPage()
   {
   }
   function sendHistory()
   {
      this.dispatchEvent(this.__event,{method:"onHistory",lines:this._dat.data});
   }
   function processLog(msg, info)
   {
      if(msg == "Connect")
      {
         msg += " : " + info.uri;
      }
      return msg;
   }
   function replaceKeyword(str, kw, col)
   {
      str = str.split(kw).join("<font color=\'" + col + "\'>" + kw + "</font>");
      return str;
   }
   function start(sID, event_name)
   {
      this.__server = sID;
      this.__event = event_name;
      var owner = this;
      this.accessStream.close();
      this.systemStream.close();
      this.accessStream = new NetStream(this.fc.nc);
      this.systemStream = new NetStream(this.fc.nc);
      this.accessStream.onLog = function(info)
      {
         owner.onLog(info,"access");
      };
      this.systemStream.onLog = function(info)
      {
         owner.onLog(info,"stream");
      };
      this.accessStream.play("logs/access",-1);
      this.systemStream.play("logs/system",-1);
      this.sendHistory();
   }
   function setPage(i)
   {
      this.activePage = i;
   }
   function onLog(info, source)
   {
      if(_global.groupManager.prVisible != true)
      {
         var _loc3_ = this._dat.data;
         var _loc5_ = 300;
         var _loc6_ = 200;
         _loc3_.push({msg:this.processLog(info.description,info),time:info.time});
         if(_loc3_.length > _loc5_)
         {
            _loc3_.splice(0,_loc3_.length - _loc6_);
            this.dispatchEvent(this.__event,{method:"onHistory",lines:_loc3_});
         }
         this.dispatchEvent(this.__event,{method:"onLog"});
      }
   }
}
