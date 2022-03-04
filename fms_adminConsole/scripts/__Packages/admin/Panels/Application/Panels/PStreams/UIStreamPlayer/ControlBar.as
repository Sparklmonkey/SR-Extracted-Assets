class admin.Panels.Application.Panels.PStreams.UIStreamPlayer.ControlBar extends UI.core.movieclip
{
   var __playState = "Play";
   var __muteState = "Vol";
   function ControlBar()
   {
      super();
      this.attachMovie("StreamPlayer_S1","p1",0);
      this.attachMovie("StreamPlayer_S2","p2",1);
      this.attachMovie("StreamPlayer_S3","p3",2);
      this.p2._x = this.p1._width;
      this.attachMovie("StreamPlayer_b1","playBtn",3);
      this.playBtn._x = this.playBtn._y = 8;
      this.attachMovie("StreamPlayer_b2","stopBtn",4);
      this.stopBtn._x = 57;
      this.stopBtn._y = 8;
      this.attachMovie("StreamPlayer_b3","muteBtn",5);
      this.muteBtn._y = 8;
      this.attachMovie("StreamPlayer_SeekBar","seekBar",6);
      this.seekBar._x = 85;
      this.seekBar._y = 15;
      var o = this;
      this.playBtn.onRollOver = function()
      {
         o.playOver = true;
         o.playBtn.gotoAndStop(o.__playState + " Over");
      };
      this.playBtn.onRollOut = function()
      {
         o.playOver = false;
         o.playBtn.gotoAndStop(o.__playState);
      };
      this.playBtn.onReleaseOutside = function()
      {
         o.playOver = false;
         o.playBtn.gotoAndStop(o.__playState);
      };
      this.playBtn.onRelease = function()
      {
         o.playBtn.gotoAndStop(o.__playState + " Over");
      };
      this.playBtn.onPress = function()
      {
         o.playBtn.gotoAndStop(o.__playState + " Down");
         o.owner.playDown();
      };
      this.stopBtn.onRollOver = function()
      {
         this.gotoAndStop("Stop Over");
      };
      this.stopBtn.onRollOut = function()
      {
         this.gotoAndStop("Stop");
      };
      this.stopBtn.onReleaseOutside = function()
      {
         this.gotoAndStop("Stop");
      };
      this.stopBtn.onRelease = function()
      {
         this.gotoAndStop("Stop Over");
      };
      this.stopBtn.onPress = function()
      {
         this.gotoAndStop("Stop Down");
         o.owner.stopDown();
      };
      this.muteBtn.onRollOver = function()
      {
         o.muteOver = true;
         this.gotoAndStop(o.__muteState + " Over");
      };
      this.muteBtn.onRollOut = function()
      {
         o.muteOver = false;
         this.gotoAndStop(o.__muteState);
      };
      this.muteBtn.onRelease = function()
      {
         o.muteOver = true;
         this.gotoAndStop(o.__muteState + " Over");
      };
      this.muteBtn.onReleaseOutside = function()
      {
         o.muteOver = false;
         this.gotoAndStop(o.__muteState);
      };
      this.muteBtn.onPress = function()
      {
         this.gotoAndStop(o.__muteState + " Down");
         o.owner.muteDown();
      };
      this.stopBtn.useHandCursor = false;
      this.stopBtn._focusrect = false;
      this.playBtn.useHandCursor = false;
      this.playBtn._focusrect = false;
      this.playBtn.tabEnabled = false;
      this.stopBtn.tabEnabled = false;
      this.muteBtn.tabEnabled = false;
      this.muteBtn._focusrect = false;
      this.muteBtn.useHandCursor = false;
   }
   function set seek(n)
   {
      this.seekBar.position = n;
   }
   function set length(n)
   {
      this.seekBar.max = n;
   }
   function showSeek(b)
   {
      this.seekBar._visible = b;
   }
   function set onChange(f)
   {
      this.seekBar.onChange = f;
   }
   function set muteState(s)
   {
      this.__muteState = s;
      if(this.muteOver == true)
      {
         this.muteBtn.gotoAndStop(s + " Over");
      }
      else
      {
         this.muteBtn.gotoAndStop(s);
      }
   }
   function get muteState()
   {
      return this.__muteState;
   }
   function set playState(s)
   {
      this.__playState = s;
      if(this.playOver == true)
      {
         this.playBtn.gotoAndStop(s + " Over");
      }
      else
      {
         this.playBtn.gotoAndStop(s);
      }
   }
   function get playState()
   {
      return this.__playState;
   }
   function setSize(w, h)
   {
      this.p3._x = w - this.p3._width;
      this.p2._width = w - (this.p3._width + this.p1._width);
      this.muteBtn._x = w - 35;
      this.seekBar.setSize(w - 127);
   }
}
