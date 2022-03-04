class admin.Panels.Application.Panels.PLog.Description_render_server extends UI.core.movieclip
{
   function Description_render_server()
   {
      super();
      this.createTextField("label",0,0,2,100,20);
      this.label.selectable = true;
      this.label.multiline = true;
      this.label.wordWrap = true;
      this.label.html = true;
      this.strEnd = "</font>";
   }
   function deselect()
   {
      this.label.htmlText = this.strPre + this.__data.description + this.strEnd;
   }
   function select(s, e)
   {
      var _loc2_ = this.__data.description;
      this.label.htmlText = this.strPre + _loc2_.slice(0,s) + "<b><u><font color=\'#000000\'>" + _loc2_.slice(s,e) + "</font></u></b>" + _loc2_.slice(e,_loc2_.length) + this.strEnd;
   }
   function setData(info)
   {
      this.strPre = "<font face=\'Verdana\' size=\'10\' color=\'#";
      if(info.level == "error")
      {
         this.strPre += "ff0000";
      }
      else if(info.level == "warning")
      {
         this.strPre += "ff33cc";
      }
      else if(info.source == "access")
      {
         this.strPre += "0000ff";
      }
      else if(info.source == "stream")
      {
         this.strPre += "006600";
      }
      else
      {
         this.strPre += "000000";
      }
      this.strPre += "\'>";
      this.label.htmlText = this.strPre + info.description + this.strEnd;
      this.label._height = this.label.textHeight + 4;
      this.__data = info;
   }
   function getData()
   {
      return this.__data.description;
   }
   function getBestHeight()
   {
      this.label._height = this.label.textHeight + 4;
      return this.label._height + 4;
   }
   function setWidth(w)
   {
      this.label._width = w;
      this.label._height = this.label.textHeight + 4;
      this.owner.onChangeHeight();
   }
}
