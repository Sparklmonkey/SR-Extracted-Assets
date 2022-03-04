on(release, releaseOutside){
   anim.gotoAndStop("RELEASED");
   popTutorial = function()
   {
      if(root.playerStats.mission <= 3)
      {
         if(root.inWorld != true)
         {
            BattleSystem.Tutorial.gotoAndPlay("attack");
         }
         clearInterval(intTutorial);
      }
   };
   if(BattleSystem.IsFirstBattle)
   {
      if(root.inWorld != true)
      {
         BattleSystem.Tutorial.gotoAndPlay("dice");
      }
   }
   else
   {
      intTutorial = setInterval(popTutorial,15000);
   }
   BattleSystem.CallbackButtonDice();
}
