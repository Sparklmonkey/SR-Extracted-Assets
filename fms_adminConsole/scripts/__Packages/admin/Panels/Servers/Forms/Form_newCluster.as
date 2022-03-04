class admin.Panels.Servers.Forms.Form_newCluster extends UI.core.movieclip
{
   function Form_newCluster()
   {
      super();
      this.addControl("Label","l1",0,{_x:11,_y:18,autoSize:"left"});
      this.l1.setFormat("bold",true);
      this.l1.setFormat("size",14);
      this.l1.text = "New Cluster";
      this.addControl("Label","l2",2,{_x:11,_y:45,autoSize:"left",text:"Clusters allow you to group your Flash Media Servers. Use the controls below to configure this cluster."});
      this.addControl("Label","l3",3,{_x:11,_y:72,autoSize:"left",text:"Cluster Information"});
      this.l3.setFormat("bold",true);
      this.addControl("Label","l4",4,{_x:11,_y:97,autoSize:"left",text:"Name:"});
      this.addControl("TextInput","t1",5,{_x:55,_y:95,width:189,height:20});
      this.addControl("CheckBox","c1",6,{_x:55,_y:120,width:200,height:24,label:"Use a username and password to login to all servers within the cluster?"});
      this.addControl("TextInput","t2",7,{_x:186,_y:140,width:142,height:20});
      this.addControl("TextInput","t3",8,{_x:186,_y:163,width:142,height:20});
      this.addControl("TextInput","t4",9,{_x:186,_y:186,width:142,height:20});
      this.t3.password = this.t4.password = true;
      this.addControl("Label","l5",10,{_x:72,_y:142,autoSize:"left",text:"Username:"});
      this.addControl("Label","l6",11,{_x:72,_y:165,autoSize:"left",text:"Password:"});
      this.addControl("Label","l7",12,{_x:72,_y:188,autoSize:"left",text:"Confirm Password:"});
      this.addControl("CheckBox","c2",13,{_x:186,_y:209,width:200,height:24,label:"Remember password?"});
      this.addControl("CheckBox","c3",14,{_x:186,_y:228,width:200,height:24,label:"Automatically login?"});
      this.addControl("Button","b1",15,{width:65,height:22,label:"Save"});
      this.addControl("Button","b2",16,{width:65,height:22,label:"Cancel"});
      this.b1.addListener("click",this.doSave,this);
      this.b2.addListener("click",this.doCancel,this);
      this.c1.addListener("click",this.refreshUI,this);
      this.c2.addListener("click",this.refreshUI,this);
      this.c3.addListener("click",this.refreshUI,this);
      _global.tabs.registerContext("f1");
      _global.tabs.registerTab("f1",this.t1,0);
      _global.tabs.registerTab("f1",this.c1,1);
      _global.tabs.registerTab("f1",this.t2,2);
      _global.tabs.registerTab("f1",this.t3,3);
      _global.tabs.registerTab("f1",this.t4,4);
      _global.tabs.registerTab("f1",this.c2,5);
      _global.tabs.registerTab("f1",this.c3,6);
      _global.tabs.registerTab("f1",this.b1,7);
      _global.tabs.registerTab("f1",this.b2,8);
   }
   function setSelected(cID, first_a)
   {
      this.__first = first_a;
      if(cID == undefined)
      {
         this.l1.text = this.t1.text = "New Cluster";
      }
      else
      {
         this._cID = cID;
         var _loc3_ = _global.cm.getCluster(cID);
         this.l1.text = _loc3_.label;
         this.t1.text = _loc3_.label;
         if(_loc3_.dl.user)
         {
            this.c1.selected = true;
         }
         else
         {
            this.c1.selected = false;
         }
         if(first_a == true)
         {
            this.c1.selected = false;
         }
         this.c3.selected = _loc3_.auto;
         this.c2.selected = !_loc3_.dl.promt;
      }
      this.refreshUI();
   }
   function refreshUI()
   {
      if(this.c1.selected == false)
      {
         this.t2._alpha = this.t3._alpha = this.t4._alpha = this.l5._alpha = this.l6._alpha = this.l7._alpha = this.c2._alpha = this.c3._alpha = 50;
         this.t2.enabled = this.t3.enabled = this.t4.enabled = false;
      }
      else
      {
         this.t2.enabled = true;
         this.t2._alpha = this.t3._alpha = this.t4._alpha = this.l5._alpha = this.l6._alpha = this.l7._alpha = this.c2._alpha = this.c3._alpha = 100;
         if(this.c2.selected == true)
         {
            this.t3._alpha = this.t4._alpha = 100;
            this.t3.enabled = this.t4.enabled = true;
         }
         else
         {
            this.t3._alpha = this.t4._alpha = 50;
            this.t3.enabled = this.t4.enabled = false;
         }
      }
   }
   function doSave()
   {
      if(this.c1.selected == true)
      {
         if(this.t3.text != this.t4.text)
         {
            this.onError("Your passwords do not match");
            return undefined;
         }
      }
      var _loc2_ = this.__get__Clusters().getCluster(this._cID);
      _loc2_.label = this.t1.text;
      if(this.c1.selected == true)
      {
         _loc2_.dl = new Object({user:this.t2.text,pass:this.t3.text});
         _loc2_.dl.promt = !this.c2.selected;
      }
      else
      {
         _loc2_.dl = null;
         _loc2_.dl.promt = false;
      }
      _loc2_.auto = this.c3.selected;
      this.__get__Clusters().update();
      this.owner.showForm();
   }
   function doCancel()
   {
      if(this.__first == true)
      {
         _global.cm.removeCluster(this._cID);
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
