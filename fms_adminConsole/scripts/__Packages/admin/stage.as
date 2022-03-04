class admin.stage extends UI.core.movieclip
{
   function stage()
   {
      super();
      _global.stg = this;
      _global.uid_c = 0;
      _global.uniqueID = function()
      {
         _global.uid_c = _global.uid_c + 1;
         return _global.uid_c;
      };
      this.attachMovie("pauseBound","pb",-3);
      this.pb._x = 11;
      this.pb._y = 96;
      this._con = new admin.general.connection();
      _global.tabOffset = 0;
      _global.tt = _root.attachMovie("ToolTip","tooltip",34);
      this.attachMovie("admin_bg_grad","base_grad",-5);
      this.attachMovie("ShadowBox","sb1",-4);
      this.attachMovie("ShadowBox","sb2",-2);
      this.attachMovie("Login_HeadBox","headBox",-1);
      this.headBox._x = 17;
      this.resizeManager = new admin.general.ResizeManager();
      this.ScreenManager = new admin.manager(this);
      this.attachMovie("alertManager","alertManager",this.getNextHighestDepth());
      this.attachMovie("adminHead","adminHead",this.getNextHighestDepth());
      this.adminHead.hide();
      this.attachMovie("Menu","resources",this.getNextHighestDepth());
      this.attachMovie("Menu","helpMeRhonda",this.getNextHighestDepth());
      _global.resources = this.resources;
      _global.help = this.helpMeRhonda;
      _global.resources.headerLabel = "Flash Media Server Resources";
      _global.help.headerLabel = "Help / Documentation";
      var _loc6_ = new Array();
      _loc6_.push({label:"Flash Media Server Website",data:"http://www.adobe.com/go/flashmediaserver_en"});
      _loc6_.push({label:"Related Resources",data:"http://www.adobe.com/go/flashmediaserver_resources_en"});
      _loc6_.push({label:"Online Forums",data:"http://www.adobe.com/go/flashmediaserver_forum_en"});
      _loc6_.push({label:"spacer"});
      _loc6_.push({label:"Support Center",data:"http://www.adobe.com/go/flashmediaserver_support_en"});
      _loc6_.push({label:"Help Resource Center",data:"http://www.adobe.com/go/flashmediaserver_docs_en"});
      _loc6_.push({label:"Release Notes",data:"http://www.adobe.com/go/flashmediaserver_releasenotes_en"});
      _loc6_.push({label:"Enhancement Requests / Bugs",data:"http://www.adobe.com/go/flashmediaserver_wishform_en"});
      _loc6_.push({label:"Designer / Developer Center",data:"http://www.adobe.com/go/flashmediaserver_desdev_en"});
      _loc6_.push({label:"Customer Service",data:"http://www.adobe.com/go/flashmediaserver_service_en"});
      _loc6_.push({label:"Online Registration",data:"http://www.adobe.com/go/software_register"});
      _global.resources.dataProvider = _loc6_;
      var _loc5_ = new Array();
      _loc5_.push({label:"Getting Started",data:" http://www.adobe.com/go/flashmediaserver_gettingstarted"});
      _loc5_.push({label:"Technical Overview",data:"http://www.adobe.com/go/flashmediaserver_techoverview"});
      _loc5_.push({label:"Installation Guide",data:"http://www.adobe.com/go/flashmediaserver_installation"});
      _loc5_.push({label:"Configuration and Administration Guide",data:"http://www.adobe.com/go/flashmediaserver_config"});
      _loc5_.push({label:"Administration API Reference",data:"http://www.adobe.com/go/flashmediaserver_adminapi"});
      _loc5_.push({label:"spacer"});
      _loc5_.push({label:"Developer Guide",data:"http://www.adobe.com/go/flashmediaserver_devguide"});
      _loc5_.push({label:"ActionScript 3.0 Language Reference",data:"http://www.adobe.com/go/flashmediaserver_as3reference"});
      _loc5_.push({label:"ActionScript 2.0 Language Reference",data:"http://www.adobe.com/go/flashmediaserver_as2reference"});
      _loc5_.push({label:"Server-Side ActionScript Reference",data:"http://www.adobe.com/go/flashmediaserver_ss_asreference"});
      _loc5_.push({label:"Plug-in Developer Guide",data:"http://www.adobe.com/go/flashmediaserver_plugindev"});
      _loc5_.push({label:"Plug-in API Reference",data:"http://www.adobe.com/go/flashmediaserver_pluginapi"});
      _loc5_.push({label:"spacer"});
      _loc5_.push({label:"About Flash Media Server 3.5.1",data:"aboutDialog"});
      _global.help.dataProvider = _loc5_;
      _global.help.addListener("click",this.onMenu,this);
      _global.resources.addListener("click",this.onMenu,this);
      this.pb._visible = false;
      this.fm = new admin.formManager(this,this.getNextHighestDepth());
      _global.cm.init();
   }
   function onMenu(evt)
   {
      if(evt.data == "aboutDialog")
      {
         this.onAlert("admin.aboutDialog",500,350,"",this);
      }
      else
      {
         this.getURL(evt.data,"_blank");
      }
   }
   function setSize(w, h)
   {
      this.__width = w;
      this.__height = h;
      this.headBox.setSize(w - 34,50);
      this.fm.setSize(w,h);
      this.adminHead.setSize(w,h);
      this.base_grad._width = w;
      this.base_grad._height = h;
      _global.ResizeManager.setSize(0,w,h);
      this.alertManager.setSize(w,h);
      this.ScreenManager.setSize(w,h);
      this.pb.setSize(w - 22,h - 101);
   }
}
