stop();
_parent.IsReady = true;
switch(_parent.Type)
{
   case 1:
      _parent.gotoAndStop("RED");
      break;
   case 2:
      _parent.gotoAndStop("BLUE");
      break;
   case 4:
      _parent.gotoAndStop("YELLOW");
      break;
   case 3:
      _parent.gotoAndStop("GREEN");
      break;
   case 5:
      _parent.gotoAndStop("WHITE");
}
