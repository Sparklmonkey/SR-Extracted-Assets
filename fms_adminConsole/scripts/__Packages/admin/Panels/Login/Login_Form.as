class admin.Panels.Login.Login_Form extends UI.core.movieclip
{
   function Login_Form()
   {
      super();
      _global.lf = this;
      this.eFlag = false;
      this.addControl("Label","l1",0,{text:"Enter your server information",width:200,height:16});
      this.addControl("Label","l2",1,{text:"Server Name:",width:200,height:16,_y:29});
      this.addControl("Label","l3",2,{text:"Server Address:",width:200,height:16,_y:53});
      this.addControl("Label","l4",3,{text:"Username:",width:200,height:16,_y:77});
      this.addControl("Label","l6",4,{text:"Password:",width:200,height:16,_y:101});
      this.addControl("TextInput","t2",6,{width:205,height:20,_x:92,_y:53});
      this.addControl("TextInput","t3",7,{width:171,height:20,_x:92,_y:77});
      this.addControl("TextInput","t4",8,{width:171,height:20,_x:92,_y:101});
      this.addControl("CheckBox","cb1",9,{label:"Remember my password",width:170,height:22,_x:92,_y:126});
      this.addControl("CheckBox","cb2",10,{label:"Automatically connect me",width:170,height:22,_x:92,_y:143});
      this.addControl("Button","b1",11,{label:"Login",width:70,height:24,_x:92,_y:165});
      this.addControl("ComboBox","t1",14,{width:205,height:20,_x:92,_y:29,input:true});
      this.attachMovie("Button","revertBtn",12);
      this.revertBtn.setSize(70,24);
      this.revertBtn._x = 165;
      this.revertBtn._y = 165;
      this.revertBtn.label = "Revert";
      this.addToolTip("Revert this console to defaults (it will lose all settings)",this.revertBtn);
      this.revertBtn.addListener("click",this.onRevert,this);
      this.t4.password = true;
      this.t1.listHeight = 150;
      var owner = this;
      _global.conn.onBadConnect = function()
      {
         owner.onBadLogin();
      };
      _global.conn.onConnect = function(data)
      {
         owner.onConnect(data);
      };
      this.b1.addListener("click",this.onClick,this);
      this.t1.addListener("change",this.onChangeServer,this);
      this.t1.addListener("textChange",this.toCombo,this);
      this.t1.addListener("setFocus",this.cacheText,this);
      this.t1.addListener("killFocus",this.checkText,this);
      this.t2.addListener("change",this.onRefresh,this);
      this.t3.addListener("change",this.onRefresh,this);
      this.t4.addListener("change",this.onRefresh,this);
      this.cb2.addListener("click",this.onRefresh,this);
      this.cb1.addListener("click",this.onRefresh,this);
      this.t2.addListener("enter",this.onClick,this);
      this.t3.addListener("enter",this.onClick,this);
      this.t4.addListener("enter",this.onClick,this);
      this.firstDraw();
      this.addToolTip("URL to server, e.g. localhost",this.t2);
      this.addToolTip("The administrator username to log in to this server",this.t3);
      this.addToolTip("The password for this user ",this.t4);
   }
   function onRevert()
   {
      _global.form_manager.onAlert("Form_revert",327,160,"Revert management console",this);
   }
   function firstDraw()
   {
      this.singleData = _global.l_cache.getProp("singletonServers",new Array(new Object({label:"Server 1"})));
      this.sIndex = _global.l_cache.getProp("lss",0);
      this.t1.removeAll();
      if(this.singleData.length > 0)
      {
         var _loc3_ = 0;
         while(_loc3_ < this.singleData.length)
         {
            this.t1.addItem({label:this.singleData[_loc3_].label,data:_loc3_});
            _loc3_ = _loc3_ + 1;
         }
         this.t1.addItem({type:"spacer"});
      }
      this.t1.addItem({label:"New Server..",new_c:true});
      this.t1.selectedIndex = this.sIndex;
      this.addToolTip("Login to server: " + this.t1.selectedItem.label,this.b1);
      this.onEnter();
      var _loc5_ = this.__get__Clusters().getClusterList();
      _loc3_ = 0;
      while(_loc3_ < _loc5_.length)
      {
         var _loc4_ = _loc5_[_loc3_];
         var _loc6_ = this.__get__Clusters().getCluster(_loc4_).label;
         _loc3_ = _loc3_ + 1;
      }
      if(_loc5_.length > 0)
      {
      }
   }
   function toCombo()
   {
      if(this.t1.text != "")
      {
         if(this.t1.selectedItem.new_c != true)
         {
            this.t1.selectedItem.label = this.t1.text;
            this.singleData[this.t1.selectedItem.data].label = this.t1.text;
            this.saveSingleData();
         }
         var _loc4_ = this.t1.text;
         var _loc2_ = 0;
         while(_loc2_ < this.t1.length)
         {
            if(_loc2_ != this.t1.selectedIndex)
            {
               var _loc3_ = this.t1.getItemAt(_loc2_).data;
               if(_loc4_ == this.singleData[_loc3_].label)
               {
                  this.t1.setText(this.__cacheText);
                  this.t1.selectedItem.label = this.__cacheText;
                  this.singleData[this.t1.selectedItem.data].label = this.__cacheText;
                  this.saveSingleData();
                  this.t1.selectedIndex = _loc2_;
                  this.onEnter();
                  this.cacheText();
                  break;
               }
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function cacheText()
   {
      if(this.t1.text != "")
      {
         this.__cacheText = this.t1.text;
      }
   }
   function checkText()
   {
      var _loc2_ = this.t1.text;
      if(_loc2_ == "" && this.__cacheText != "")
      {
         this.t1.setText(this.__cacheText);
         this.t1.selectedItem.label = this.__cacheText;
         this.singleData[this.t1.selectedItem.data].label = this.__cacheText;
         this.saveSingleData();
      }
   }
   function onClick()
   {
      this.checkText();
      if(this.t1.selectedItem)
      {
         var _loc4_ = new Object();
         _loc4_.user = this.t3.text;
         _loc4_.pass = this.t4.text;
         _loc4_.server = _global.conn.paddServer(this.t2.text);
         _loc4_.rememberpass = this.cb1.selected;
         _loc4_.auto = this.cb2.selected;
         this.eFlag = true;
         var _loc3_ = this.singleData[this.t1.selectedItem.data];
         _loc3_.user = this.t3.text;
         _loc3_.server = this.t2.text;
         _loc3_.rememberPass = this.cb1.selected;
         _loc3_.auto = this.cb2.selected;
         _loc3_.pass = this.t4.text;
         this.saveSingleData();
         _global.cm.connect("a" + this.t1.selectedItem.data,this.onConnect,this);
      }
   }
   function onChangeServer()
   {
      this.addToolTip("Login to server: " + this.t1.selectedItem.label,this.b1);
      if(this.t1.selectedItem.new_c == true)
      {
         var _loc9_ = new Object();
         _loc9_.auto = false;
         this.cb2.selected = false;
         var _loc7_ = "Server ";
         var _loc6_ = 0;
         var _loc4_ = 0;
         while(_loc4_ < this.singleData.length)
         {
            var _loc3_ = this.singleData[_loc4_].label;
            if(_loc3_.slice(0,7) == "Server ")
            {
               var _loc5_ = Number(_loc3_.slice(7,_loc3_.length));
               if(_loc5_ != NaN && _loc5_ > _loc6_)
               {
                  _loc6_ = Number(_loc3_.slice(7,_loc3_.length));
               }
            }
            _loc4_ = _loc4_ + 1;
         }
         _loc7_ += (_loc6_ + 1).toString();
         _loc9_.label = _loc7_;
         var _loc10_ = {data:this.singleData.length,label:_loc7_};
         var _loc8_ = this.t1.length - 2;
         if(_loc8_ < 0)
         {
            _loc8_ = 0;
         }
         this.t1.addItemAt(_loc8_,_loc10_);
         this.singleData.push(_loc9_);
         this.t2.setText("");
         this.t3.setText("");
         this.t4.setText("");
         this.t1.selectedIndex = _loc8_;
         this.t1.setText(_loc7_);
         this.saveSingleData();
      }
      else
      {
         _global.l_cache.setProp("lss",this.t1.selectedItem.data);
         this.onEnter();
      }
   }
   function saveSingleData()
   {
      _global.l_cache.setProp("singletonServers",this.singleData);
   }
   function conResult(data)
   {
      this.onConnect();
      _global.cm.dispatchEvent("login",data);
   }
   function onRefresh(evt)
   {
      var _loc2_ = this.singleData[this.t1.selectedItem.data];
      if(_loc2_)
      {
         _loc2_.label = this.t1.text;
         _loc2_.server = this.t2.text;
         _loc2_.user = this.t3.text;
         _loc2_.auto = this.cb2.selected;
         _loc2_.rememberPass = this.cb1.selected;
         if(this.cb1.selected)
         {
            _loc2_.pass = this.t4.text;
         }
         else
         {
            _loc2_.pass = "";
         }
         this.saveSingleData();
      }
   }
   function onConnect()
   {
      this.__waiting = false;
      _global.am.clear();
      _global.am.hide();
      _global.admin_head.setLL(this.serverName);
      this._parent.transitionOut();
   }
   function onBadLogin()
   {
      this.__waiting = false;
   }
   function drawTabs(lp)
   {
      lp.nextTab(this.t1.label_txt);
      lp.nextTab(this.t2);
      lp.nextTab(this.t3);
      lp.nextTab(this.t4);
      lp.nextTab(this.cb1);
      lp.nextTab(this.cb2);
      lp.nextTab(this.b1);
      lp.nextTab(this.revertBtn);
   }
   function onActivate()
   {
      this.firstDraw();
   }
   function setText(mc, val, i)
   {
      if(this.singleData[i][val])
      {
         mc.setText(this.singleData[i][val]);
      }
      else
      {
         mc.setText("");
      }
   }
   function onEnter()
   {
      var _loc2_ = this.t1.selectedItem.data;
      this.setText(this.t2,"server",_loc2_);
      this.setText(this.t3,"user",_loc2_);
      if(this.singleData[_loc2_].rememberPass == undefined)
      {
         this.singleData[_loc2_].rememberPass = false;
         this.cb1.selected = false;
      }
      else
      {
         this.cb1.selected = this.singleData[_loc2_].rememberPass;
      }
      if(this.singleData[_loc2_].auto == undefined)
      {
         this.singleData[_loc2_].auto = false;
         this.cb2.selected = false;
      }
      else
      {
         this.cb2.selected = this.singleData[_loc2_].auto;
      }
      if(this.singleData[_loc2_].rememberPass && this.singleData[_loc2_].pass)
      {
         this.setText(this.t4,"pass",_loc2_);
      }
      else
      {
         this.t4.text = "";
      }
   }
}
