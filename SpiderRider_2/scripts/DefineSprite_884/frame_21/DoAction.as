root.sfx.gotoAndPlay("textBox");
loadTxt(page);
if(ico > 0)
{
   nameTxt1.text = charIco.iconPerso.nameText;
   nameTxt2.text = nameTxt1.text;
}
else
{
   nameTxt1.text = "";
   nameTxt2.text = nameTxt1.text;
}
stop();
