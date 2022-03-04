barW = 158;
tBytes = target.getBytesTotal();
this.onEnterFrame = function()
{
   bLoaded = target.getBytesLoaded();
   ratio = bLoaded / tBytes;
   if(bLoaded < tBytes)
   {
      lBar._width = ratio * barW;
   }
   else
   {
      delete this.onEnterFrame;
      gotoAndStop("outro");
      play();
   }
};
txtLoading1 = root.getInsName("txtLoading1",root.parseKitVisual);
txtLoading2 = root.getInsName("txtLoading2",root.parseKitVisual);
txtLoading3 = root.getInsName("txtLoading3",root.parseKitVisual);
txtLoading4 = root.getInsName("txtLoading4",root.parseKitVisual);
msgArray = new Array(txtLoading1,txtLoading2,txtLoading3,txtLoading4);
indx = random(msgArray.length);
info.msgTxt.text = msgArray[indx];
stop();
