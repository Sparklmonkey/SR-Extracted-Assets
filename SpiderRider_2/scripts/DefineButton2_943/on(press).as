on(press){
   if(question.myText.text != "")
   {
      root.questionAnswer(question._currentframe,question.myText.text);
      question.myText.text = "";
      root.sfx.gotoAndPlay("clic");
      play();
   }
   else
   {
      root.sfx.gotoAndPlay("errorBeep");
   }
}
