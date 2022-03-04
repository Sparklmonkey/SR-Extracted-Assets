class admin.formManager extends UI.core.movieclip
{
   function formManager(stage, depth)
   {
      super();
      _global.form_manager = this;
      this.__width = 0;
      this.__height = 0;
      this.whiteSpace = stage.createEmptyMovieClip("whiteSpace",depth);
      this.infoSpace = stage.createEmptyMovieClip("infoSpace",depth + 1);
      this.whiteSpace.onPress = function()
      {
      };
      this.whiteSpace.useHandCursor = false;
      this.infoSpace.attachMovie("InfoBox","ib",0);
      var owner = this;
      this.infoSpace.ib.onKillBox = function()
      {
         owner.closeForm();
      };
      this.infoSpace._visible = false;
      this.whiteSpace._visible = false;
   }
   function onAlert(content, width, height, title, owner, white)
   {
      this.infoSpace._visible = true;
      if(white == undefined)
      {
         white = true;
      }
      this.closeForm();
      this.whiteSpace._visible = white;
      this.infoSpace.ib.setSize(width,height);
      this.infoSpace.ib.content = content;
      this.infoSpace.ib.title = title;
      this.infoSpace.ib.content.owner = owner;
      this.infoSpace.ib.w = width;
      this.infoSpace.ib.h = height;
      this.infoSpace.ib._x = Math.max(Math.round(this.__get__StageWidth() / 2 - width / 2),0);
      this.infoSpace.ib._y = Math.max(Math.round(this.__get__StageHeight() / 2 - height / 2),0);
      this.infoSpace._visible = true;
      return this.infoSpace.ib.content;
   }
   function closeForm(b)
   {
      this.whiteSpace._visible = false;
      this.infoSpace.ib.title = "";
      this.infoSpace.ib.disposeForm();
      this.infoSpace.ib.content = null;
      this.infoSpace._visible = false;
      var _loc3_ = _global.groupManager.panelGroups[_global.groupManager.currentScreen].container;
      _global.tabs.setOrder("main," + _global.groupManager.currentScreen + "," + _loc3_.PanelSpace.focusedScreen.__tID);
   }
   function setSize(w, h)
   {
      var _loc3_ = Math.max(Math.round(this.__width / 2 - this.infoSpace.ib.w / 2),0);
      var _loc2_ = Math.max(Math.round(this.__height / 2 - this.infoSpace.ib.h / 2),0);
      if(this.infoSpace.ib._x == _loc3_ && this.infoSpace.ib._y == _loc2_)
      {
         this.infoSpace.ib._x = Math.max(Math.round(w / 2 - this.infoSpace.ib.w / 2),0);
         this.infoSpace.ib._y = Math.max(Math.round(h / 2 - this.infoSpace.ib.h / 2),0);
      }
      this.__width = w;
      this.__height = h;
      this.whiteSpace.clear();
      this.drawRect(this.whiteSpace,0,0,w,h,16777215,50);
      this.whiteSpace.tabEnabled = false;
      this.whiteSpace._focusrect = false;
   }
}
