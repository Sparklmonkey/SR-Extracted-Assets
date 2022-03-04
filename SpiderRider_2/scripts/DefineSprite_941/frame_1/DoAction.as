function clearSelection()
{
   var i = 1;
   while(i < 7)
   {
      checkBox = eval("check" + i);
      checkBox.gotoAndStop(1);
      i++;
   }
}
function selectChoice(nbr)
{
   checkBox = eval("check" + nbr);
   checkBox.gotoAndStop(2);
   select = nbr;
}
stop();
select = 0;
