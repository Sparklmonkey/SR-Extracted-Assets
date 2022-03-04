gilsTxt.text = root.playerStats.gils;
merchantCard = new Array("502","503","504","505","506","507","508");
txtMerchant.text = txtMerchantS.text = root.getInsName("txtMerchant",root.parseKitVisual);
txtCardPers.text = root.getInsName("txtMerch2T",root.parseKitVisual);
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
