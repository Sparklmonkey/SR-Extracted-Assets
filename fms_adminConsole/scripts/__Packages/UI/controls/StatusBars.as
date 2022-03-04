class UI.controls.StatusBars extends UI.core.events
{
   function StatusBars()
   {
      super();
      this.createEmptyMovieClip("rowHolder",0);
      this.attachMovie("Label","currentTitleLabel",1);
      this.attachMovie("Label","peakTitleLabel",2);
      this.attachMovie("Label","peakClientStartTimeLabel",3);
      this.attachMovie("ScrollBar","vScroll",4);
      this.createEmptyMovieClip("rowMask",5);
      this.rowHolder.setMask(this.rowMask);
      this.vScroll.addListener("scroll",this.doVScroll,this);
      this.vScroll._visible = false;
      this.vScroll._y = 15;
      this.vScroll.blockFocus();
      this.currentTitleLabel.text = "Current Clients";
      this.currentTitleLabel.setFormat("bold",true);
      this.currentTitleLabel.autoSize = "left";
      this.currentTitleLabel._x = 120;
      this.currentTitleLabel._y = 0;
      this.peakTitleLabel.autoSize = "left";
      this.peakTitleLabel.text = "Peak Clients*";
      this.peakTitleLabel.setFormat("color",6710886);
      this.peakTitleLabel._x = 325;
      this.peakTitleLabel._y = 0;
      this.start_time = new Date().toString();
      this.peakClientStartTimeLabel.autoSize = "left";
      this.peakClientStartTimeLabel.setFormat("color",6710886);
      this.peakClientStartTimeLabel._x = 185;
      this.peakClientStartTimeLabel._y = (this.__index + 1) * 16;
      this.__data = new Object();
      this.__index = 1;
   }
   function set label(l)
   {
      this.label_txt.text = l;
   }
   function get label()
   {
      return this.label_txt.text;
   }
   function getBestHeight()
   {
      return this.List.__rowHeight;
   }
   function getWidth()
   {
      return this.label_txt._x + this.label_txt._width;
   }
   function clear()
   {
      this.__data = new Object();
      this.__index = 1;
      this.createEmptyMovieClip("rowHolder",0);
   }
   function updateServer(sID, label, connected, peak)
   {
      if(this.__data[sID] == undefined)
      {
         this.__data[sID] = this.addRow(label,0);
         this.updateRow(sID,connected,peak);
      }
      else
      {
         this.updateRow(sID,connected,peak);
      }
   }
   function updateVhost(vhostName, connected, peak)
   {
      if(this.__data[vhostName] == undefined)
      {
         this.__data[vhostName] = this.addRow(vhostName,this.__index);
         this.updateRow(vhostName,connected,peak);
         this._checkScroll();
         this.__index = this.__index + 1;
         this.peakClientStartTimeLabel._y = (this.__index + 1) * 16;
         this.peakClientStartTimeLabel.text = " *Since " + this.start_time.substring(0,this.start_time.length - 5);
      }
      else
      {
         this.updateRow(vhostName,connected,peak);
      }
   }
   function updateRow(id, connected, peak)
   {
      if(this.__data[id].connected != connected || this.__data[id].peak != peak)
      {
         this.__data[id].currentClientsTxt.text = connected;
         this.__data[id].peakClientsTxt.text = peak;
         this.__data[id].currentClientsTxt._x = peak != 0 ? 142 + connected * 176 / peak - this.__data[id].currentClientsTxt.width : 142 - this.__data[id].currentClientsTxt.width;
         this.__data[id].clear();
         this.drawRect(this.__data[id],120,16,200,14,15726847,100,6);
         var _loc5_ = peak != 0 ? 20 + connected * 176 / peak : 20;
         if(this.__data[id].index == 0)
         {
            this.drawRect(this.__data[id],122,18,_loc5_,10,36086,100,4);
         }
         else
         {
            this.drawRect(this.__data[id],122,18,_loc5_,10,8585061,100,4);
         }
         this.__data[id].connected = connected;
         this.__data[id].peak = peak;
      }
   }
   function addRow(label, i)
   {
      this.rowHolder.createEmptyMovieClip("row" + i,i);
      this.rowHolder["row" + i].index = i;
      this.rowHolder["row" + i]._y = i * 16;
      this.rowHolder["row" + i].attachMovie("Label","label_txt",2);
      this.rowHolder["row" + i].attachMovie("Label","currentClientsTxt",3);
      this.rowHolder["row" + i].attachMovie("Label","peakClientsTxt",4);
      this.rowHolder["row" + i].currentClientsTxt.autoSize = "right";
      this.rowHolder["row" + i].currentClientsTxt.text = "0";
      this.rowHolder["row" + i].currentClientsTxt._y = 15;
      if(i == 0)
      {
         this.rowHolder["row" + i].currentClientsTxt.setFormat("color",16777215);
      }
      else
      {
         this.rowHolder["row" + i].currentClientsTxt.setFormat("color",6710886);
      }
      this.rowHolder["row" + i].peakClientsTxt.autoSize = "left";
      this.rowHolder["row" + i].peakClientsTxt._x = 325;
      this.rowHolder["row" + i].peakClientsTxt._y = 15;
      this.rowHolder["row" + i].peakClientsTxt.setFormat("color",6710886);
      this.rowHolder["row" + i].label_txt.setSize(115,12);
      this.rowHolder["row" + i].label_txt.text = label.length <= 19 ? label : label.slice(0,16) + "...";
      this.rowHolder["row" + i].label_txt._x = 0;
      this.rowHolder["row" + i].label_txt._y = 15;
      this.rowHolder["row" + i].label_txt.autoSize = "right";
      if(i == 0)
      {
         this.rowHolder["row" + i].label_txt.setFormat("bold",true);
      }
      this.rowHolder.setMask(this.rowMask);
      return this.rowHolder["row" + i];
   }
   function doVScroll()
   {
      this.rowHolder._y = - this.vScroll.scrollPosition;
   }
   function _checkScroll()
   {
      var _loc3_ = this.__index * 16;
      if(_loc3_ > this.__height - 34)
      {
         this.vScroll._visible = true;
         var _loc2_ = _loc3_ + 2;
         this.vScroll.setSize(this.__height - 4);
         this.vScroll.setScrollProperties(_loc2_,0,_loc2_ - (this.__height - 18));
         this.vScroll._x = this.__width - (this.vScroll.width + 2);
      }
      else
      {
         this.vScroll._visible = false;
         this.rowHolder._y = 0;
      }
   }
   function setSize(width, height)
   {
      this.__width = width;
      this.__height = height;
      this.rowMask.clear();
      this.drawRect(this.rowMask,0,15,this.__width - (this.vScroll.width + 4),height - 4,16777215,0);
   }
}
