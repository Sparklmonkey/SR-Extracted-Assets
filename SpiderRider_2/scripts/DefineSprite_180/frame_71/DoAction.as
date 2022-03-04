root.upPanel.endFct = function()
{
   root.gotoAndPlay("charSheet");
};
root.upPanel.gotoAndPlay("close");
root.downPanel.gotoAndPlay("close");
if(root.mustUpgradeDeck == true && root.playerStats.card.length > 0)
{
   root.upgradeDeck();
   delete root.mustUpgradeDeck;
}
root.checkReward();
stop();
