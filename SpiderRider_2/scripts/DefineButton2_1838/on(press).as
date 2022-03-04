on(press){
   if(helpWordIndx != 0)
   {
      if(helpWordIndx - 30 > 0)
      {
         helpWordIndx = helpWordIndx - 30;
      }
      else
      {
         helpWordIndx = 0;
      }
      refreshWord();
   }
}
