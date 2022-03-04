on(press){
   root.sfx.gotoAndPlay("clic1");
   if(confirmPass_txt.text == pass_txt.text)
   {
      if(root.testBadWord(user_txt.text))
      {
         eraseUserFct = function()
         {
            user_txt.text = "";
         };
         root.textWindow.drawWindow(["..:: ERROR ::..\nTHIS USERNAME IS PROHIBITED!"],eraseUserFct);
      }
      else
      {
         root.subscribeUser(user_txt.text,pass_txt.text,age);
      }
   }
   else
   {
      root.textWindow.drawWindow(["..:: ERROR ::..\nCONFIRM YOUR PASSWORD CORRECTLY!"],null);
   }
}
