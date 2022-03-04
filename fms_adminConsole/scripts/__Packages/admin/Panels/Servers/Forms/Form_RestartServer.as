class admin.Panels.Servers.Forms.Form_RestartServer extends UI.core.Form
{
   function Form_RestartServer()
   {
      super();
      this.addControl("Label","l1",0,{text:"Are you sure you want to restart this server?",width:250,height:20,_x:20,_y:20});
      this.addControl("Button","b1",1,{label:"Restart",width:70,height:24,_x:45,_y:50});
      this.addControl("Button","b2",2,{label:"Cancel",width:70,height:24,_x:145,_y:50});
      this.b1.addListener("click",this.onRestart,this);
      this.b2.addListener("click",this.closeForm,this);
      var _loc4_ = "f" + _global.uniqueID();
      _global.tabs.registerContext(_loc4_);
      _global.tabs.registerTab(_loc4_,this.b1,0);
      _global.tabs.registerTab(_loc4_,this.b2,1);
      _global.tabs.setOrder(_loc4_);
      this.keyToEvent("r",this.onRestart,this);
      this.keyToEvent("y",this.onRestart,this);
      this.keyToEvent("o",this.onRestart,this);
      this.keyToEvent("c",this.closeForm,this);
      this.keyToEvent("n",this.closeForm,this);
   }
   function onRestart()
   {
      this.owner.restartServer();
      this.closeForm();
   }
   function onActivate()
   {
      this.b1.tabIndex = 0;
      this.b2.tabIndex = 1;
   }
}
