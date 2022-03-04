onClipEvent(load){
   if(root.playerStats.guild == 0)
   {
      _visible = false;
   }
   else
   {
      gotoAndStop(root.playerStats.guild);
   }
}
