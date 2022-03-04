onClipEvent(load){
   this.onPress = function()
   {
      if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
      {
         var _loc1_ = BattleSystem.card_txt.text.split(" ").join("");
         root.Trace("str : " + _loc1_);
         _loc1_ = _loc1_.split(",").join("~0~0~0,");
         root.Trace("str2 : " + _loc1_);
         BattleSystem.updateDeckFGSO(true,null,_loc1_,null,false);
      }
   };
}
