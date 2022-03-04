class UI.core.tabManager extends UI.core.movieclip
{
   var ctIndex = -1;
   var ctCount = 0;
   function tabManager(owner)
   {
      super();
      this.ownerRefs = new Object();
      this.tabStore = new Array();
      this.tID = 0;
      _global.tabs = this;
      this.ctHolder = new Object();
      this.fm = owner;
      Selection.addListener(this);
   }
   function findMatch(o1, o2)
   {
      var _loc3_ = o1.split(",");
      o2 = "," + o2;
      var _loc5_ = "";
      var _loc1_ = _loc3_.length;
      while(_loc1_ > 0)
      {
         var _loc2_ = _loc3_[_loc1_ - 1];
         if(o2.indexOf("," + _loc2_ + ",") != -1)
         {
            _loc5_ = _loc2_;
         }
         _loc1_ = _loc1_ - 1;
      }
   }
   function setOrder(o)
   {
      var lastSel = eval(Selection.getFocus());
      var oldCT = this.ctOrder;
      this.ctOrder = o + ",";
      var i = 0;
      while(i < this.tabStore.length)
      {
         this.tabStore[i].tabEnabled = false;
         i++;
      }
      var orders = this.ctOrder.split(",");
      orders.pop();
      var holdMC;
      var f = this.findMatch(oldCT,this.ctOrder);
      if(f == "")
      {
         f = orders[0];
      }
      this.nextRef = new Array();
      var j = 0;
      while(j < orders.length)
      {
         var id = orders[j];
         var ct = this.ctHolder[id];
         var tempOrder = new Array();
         for(var h in ct)
         {
            if(h != "length")
            {
               var mc = ct[h].tabOwner();
               mc.tabEnabled = true;
               if(id == f && holdMC == undefined)
               {
                  holdMC = mc;
               }
               tempOrder.push({index:mc.tabIndex,mc:mc});
            }
         }
         tempOrder.sortOn("index");
         this.nextRef = this.nextRef.concat(tempOrder);
         j++;
      }
      var d = 0;
      while(d < this.nextRef.length)
      {
         this.nextRef[d].mc.___tnid = d;
         d++;
      }
      if(this.ownerRefs[f])
      {
         holdMC = this.ownerRefs[f];
      }
      Selection.setFocus(holdMC);
      _root.fcm_focusrect.clear();
   }
   function onSetFocus(old, newf)
   {
      if(newf.__tct)
      {
         this.ownerRefs[newf.__tct] = newf;
      }
   }
   function registerContext(n)
   {
      this.ctHolder[n] = new Object();
      this.ctHolder[n].length = 1;
      this.ctHolder[n].i = this.ctCount;
      this.ctCount = this.ctCount + 1;
   }
   function registerTab(p_ct, mc, i)
   {
      var _loc2_ = this.ctHolder[p_ct];
      _loc2_[i] = mc;
      _loc2_.length = _loc2_.length + 1;
      mc.__tct = p_ct;
      mc.__id = i;
      this.tID = this.tID + 1;
      var _loc3_ = mc.tabOwner();
      _loc3_.tabIndex = _loc2_.i * 150 + i;
      _loc3_.__tct = p_ct;
      this.tabStore.push(_loc3_);
   }
   function nextID(ct)
   {
      return this.ctHolder[ct].length;
   }
   function onFocusMC(mc)
   {
      if(mc.tabOwner().__tct)
      {
         this.ownerRefs[mc.tabOwner().__tct] = mc.tabOwner();
      }
   }
   function focusCheat(mc)
   {
      this.tcInt = setInterval(100,this.workTabCheat,this,mc);
   }
   function workTabCheat(o, mc)
   {
      clearInterval(o.tcInt);
      Selection.setFocus(mc);
   }
}
