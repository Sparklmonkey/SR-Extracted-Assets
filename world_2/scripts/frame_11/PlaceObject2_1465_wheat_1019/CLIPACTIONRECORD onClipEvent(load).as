onClipEvent(load){
   _visible = false;
   if(game.eventAccess == "true")
   {
      fct = function()
      {
         game.unregisterWalkZone(this);
         game.char.char.gotoAndStop("pickUp");
         _visible = false;
         game.wheatInv = game.wheatInv + 1;
         game.addObject("wheat");
      };
      if(root.crntEvent.id == 7)
      {
         if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
         {
            randApp = random(100);
            if(randApp < game.randWheatSet)
            {
               _visible = true;
               game.registerWalkZone(this);
            }
         }
      }
   }
}
