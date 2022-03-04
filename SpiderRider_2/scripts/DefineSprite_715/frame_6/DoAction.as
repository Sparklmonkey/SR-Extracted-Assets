gilsTxt.text = root.playerStats.gils;
merchantCard = new Array("400","401","402","403","404","405","406","407","408","417");
txtYour = root.getInsName("txtYour",root.parseKitVisual);
txtPage = root.getInsName("txtPage",root.parseKitVisual);
txtMerchant.text = txtMerchantS.text = root.getInsName("txtMerchant",root.parseKitVisual);
txtCardPers.text = root.getInsName("txtMerch1T",root.parseKitVisual);
card0.gilsTxt.text = card1.gilsTxt.text = card2.gilsTxt.text = card3.gilsTxt.text = "";
pageNb = 1;
maxPages = 3;
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
