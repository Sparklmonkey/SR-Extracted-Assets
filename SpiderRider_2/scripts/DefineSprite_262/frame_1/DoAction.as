stop();
switch(_parent.ID)
{
   case 1:
      forLength = 3;
      break;
   case 2:
      forLength = 3;
      break;
   case 3:
      forLength = 3;
      break;
   case 4:
      forLength = 4;
      break;
   case 5:
      forLength = 3;
      break;
   case 6:
      forLength = 3;
      break;
}
i = 1;
while(i <= forLength)
{
   this["output" + i] = root.getInsName("txtInst" + _parent.ID + "_" + i,root.parseKitVisual);
   i++;
}
