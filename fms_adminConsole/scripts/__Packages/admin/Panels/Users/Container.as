class admin.Panels.Users.Container extends admin.panel
{
   function Container()
   {
      super();
      this.createEmptyMovieClip("backing",0);
      this.attachMovie("List","userList",1);
      this.attachMovie("ComboClustersTree","clusterTree",2);
      this.attachMovie("Label","userNameLabel",3);
      this.attachMovie("Label","resetPromptLabel",4);
      this.attachMovie("Label","deletePromptLabel",5);
      this.attachMovie("Button","resetPasswordButton",6);
      this.attachMovie("Label","userRoleLabel",7);
      this.attachMovie("Button","newUserButton",8);
      this.attachMovie("Button","deleteButton",9);
      this.attachMovie("Seperator","seperator",10);
      this.xOffset = this.__get__Cache().getProp("users/xOffset",211);
      this.userList._y = 29;
      this.userList.render = "userListRender";
      this.userList.addListener("change",this.onListChange,this);
      this.userNameLabel.text = "";
      this.userNameLabel.setFormat("color",0);
      this.userNameLabel.setFormat("bold",true);
      this.userNameLabel.setFormat("size",17);
      this.userNameLabel.autoSize = "left";
      this.userNameLabel._x = this.xOffset + 20;
      this.userNameLabel._y = 15;
      this.userRoleLabel.setFormat("color",5592405);
      this.userRoleLabel.setFormat("size",14);
      this.userRoleLabel.autoSize = "left";
      this.userRoleLabel._x = this.xOffset + 20;
      this.userRoleLabel._y = 36;
      this.resetPromptLabel.text = "Reset the password for this user ";
      this.resetPromptLabel.autoSize = "left";
      this.resetPromptLabel._x = this.xOffset + 50;
      this.resetPromptLabel._y = 105;
      this.deletePromptLabel.text = "Delete this user account on the server";
      this.deletePromptLabel.autoSize = "left";
      this.deletePromptLabel._x = this.xOffset + 50;
      this.deletePromptLabel._y = 145;
      this.resetPasswordButton.label = "";
      this.resetPasswordButton.icon = "icon_servers_reloadRestart";
      this.resetPasswordButton.setSize(24,24);
      this.resetPasswordButton._x = this.xOffset + 20;
      this.resetPasswordButton._y = 100;
      this.resetPasswordButton.addListener("click",this.onResetPassword,this);
      this.addToolTip("Reset this user\'s password",this.resetPasswordButton);
      this.clusterTree.setSize(60,24);
      this.clusterTree.labelPrefix = "Server: ";
      this.clusterTree.addListener("change",this.onClusterTreeSelect,this);
      this.addToolTip("Select the server you wish to query for users",this.clusterTree);
      this.newUserButton.label = "New User";
      this.newUserButton.setSize(70,24);
      this.newUserButton._x = 5;
      this.newUserButton.addListener("click",this.onNewUser,this);
      this.addToolTip("Add a new user to the currently selected server or vHost",this.newUserButton);
      this.newUserButton._visible = false;
      this.deleteButton.label = "";
      this.deleteButton.icon = "icon_servers_delete";
      this.deleteButton.setSize(24,24);
      this.deleteButton._x = this.xOffset + 20;
      this.deleteButton._y = 140;
      this.deleteButton.addListener("click",this.onDeleteUser,this);
      this.addToolTip("Delete this user",this.deleteButton);
      var o = this;
      this.seperator.onPress = function()
      {
         o.doDrag();
      };
      this.seperator.onRelease = this.seperator.onReleaseOutside = function()
      {
         o.endDrag();
      };
      this.seperator._focusrect = false;
      this.seperator.tabEnabled = false;
      this.dragListner = new Object();
      this.dragListner.onMouseMove = function()
      {
         o.onDrag();
      };
      this.resetPromptLabel._visible = this.deletePromptLabel._visible = false;
   }
   function doDrag()
   {
      this.seperator.startX = this.seperator._xmouse;
      this.firstDrag = true;
      Mouse.addListener(this.dragListner);
   }
   function onDrag()
   {
      if(this.firstDrag == true)
      {
         this.seperator.hasDragged = true;
         this.setVisible(false);
         this.firstDrag = false;
      }
      var _loc2_ = this._xmouse - this.seperator.startX;
      this.xOffset = _loc2_ + 6;
      if(this.xOffset < 211)
      {
         this.xOffset = 211;
      }
      if(this.xOffset > this.__width)
      {
         this.xOffset = this.__width;
      }
      this.resetPasswordButton._visible = false;
      this.deleteButton._visible = false;
      this.__get__Cache().setProp("users/uncv",this.xOffset);
      this.seperator._x = this.xOffset - 7;
      this.backing.clear();
      this.drawRect(this.backing,this.xOffset,0,this.__width - this.xOffset,this.__height,16777215,30,4);
      this.drawRect(this.backing,0,0,this.xOffset - 9,this.__height,16777215,20,4);
   }
   function endDrag()
   {
      Mouse.removeListener(this.dragListner);
      if(this.firstDrag == true)
      {
         if(this.xOffset == 5)
         {
            this.xOffset = this.__get__Cache().getProp("users/uncv",211);
         }
         else
         {
            this.xOffset = 5;
         }
      }
      this.setVisible(true);
      this.setSize(this.__width,this.__height);
      this.__get__Cache().setProp("users/xOffset",this.xOffset);
   }
   function setVisible(b)
   {
      this.userList._visible = b;
      this.clusterTree._visible = b;
      this.userNameLabel._visible = b;
      this.userRoleLabel._visible = b;
      if(!this.__displayMsg && this.__server)
      {
         this.userNameLabel._visible = this.resetPromptLabel._visible = this.deletePromptLabel._visible = this.resetPasswordButton._visible = this.newUserButton._visible = this.deleteButton._visible = b;
      }
      else if(b == false)
      {
         this.userNameLabel._visible = this.resetPromptLabel._visible = this.deletePromptLabel._visible = this.resetPasswordButton._visible = this.newUserButton._visible = this.deleteButton._visible = b;
      }
   }
   function onActivate()
   {
   }
   function onDeactivate()
   {
   }
   function drawPanels()
   {
      this.nextTab(this.clusterTree);
      this.nextTab(this.userList);
      this.nextTab(this.resetPasswordButton);
      this.nextTab(this.deleteButton);
      this.nextTab(this.newUserButton);
   }
   function onLogout()
   {
      this.userList.removeAll();
   }
   function onRefresh()
   {
      if(this.__server != undefined && _global.cm.isConnected(this.__server) && !this.__displayMsg)
      {
         this.getAdmins(this.__server);
      }
      else if(this.__server == undefined || !_global.cm.isConnected(this.__server))
      {
         this.resetPasswordButton._visible = false;
         this.deleteButton._visible = false;
      }
   }
   function getAdmins(sID)
   {
      this.__get__fc().call(sID,"getAdmins",new this.ResBind(this.displayUsers,this));
   }
   function displayUsers(result)
   {
      this.userList.removeAll();
      if(this.__currentUser == undefined)
      {
         this.userNameLabel.text = "";
         this.userRoleLabel.text = "Select a user ...";
      }
      var _loc8_ = result.data.server_admins;
      var _loc7_ = 0;
      for(var _loc2_ in _loc8_)
      {
         _loc7_ = _loc7_ + 1;
         this.userList.addItem({label:_loc8_[_loc2_],icon:"icon_userAdmin"});
      }
      var _loc3_ = result.data.vhost_admins;
      for(_loc2_ in _loc3_)
      {
         if(this.__vhostFilter == "" || this.__vhostFilter == _loc2_.toString())
         {
            for(var _loc9_ in _loc3_[_loc2_])
            {
               this.userList.addItem({label:_loc3_[_loc2_][_loc9_],icon:"icon_userAppDev",vhost:_loc2_});
               _loc7_ = _loc7_ + 1;
            }
         }
      }
      if(this.__oldSelectionLabel != undefined)
      {
         _loc2_ = 0;
         while(_loc2_ < this.userList.length)
         {
            if(this.__oldSelectionLabel == this.userList.getItemAt(_loc2_).label)
            {
               if(this.__oldSelectionIcon != undefined && this.__oldSelectionIcon == this.userList.getItemAt(_loc2_).icon && this.__oldSelectionVHost == this.userList.getItemAt(_loc2_).vhost)
               {
                  this.userList.selectedIndex = _loc2_;
                  this.userRoleLabel.text = this.userList.selectedItem.icon != "icon_userAdmin" ? "App Developer" : "Administrator";
                  this.userRoleLabel.text += this.userList.selectedItem.icon != "icon_userAdmin" ? " on the vHost \'" + this.userList.selectedItem.vhost + "\' of server \'" + this.__serverLabel + "\'" : " on the server \'" + this.__serverLabel + "\'";
                  break;
               }
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function onListChange()
   {
      if(this.userList.selectedItem)
      {
         this.deleteButton._visible = true;
         this.resetPasswordButton._visible = true;
         this.__oldSelectionLabel = this.userList.selectedItem.label;
         this.__oldSelectionIcon = this.userList.selectedItem.icon;
         this.__oldSelectionVHost = this.userList.selectedItem.vhost;
         this.userNameLabel.text = this.userList.selectedItem.label;
         this.usernameInput.text = this.userList.selectedItem.label;
         this.__get__fc().call(this.__server,"getAdminContext",new this.ResBind(this.onGetAdminContext,this),this.userList.selectedItem.label);
         this.onRefresh();
      }
   }
   function onReset()
   {
      this.onListChange();
      this.resetButton._visible = false;
      this.saveButton._visible = false;
   }
   function onClusterTreeSelect(evt)
   {
      this.__vhostFilter = "";
      this.__type = evt.node.type;
      this.__node = evt.node;
      this.resetPasswordButton._visible = false;
      this.deleteButton._visible = false;
      this.resetPromptLabel._visible = false;
      this.resetPromptLabel._visible = false;
      if(!_global.cm.isConnected(this.__node.nodeid))
      {
         this.hideForVhost(true,"Attempting to connect... If nothing happens after a few seconds, \nplease go to the Manage Servers panel and connect the server there.");
         return undefined;
      }
      switch(evt.node.type)
      {
         case "cluster":
            this.__displayMsg = true;
            this.hideForVhost(true,"You have selected a cluster. Please select a server to view users");
            break;
         case "server":
            if(_global.conn.getFC(this.__node.nodeid).adminLevel.admin_type == "server")
            {
               this.hideForVhost(false);
               this.__server = evt.node.nodeid;
               this.__serverLabel = evt.node.label;
               this.__currentAdaptor = _global.conn.getFC(this.__server).adminLevel.adaptor;
               this.getAdmins(this.__server);
            }
            else
            {
               this.__displayMsg = true;
               this.hideForVhost(true,"As a vHost admin you do not have access to the Manage Users panel");
            }
            break;
         case "vhost":
            if(_global.conn.getFC(this.__node.nodeid).adminLevel.admin_type == "server")
            {
               this.hideForVhost(false);
               this.__server = evt.node.nodeid;
               this.__serverLabel = evt.node.parent.label;
               this.getAdmins(this.__server);
               this.__vhostFilter = evt.node.label;
            }
            else
            {
               this.__displayMsg = true;
               this.hideForVhost(true,"As a vHost admin you do not have access to the Manage Users panel");
            }
      }
   }
   function hideForVhost(state, msg)
   {
      this.__displayMsg = state;
      if(state)
      {
         this.userRoleLabel.text = msg;
         this.userList.removeAll();
         this.userNameLabel._visible = this.resetPromptLabel._visible = this.deletePromptLabel._visible = this.resetPasswordButton._visible = this.newUserButton._visible = this.deleteButton._visible = false;
      }
      else
      {
         this.userRoleLabel.text = "Select a user ...";
         this.userNameLabel.text = "";
         this.userNameLabel._visible = this.resetPromptLabel._visible = this.deletePromptLabel._visible = this.resetPasswordButton._visible = this.newUserButton._visible = this.deleteButton._visible = true;
      }
   }
   function onGetAdminContext(result)
   {
      if(result.level == "status")
      {
         this.__currentUser = result.data;
      }
   }
   function showButtons(visibility)
   {
      this.resetButton._visible = visibility;
      this.saveButton._visible = visibility;
   }
   function onInputChange()
   {
      this.showButtons(true);
   }
   function onResetPassword(evt)
   {
      if(this.__currentUser == undefined)
      {
         this.onError("No user has been selected");
      }
      else
      {
         this.onAlert("Form_ResetPassword",360,160,"Resetting Password for " + this.userList.selectedItem.label,this);
      }
   }
   function onNewUser(evt)
   {
      if(this.__server == undefined)
      {
         this.onError("No server has been selected");
      }
      else if(this.__node.connected == false)
      {
         this.onError("That server is not connected. Please connect to it first.");
      }
      else
      {
         var _loc2_ = this.__type != "server" ? "Adding an app developer to the vhost " + this.__vhostFilter : "Adding a new administrator to " + this.__serverLabel;
         this.onAlert("Form_NewUser",400,230,_loc2_,this);
      }
   }
   function addUser(name, password, type)
   {
      var _loc2_ = this.__type != "server" ? this.__currentAdaptor + "/" + this.__vhostFilter : "server";
      this.__get__fc().call(this.__server,"addAdmin",new this.ResBind(this.onAddAdmin,this),name,password,_loc2_);
   }
   function onAddAdmin(result)
   {
      if(result.level == "status")
      {
         this.onInfo("User successfully added");
         this.getAdmins(this.__server);
      }
      else
      {
         var _loc2_ = result.description == undefined ? "" : " : " + result.description;
         this.onError("User could not be added" + _loc2_);
      }
   }
   function updatePassword(pass)
   {
      var _loc2_ = this.__currentUser.admin_type != "server" ? this.__currentAdaptor + "/" + this.userList.selectedItem.vhost : "server";
      this.__get__fc().call(this.__server,"changePswd",new this.ResBind(this.onResetPasswordResponse,this),this.userList.selectedItem.label,pass,_loc2_);
   }
   function onResetPasswordResponse(result)
   {
      if(result.level == "status")
      {
         this.onInfo("Password successfully updated");
      }
      else
      {
         this.onError("Password could not be updated ");
      }
   }
   function onDeleteUser()
   {
      if(!this.userList.selectedItem)
      {
         this.onError("No user has been selected");
      }
      else
      {
         this.onAlert("Form_DeleteUser",280,120,"Deleting user:  " + this.userList.selectedItem.label,this);
      }
   }
   function deleteUser()
   {
      var _loc2_ = this.userList.selectedItem.vhost != undefined ? this.__currentAdaptor + "/" + this.userList.selectedItem.vhost : "server";
      this.__get__fc().call(this.__server,"removeAdmin",new this.ResBind(this.onDeleteResponse,this),this.userList.selectedItem.label,_loc2_);
   }
   function onDeleteResponse(result)
   {
      if(result.level == "status")
      {
         this.onInfo("User successfully deleted");
         this.__currentUser == undefined;
         this.getAdmins(this.__server);
      }
      else
      {
         var _loc2_ = result.description == undefined ? "" : " : " + result.description;
         this.onError("User could not be deleted" + _loc2_);
      }
   }
   function setSize(w, h)
   {
      this.__width = w;
      this.__height = h;
      this.backing.clear();
      this.drawRect(this.backing,this.xOffset,0,w - this.xOffset,h,16777215,30,4);
      if(this.xOffset > 5)
      {
         this.drawRect(this.backing,0,h - 39,this.xOffset - 8,39,10726064,100,4);
      }
      this.seperator._y = h / 2 - this.seperator._height / 2;
      this.seperator._x = this.xOffset - 7;
      this.clusterTree.setSize(this.xOffset - 4);
      this.userList.setSize(this.xOffset - 8,h - 59);
      this.userNameLabel._x = this.xOffset + 20;
      this.userRoleLabel._x = this.xOffset + 20;
      this.resetPromptLabel._x = this.xOffset + 50;
      this.deletePromptLabel._x = this.xOffset + 50;
      this.resetPasswordButton._x = this.xOffset + 20;
      this.deleteButton._x = this.xOffset + 20;
      this.newUserButton._y = h - 28;
      if(this.xOffset > 5)
      {
         this.userList._visible = true;
         this.clusterTree._visible = true;
         if(!this.__displayMsg)
         {
            this.newUserButton._visible = true;
         }
         this.seperator.gotoAndStop(1);
      }
      else
      {
         this.seperator._x = 0;
         this.userList._visible = this.clusterTree._visible = this.newUserButton._visible = false;
         this.seperator.gotoAndStop(2);
      }
   }
}
