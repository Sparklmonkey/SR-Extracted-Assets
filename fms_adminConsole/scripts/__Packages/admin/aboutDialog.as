class admin.aboutDialog extends UI.core.Form
{
   var labelStartYPos = 55;
   var labelStartXPos = 200;
   var yPos = admin.aboutDialog.prototype.labelStartYPos;
   var xPos = admin.aboutDialog.prototype.labelStartXPos;
   var labelWidth = 130;
   var labelHeight = 16;
   var colSpace = 5;
   var _curImgIndex = 0;
   var _curImgCount = 0;
   var _curTextCount = 0;
   var _curDept = 0;
   var _totalDepts = 0;
   var _callsPerSec = 25;
   var _deptVisibleTime = 5;
   var gutter = 15;
   function aboutDialog()
   {
      super();
      this._images = new Array();
      this._imageNames = new Array();
      this._numPeople = new Array();
      this._firstDrawImage = true;
      this._nameLabel = null;
      this._prevLabel = null;
      this.attachMovie("Flashcom_logo","logo",0);
      this.logo._x = this.gutter - 2;
      this.logo._y = this.gutter - 2;
      this.addControl("Label","productNameLabel",1,{_x:this.gutter - 2,_y:277,autoSize:"left",text:"Flash Media Server 3,5,1 (Console:" + admin.consoleVersion.getConsoleVersion() + ")"});
      this.productNameLabel.setFormat("color",2237030);
      this.addControl("Label","copyrightLabel3",4,{_x:this.gutter - 2,_y:290,autoSize:"left",text:"<AdobeIP#0000609>"});
      this.copyrightLabel3.setFormat("color",3355443);
      var _loc4_ = 60;
      var _loc3_ = 22;
      this.addControl("Button","closeButton",5,{_x:492 - this.gutter - _loc4_,_y:320 - this.gutter - _loc3_ + 2,width:_loc4_,height:_loc3_,label:"Close"});
      this.closeButton.addListener("click",this.onClose,this);
      this.storeList([{label:"The Usual Suspects",image:"groupDev",type:"picture"},{label:"Engineering",image:"",type:"title"},{label:"Ed Chan",image:"Ed",type:"label"},{label:"Stephen Cheng",image:"StephenC",type:"label"},{label:"Andrew Davis",image:"AndrewD",type:"label"},{label:"Srinivas Manapragada",image:"Srinivas",type:"label"},{label:"Osip Lisitsa",image:"Osip",type:"label"},{label:"Kevin Streeter",image:"KevinS",type:"label"},{label:"Simon Tsai",image:"",type:"label"},{label:"Asa Whillock",image:"Asa",type:"label"},{label:"Andrew Barnert",image:"andrewB",type:"label"},{label:"Glenn Eguchi ",image:"glennE",type:"label"},{label:"Mohit Srivastava ",image:"mohitS",type:"label"},{label:"Paarijaat Aditya",image:"paarijaat",type:"label"},{label:"Pankaj Yadav",image:"pankaj",type:"label"},{label:"Puneet Ahuja",image:"puneetA",type:"label"},{label:"Wes McCullough",image:"WesM",type:"label"},{label:"Russ Anson",image:"russellA",type:"label"},{label:"Neeraj Goel",image:"",type:"label"},{label:"Rudhir Gupta",image:"",type:"label"},{label:"Rohit Nambiar",image:"",type:"label"},{label:"Mohammed Pithapurwala",image:"",type:"label"},{label:" ",image:"",type:"space"},{label:"Quality Engineering",image:"groupQE",type:"title"},{label:"Sachin Bansal",image:"Sachin",type:"label"},{label:"Tom Neuhold-Huber",image:"Tom",type:"label"},{label:"Woojin Choi",image:"Woojin",type:"label"},{label:"Jiyoung Chang",image:"Jiyoung",type:"label"},{label:"Calise Cheung",image:"Calise",type:"label"},{label:"Kevin Lind ",image:"kevinLind",type:"label"},{label:"Brad Outlaw ",image:"bradO",type:"label"},{label:"Thirugnana Sambandam ",image:"thiruS",type:"label"},{label:"Varamamata Karna",image:"VaramamataK",type:"label"},{label:"Viraj Gokhale",image:"Viraj",type:"label"},{label:"Bhavani Kottangada",image:"Bhavani",type:"label"},{label:"Rudresh Chari ",image:"Rudresh",type:"label"},{label:"Vijayananda Reddy ",image:"VijayanandaR",type:"label"},{label:"Janaki Lakshmikanthan ",image:"JanakiL",type:"label"},{label:"Moinullah Ansari ",image:"moinullahA",type:"label"},{label:"Vijay Kumar Das ",image:"vijayK",type:"label"},{label:"Nikhil Pavan Kalyan ",image:"nikkilPK",type:"label"},{label:"Yogesh Chavan",image:"YogeshC",type:"label"},{label:"Amarendra Edpuganti",image:"AmarendraE",type:"label"},{label:"Dipti Kaushikkar",image:"diptiK",type:"label"},{label:"Lakshmi Ganesh",image:"",type:"label"},{label:"Scott Morgan",image:"ScottMorgan",type:"label"},{label:" ",image:"",type:"space"},{label:"Senior Management",image:"",type:"title"},{label:"Bill Hensler",image:"",type:"label"},{label:"Jim Guerard",image:"",type:"label"},{label:"Niraj Gupta",image:"nirajG",type:"label"},{label:"Pritham Shetty",image:"Pritham",type:"label"},{label:"Bob Wulff",image:"",type:"label"},{label:" ",image:"",type:"space"},{label:"Product Management",image:"",type:"title"},{label:"Kevin Towes",image:"kevTowes",type:"label"},{label:" ",image:"",type:"space"},{label:"Program Management",image:"",type:"title"},{label:"Janice Pearce",image:"Janice",type:"label"},{label:"Namit Agrawal",image:"NamitA",type:"label"},{label:" ",image:"",type:"space"},{label:"Daniel Chay",image:"danielChay",type:"label"},{label:"Patrick Simon",image:"patrickSimon",type:"label"},{label:"Sarge Sargent",image:"sarge",type:"label"},{label:"Swathi Chitteddi",image:"",type:"label"},{label:"Darren McNally",image:"darrenM",type:"label"},{label:" ",image:"",type:"space"},{label:"Public Relations",image:"",type:"title"},{label:"Sandra Nakama",image:"SandraN",type:"label"},{label:" ",image:"",type:"space"},{label:"Product Marketing",image:"",type:"title"},{label:"Desiree Motamedi",image:"desireeM",type:"label"},{label:"Jessica Fewless",image:"jessicaF",type:"label"},{label:" ",image:"",type:"space"},{label:"Legal",image:"",type:"title"},{label:"Amanda Keith",image:"",type:"label"},{label:"Bill Mitchell",image:"",type:"label"},{label:"Curtis Arnold",image:"",type:"label"},{label:"Melinda Zuech",image:"",type:"label"},{label:" ",image:"",type:"space"},{label:"Operations",image:"",type:"title"},{label:"Scott Perry",image:"",type:"label"},{label:" ",image:"",type:"space"},{label:"Corporate Marketing",image:"",type:"title"},{label:"Craig Goodman",image:"",type:"label"},{label:"Stefan Gruenwedel",image:"",type:"label"},{label:"Fawn Szeto",image:"",type:"label"},{label:" ",image:"",type:"space"},{label:"Documentation",image:"",type:"title"},{label:"Suzanne Smith",image:"Suzanne",type:"label"},{label:"Jody Bleyle",image:"JodyBleyle",type:"label"},{label:"Shimi Rahim",image:"ShimulR",type:"label"},{label:"Eric Vera",image:"erikV",type:"label"}]);
   }
   function storeList(data)
   {
      var _loc4_ = 0;
      var _loc5_ = 0;
      this._names = new Object();
      this._names[0] = new Object();
      var _loc3_ = 0;
      while(_loc3_ < data.length)
      {
         var _loc2_ = data[_loc3_];
         if(_loc2_.image != undefined && _loc2_.image != "")
         {
            this._images.push(_loc2_.image);
            this._imageNames.push(_loc2_.label);
         }
         if(_loc2_.type == "space")
         {
            this._numPeople[_loc4_] = _loc5_;
            _loc4_ = _loc4_ + 1;
            this._names[_loc4_] = new Object();
            _loc5_ = 0;
         }
         else if(_loc2_.type != "picture")
         {
            _loc5_;
            this._names[_loc4_][_loc5_++] = _loc2_.label;
         }
         _loc3_ = _loc3_ + 1;
      }
      this._totalDepts = _loc4_;
      this._numPeople[_loc4_] = _loc5_;
      clearInterval(this._timer1);
      this._timer1 = setInterval(this.drawImage,1000 / this._callsPerSec,this);
      this.scrollText(this);
   }
   function onClick(data)
   {
      var _loc4_ = data.target;
      var _loc3_ = _loc4_.getImage();
      var _loc2_ = this.attachMovie(_loc3_,_loc3_ + "_",31);
      _loc2_.setSize(162,122);
      _loc2_._x = this.gutter;
      _loc2_._y = 60;
   }
   function drawImage(o)
   {
      if(o._curImgCount > o._callsPerSec * 0.5 && o._curImgCount < o._callsPerSec * 2)
      {
         o._curImgCount = o._curImgCount + 1;
         return undefined;
      }
      var _loc7_ = undefined;
      if(o._curImgCount >= o._callsPerSec * 2)
      {
         o._curImgIndex = ++o._curImgIndex % o._images.length;
         o._curImgCount = 0;
         o._firstDrawImage = false;
         if(o._nameLabel)
         {
            o._nameLabel.removeMovieClip();
            o._nameLabel = null;
         }
         if(o._prevLabel)
         {
            o._prevLabel.removeMovieClip();
            o._prevLabel = null;
         }
      }
      if(o._curImgIndex > 0)
      {
         o._prevImg = o._images[o._curImgIndex - 1];
         _loc7_ = o._imageNames[o._curImgIndex - 1];
      }
      else if(o._firstDrawImage == true)
      {
         o._prevImg = o._images[o._curImgIndex];
         _loc7_ = o._imageNames[o._curImgIndex];
      }
      else
      {
         o._prevImg = o._images[o._images.length - 1];
         _loc7_ = o._imageNames[o._images.length - 1];
      }
      o._curImg = o._images[o._curImgIndex];
      var _loc11_ = o._imageNames[o._curImgIndex % o._images.length];
      o._curImgCount = o._curImgCount + 1;
      var _loc2_ = o.attachMovie(o._curImg,o._curImg + "_",32);
      var _loc4_ = o.attachMovie(o._prevImg,o._prevImg + "_",31);
      var _loc3_ = o.attachMovie("captionStrip","captionStrip_",33);
      var _loc5_ = o.attachMovie("inset","inset_",34);
      var _loc6_ = o.attachMovie("mask","mask1_",35);
      var _loc10_ = o.attachMovie("mask","mask2_",36);
      var _loc9_ = o.attachMovie("mask","mask3_",37);
      var _loc8_ = o.attachMovie("mask","mask4_",38);
      _loc6_._x = o.gutter;
      _loc6_._y = o.labelStartYPos;
      _loc6_.setSize(162,122);
      _loc10_._x = o.gutter;
      _loc10_._y = o.labelStartYPos;
      _loc10_.setSize(162,122);
      _loc9_._x = o.gutter;
      _loc9_._y = o.labelStartYPos;
      _loc9_.setSize(162,122);
      _loc8_._x = o.gutter;
      _loc8_._y = o.labelStartYPos;
      _loc8_.setSize(162,122);
      _loc2_.setMask(_loc6_);
      _loc4_.setMask(_loc10_);
      _loc5_.setMask(_loc9_);
      _loc3_.setMask(_loc8_);
      o._nameLabel = o.attachMovie("Label","_" + _loc11_,40);
      o._nameLabel.setSize(162,o.labelHeight);
      o._nameLabel.text = _loc11_.toUpperCase();
      o._nameLabel.setEmbedFonts(true);
      o._nameLabel.setFormat("color",16777215);
      o._nameLabel.setFormat("font","ArialNarrowFont");
      o._nameLabel.setFormat("size",12);
      o._nameLabel.setFormat("bold",true);
      o._nameLabel._x = 23;
      o._nameLabel._y = o.labelStartYPos + _loc2_._height - _loc3_._height + 2;
      o._prevLabel = o.attachMovie("Label","_" + _loc7_,39);
      o._prevLabel.setSize(162,o.labelHeight);
      o._prevLabel.text = _loc7_.toUpperCase();
      o._prevLabel.setEmbedFonts(true);
      o._prevLabel.setFormat("color",16777215);
      o._prevLabel.setFormat("font","ArialNarrowFont");
      o._prevLabel.setFormat("size",12);
      o._prevLabel.setFormat("bold",true);
      o._prevLabel._x = 23;
      o._prevLabel._y = o.labelStartYPos + _loc2_._height - _loc3_._height + 2;
      if(o._curImgCount <= o._callsPerSec * 0.5)
      {
         _loc2_._alpha = o._curImgCount * 100 / (o._callsPerSec * 0.5);
         _loc4_._alpha = (o._callsPerSec * 0.5 - o._curImgCount) * 100 / (o._callsPerSec * 0.5);
         _loc3_._alpha = o._curImgCount * 100 / (o._callsPerSec * 0.5);
         _loc5_._alpha = o._curImgCount * 100 / (o._callsPerSec * 0.5);
         o._nameLabel.setAlpha(o._curImgCount * 100 / (o._callsPerSec * 0.5));
         o._prevLabel.setAlpha((o._callsPerSec * 0.5 - o._curImgCount) * 100 / (o._callsPerSec * 0.5));
      }
      else
      {
         _loc2_._alpha = 100;
         _loc4_._alpha = 0;
         _loc3_._alpha = 100;
         _loc5_._alpha = 100;
         o._nameLabel.setAlpha(100);
         o._prevLabel.setAlpha(0);
      }
      _loc2_.setSize(162,122);
      _loc2_._x = o.gutter;
      _loc2_._y = o.labelStartYPos;
      _loc4_.setSize(162,122);
      _loc4_._x = o.gutter;
      _loc4_._y = o.labelStartYPos;
      _loc3_._x = o.gutter;
      _loc3_._y = o.labelStartYPos + _loc2_._height - _loc3_._height;
      _loc5_._x = o.gutter;
      _loc5_._y = o.labelStartYPos;
   }
   function scrollText(o)
   {
      this.attachMovie("TextArea","scrollingText",6);
      var _loc2_ = new TextFormat();
      _loc2_.font = "Verdana";
      _loc2_.size = 11;
      this.scrollingText.__text.setTextFormat(_loc2_);
      this.scrollingText._x = this.xPos - 8;
      this.scrollingText._y = this.yPos - 8;
      this.scrollingText.setSize(280,224);
      this.scrollingText.html = true;
      this.scrollingText.selectable = false;
      this.scrollingText.multiline = true;
      this.scrollingText.wordWrap = true;
      this.scrollingText.text += "<font face=\"Verdana\" size=\"9\">Copyright © 1993-2009 Adobe Systems Incorporated and its licensors. All Rights Reserved.<br /><br />Adobe, the Adobe logo, and Flash are either registered trademarks or trademarks of Adobe Systems Incorporated in the United States and/or other countries. Protected by U.S. patents 7,246,356; 7,272,658; 7,287,256. Patents Pending in the U.S. and/or other countries.<br /><br />&lt;Adobeip# 0000609&gt;<br /><br />Third Party notices, terms and conditions pertaining to third party software can be found at http://www.adobe.com/go/thirdparty and are incorporated by reference herein.<br /><br /></font>";
      this.scrollingText.text += this.namesToHTML(o);
      this.scrollingText.background = 13031910;
      this.scrollingText.border = 13031910;
   }
   function namesToHTML(o)
   {
      var _loc4_ = "";
      var _loc2_ = 0;
      while(_loc2_ <= o._totalDepts)
      {
         var _loc3_ = o._names[_loc2_];
         _loc4_ += "<font face=\"Verdana\" size=\"10\"><b>" + _loc3_[0] + "</b></font><br />";
         var _loc1_ = 1;
         while(_loc1_ < o._numPeople[_loc2_])
         {
            _loc4_ += "<font face=\"Verdana\" size=\"9\">" + _loc3_[_loc1_] + "</font><br />";
            _loc1_ = _loc1_ + 1;
         }
         _loc4_ += "<br />";
         _loc2_ = _loc2_ + 1;
      }
      return _loc4_;
   }
   function drawText(o)
   {
      var _loc5_ = o._numPeople[o._curDept];
      o._deptVisibleTime = _loc5_ <= 6 ? (_loc5_ <= 3 ? 2 : 4) : 5;
      if(o._curTextCount > o._callsPerSec * 1 && o._curTextCount < o._callsPerSec * (o._deptVisibleTime - 1))
      {
         o._curTextCount += 1;
         return undefined;
      }
      o._curTextCount += 1;
      o.xPos = o.labelStartXPos;
      o.yPos = o.labelStartYPos - 4;
      if(o._curTextCount > o._callsPerSec * o._deptVisibleTime)
      {
         o._curTextCount = 0;
         var _loc4_ = 0;
         while(_loc4_ < o._numPeople[o._curDept])
         {
            o._labels[_loc4_].removeMovieClip();
            o._labels[_loc4_] = null;
            _loc4_ = _loc4_ + 1;
         }
         o._curDept = (o._curDept + 1) % o._totalDepts;
      }
      _loc5_ = o._numPeople[o._curDept];
      o._deptVisibleTime = _loc5_ <= 6 ? (_loc5_ <= 3 ? 2 : 4) : 5;
      var _loc6_ = 10;
      o._labels = new Array();
      var _loc3_ = 0;
      while(_loc3_ < _loc5_)
      {
         _loc6_;
         var _loc2_ = o.attachMovie("Label","l" + _loc3_,_loc6_++);
         _loc2_.setSize(o.labelWidth,o.labelHeight);
         _loc2_.text = o._names[o._curDept][_loc3_];
         _loc2_.setFormat("color",3355443);
         _loc2_.setEmbedFonts(true);
         _loc2_.setFormat("font","VerdanaFont");
         _loc2_.setFormat("size",10);
         if(_loc3_ == 0)
         {
            _loc2_.setSize(o.labelWidth * 1.4,o.labelHeight * 1.2);
            _loc2_.setFormat("font","VerdanaFontBold");
            _loc2_.setFormat("bold",true);
            _loc2_.setFormat("size",11);
         }
         if(o._curTextCount < o._callsPerSec * 1)
         {
            _loc2_.setAlpha(Math.floor(o._curTextCount * (100 / o._callsPerSec) * 1));
         }
         else if(o._curTextCount > o._callsPerSec * (o._deptVisibleTime - 1) && o._curTextCount <= o._callsPerSec * o._deptVisibleTime)
         {
            _loc2_.setAlpha(100 - Math.floor((o._curTextCount / o._callsPerSec - (o._deptVisibleTime - 1)) * 100));
         }
         else
         {
            _loc2_.setAlpha(100);
         }
         _loc2_._x = o.xPos;
         _loc2_._y = o.yPos;
         o.yPos += _loc3_ != 0 ? o.labelHeight : o.labelHeight * 1.2;
         if(o.yPos >= o.labelStartYPos + 112)
         {
            o.yPos = o.labelStartYPos + 10;
            o.xPos = o.xPos + o.labelWidth + o.colSpace;
         }
         o._labels[_loc3_] = _loc2_;
         _loc3_ = _loc3_ + 1;
      }
   }
   function onClose()
   {
      clearInterval(this._timer1);
      this.closeForm();
   }
   function onKillDialog()
   {
      this.onClose();
   }
}
