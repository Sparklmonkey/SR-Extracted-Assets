onClipEvent(load){
   _visible = false;
   if(game.eventAccess == "true")
   {
      fct = function()
      {
         game.unregisterWalkZone(this);
         game.char.char.gotoAndStop("pickUp");
         _visible = false;
         game.flagInv = game.flagInv + 1;
         game.addObject("flag");
      };
      if(root.crntEvent.id == 10)
      {
         if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
         {
            randApp = random(100);
            if(randApp < game.randFlagSet)
            {
               _visible = true;
               game.registerWalkZone(this);
            }
         }
      }
   }
}
