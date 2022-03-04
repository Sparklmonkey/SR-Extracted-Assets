class admin.Panels.Login.Login_HeadBox extends UI.core.movieclip
{
   var __state = 0;
   var __helpOpen = false;
   var __resourceOpen = false;
   function Login_HeadBox()
   {
      super();
      _global.li_hb = this;
      this.attachMovie("Login_ico1","ico1",0);
      this.attachMovie("Label","ico1Label",1);
      this.attachMovie("login_trayBtn_over2","ico2over",2);
      this.attachMovie("Login_ico2","ico2",3);
      this.attachMovie("Label","ico2Label",4);
      this.attachMovie("login_trayBtn_over","ico3over",5);
      this.attachMovie("Login_ico3","ico3",6);
      this.attachMovie("Label","ico3Label",7);
      this.attachMovie("Login_LinkList","ll_1",8);
      this.attachMovie("Login_LinkList","ll_2",9);
      this.createEmptyMovieClip("btnHolder",10);
      this.attachMovie("Login_Form","form",11);
      this.createEmptyMovieClip("progForm",12);
      this.progForm.attachMovie("LoadClip_small","lc",0);
      this.progForm._x = 59;
      this.progForm._y = 79;
      this.progForm.attachMovie("Label","l1",1);
      this.progForm.l1._x = 20;
      this.progForm.l1.autoSize = "left";
      this.progForm.attachMovie("Label","l2",2);
      this.progForm.l2._y = 20;
      this.progForm.l2._x = 20;
      this.progForm.l2.autoSize = "left";
      this.progForm.attachMovie("Button","b1",3);
      this.progForm.b1.setSize(100,24);
      this.progForm.b1.label = "Cancel";
      this.progForm.b1._y = 40;
      this.progForm.b1.addListener("click",this.onStopAuto,this);
      this.btnHolder._x = 6;
      this.btnHolder._y = 3;
      this.ico1._x = 17;
      this.ico1._y = this.ico2._y = this.ico3._y = 7;
      this.ButtonRef = new Object();
      this.ico1Label.text = "Flash Media Administration Console";
      this.ico1Label._x = 43;
      this.ico1Label.autoSize = "left";
      this.ico1Label._y = this.ico2Label._y = this.ico3Label._y = 12;
      this.ico2over._visible = false;
      this.ico2over._y = 3;
      this.ico3over._visible = false;
      this.ico3over._y = 3;
      this.ico2.owner = this;
      this.ico2.onRollOver = function()
      {
         this.owner.ico2over._visible = true;
         this.owner.ico2Label.setFormat("underline",true);
         this.owner.__helpOpen = _global.help.open;
         if(this.owner.__resourceOpen == true)
         {
            this.owner.showHelp();
            this.owner.__resourceOpen = false;
            _global.resources.hide();
         }
      };
      this.ico2.onRollOut = this.ico2.onReleaseOutside = function()
      {
         this.owner.ico2over._visible = false;
         this.owner.ico2Label.setFormat("underline",false);
      };
      this.ico2.onPress = function()
      {
         this.owner.showHelp();
      };
      this.ico3.owner = this;
      this.ico3.onRollOver = function()
      {
         this.owner.ico3over._visible = true;
         this.owner.ico3Label.setFormat("underline",true);
         this.owner.__resourceOpen = _global.resources.open;
         if(this.owner.__helpOpen == true)
         {
            this.owner.showResources();
            this.owner.__helpOpen = false;
            _global.help.hide();
         }
      };
      this.ico3.onRollOut = this.ico3.onReleaseOutside = function()
      {
         this.owner.ico3over._visible = false;
         this.owner.ico3Label.setFormat("underline",false);
      };
      this.ico3.onPress = function()
      {
         this.owner.showResources();
      };
      this.ico2Label.owner = this;
      this.ico2Label.onRollOver = function()
      {
         this.owner.ico2over._visible = true;
         this.setFormat("underline",true);
         this.owner.__helpOpen = _global.help.open;
         if(this.owner.__resourceOpen == true)
         {
            this.owner.showHelp();
            this.owner.__resourceOpen = false;
            _global.resources.hide();
         }
      };
      this.ico2Label.onRollOut = this.ico2Label.onReleaseOutside = function()
      {
         this.owner.ico2over._visible = false;
         this.setFormat("underline",false);
      };
      this.ico2Label.onPress = function()
      {
         this.owner.showHelp();
      };
      this.ico3Label.owner = this;
      this.ico3Label.onRollOver = function()
      {
         this.owner.ico3over._visible = true;
         this.setFormat("underline",true);
         this.owner.__resourceOpen = _global.resources.open;
         if(this.owner.__helpOpen == true)
         {
            this.owner.showResources();
            this.owner.__helpOpen = false;
            _global.help.hide();
         }
      };
      this.ico3Label.onRollOut = this.ico3Label.onReleaseOutside = function()
      {
         this.owner.ico3over._visible = false;
         this.setFormat("underline",false);
      };
      this.ico3Label.onPress = function()
      {
         this.owner.showResources();
      };
      this.ico1Label.setFormat("bold",true);
      this.ico1Label.setFormat("color",2971251);
      this.ico2Label.setFormat("bold",true);
      this.ico2Label.text = "Help / Documentation";
      this.ico2Label.setFormat("color",2971251);
      this.ico2Label.autoSize = "left";
      this.ico3Label.setFormat("bold",true);
      this.ico3Label.setFormat("color",2971251);
      this.ico3Label.autoSize = "left";
      this.ico3Label.text = "Flash Media Server Resources";
      this.form._x = this.form._y = 59;
      this.ll_1.drawList([{label:"Flash Media Server Website",url:"http://www.adobe.com/go/flashmediaserver_en"},{label:"Related Resources",url:"http://www.adobe.com/go/flashmediaserver_resources_en"},{label:"Online Forums",url:"http://www.adobe.com/go/flashmediaserver_forum_en"},{type:"space",height:8},{label:"Support Center",url:"http://www.adobe.com/go/flashmediaserver_support_en"},{label:"Help Resource Center",url:"http://www.adobe.com/go/flashmediaserver_docs_en"},{label:"Release Notes",url:"http://www.adobe.com/go/flashmediaserver_releasenotes_en"},{label:"Enhancement Requests / Bugs",url:"http://www.adobe.com/go/flashmediaserver_wishform_en"},{label:"Designer / Developer Center",url:"http://www.adobe.com/go/flashmediaserver_desdev_en"},{label:"Customer Service",url:"http://www.adobe.com/go/flashmediaserver_service_en"},{label:"Online Registration",url:"http://www.adobe.com/go/software_register"}]);
      this.ll_2.drawList([{label:"Getting Started",url:" http://www.adobe.com/go/flashmediaserver_gettingstarted"},{label:"Technical Overview",url:"http://www.adobe.com/go/flashmediaserver_techoverview"},{label:"Installation Guide",url:"http://www.adobe.com/go/flashmediaserver_installation"},{label:"Configuration and Administration",url:"http://www.adobe.com/go/flashmediaserver_config"},{label:"Administration API Reference",url:"http://www.adobe.com/go/flashmediaserver_adminapi"},{type:"space",height:8},{label:"Developer Guide",url:"http://www.adobe.com/go/flashmediaserver_devguide"},{label:"ActionScript 3.0 Reference",url:"http://www.adobe.com/go/flashmediaserver_as3reference"},{label:"ActionScript 2.0 Reference",url:"http://www.adobe.com/go/flashmediaserver_as2reference"},{label:"Server-Side ActionScript",url:"http://www.adobe.com/go/flashmediaserver_ss_asreference"},{label:"Plug-in Developer Guide",url:"http://www.adobe.com/go/flashmediaserver_plugindev"},{label:"Plug-in API Reference",url:"http://www.adobe.com/go/flashmediaserver_pluginapi"}]);
      this.ll_1._y = 58;
      this.ll_2._y = 58;
      this.btnHolder._visible = false;
      this.addButton("Apps","View Applications","G1_ico",0);
      this.addButton("Users","Manage Users","G2_ico",1);
      this.addButton("Servers","Manage Servers","G3_ico",2);
      this.progForm._visible = false;
   }
   function onStopAuto()
   {
      _global.autoOn = false;
      this.progForm._visible = false;
      this.form._visible = true;
      delete _global.cm.processAuto;
   }
   function setLoginText(t1, t2)
   {
      this.progForm.l1.text = t1;
      this.progForm.l2.text = t2;
      if(_global.autoOn == true)
      {
         this.progForm._visible = true;
         this.form._visible = false;
      }
      else
      {
         this.progForm._visible = false;
         this.form._visible = true;
      }
   }
   function addButton(id, label, icon, i)
   {
      var _loc3_ = this.btnHolder.attachMovie("Login_GroupBtn","btn" + i,i);
      _loc3_.label = label;
      _loc3_.icon = icon;
      _loc3_.id = id;
      _loc3_._x = i * 148;
      _loc3_.addListener("click",this.doClick,this);
      this.ButtonRef[id] = _loc3_;
      _global.tabs.registerTab("main",_loc3_,3 + i);
   }
   function doClick(data)
   {
      if(data.target != this.__last)
      {
         this.__last.states.gotoAndStop(1);
         this.__last = data.target;
         this.__last.states.gotoAndStop(3);
         this.__get__Cache().setProp("lastFocus",this.__last.id);
         _global.groupManager.show(this.__last.id);
      }
   }
   function setUpTabs()
   {
      _global.fm.removeAll();
      this.btnHolder.btn0.tabIndex = 0;
      this.btnHolder.btn1.tabIndex = 1;
      this.btnHolder.btn2.tabIndex = 2;
      _global.tabOffset = 3;
   }
   function drawTabs(m)
   {
      this.form.drawTabs(m);
   }
   function onActivate()
   {
      this.form.onActivate();
      this.addToolTip("",this.ico2);
      this.addToolTip("",this.ico3);
   }
   function onDeactivate()
   {
      this.addToolTip("Help / Documentation",this.ico2);
      this.addToolTip("Flash Media Server Resources",this.ico3);
   }
   function transitionOut()
   {
      this.__state = 1;
      this.clear();
      var _loc2_ = 3;
      var _loc3_ = mx.transitions.easing.Strong.easeOut;
      this.ico1._visible = false;
      this.ico1Label._visible = this.ico2Label._visible = this.ico3Label._visible = false;
      this.ll_1._visible = false;
      this.ll_2._visible = false;
      this.form._visible = false;
      this.progForm._visible = false;
      var _loc5_ = new mx.transitions.Tween(this.ico3,"_x",_loc3_,this.ico3._x,this.__width - 88,_loc2_,false);
      var _loc4_ = new mx.transitions.Tween(this.ico2,"_x",_loc3_,this.ico2._x,this.__width - 43,_loc2_,false);
      var owner = this;
      _loc4_.onMotionFinished = function()
      {
         owner.setSize(owner.__width,owner.__height);
         owner.loginSlide.transition();
         owner.btnHolder._visible = true;
         owner.setUpTabs();
      };
   }
   function showHelp()
   {
      if(!this.__helpOpen)
      {
         var _loc3_ = new Object();
         _loc3_.y = 0;
         _loc3_.x = 0;
         this.ico3.localToGlobal(_loc3_);
         if(_global.groupManager.currentScreen == "Login")
         {
            _global.help.show(this.ico2._x + 10,_loc3_.y + 30);
         }
         else
         {
            _global.help.show(this.ico2._x - _global.help.width + 50,_loc3_.y + 30);
         }
         this.__helpOpen = true;
      }
      else
      {
         this.__helpOpen = false;
      }
   }
   function showResources()
   {
      if(!this.__resourceOpen)
      {
         var _loc3_ = new Object();
         _loc3_.y = 0;
         _loc3_.x = 0;
         this.ico2.localToGlobal(_loc3_);
         if(_global.groupManager.currentScreen == "Login")
         {
            _global.resources.show(this.ico3._x + 10,_loc3_.y + 30);
         }
         else
         {
            _global.resources.show(this.ico3._x - _global.resources.width + 50,_loc3_.y + 30);
         }
         this.__resourceOpen = true;
      }
      else
      {
         this.__resourceOpen = false;
      }
   }
   function transitionIn()
   {
      this.__tween = true;
      this.loginSlide.light._visible = false;
      this.loginSlide.hideLayers();
      this.form._visible = false;
      this.ico1._visible = true;
      this.ico1Label._visible = true;
      this.clear();
      var _loc2_ = 3;
      var _loc3_ = mx.transitions.easing.Strong.easeOut;
      var _loc5_ = new mx.transitions.Tween(this.ico3,"_x",_loc3_,this.ico3._x,this.__width - 470,_loc2_,false);
      var _loc4_ = new mx.transitions.Tween(this.ico2,"_x",_loc3_,this.ico2._x,this.__width - 208,_loc2_,false);
      this.btnHolder._visible = false;
      var owner = this;
      _loc4_.onMotionFinished = function()
      {
         owner.ico3Label._visible = true;
         owner.ico2Label._visible = true;
         owner.loginSlide.transitionIn();
         owner.__tween = false;
      };
   }
   function setSize(width, height)
   {
      this.__width = width;
      this.__height = height;
      if(this.__tween == true)
      {
         return false;
      }
      if(this.__state == 0)
      {
         this.clear();
         this.drawRect(this,0,40,width,1,0,10);
         this.drawRect(this,0,41,width,1,16777215,50);
         this.ico2._x = width - 220;
         this.ico2Label._x = width - 190;
         this.ico2over._x = this.ico2._x - 5;
         this.ico3._x = width - 460;
         this.ico3Label._x = width - 425;
         this.ico3over._x = this.ico3._x - 6;
         _global.resources._x = this.ico3._x - _global.resources.width;
         _global.help._x = this.ico2._x - _global.help.width;
         this.ll_1._x = width - 460;
         this.ll_2._x = width - 213;
         if(width < 825)
         {
            this.ll_1._visible = false;
            this.ico3._visible = false;
            this.ico3Label._visible = false;
         }
         else
         {
            this.ll_1._visible = true;
            this.ico3._visible = true;
            this.ico3Label._visible = true;
         }
         if(width < 574)
         {
            this.ll_2._visible = false;
            this.ico2._visible = false;
            this.ico2Label._visible = false;
         }
         else
         {
            this.ll_2._visible = true;
            this.ico2._visible = true;
            this.ico2Label._visible = true;
         }
         if(width < 437)
         {
            this.form._visible = false;
            this.progForm._visible = false;
         }
         else if(_global.autoOn == true)
         {
            this.progForm._visible = true;
            this.form._visible = false;
         }
         else
         {
            this.progForm._visible = false;
            this.form._visible = true;
         }
      }
      else if(this.__state == 1)
      {
         this.clear();
         this.light._x = width - 4;
         this.drawRect(this,width - 9,0,1,39,16777215,60);
         this.drawRect(this,width - 10,0,1,39,0,10);
         this.ico3._x = width - 88;
         this.ico2._x = width - 43;
         this.ico2over._x = this.ico2._x - 5;
         this.ico3over._x = this.ico3._x - 6;
         _global.resources._x = this.ico3._x - _global.resources.width;
         _global.help._x = this.ico2._x - _global.help.width;
         if(width < 531)
         {
            this.ico3._visible = false;
         }
         else
         {
            this.ico3._visible = true;
            this.drawRect(this,width - 104,6,1,24,7243172,37);
            this.drawRect(this,width - 103,6,1,24,16777215,37);
         }
         if(width < 485)
         {
            this.ico2._visible = false;
         }
         else
         {
            this.ico2._visible = true;
         }
         if(width < 481)
         {
            this.btnHolder.btn2._visible = false;
         }
         else
         {
            this.btnHolder.btn2._visible = true;
         }
         if(width < 306)
         {
            this.btnHolder.btn1._visible = false;
         }
         else
         {
            this.btnHolder.btn1._visible = true;
         }
         if(width < 173)
         {
            this.btnHolder.btn0._visible = false;
         }
         else
         {
            this.btnHolder.btn0._visible = true;
         }
      }
   }
}
