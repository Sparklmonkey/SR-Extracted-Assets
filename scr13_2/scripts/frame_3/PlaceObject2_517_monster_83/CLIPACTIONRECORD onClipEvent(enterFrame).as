onClipEvent(enterFrame){
   if(game.rightarm == 1)
   {
      this.char.char.rightForearm.gotoAndStop(2);
      this.char.char.rightarm.gotoAndStop(2);
      this.char.char.rightShoulder.gotoAndStop(2);
   }
   if(game.leftarm == 1)
   {
      this.char.char.leftForearm.gotoAndStop(2);
      this.char.char.leftarm.gotoAndStop(2);
      this.char.char.leftShoulder.gotoAndStop(2);
   }
   if(game.core == 1)
   {
      this.char.char.body.gotoAndStop(2);
      this.char.char.pelvis.gotoAndStop(2);
      this.char.char.tail.gotoAndStop(2);
   }
}
