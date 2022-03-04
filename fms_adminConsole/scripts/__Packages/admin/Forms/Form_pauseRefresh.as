class admin.Forms.Form_pauseRefresh extends UI.core.Form
{
   function Form_pauseRefresh()
   {
      super();
      this.attachMovie("CheckBox","cb",0);
      this.cb.label = "Don\'t show again";
      this.cb._x = 15;
      this.cb._y = 100;
      this.cb.selected = false;
      this.addControl("Label","l1",3,{_x:15,_y:15,text:"Flash Media Server will not monitor any application",autoSize:"left"});
      this.addControl("Label","l2",4,{_x:15,_y:30,text:"or server data while the console is paused.",autoSize:"left"});
      this.addControl("Label","l3",5,{_x:15,_y:45,text:"Are you sure you wish to continue?",autoSize:"left"});
      this.addControl("Button","b1",1,{label:"Pause Refresh",_x:152,_y:96,width:100,height:24});
      this.addControl("Button","b2",2,{label:"Cancel",_x:256,_y:96,width:50,height:24});
      this.cb.addListener("click",this.onClick,this);
      this.b1.addListener("click",this.onOK,this);
      this.b2.addListener("click",this.onCancel,this);
      var _loc4_ = "f" + _global.uniqueID();
      _global.tabs.registerContext(_loc4_);
      _global.tabs.registerTab(_loc4_,this.cb,0);
      _global.tabs.registerTab(_loc4_,this.b1,1);
      _global.tabs.registerTab(_loc4_,this.b2,2);
      _global.tabs.setOrder(_loc4_);
      this.keyToEvent("p",this.onOK,this);
      this.keyToEvent("y",this.onOK,this);
      this.keyToEvent("o",this.onOK,this);
      this.keyToEvent("c",this.onCancel,this);
      this.keyToEvent("n",this.onCancel,this);
   }
   function onOK()
   {
      this.onClick();
      _global.groupManager.setRate(-2);
      this.closeForm();
   }
   function onCancel()
   {
      _global.admin_head.rateCombo.selectedIndex = _global.admin_head.lastIndex;
      _global.l_cache.setProp("rf_Rate",_global.admin_head.lastIndex + 1);
      this.closeForm();
   }
   function onClick()
   {
      this.__get__Cache().setProp("pauseDialog",this.cb.selected);
   }
   function onKillDialog()
   {
      this.onClick();
      _global.admin_head.rateCombo.selectedIndex = _global.admin_head.lastIndex - 1;
   }
}
