Mouse.addListener(mouseListener);
Mouse.hide();
charColor = new Color(char);
flashChar = function()
{
   if(charColor.getTransform().ra == 100)
   {
      charColor.setTransform(flash);
   }
   else
   {
      charColor.setTransform(restore);
   }
};
this.onEnterFrame = function()
{
   if(!PAUSE)
   {
      runMG();
      runLVL();
      if(sentBoss)
      {
         runBoss();
      }
   }
};
stop();
