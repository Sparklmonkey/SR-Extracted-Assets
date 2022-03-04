class admin.adminHead extends UI.core.movieclip
{
   var lastIndex = 0;
   function adminHead()
   {
      super();
      _global.admin_head = this;
      this.attachMovie("ComboBox","rateCombo",0);
      this.attachMovie("Label","userLabel",1);
      this.attachMovie("Label","refreshLabel",2);
      this.attachMovie("console_logo","fcsLogo",3);
      this.attachMovie("Label","rrlabel",6);
      this.createEmptyMovieClip("seperator",4);
      this.createEmptyMovieClip("seperator2",5);
      this.drawRect(this.seperator,0,0,1,10,16777215,100);
      this.drawRect(this.seperator2,0,0,1,10,16777215,100);
      var _loc4_ = 15;
      this.fcsLogo._x = 17;
      this.fcsLogo._y = 8;
      this.userLabel.autoSize = "left";
      this.userLabel._y = _loc4_;
      this.userLabel.setFormat("color",16777215);
      this.userLabel.link = true;
      this.userLabel.addListener("click",this.onLogoff,this);
      this.userLabel.text = "Logoff";
      this.rrlabel._y = _loc4_;
      this.rrlabel.autoSize = "left";
      this.rrlabel.setFormat("color",16777215);
      this.rrlabel.text = "Refresh Rate:";
      this.refreshLabel.autoSize = "left";
      this.refreshLabel._y = _loc4_;
      this.refreshLabel.setFormat("color",16777215);
      this.refreshLabel.link = true;
      this.refreshLabel.addListener("click",this.onRefresh,this);
      this.refreshLabel.text = "Refresh";
      this.seperator._y = _loc4_ + 3;
      this.seperator2._y = _loc4_ + 3;
      this.rateCombo.setSize(70);
      this.rateCombo.listHeight = 100;
      this.rateCombo.listWidth = 70;
      this.rateCombo._y = 11;
      this.rateCombo.addItem({label:"1 sec",data:1000});
      this.rateCombo.addItem({label:"5 sec",data:5000});
      this.rateCombo.addItem({label:"10 sec",data:10000});
      this.rateCombo.addItem({label:"15 sec",data:15000});
      this.rateCombo.addItem({label:"20 sec",data:20000});
      this.rateCombo.addItem({label:"25 sec",data:25000});
      this.rateCombo.addItem({label:"30 sec",data:30000});
      this.rateCombo.addItem({label:"45 sec",data:45000});
      this.rateCombo.addItem({label:"60 sec",data:60000});
      this.rateCombo.addItem({label:"Pause",data:-2});
      var _loc5_ = _global.l_cache.getProp("rf_Rate",2);
      this.rateCombo.selectedIndex = _loc5_ - 1;
      _global.groupManager.setRate(this.rateCombo.selectedItem.data);
      this.lastIndex = _loc5_;
      if(this.lastIndex == 9)
      {
         this.lastIndex = 0;
      }
      this.rateCombo.addListener("change",this.onChange,this);
      _global.groupManager.setRate(this.rateCombo.selectedItem.data);
      _global.tabs.registerTab("main",this.rateCombo,0);
      _global.tabs.registerTab("main",this.refreshLabel,1);
      _global.tabs.registerTab("main",this.userLabel,2);
   }
   function onRefresh()
   {
      _global.groupManager.handleRefresh();
      _global.groupManager.specialRefresh();
   }
   function onChange(evt)
   {
      _global.l_cache.setProp("rf_Rate",this.rateCombo.selectedIndex + 1);
      if(this.rateCombo.selectedItem.label == "Pause")
      {
         var _loc3_ = this.__get__Cache().getProp("pauseDialog",false);
         if(_loc3_ != true)
         {
            this.onAlert("Form_pauseRefresh",327,160,"Pause",this,true);
         }
         else
         {
            _global.groupManager.setRate(this.rateCombo.selectedItem.data);
            _global.stg.pb._visible = true;
            _global.stg.pb.isVisible = true;
         }
      }
      else
      {
         this.lastIndex = this.rateCombo.selectedIndex;
         _global.groupManager.setRate(this.rateCombo.selectedItem.data);
      }
   }
   function onLogoff()
   {
      _global.am.clear();
      _global.groupManager.onLogout();
      this.hide();
      _global.conn.disposeAll();
      _global.cm.logoff();
      _global.dat_c.clear();
      _global.groupManager.show("Login");
      _global.li_hb.transitionIn();
   }
   function show()
   {
      this._visible = true;
      _global.groupManager.setRate(this.rateCombo.selectedItem.data);
      this.setSize(this.__get__StageWidth(),this.__get__StageHeight());
   }
   function hide()
   {
      this._visible = false;
   }
   function setSize(w, h)
   {
      if(this._visible != false)
      {
         w -= 20;
         this.userLabel._x = w - this.userLabel.width;
         this.refreshLabel._x = this.userLabel._x - (this.refreshLabel.width + 14);
         this.seperator2._x = w - 110;
         this.rateCombo._x = w - 190;
         this.rrlabel._x = w - 190 - (this.rrlabel.width + 5);
         this.seperator._x = this.refreshLabel._x + this.refreshLabel.width + 6;
         if(w < 570)
         {
            this.rrlabel._visible = false;
         }
         else
         {
            this.rrlabel._visible = true;
         }
         if(w < 485)
         {
            this.rateCombo._visible = false;
         }
         else
         {
            this.rateCombo._visible = true;
         }
         if(w < 405)
         {
            this.seperator2._visible = false;
         }
         else
         {
            this.seperator2._visible = true;
         }
         if(w < 393)
         {
            this.refreshLabel._visible = false;
         }
         else
         {
            this.refreshLabel._visible = true;
         }
         if(w < 343)
         {
            this.seperator._visible = false;
         }
         else
         {
            this.seperator._visible = true;
         }
         if(w < 340)
         {
            this.userLabel._visible = false;
         }
         else
         {
            this.userLabel._visible = true;
         }
      }
   }
}
