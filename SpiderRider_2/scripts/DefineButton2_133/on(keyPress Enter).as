on(keyPress "<Enter>"){
   if(!(user_txt.text == "" || pass_txt.text == ""))
   {
      root.showTextSheet = true;
      root.sfx.gotoAndPlay("clic1");
      root.tryLogin(user_txt.text,pass_txt.text);
   }
}
