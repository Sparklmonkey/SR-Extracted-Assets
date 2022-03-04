on(press){
   root.googleAnalytic("javascript:urchinTracker(\'/register\');");
   root.sfx.gotoAndPlay("clic1");
   if(confirmPass_txt.text == pass_txt.text && pass_txt.text != "")
   {
      if(root.testBadWord(user_txt.text))
      {
         eraseUserFct = function()
         {
            user_txt.text = "";
         };
         root.textWindow.drawWindow(["-SORRY-\nTHIS USERNAME IS PROHIBITED!"],eraseUserFct);
      }
      else
      {
         root.subscribeUser(user_txt.text,pass_txt.text,age);
      }
   }
   else
   {
      root.textWindow.drawWindow(["-SORRY-\nCONFIRM YOUR PASSWORD CORRECTLY!"],null);
   }
}
