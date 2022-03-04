class admin.panel extends UI.core.movieclip
{
   function panel()
   {
      super();
      this.maskCount = 0;
      this.masks = new Object();
      this.mainContext = this.newContext();
   }
   function get server()
   {
      return this.owner.__server;
   }
   function get app()
   {
      return this.owner.selectedApplication;
   }
   function get length()
   {
      return _global.dc.length;
   }
   function activateDataProfile(profile_name, server_cacheID, callBack, context)
   {
      _global.dc.activateDataProfile(profile_name,server_cacheID,callBack,context);
   }
   function deactivateDataProfile(profile_name, server_cacheID, callBack, context)
   {
      _global.dc.deactivateDataProfile(profile_name,server_cacheID,callBack,context);
   }
   function sendToProfile(name, sID, method, data)
   {
      return _global.dc.sendToProfile(name,sID,method,data);
   }
   function flushProfiles(server_cacheID)
   {
      _global.dc.flushProfiles(server_cacheID);
   }
   function manageClip(id, mc, data)
   {
      if(typeof id == "number")
      {
         _global.ResizeManager.manageClip(id,mc,data);
      }
      else
      {
         _global.ResizeManager.manageClip(this.mainContext,arguments[0],arguments[1]);
      }
   }
   function newContext()
   {
      return _global.ResizeManager.contextID();
   }
   function clearTab(mc)
   {
      _global.fm.clearTab(mc);
   }
   function unmanageClip(id, mc)
   {
      if(typeof id == "movieclip")
      {
         _global.ResizeManager.unmanageClip(this.mainContext,id);
      }
      else
      {
         _global.ResizeManager.unmanageClip(id,mc);
      }
   }
   function editResize(id, mc)
   {
      if(typeof id == "movieclip")
      {
         return _global.ResizeManager.editData(this.mainContext,id);
      }
      return _global.ResizeManager.editData(id,mc);
   }
   function resize(w, h)
   {
      if(arguments.length == 0)
      {
         w = this.___width;
         h = this.___height;
      }
      this.___width = w;
      this.___height = h;
      _global.ResizeManager.setSize(this.mainContext,w,h);
   }
   function mask(mc, data)
   {
      var _loc2_ = this.createEmptyMovieClip("mask" + this.maskCount + this._name,this.maskCount + 100);
      this.drawRect(_loc2_,0,0,1,1,0,100);
      this.maskCount = this.maskCount + 1;
      if(data.x == undefined)
      {
         data.x = mc;
      }
      if(data.y == undefined)
      {
         data.y = mc;
      }
      this.masks[mc] = {data:data,mask:_loc2_,mc:mc};
      this.manageClip(_loc2_,data);
      mc.setMask(_loc2_);
   }
   function unmask(mc)
   {
      this.masks[mc].mc.setMask(null);
      this.masks[mc].mask.removeMovieClip();
      this.unmanageClip(this.masks[mc].mask);
      delete this.masks[mc];
   }
   function get fc()
   {
      return _global.fcsct;
   }
   function nextTab(mc)
   {
      _global.tabs.registerTab(this.__tID,mc,_global.tabs.nextID(this.__tID));
   }
}
