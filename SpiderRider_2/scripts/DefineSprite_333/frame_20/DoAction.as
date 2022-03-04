if(this.resultsArr[0].Name == root.playerStats.Name)
{
   root.setTopTen(this.resultsArr[0].Pts,this.gameID);
}
else
{
   root.setTopTen(this.resultsArr[1].Pts,this.gameID);
}
root.sfx.gotoAndPlay("textBox");
if(this.resultsArr[0].winner != "disconnect")
{
   P1Win.word = !this.resultsArr[0].winner?"":root.getInsName("txtWin",root.parseKitVisual);
}
else
{
   P1Win.word = root.getInsName("txtDiscon",root.parseKitVisual);
}
P1Name.text = this.resultsArr[0].Name;
P1Pts.text = this.resultsArr[0].Pts;
P1Misc.text = this.resultsArr[0].Misc;
if(this.resultsArr.length > 1)
{
   if(this.resultsArr[1].winner != "disconnect")
   {
      P2Win.word = !this.resultsArr[1].winner?"":root.getInsName("txtWin",root.parseKitVisual);
   }
   else
   {
      P2Win.word = root.getInsName("txtDiscon",root.parseKitVisual);
   }
   P2Name.text = this.resultsArr[1].Name;
   P2Pts.text = this.resultsArr[1].Pts;
   P2Misc.text = this.resultsArr[1].Misc;
}
else
{
   P2Win._visible = false;
   P2Name.text = P2Pts.text = P2Misc.text = "";
}
stop();
