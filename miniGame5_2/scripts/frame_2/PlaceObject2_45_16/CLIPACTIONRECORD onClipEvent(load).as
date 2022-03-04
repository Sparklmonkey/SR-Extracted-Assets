onClipEvent(load){
   score = 75;
   health = 2;
   hit = 0;
   damage = 2;
   succes = false;
   onStage = false;
   ammoType = "bullet";
   _visible = false;
   fct = function()
   {
      if(!onStage)
      {
         onStage = true;
         stopChar = function()
         {
            if(speed == - mg5.bkgSpeed)
            {
               speed = 0;
            }
            else
            {
               speed = - mg5.bkgSpeed;
            }
         };
         intID = setInterval(stopChar,1000);
      }
   };
}
