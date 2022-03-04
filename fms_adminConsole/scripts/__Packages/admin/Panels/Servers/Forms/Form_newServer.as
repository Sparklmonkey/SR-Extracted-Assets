class admin.Panels.Servers.Forms.Form_newServer extends UI.core.movieclip
{
   function Form_newServer()
   {
      super();
      this.addControl("Label","l1",0,{_x:11,_y:18,autoSize:"left"});
      this.l1.setFormat("bold",true);
      this.l1.setFormat("size",14);
      this.l1.text = "New Server";
      this.addControl("Label","l2",2,{_x:11,_y:45,autoSize:"left",text:"Use the controls below to configure this Flash Media Server"});
      this.addControl("Label","l3",3,{_x:11,_y:72,autoSize:"left",text:"Server Information"});
      this.l3.setFormat("bold",true);
      this.addControl("Label","l4",4,{_x:11,_y:97,autoSize:"left",text:"Name:"});
      this.addControl("TextInput","t1",5,{_x:55,_y:95,width:189,height:20});
      this.addControl("Label","l4",15,{_x:11,_y:122,autoSize:"left",text:"Server:"});
      this.addControl("TextInput","t5",16,{_x:55,_y:120,width:189,height:20});
      this.addControl("CheckBox","c1",6,{_x:55,_y:143,width:200,height:24,label:"Use the clusters username and password?"});
      this.addControl("TextInput","t2",7,{_x:186,_y:163,width:142,height:20});
      this.addControl("TextInput","t3",8,{_x:186,_y:186,width:142,height:20});
      this.addControl("TextInput","t4",9,{_x:186,_y:209,width:142,height:20});
      this.t3.password = this.t4.password = true;
      this.addControl("Label","l5",10,{_x:72,_y:165,autoSize:"left",text:"Username:"});
      this.addControl("Label","l6",11,{_x:72,_y:188,autoSize:"left",text:"Password:"});
      this.addControl("Label","l7",12,{_x:72,_y:211,autoSize:"left",text:"Confirm Password:"});
      this.addControl("CheckBox","c2",13,{_x:186,_y:234,width:200,height:24,label:"Remember password?"});
      this.addControl("CheckBox","c3",19,{_x:186,_y:250,width:200,height:24,label:"Automatically connect me"});
      this.addControl("Button","b1",17,{width:65,height:22,label:"Save"});
      this.addControl("Button","b2",18,{width:65,height:22,label:"Cancel"});
      this.b1.addListener("click",this.doSave,this);
      this.b2.addListener("click",this.doCancel,this);
      this.c1.addListener("click",this.refreshUI,this);
      this.c2.addListener("click",this.refreshUI,this);
      _global.tabs.registerContext("f2");
      _global.tabs.registerTab("f2",this.t1,0);
      _global.tabs.registerTab("f2",this.t5,1);
      _global.tabs.registerTab("f2",this.c1,2);
      _global.tabs.registerTab("f2",this.t2,3);
      _global.tabs.registerTab("f2",this.t3,4);
      _global.tabs.registerTab("f2",this.t4,5);
      _global.tabs.registerTab("f2",this.c2,6);
      _global.tabs.registerTab("f2",this.c3,7);
      _global.tabs.registerTab("f2",this.b1,8);
      _global.tabs.registerTab("f2",this.b2,9);
   }
   function setText(mc, str)
   {
      if(str != undefined)
      {
         mc.text = str;
      }
   }
   function setSelected(sID, first_a)
   {
      this._sID = sID;
      this.__first = first_a;
      if(sID.indexOf("a") != -1)
      {
         var _loc6_ = _global.l_cache.getProp("singletonServers");
         var _loc5_ = Number(sID.slice(1,sID.length));
         var _loc3_ = _loc6_[_loc5_];
         this.setText(this.l1,_loc3_.label);
         this.setText(this.t1,_loc3_.label);
         this.setText(this.t2,_loc3_.user);
         this.setText(this.t5,_loc3_.server);
         this.c1._visible = false;
         if(_loc3_.rememberPass == undefined)
         {
            _loc3_.rememberPass = false;
            this.c2.selected = false;
         }
         else
         {
            this.c2.selected = _loc3_.rememberPass;
         }
         if(_loc3_.auto == undefined)
         {
            _loc3_.auto = false;
            this.c3.selected = false;
         }
         else
         {
            this.c3.selected = _loc3_.auto;
         }
         if(_loc3_.rememberPass)
         {
            this.setText(this.t3,_loc3_.pass);
            this.setText(this.t4,_loc3_.pass);
         }
         else
         {
            this.setText(this.t3,"");
            this.setText(this.t4,"");
         }
      }
      else
      {
         _loc3_ = _global.cm.getCluster(this.__get__Clusters().getServersGroup(sID)).servers[sID];
         this.l1.text = _loc3_.dl.label;
         this.t1.text = _loc3_.dl.label;
         this.setText(this.t2,_loc3_.dl.user);
         this.setText(this.t5,_loc3_.dl.server);
         if(_loc3_.dl.rememberPass)
         {
            this.setText(this.t3,_loc3_.dl.pass);
            this.setText(this.t4,_loc3_.dl.pass);
         }
         else
         {
            this.setText(this.t3,"");
            this.setText(this.t4,"");
         }
         this.c2.selected = _loc3_.dl.rememberPass;
         this.c3.selected = _loc3_.dl.auto;
      }
      this.refreshUI();
   }
   function refreshUI()
   {
      if(this._sID.indexOf("a") != -1)
      {
         this.t2.enabled = true;
         this.t2._alpha = 100;
         if(this.c2.selected == true)
         {
            this.t4.enabled = true;
            this.t3.enabled = true;
            this.t3._alpha = this.t4._alpha = 100;
         }
         else
         {
            this.t4.enabled = false;
            this.t3.enabled = false;
            this.t3._alpha = this.t4._alpha = 50;
         }
      }
      else if(this.c1.selected == true)
      {
         this.t2._alpha = this.t3._alpha = this.t4._alpha = 50;
         this.t2.enabled = this.t3.enabled = this.t4.enabled = false;
         this.l5._alpha = 50;
         this.l6._alpha = 50;
         this.l7._alpha = 50;
      }
      else
      {
         this.t2._alpha = 100;
         this.t2.enabled = true;
         this.l5._alpha = 100;
         if(this.c2.selected == true)
         {
            this.t3.enabled = this.t4.enabled = true;
            this.t3._alpha = this.t4._alpha = 100;
            this.l6._alpha = 100;
            this.l7._alpha = 100;
         }
         else
         {
            this.t3.enabled = this.t4.enabled = false;
            this.t3._alpha = this.t4._alpha = 50;
            this.l6._alpha = 50;
            this.l7._alpha = 50;
         }
      }
   }
   function doSave()
   {
      if(this.c2.selected)
      {
         if(this.t3.text != this.t4.text)
         {
            this.onError("Your passwords do not match");
            return undefined;
         }
      }
      if(this._sID.indexOf("a") != -1)
      {
         var _loc4_ = _global.l_cache.getProp("singletonServers");
         var _loc5_ = Number(this._sID.slice(1,this._sID.length));
         var _loc3_ = _loc4_[_loc5_];
         _loc3_.label = this.t1.text;
         _loc3_.user = this.t2.text;
         _loc3_.server = this.t5.text;
         _loc3_.auto = this.c3.selected;
         _loc3_.rememberPass = this.c2.selected;
         if(this.c2.selected)
         {
            _loc3_.pass = this.t3.text;
         }
         else
         {
            _loc3_.pass = "";
         }
         _global.l_cache.setProp("singletonServers",_loc4_);
         _global.cm.update();
      }
      else
      {
         trace("this shouldn\'t happen");
         _loc3_ = this.__get__Clusters().getCluster(this.__get__Clusters().getServersGroup(this._sID)).servers[this._sID];
         _loc3_.label = this.t1.text;
         if(this.c1.selected == true)
         {
            _loc3_.dl = new Object();
            _loc3_.dl.promt = false;
         }
         else
         {
            _loc3_.dl = new Object();
            _loc3_.dl.user = this.t2.text;
            _loc3_.dl.promt = !this.c2.selected;
            if(this.c2.selected == true)
            {
               _loc3_.dl.pass = this.t3.text;
            }
         }
         _loc3_.dl.auto = this.c3.selected;
         _loc3_.dl.server = this.t5.text;
         _global.cm.update();
      }
      this.owner.showForm();
   }
   function doCancel()
   {
      if(this.__first == true)
      {
         _global.cm.removeServer(this._sID);
      }
      this.owner.showForm();
   }
   function setSize(w, h)
   {
      this.b1._x = w - 140;
      this.b1._y = h - 27;
      this.b2._x = w - 70;
      this.b2._y = h - 27;
   }
}
