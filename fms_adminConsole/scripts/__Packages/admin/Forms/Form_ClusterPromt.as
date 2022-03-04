class admin.Forms.Form_ClusterPromt extends UI.core.Form
{
   function Form_ClusterPromt()
   {
      super();
      this.addControl("Label","l1",0,{_x:17,_y:12,autoSize:"left"});
      this.l1.text = "To log into this cluster, type your username and";
      this.addControl("Label","l2",1,{_x:17,_y:27,autoSize:"left"});
      this.l2.text = "password below.";
      this.addControl("Label","l3",2,{_x:17,_y:59,autoSize:"left",text:"Cluster:"});
      this.addControl("Label","l4",3,{_x:17,_y:82,autoSize:"left",text:"Username:"});
      this.addControl("Label","l5",4,{_x:17,_y:106,autoSize:"left",text:"Password:"});
      this.addControl("Label","v1",5,{_x:110,_y:59,autoSize:"left"});
      this.addControl("TextInput","v2",6,{_x:110,_y:79,width:125,height:20});
      this.addControl("TextInput","v3",7,{_x:110,_y:104,width:125,height:20});
      this.v3.password = true;
      this.addControl("CheckBox","c1",8,{_y:129,_x:110,width:150,height:22,label:"Remember my password"});
      this.addControl("Button","b1",9,{_x:180,_y:151,width:55,height:22,label:"Ok"});
      this.addControl("Button","b2",10,{_x:240,_y:151,width:55,height:22,label:"Ignore"});
      this.b1.addListener("click",this.onOK,this);
      this.b2.addListener("click",this.onIgnore,this);
      var _loc4_ = "f" + _global.uniqueID();
      _global.tabs.registerContext(_loc4_);
      _global.tabs.registerTab(_loc4_,this.v2,0);
      _global.tabs.registerTab(_loc4_,this.v3,1);
      _global.tabs.registerTab(_loc4_,this.c1,2);
      _global.tabs.registerTab(_loc4_,this.b1,3);
      _global.tabs.registerTab(_loc4_,this.b2,4);
      _global.tabs.setOrder(_loc4_);
   }
   function onQueData(q, cObj)
   {
      this.__qData = q;
      this.setText(this.v1,cObj.label);
      this.setText(this.v2,cObj.dl.user);
      this.setText(this.v3,cObj.dl.pass);
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
      var _loc3_ = this.__qData.cQues;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         this.__qData.connQue.push({id:_loc3_[_loc2_].id,user:this.v2.text,pass:this.v3.text,server:_loc3_[_loc2_].server});
         _loc2_ = _loc2_ + 1;
      }
      this.__qData.user = this.v2.text;
      this.__qData.pass = this.v3.text;
      this.__qData.cQues.splice(0,this.__qData.cQues.length);
      this.owner.workQue(this.__qData,this);
   }
   function onKillDialog()
   {
      this.onIgnore();
   }
   function onIgnore()
   {
      var _loc3_ = this.__qData.cQues;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         this.__qData.result.lost.push(_loc3_[_loc2_].id);
         _loc2_ = _loc2_ + 1;
      }
      this.__qData.cQues.splice(0,this.__qData.cQues.length);
      this.owner.workQue(this.__qData,this);
   }
}
