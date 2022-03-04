root.sfx.gotoAndPlay("textBox");
loadTxt(page);
if(root.playerStats.mission > 1)
{
   textBox.text = "To continue your mission, you must force open the door.";
}
protectBtn.useHandCursor = false;
stop();
