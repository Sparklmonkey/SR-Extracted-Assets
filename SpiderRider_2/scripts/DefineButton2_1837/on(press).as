on(press){
   if(helpWordIndx < helpWordArr.length - helpWordIndx)
   {
      if(helpWordIndx > helpWordArr.length - 30)
      {
         helpWordIndx = helpWordArr.length - helpWordIndx;
      }
      else
      {
         helpWordIndx = helpWordIndx + 30;
      }
      refreshWord();
   }
}
