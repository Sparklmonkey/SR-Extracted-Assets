class admin.manager extends UI.core.movieclip
{
   var prVisible = false;
   function manager(stageMC)
   {
      super();
      _global.groupManager = this;
      this.stage = stageMC.createEmptyMovieClip("pHolder",1);
      this.pMask = stageMC.createEmptyMovieClip("pMask",2);
      _global.dc = stageMC.attachMovie("DataCollector","dc",1000);
      this.stage.setMask(this.pMask);
      this.panelGroups = new Object();
      this.registerGroup("Login","Login_Container",true);
      this.registerGroup("Apps","Apps_Container");
      this.registerGroup("Users","Users_Container");
      this.registerGroup("Servers","Servers_Container");
      this.show("Login");
   }
   function registerGroup(name, link, fullscreen)
   {
      var _loc0_ = null;
      var _loc5_ = this.panelGroups[name] = new Object();
      var _loc3_ = this.stage.attachMovie(link,"pc_" + name,this.stage.getNextHighestDepth());
      _global.tabs.registerContext(name);
      _loc3_._visible = false;
      _loc3_.isActivated = false;
      _loc3_.__tID = name;
      _loc5_.container = _loc3_;
      _loc3_.fullscreen = fullscreen;
      _loc3_.attachMovie("panel_holder","PanelSpace",_loc3_.getNextHighestDepth());
      _loc3_.PanelSpace.__owner = _loc3_;
      _loc3_.drawPanels();
      if(fullscreen != true)
      {
         _loc3_._x = 24;
         _loc3_._y = 106;
      }
   }
   function show(p)
   {
      if(p != "Login")
      {
         _global.stg.pb._visible = this.prVisible;
      }
      else
      {
         _global.stg.pb._visible = false;
      }
      this.focusedScreen.isActivated = false;
      this.focusedScreen.PanelSpace.doDeactivate();
      this.focusedScreen.onDeactivate();
      this.focusedScreen._visible = false;
      this.focusedScreen = this.panelGroups[p].container;
      this.focusedScreen.isActivated = true;
      this.setSize(this.__width,this.__height);
      this.focusedScreen.onActivate();
      this.focusedScreen.onRefresh();
      this.focusedScreen._visible = true;
      this.currentScreen = p;
      if(_global.conn.conList.length == 0)
      {
         _global.cm.dispatchEvent("change",{target:_global.cm});
      }
      _global.tabs.setOrder("main," + p + "," + this.focusedScreen.PanelSpace.focusedScreen.__tID);
   }
   function onLogout()
   {
      clearInterval(this.refreshInt);
      for(var _loc2_ in this.panelGroups)
      {
         this.panelGroups[_loc2_].onLogout();
         this.panelGroups[_loc2_].PanelSpace.onLogout();
      }
   }
   function setRate(r)
   {
      clearInterval(this.refreshInt);
      if(r == -2)
      {
         if(this.currentScreen != "Login")
         {
            _global.stg.pb._visible = true;
         }
         this.prVisible = true;
      }
      else
      {
         this.refreshInt = setInterval(this.onRefresh,r,this);
         _global.stg.pb._visible = false;
         this.prVisible = false;
      }
   }
   function handleRefresh()
   {
      this.focusedScreen.onRefresh();
      this.focusedScreen.PanelSpace.focusedScreen.onRefresh();
      _global.dat_c.onRefresh();
   }
   function specialRefresh()
   {
      this.focusedScreen.onForceRefresh();
      this.focusedScreen.PanelSpace.focusedScreen.onForceRefresh();
   }
   function onRefresh(o)
   {
      o.handleRefresh();
   }
   function setSize(w, h)
   {
      this.__width = w;
      this.__height = h;
      this.pMask.clear();
      if(this.focusedScreen.fullscreen == true)
      {
         this.focusedScreen.setSize(w,h);
         this.focusedScreen.resize(w,h);
         this.drawRect(this.pMask,this.focusedScreen._x,this.focusedScreen._y,w,h,0,100);
      }
      else
      {
         this.focusedScreen.setSize(w - 49,h - 124);
         this.focusedScreen.resize(w - 49,h - 124);
         this.drawRect(this.pMask,this.focusedScreen._x,this.focusedScreen._y,w - 49,h - 124,0,100);
      }
   }
}
