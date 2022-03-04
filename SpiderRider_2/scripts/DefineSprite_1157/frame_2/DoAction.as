txtCamp.text = root.getInsName("txtCamp",root.parseKitSheets);
crntDate = new Date();
crntDay = crntDate.getDate();
crntMonth = crntDate.getMonth() + 1;
crntYear = crntDate.getFullYear();
btnCamp1C = new Color(btnCamp1);
btnCamp2C = new Color(btnCamp2);
btnCamp3C = new Color(btnCamp3);
darker = {ra:"50",rb:"0",ga:"50",gb:"0",ba:"50",bb:"0",aa:"100",ab:"0"};
if(root.bonusDate[0][2] >= crntYear)
{
   if(root.bonusDate[0][1] >= crntMonth)
   {
      if(root.bonusDate[0][1] == crntMonth)
      {
         if(root.bonusDate[0][0] > crntDay)
         {
            btnCamp1C.setTransform(darker);
            btnCamp1.enabled = false;
         }
      }
      else
      {
         btnCamp1C.setTransform(darker);
         btnCamp1.enabled = false;
      }
   }
}
if(root.bonusDate[1][2] >= crntYear)
{
   if(root.bonusDate[1][1] >= crntMonth)
   {
      if(root.bonusDate[1][1] == crntMonth)
      {
         if(root.bonusDate[1][0] > crntDay)
         {
            btnCamp2C.setTransform(darker);
            btnCamp2.enabled = false;
         }
      }
      else
      {
         btnCamp2C.setTransform(darker);
         btnCamp2.enabled = false;
      }
   }
}
if(root.bonusDate[2][2] >= crntYear)
{
   if(root.bonusDate[2][1] >= crntMonth)
   {
      if(root.bonusDate[2][1] == crntMonth)
      {
         if(root.bonusDate[2][0] > crntDay)
         {
            btnCamp3C.setTransform(darker);
            btnCamp3.enabled = false;
         }
      }
      else
      {
         btnCamp3C.setTransform(darker);
         btnCamp3.enabled = false;
      }
   }
}
stop();
