onClipEvent(load){
   _visible = false;
   trace("game.eventAccess = " + game.eventAccess);
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
      trace("root.crntEvent.id = " + root.crntEvent.id);
      if(root.crntEvent.id == 1)
      {
         trace("root.crntEvent.state = " + root.crntEvent.state);
         if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
         {
            randApp = random(100);
            trace("randApp = " + randApp);
            trace("game.randWoodSet = " + game.randWoodSet);
            if(randApp < game.randWoodSet)
            {
               _visible = true;
               trace("_visible = " + _visible);
               game.registerWalkZone(this);
            }
         }
      }
   }
}
