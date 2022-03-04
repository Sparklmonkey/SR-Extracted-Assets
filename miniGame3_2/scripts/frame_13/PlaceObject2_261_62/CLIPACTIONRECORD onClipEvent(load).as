onClipEvent(load){
   if(mg3.secondPlyr)
   {
      _name = "player";
      mg3.setWave(mg3.waveArr[0]);
      mg3.playerNameBox.name_txt.text = mg3.playerDesc[1].n;
   }
   else
   {
      _name = "friend";
      mg3.friendNameBox.name_txt.text = mg3.playerDesc[0].n;
   }
}
