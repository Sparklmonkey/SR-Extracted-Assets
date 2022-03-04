onClipEvent(load){
   _visible = false;
   if(game.eventAccess == "true")
   {
      fct = function()
      {
         game.unregisterWalkZone(this);
         game.char.char.gotoAndStop("pickUp");
         _visible = false;
         game.logInv = game.logInv + 1;
         game.addObject("wood");
      };
      if(root.crntEvent.id == 1)
      {
         if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
         {
            randApp = random(100);
            if(randApp < game.randWoodSet)
            {
               _visible = true;
               game.registerWalkZone(this);
            }
         }
      }
   }
}
