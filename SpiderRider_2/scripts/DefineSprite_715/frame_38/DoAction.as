gilsTxt.text = root.playerStats.gils;
merchantCard = new Array("107","108","109","300","301","302","303","304","418","420","421");
txtTeacher.text = txtTeacherS.text = root.getInsName("txtTeacher",root.parseKitVisual);
txtCardPers.text = root.getInsName("txtTeacherT",root.parseKitVisual);
txtYour = root.getInsName("txtYour",root.parseKitVisual);
txtPage = root.getInsName("txtPage",root.parseKitVisual);
card0.gilsTxt.text = card1.gilsTxt.text = card2.gilsTxt.text = card3.gilsTxt.text = "";
pageNb = 1;
maxPages = 2;
frameCall = 10;
this.onEnterFrame = function()
{
   if(frameCall > 0)
   {
      frameCall--;
   }
   else
   {
      delete this.onEnterFrame;
      delete frameCall;
      showCard();
   }
};
