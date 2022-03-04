class admin.Forms.Form_ServerPromt extends UI.core.Form
{
   function Form_ServerPromt()
   {
      super();
      this.addControl("Label","l1",0,{_x:17,_y:12,autoSize:"left",text:"Login attempt to the server below failed. Please"});
      this.addControl("Label","l2",1,{_x:17,_y:27,autoSize:"left",text:"verify your login information and try again."});
      this.addControl("Label","l4",3,{_x:17,_y:69,autoSize:"left",text:"Server Address:"});
      this.addControl("Label","l5",4,{_x:17,_y:98,autoSize:"left",text:"Username:"});
      this.addControl("Label","l6",5,{_x:17,_y:120,autoSize:"left",text:"Password:"});
      this.addControl("TextInput","v1",6,{_x:115,_y:68,width:215,height:20});
      this.addControl("TextInput","v2",7,{_x:115,_y:97,width:125,height:20});
      this.addControl("TextInput","v3",8,{_x:115,_y:119,width:125,height:20});
      this.v3.password = true;
      this.addControl("CheckBox","c2",10,{_x:115,_y:166,width:200,height:22,label:"Remember my password"});
      this.addControl("Button","b1",11,{_x:210,_y:198,width:55,height:22,label:"Ok"});
      this.addControl("Button","b2",12,{_x:270,_y:198,width:55,height:22,label:"Ignore"});
      this.b1.addListener("click",this.onOK,this);
      this.b2.addListener("click",this.onIgnore,this);
      var _loc4_ = "f" + _global.uniqueID();
      _global.tabs.registerContext(_loc4_);
      _global.tabs.registerTab(_loc4_,this.v1,0);
      _global.tabs.registerTab(_loc4_,this.v2,1);
      _global.tabs.registerTab(_loc4_,this.v3,2);
      _global.tabs.registerTab(_loc4_,this.c2,3);
      _global.tabs.registerTab(_loc4_,this.b1,4);
      _global.tabs.registerTab(_loc4_,this.b2,5);
      _global.tabs.setOrder(_loc4_);
   }
   function onQueData(q, sObj, d)
   {
      this.__sID = q.sQues[0].id;
      this.__qData = q;
      this.__pc = d.postCon;
      var _loc4_ = this.owner.getServerConnMethod(q.sQues[0].id);
      if(_loc4_.mode == 2 || _loc4_.mode == 3)
      {
         this.setText(this.v2,q.user);
         this.setText(this.v3,q.pass);
         this.setText(this.v1,q.server);
      }
      else
      {
         this.setText(this.v2,sObj.dl.user);
         this.setText(this.v3,sObj.dl.pass);
         this.setText(this.v1,sObj.dl.server);
         if(sObj.dl.rememberPass)
         {
            this.c2.selected = true;
         }
         else
         {
            this.c2.selected = false;
         }
      }
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
      var _loc4_ = undefined;
      _loc4_ = {id:this.__qData.sQues[0].id,server:this.v1.text,user:this.v2.text,pass:this.v3.text};
      if(this.__sID.indexOf("a") != -1)
      {
         var _loc5_ = _global.l_cache.getProp("singletonServers");
         var _loc6_ = Number(this.__sID.slice(1,this.__sID.length));
         var _loc3_ = _loc5_[_loc6_];
         _loc3_.user = this.v2.text;
         _loc3_.server = this.v1.text;
         if(this.c2.selected == true)
         {
            _loc3_.pass = this.v3.text;
            _loc3_.rememberPass = true;
         }
         else
         {
            delete _loc3_.pass;
            _loc3_.rememberPass = false;
         }
         _global.l_cache.setProp("singletonServers",_loc5_);
         _global.cm.update();
      }
      else
      {
         _loc3_ = this.__get__Clusters().getCluster(this.__get__Clusters().getServersGroup(this.__sID)).servers[this.__sID];
         _loc3_.dl = new Object();
         _loc3_.dl.user = this.v2.text;
         _loc3_.dl.promt = !this.c2.selected;
         if(this.c2.selected == true)
         {
            _loc3_.dl.pass = this.v3.text;
            _loc3_.dl.rememberPass = true;
         }
         else
         {
            _loc3_.dl.rememberPass = false;
         }
         _loc3_.dl.server = this.v1.text;
         _global.cm.update();
      }
      if(this.__pc == true)
      {
         this.owner.connection.requestOpenServer(_loc4_.id,_loc4_);
      }
      else
      {
         this.__qData.sQues.splice(0,1);
         this.__qData.connQue.push(_loc4_);
         this.owner.workQue(this.__qData,this);
      }
   }
   function onKillDialog()
   {
      this.onIgnore();
   }
   function onIgnore()
   {
      this.__qData.result.lost.push(this.__qData.sQues[0].id);
      this.__qData.sQues.splice(0,1);
      this.owner.workQue(this.__qData,this);
   }
}
