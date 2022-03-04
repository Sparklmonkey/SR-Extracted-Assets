onClipEvent(load){
   fct = function(cPlayer)
   {
      cPlayer.mcBlocker = mg2.hitUnder;
      cPlayer.swapDepths(mg2.getNewDepth("spider"));
   };
}
