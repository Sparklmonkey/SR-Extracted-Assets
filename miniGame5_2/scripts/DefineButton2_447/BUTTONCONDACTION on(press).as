on(press){
   if(root.sVol.getVolume() == 0)
   {
      root.sVol.setVolume(100);
   }
   else
   {
      root.sVol.setVolume(0);
   }
}
