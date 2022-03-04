onClipEvent(load){
   _visible = false;
   if(game.eventAccess == "true")
   {
      nbr_stones = _totalframes;
      no_stone = random(nbr_stones) + 1;
      this.gotoAndStop(no_stone);
      fct = function()
      {
         game.unregisterWalkZone(this);
         game.char.char.gotoAndStop("pickUp");
         _visible = false;
         tmpStone = eval("game.stone" + no_stone + "Inv");
         tmpStone++;
         set("game.stone" + no_stone + "Inv",tmpStone);
         game.addObject("stone" + no_stone);
      };
      if(root.crntEvent.id == 4)
      {
         if(root.crntEvent.state == "collect" || root.crntEvent.state == "sprint")
         {
            randApp = random(100);
            trace(randApp);
            if(randApp < game.randStoneSet)
            {
               _visible = true;
               game.registerWalkZone(this);
            }
         }
      }
   }
}
