on(press){
   if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
   {
      if(BattleSystem.CurrentMode == BattleSystem.MODE_CARD)
      {
         if(!BattleSystem.DragLocked)
         {
            BattleSystem.IsDraging = true;
            BattleSystem.HasMouseReleased = false;
            BattleSystem.DragedDice = this;
            BattleSystem.DragedDice.fromX = _X;
            BattleSystem.DragedDice.fromY = _Y;
            BattleSystem.DragedDice.swapDepths(++BattleSystem.nextDepth);
            BattleSystem.DragedDice.startDrag();
         }
      }
   }
}
