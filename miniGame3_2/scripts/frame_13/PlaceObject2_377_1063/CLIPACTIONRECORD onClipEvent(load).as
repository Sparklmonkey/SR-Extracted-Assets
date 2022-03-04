onClipEvent(load){
   if(mg3.firstPlyr)
   {
      _name = "playerNameBox";
      name_txt.text = mg3.playerDesc[0].n;
   }
   else
   {
      name_txt.text = mg3.playerDesc[0].n;
      _name = "friendNameBox";
   }
}
