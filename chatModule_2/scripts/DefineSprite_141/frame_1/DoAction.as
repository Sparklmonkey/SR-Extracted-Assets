stop();
_global.chat = this;
allDictionnaries = new Array("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","SYMBOL");
if(dictByA[0] == undefined)
{
   i = 0;
   while(i < allDictionnaries.length)
   {
      this["dictBy" + allDictionnaries[i]] = new Array();
      i++;
   }
}
