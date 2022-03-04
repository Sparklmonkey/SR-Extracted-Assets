class admin.panel_holder extends MovieClip
{
   var screenCount = 0;
   function panel_holder()
   {
      super();
      this.screenRef = new Object();
      this.tRef = new Object();
   }
   function registerPanel(name, link, data)
   {
      var _loc2_ = this.create(name,link);
      this.panelData[_loc2_] = data;
   }
   function create(name, link)
   {
      var _loc2_ = this.screenCount++;
      this.tRef[name] = link;
      return _loc2_;
   }
   function send(m, d)
   {
      this.focusedScreen.m(d);
   }
   function onLogout()
   {
      for(var _loc2_ in this.screenRef)
      {
         this.screenRef[_loc2_].onLogout();
      }
   }
   function show(l)
   {
      if(!this.screenRef[l])
      {
         _global.tabs.registerContext(l);
         var _loc5_ = this.attachMovie(this.tRef[l],"s" + this.screenCount,this.getNextHighestDepth());
         _loc5_.__tID = l;
         _loc5_.owner = this.__owner;
         _loc5_.firstDraw();
         this.screenCount = this.screenCount + 1;
         this.screenRef[l] = _loc5_;
      }
      this.focusedScreen.onDeactivate();
      this.focusedScreen._visible = false;
      var _loc3_ = this.screenRef[l];
      _loc3_.onActivate();
      _loc3_.setSize(this.__width,this.__height);
      _loc3_.resize(this.__width,this.__height);
      _loc3_._visible = true;
      this.focusedScreen = _loc3_;
      _global.tabs.setOrder("main," + _global.groupManager.currentScreen + "," + l);
   }
   function doDeactivate()
   {
      this.focusedScreen.onDeactivate();
      this.focusedScreen._visible = false;
   }
   function refresh()
   {
      this.focusedScreen.onRefresh();
   }
   function setSize(w, h)
   {
      this.__width = w;
      this.__height = h;
      this.focusedScreen.setSize(w,h);
      this.focusedScreen.resize(w,h);
   }
}
