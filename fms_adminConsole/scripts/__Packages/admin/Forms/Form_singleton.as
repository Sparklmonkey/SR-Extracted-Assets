class admin.Forms.Form_singleton extends UI.core.Form
{
   function Form_singleton()
   {
      super();
      this.addControl("Label","l1",0,{_x:17,_y:12,autoSize:"left"});
      this.addControl("Label","l2",1,{_x:17,_y:27,autoSize:"left"});
      this.addControl("Label","l4",3,{_x:17,_y:69,autoSize:"left",text:"Server Address:"});
      this.addControl("Label","l5",4,{_x:17,_y:98,autoSize:"left",text:"Username:"});
      this.addControl("Label","l6",5,{_x:17,_y:120,autoSize:"left",text:"Password:"});
      this.addControl("TextInput","v1",6,{_x:115,_y:68,width:215,height:20});
      this.addControl("TextInput","v2",7,{_x:115,_y:94,width:125,height:20});
      this.addControl("TextInput","v3",8,{_x:115,_y:116,width:125,height:20});
      this.v3.password = true;
      this.addControl("CheckBox","c1",9,{_x:115,_y:146,width:200,height:22,label:"Remember my password"});
      this.addControl("Button","b1",11,{_x:210,_y:176,width:55,height:22,label:"Ok"});
      this.addControl("Button","b2",12,{_x:270,_y:176,width:55,height:22,label:"Ignore"});
      this.b1.addListener("click",this.onOK,this);
      this.b2.addListener("click",this.onIgnore,this);
      var _loc4_ = "f" + _global.uniqueID();
      _global.tabs.registerContext(_loc4_);
      _global.tabs.registerTab(_loc4_,this.v1,0);
      _global.tabs.registerTab(_loc4_,this.v2,1);
      _global.tabs.registerTab(_loc4_,this.v3,2);
      _global.tabs.registerTab(_loc4_,this.c1,3);
      _global.tabs.registerTab(_loc4_,this.b1,4);
      _global.tabs.registerTab(_loc4_,this.b2,5);
      _global.tabs.setOrder(_loc4_);
   }
   function onQueData(q)
   {
      this.qDat = q;
      this.setText(this.v1,q.server);
      this.setText(this.v2,q.user);
      this.setText(this.v3,q.pass);
      this.c1.selected = q.rememberPass;
   }
   function setType(t)
   {
      this.l1.text = "Login attempt to the server below failed. Please";
      this.l2.text = "verify your login information and try again.";
      this.__type = t;
   }
   function onKillDialog()
   {
      this.onIgnore();
   }
   function setText(mc, v)
   {
      if(v != undefined)
      {
         mc.text = v;
      }
   }
   function onOK()
   {
      this.qDat.promt = false;
      this.qDat.server = this.v1.text;
      this.qDat.user = this.v2.text;
      this.qDat.pass = this.v3.text;
      this.qDat.rememberPass = this.c1.selected;
      var _loc4_ = _global.l_cache.getProp("singletonServers");
      var _loc3_ = _loc4_[this.qDat.n];
      _loc3_.server = this.v1.text;
      _loc3_.user = this.v2.text;
      _loc3_.pass = this.v3.text;
      _loc3_.rememberPass = this.c1.selected;
      if(!this.c1.selected)
      {
         _loc3_.pass = "";
      }
      _global.l_cache.setProp("singletonServers",_loc4_);
      _global.cm.update();
      this.owner.workSingle(this.qDat,this);
   }
   function onIgnore()
   {
      this.qDat.promt = false;
      this.qDat.result.lost.push(this.qDat.id);
      this.owner.resultQue(this.qDat,this);
   }
}
