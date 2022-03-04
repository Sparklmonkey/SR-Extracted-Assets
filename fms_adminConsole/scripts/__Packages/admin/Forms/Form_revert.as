class admin.Forms.Form_revert extends UI.core.Form
{
   function Form_revert()
   {
      super();
      this.addControl("Label","l1",3,{_x:15,_y:15,text:"This will reset the local cache and this console",autoSize:"left"});
      this.addControl("Label","l2",4,{_x:15,_y:30,text:"will reset all settings to defaults. You will lose",autoSize:"left"});
      this.addControl("Label","l3",5,{_x:15,_y:45,text:"all your server and cluster login information.",autoSize:"left"});
      this.addControl("Label","l4",6,{_x:15,_y:60,text:"Are you sure you wish to continue?",autoSize:"left"});
      this.addControl("Button","b1",1,{label:"OK",_x:227,_y:96,width:25,height:24});
      this.addControl("Button","b2",2,{label:"Cancel",_x:256,_y:96,width:50,height:24});
      this.b1.addListener("click",this.onOK,this);
      this.b2.addListener("click",this.onCancel,this);
      var _loc4_ = "f" + _global.uniqueID();
      _global.tabs.registerContext(_loc4_);
      _global.tabs.registerTab(_loc4_,this.b1,0);
      _global.tabs.registerTab(_loc4_,this.b2,1);
      _global.tabs.setOrder(_loc4_);
      this.keyToEvent("r",this.onOK,this);
      this.keyToEvent("y",this.onOK,this);
      this.keyToEvent("o",this.onOK,this);
      this.keyToEvent("c",this.onCancel,this);
      this.keyToEvent("n",this.onCancel,this);
   }
   function onOK()
   {
      _global.l_cache.clear();
      this.onInfo("The cache has been cleared. Please reload this console for changes to take effect");
      this.closeForm();
   }
   function onCancel()
   {
      this.closeForm();
   }
}
