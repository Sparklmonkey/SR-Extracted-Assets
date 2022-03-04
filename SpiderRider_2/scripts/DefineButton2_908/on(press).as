on(press){
   if(question.select != 0)
   {
      root.questionAnswer(question._currentframe,question.select);
      question.select = 0;
      play();
      root.sfx.gotoAndPlay("clic");
      question.select = 0;
   }
   else
   {
      root.sfx.gotoAndPlay("errorBeep");
   }
}
