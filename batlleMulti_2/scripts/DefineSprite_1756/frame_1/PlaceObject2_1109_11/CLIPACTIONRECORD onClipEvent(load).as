onClipEvent(load){
   function reset()
   {
      varTimeIncr = 0;
      meter._xscale = 100;
   }
   function update()
   {
      varTimeIncr++;
      totalSec = BattleSystem.MAX_WAITING_TIME / 1000;
      varPrct = Math.floor(varTimeIncr / totalSec * 100);
      meter._xscale = 100 - varPrct;
      if(varTimeIncr >= totalSec)
      {
         this.gotoAndPlay("end");
         reset();
         BattleSystem.CallbackButtonAction();
      }
   }
   varTimeIncr = 0;
}
