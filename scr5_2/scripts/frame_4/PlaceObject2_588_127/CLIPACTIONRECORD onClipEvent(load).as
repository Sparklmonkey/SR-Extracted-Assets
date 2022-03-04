onClipEvent(load){
   _visible = false;
   fct = function()
   {
      game.balsam = 1;
      game.itemContainer.balsam3._visible = false;
      game.addObject("balsam");
      game.char.char.gotoAndStop("pickUp");
      game.unregisterWalkZone(this);
   };
   if(game.purpleFlower == 2 && game.womanbag == 2 && game.balsam < 1)
   {
      game.registerWalkZone(this);
   }
}
