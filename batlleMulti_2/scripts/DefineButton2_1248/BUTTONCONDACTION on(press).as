on(press){
   if(BattleSystem.CurrentPlayer == BattleSystem.TURN_OPPONENT)
   {
      return undefined;
   }
   BattleSystem.IsDraging = true;
   BattleSystem.HasMouseReleased = false;
   BattleSystem.DragedCard = _parent;
   BattleSystem.DragedCard.swapDepths(++BattleSystem.nextDepth);
   BattleSystem.DragedCard.startDrag();
}
