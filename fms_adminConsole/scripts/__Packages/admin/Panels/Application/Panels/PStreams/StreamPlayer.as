class admin.Panels.Application.Panels.PStreams.StreamPlayer extends UI.core.events
{
   function StreamPlayer()
   {
      super();
      this.videoBlanket = this.createEmptyMovieClip("StreamPlayer_Video",0);
      this.attachMovie("StreamPlayer_Video","videoSpace",1);
      this.attachMovie("StreamPlayer_ControlBar","cb",2);
      this.videoBlanket.onPress = function()
      {
      };
      this.videoBlanket.useHandCursor = false;
      this.videoBlanket.tabEnabled = false;
      this.videoBlanket._focusrect = false;
      this.videoBlanket._visible = true;
      this.cb._x = 10;
      this.cb.owner = this;
      var o = this;
      this.cb.onChange = function(i)
      {
         o.onSeek(i);
      };
      this.blockFocus();
      this.showAspect = true;
      this.pFlag = false;
   }
   function onSeek(i)
   {
      this.pFlag = true;
      this.ns.seek(i);
   }
   function connect(nc)
   {
      this.ns = new NetStream(nc);
      var o = this;
      this.ns.onStatus = function(info)
      {
         o.handleStatus(info);
      };
      this.videoSpace.video.attachVideo(this.ns);
      if(this.cb.muteState == "Mute")
      {
         this.ns.receiveAudio(false);
      }
      else
      {
         this.videoSpace.video.attachAudio(this.ns);
         this.ns.receiveAudio(true);
      }
   }
   function onProg(ct)
   {
      ct.cb.seek = ct.ns.time;
   }
   function set length(len)
   {
      this.__pb = true;
      this.__len = len;
      this.cb.showSeek(true);
      this.cb.length = len;
      this.progInt = setInterval(this.onProg,100,this);
   }
   function play(str)
   {
      clearInterval(this.progInt);
      this.__pb = false;
      this.cb.showSeek(false);
      this.__lastStream = str;
      this.ns.play.apply(this.ns,arguments);
      this.stopFlag = false;
   }
   function muteDown()
   {
      switch(this.cb.muteState)
      {
         case "Vol":
            this.videoSpace.video.attachAudio(null);
            this.ns.receiveAudio(false);
            this.cb.muteState = "Mute";
            break;
         case "Mute":
            this.pFlag = true;
            this.videoSpace.video.attachAudio(this.ns);
            this.ns.receiveAudio(true);
            this.cb.muteState = "Vol";
      }
   }
   function playDown()
   {
      switch(this.cb.playState)
      {
         case "Pause":
            this.ns.pause(true);
            this.isPaused = true;
            this.cb.playState = "Play";
            break;
         case "Play":
            if(this.isPaused == true)
            {
               this.ns.pause(false);
               this.isPaused = false;
               this.cb.playState = "Pause";
            }
            else
            {
               this.play(this.__lastStream);
               if(this.__len)
               {
                  this.__set__length(this.__len);
               }
            }
      }
   }
   function stopDown()
   {
      this.ns.close();
      this.cb.playState = "Play";
      this.isPaused = false;
      this.stopFlag = false;
      clearInterval(this.progInt);
      this.cb.seek = 0;
   }
   function handleStatus(info)
   {
      switch(info.code)
      {
         case "NetStream.Play.Start":
            if(this.pFlag == false)
            {
               if(this.showAspect == true)
               {
                  this.showAspect = false;
                  this.onEnterFrame = function()
                  {
                     if(this.videoSpace.video.width != 0 && this.videoSpace.video.height != 0)
                     {
                        delete this.onEnterFrame;
                        this.dispatchEvent("onGetAspect",{target:this,width:this.videoSpace.video.width,height:this.videoSpace.video.height});
                     }
                  };
               }
               this.cb.playState = "Pause";
            }
            else
            {
               this.pFlag = false;
            }
            break;
         case "NetStream.Play.Stop":
            this.stopFlag = true;
            break;
         case "NetStream.Buffer.Empty":
            if(this.stopFlag == true)
            {
               this.cb.playState = "Play";
               this.isPaused = false;
               this.stopFlag = false;
               clearInterval(this.progInt);
               this.cb.seek = 0;
            }
      }
   }
   function setSize(w, h)
   {
      this.videoBlanket.clear();
      this.videoSpace.clear();
      this.drawRect(this.videoBlanket,0,0,w,h,0,100);
      this.drawRect(this.videoSpace,0,0,w,h,0,100);
      this.videoSpace.video._width = w;
      this.videoSpace.video._height = h;
      this.cb.setSize(w - 20);
      this.cb._y = h - 45;
   }
}
