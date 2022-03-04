onClipEvent(load){
   fct = function(cPlayer)
   {
      cPlayer.mcBlocker = mg2.hitOver;
      cPlayer.swapDepths(mg2.getNewDepth("spiderOver"));
   };
}
