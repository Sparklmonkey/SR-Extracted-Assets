class admin.Panels.Servers.Panels.License extends admin.panel
{
   function License()
   {
      super();
      this.attachMovie("DataGrid","cGrid",0);
      this.cGrid.addColumn("serial","Serial Key",290,"Key serial number",4);
      this.cGrid.addColumn("peak","Peak Connections",111,"Maximum number of simultaneous connections allowed",4);
      this.cGrid.addColumn("bandwidth","Bandwidth",100,"Maximum bandwidth allowed (Mbits/s)",4);
      this.cGrid.addColumn("valid","Valid",103,"Serial key validity",4);
      this.cGrid.addColumn("type","Type",100,"Product type",4);
      this.cGrid.addListener("change",this.onSerialSelectWrap,this);
      this.cGrid._y = 20;
      this.cGrid.rowColors = [15595519,16777215];
      this.addControl("Label","proLicenseTitle",1,{_x:0,_y:0,width:250,height:24,text:"Flash Media Server License(s)"});
      this.proLicenseTitle.setFormat("bold",true);
      this.addControl("Label","customLicenseTitle",2,{_x:0,_y:205,width:250,height:24,text:"Custom License(s)"});
      this.customLicenseTitle.setFormat("bold",true);
      this.addControl("List","customLicenseList",3,{_x:0,_y:225,width:250,height:250,text:"Custom License(s)"});
      this.customLicenseList.render = "ExpandRender";
      this.createEmptyMovieClip("blueBox",4);
      this.addControl("Label","versionLabel",5,{_x:0,_y:0,width:250,height:24,text:""});
      this.versionLabel.autoSize = "right";
      this.addControl("Label","keyLabel",6,{_x:0,_y:205,width:100,height:24,text:"Enter Serial Key:"});
      this.addControl("TextInput","serialBox1",7,{_x:0,_y:205,width:240,height:20});
      this.serialBox1.addListener("change",this.onKeyEnter,this);
      this.serialBox1.addListener("enter",this.onKeyAdd,this);
      this.serialBox1.maxChars = 29;
      this.addControl("Button","addkeyButton",11,{_x:0,_y:205,width:100,height:20,label:"Add Serial Key"});
      this.addkeyButton.addListener("click",this.onKeyAdd,this);
      this.addToolTip("Send your key to the server",this.addkeyButton);
      this.addControl("Label","capacityTitleLabel",15,{_x:10,_y:0,width:90,height:24,text:"Capacity totals: "});
      this.capacityTitleLabel.setFormat("bold",true);
      this.addControl("Label","capacityDetailsLabel",16,{_x:100,_y:0,width:300,height:24,text:" -- : -- "});
      this.attachMovie("TextArea","upgradeText",14);
      this.upgradeText.setSize(275,20);
      this.upgradeText.html = true;
      this.upgradeText.selectable = false;
      this.upgradeText.multiline = false;
      this.upgradeText.background = 15595519;
      this.upgradeText.border = 15595519;
      this.serialBox1.next = this.addkeyButton;
      this.addControl("Label","msgBox",17,{_x:20,_y:0,width:350,height:15,text:"",autoSize:"left"});
      this.msgBox.setFormat("size",14);
      this.addControl("Button","removekeyButton",18,{_x:0,_y:185,width:120,height:20,label:"Remove Serial Key"});
      this.removekeyButton.addListener("click",this.onKeyRemove,this);
      this.addToolTip("Remove your key from the server",this.removekeyButton);
      this.displayMessage(true,"Select a connected server ...");
   }
   function onActivate()
   {
      this.active = true;
      if(this.__node != undefined)
      {
         this.owner.setTitle(this.__node.label," License");
      }
      if(this.__node == undefined && this.owner.__currentNode != undefined)
      {
         this.__node = this.owner.__currentNode;
      }
      this.onSetServer(this.__node);
   }
   function onDeactivate()
   {
      this.active = false;
   }
   function onForceRefresh()
   {
   }
   function onLogout()
   {
      this.cGrid.removeAll();
      this.customLicenseList.removeAll();
      this.serialBox1.text = this.serialBox2.text = this.serialBox3.text = this.serialBox4.text = "";
   }
   function displayMessage(hide, msg)
   {
      this.cGrid._visible = this.proLicenseTitle._visible = this.customLicenseTitle._visible = this.customLicenseList._visible = this.blueBox._visible = this.versionLabel._visible = this.keyLabel._visible = this.serialBox1._visible = this.serialBox2._visible = this.serialBox3._visible = this.serialBox4._visible = this.addkeyButton._visible = this.spacer1._visible = this.spacer2._visible = this.spacer3._visible = this.capacityTitleLabel._visible = this.capacityDetailsLabel._visible = !hide;
      this.msgBox._visible = hide;
      this.onSerialSelect(hide);
      this.msgBox.text = msg;
      this.owner.setTitle("","");
   }
   function firstDraw()
   {
      this.nextTab(this.cGrid);
      this.nextTab(this.customLicenseList);
      this.nextTab(this.serialBox1);
      this.nextTab(this.addkeyButton);
   }
   function onRefresh()
   {
      if(this.active)
      {
         var _loc2_ = 0;
         var _loc3_ = new Array();
         switch(this.__node.type)
         {
            case "cluster":
               this.displayMessage(true,"You have a cluster selected. Please select a server.");
               break;
            case "server":
               if(this.__node.connected)
               {
                  this.displayMessage(false);
                  this.owner.setTitle(this.__node.label," License");
                  this.__get__fc().call(this.__node.nodeid,"getLicenseInfo",new this.ResBind(this.onGetLicenseInfo,this,this.__node.label));
               }
               break;
            case "vhost":
               if(this.__node.parent.connected)
               {
                  this.displayMessage(false);
                  this.owner.setTitle(this.__node.parent.label," License");
                  this.__get__fc().call(this.__node.parent.nodeid,"getLicenseInfo",new this.ResBind(this.onGetLicenseInfo,this,this.__node.parent.label));
               }
         }
      }
   }
   function onSetServer(node)
   {
      this.__node = node;
      this.onRefresh();
   }
   function onGetLicenseInfo(result, server)
   {
      var _loc3_ = result.data;
      if(!(this.__oldData != undefined && this.dataCompare(_loc3_,this.__oldData)))
      {
         this.__oldData = _loc3_;
         this.versionLabel.text = !(_loc3_.name || _loc3_.version || _loc3_.build) ? "Version Information Unavailable/Inaccessible" : _loc3_.name + " " + _loc3_.version + " " + _loc3_.build;
         if(_loc3_.version.indexOf("3.",0) == 0)
         {
            this.capacityTitleLabel.text = "";
            this.capacityDetailsLabel.text = "";
            this.upgradeText.text = "";
            if(_loc3_.name.indexOf("Streaming") != -1)
            {
               this.upgradeText.text += "<font face=\"Verdana\" size=\"9\">                     Add more performance,<a href=\"http://www.adobe.com/go/fms\"><b> Upgrade Now!</b></a></font>";
            }
            else if(_loc3_.name.indexOf("Develop") != -1)
            {
               this.upgradeText.text += "<font face=\"Verdana\" size=\"9\">Upgrade to unlimited Connections now!<a href=\"http://www.adobe.com/go/fms\"><b> Click Here.</b></a></font>";
            }
         }
         else if(_loc3_.max_bandwidth || _loc3_.max_connections)
         {
            this.capacityDetailsLabel.text = _loc3_.max_bandwidth != -1 ? " Bandwidth: " + _loc3_.max_bandwidth + " Mbps" : "Bandwidth: unlimited   ";
            this.capacityDetailsLabel.text += _loc3_.max_connections != -1 ? " Connections: " + _loc3_.max_connections : "Connections: unlimited   ";
         }
         else
         {
            this.capacityDetailsLabel.text = "Capacity Information Unavailable/Inaccessible";
         }
         this.customLicenseList.removeAll();
         if(_loc3_.license_files[0] != undefined)
         {
            for(var _loc4_ in _loc3_.license_files)
            {
               if(!_loc3_.license_files[_loc4_])
               {
               }
               var _loc2_ = new Array();
               _loc2_.push({label:"Description:",data:_loc3_.license_files[_loc4_].description});
               _loc2_.push({label:"Expires :",data:_loc3_.license_files[_loc4_].expires});
               _loc2_.push({label:"ID:",data:_loc3_.license_files[_loc4_].id});
               _loc2_.push({label:"Type:",data:_loc3_.license_files[_loc4_].type});
               _loc2_.push({label:"Filename:",data:_loc3_.license_files[_loc4_].filename});
               this.customLicenseList.addItem({label:_loc3_.license_files[_loc4_].filename,data:_loc2_},true);
            }
         }
         else
         {
            this.customLicenseList.addItem({label:"No license files discovered",data:null},true);
         }
         this.cGrid.removeAll();
         if(_loc3_.key_details[0] != undefined)
         {
            for(_loc4_ in _loc3_.key_details)
            {
               _loc2_ = new Object();
               _loc2_.serial = _loc3_.key_details[_loc4_].key;
               _loc2_.valid = _loc3_.key_details[_loc4_].valid;
               _loc2_.bandwidth = _loc3_.key_details[_loc4_].max_bandwidth;
               _loc2_.peak = _loc3_.key_details[_loc4_].max_connections;
               _loc2_.type = _loc3_.key_details[_loc4_].type;
               this.cGrid.addItem(_loc2_,true);
            }
         }
      }
   }
   function dataCompare(newData, oldData)
   {
      for(var _loc4_ in newData)
      {
         if(typeof newData[_loc4_] == "object")
         {
            if(!this.dataCompare(newData[_loc4_],oldData[_loc4_]))
            {
               return false;
            }
         }
         else if(newData[_loc4_] != oldData[_loc4_])
         {
            return false;
         }
      }
      return true;
   }
   function onKeyAdd(evt)
   {
      var _loc5_ = "";
      var _loc2_ = 0;
      while(_loc2_ < this.cGrid.length)
      {
         var _loc4_ = this.cGrid.getItemAt(_loc2_);
         _loc5_ += _loc4_.serial + ";";
         _loc2_ = _loc2_ + 1;
      }
      var _loc3_ = this.serialBox1.text.toUpperCase();
      var _loc7_ = _loc3_.length == 29;
      var _loc6_ = this.serialBox1.text;
      if(_loc3_.length == 24)
      {
         if(_loc3_.indexOf("-",0) == -1)
         {
            var _loc8_ = "";
            _loc8_ += _loc3_.substr(0,4) + "-" + _loc3_.substr(4,4) + "-" + _loc3_.substr(8,4) + "-";
            _loc8_ += _loc3_.substr(12,4) + "-" + _loc3_.substr(16,4) + "-" + _loc3_.substr(20,4);
            _loc6_ = _loc8_;
            _loc7_ = true;
         }
         else
         {
            var _loc9_ = _loc3_.substr(0,3).toUpperCase();
            if(_loc9_ == "FMD" || _loc9_ == "SFD" || _loc9_ == "SED")
            {
               _loc7_ = true;
            }
         }
      }
      else if(_loc3_.length == 21 && _loc3_.indexOf("-",0) == -1)
      {
         _loc9_ = _loc3_.substr(0,3).toUpperCase();
         if(!(_loc9_ == "FMD" || _loc9_ == "SFD" || _loc9_ == "SED"))
         {
            _loc7_ = false;
         }
         else
         {
            _loc8_ = "";
            _loc8_ += _loc3_.substr(0,6) + "-" + _loc3_.substr(6,5) + "-" + _loc3_.substr(11,5) + "-";
            _loc8_ += _loc3_.substr(16,5);
            _loc6_ = _loc8_;
            _loc7_ = true;
         }
      }
      if(!_loc7_ || _loc6_ == "---")
      {
         this.onError("Invalid Serial Key");
      }
      else
      {
         _loc5_ += _loc6_;
         trace(_loc5_);
         var _loc10_ = "/Server/LicenseInfo";
         this.__oldData = null;
         this.__get__fc().call(this.__node.nodeid,"setConfig2",new this.ResBind(this.onKeyAddResponse,this,_loc6_),_loc10_,_loc5_,"/");
      }
   }
   function onKeyRemove(evt)
   {
      var _loc4_ = "";
      var _loc6_ = this.cGrid.getItemAt(this.cGrid.selectedIndex).serial;
      var _loc2_ = 0;
      while(_loc2_ < this.cGrid.length)
      {
         if(_loc2_ > 0)
         {
            _loc4_ += ";";
         }
         if(_loc2_ != this.cGrid.selectedIndex)
         {
            var _loc3_ = this.cGrid.getItemAt(_loc2_);
            _loc4_ += _loc3_.serial;
         }
         _loc2_ = _loc2_ + 1;
      }
      var _loc5_ = "/Server/LicenseInfo";
      this.__oldData = null;
      this.__get__fc().call(this.__node.nodeid,"setConfig2",new this.ResBind(this.onKeyRemoveResponse,this,_loc6_),_loc5_,_loc4_,"/");
   }
   function onKeyAddResponse(response, key)
   {
      for(var _loc3_ in response)
      {
         trace("** " + _loc3_ + " " + response[_loc3_]);
      }
      if(response.level == "status")
      {
         this.onInfo("Serial Key \'" + key + "\' sent to the server for approval.");
         this.serialBox1.text = this.serialBox2.text = this.serialBox3.text = this.serialBox4.text = "";
      }
      else
      {
         this.onError("Unable to add the Serial Key \'" + key + "\'to the server.");
      }
   }
   function onKeyRemoveResponse(response, key)
   {
      if(response.level == "status")
      {
         this.onInfo("Serial Key \'" + key + "\' successfully removed from the server.");
         this.serialBox1.text = this.serialBox2.text = this.serialBox3.text = this.serialBox4.text = "";
      }
      else
      {
         this.onError("Unable to remove the Serial Key \'" + key + "\'from the server.");
      }
   }
   function onKeyEnter(evt)
   {
      if(evt.target.text.length >= evt.target.maxChars)
      {
         evt.target.text = evt.target.text.slice(0,evt.target.maxChars);
      }
   }
   function onSerialSelectWrap()
   {
      this.onSerialSelect(this.cGrid.selectedIndex != undefined);
   }
   function onSerialSelect(hide)
   {
      if(!hide)
      {
         this.removekeyButton._visible = this.cGrid.selectedIndex != undefined;
      }
      else
      {
         this.removekeyButton._visible = hide;
      }
   }
   function setSize(w, h)
   {
      this.__width = w;
      this.cGrid.setSize(w,(h - 50) / 2 - 25);
      this.customLicenseList.setSize(w,(h - 50) / 2 - 20);
      this.customLicenseList._y = h / 2 - 5;
      this.customLicenseTitle._y = h / 2 - 25;
      this.removekeyButton._y = h / 2 - 27;
      this.versionLabel._x = w - this.versionLabel.width - 10;
      this.blueBox.clear();
      this.drawRect(this.blueBox,0,h - 50,w,20,15595519,100,1);
      this.capacityTitleLabel._y = this.capacityDetailsLabel._y = h - 48;
      this.upgradeText._y = h - 50;
      this.upgradeText._x = w - this.upgradeText._width - 10;
      this.keyLabel._y = h - 22;
      this.keyLabel._x = w - 500;
      this.serialBox1._y = this.serialBox2._y = this.serialBox3._y = this.serialBox4._y = this.addkeyButton._y = h - 24;
      this.spacer1._y = this.spacer2._y = this.spacer3._y = h - 24;
      this.serialBox1._x = w - 400;
      this.serialBox2._x = w - 330;
      this.serialBox3._x = w - 260;
      this.serialBox4._x = w - 190;
      this.addkeyButton._x = w - 120;
      this.removekeyButton._x = w - 140;
      this.spacer1._x = w - 340;
      this.spacer2._x = w - 270;
      this.spacer3._x = w - 200;
   }
}
