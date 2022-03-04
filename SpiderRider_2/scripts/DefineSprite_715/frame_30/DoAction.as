gilsTxt.text = root.playerStats.gils;
merchantCard = new Array("200","201","202","203","207");
txtCraftman.text = txtCraftmanS.text = root.getInsName("txtCraftman",root.parseKitVisual);
txtCardPers.text = root.getInsName("txtCraftmanT",root.parseKitVisual);
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
