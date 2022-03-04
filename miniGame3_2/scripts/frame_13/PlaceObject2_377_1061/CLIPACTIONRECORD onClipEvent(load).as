onClipEvent(load){
   if(mg3.secondPlyr)
   {
      _name = "playerNameBox";
      name_txt.text = mg3.playerDesc[1].n;
   }
   else
   {
      _name = "friendNameBox";
      name_txt.text = mg3.playerDesc[1].n;
   }
}
