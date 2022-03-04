txtMiniGTitle.text = root.getInsName("txtMiniGTitle",root.parseKitVisual);
txtStatus.text = root.getInsName("txtStatus",root.parseKitVisual);
txtNames.text = root.getInsName("txtNames",root.parseKitVisual);
txtPts.text = root.getInsName("txtPts",root.parseKitVisual);
switch(this.gameID)
{
   case 1:
      clipTitle.gotoAndStop(this.gameID);
      clipTitle.txtMiniG1S.text = _loc0_ = root.getInsName("txtMiniG1",root.parseKitVisual);
      clipTitle.txtMiniG1.text = _loc0_;
      break;
   case 2:
      clipTitle.gotoAndStop(this.gameID);
      clipTitle.txtMiniG2S.text = _loc0_ = root.getInsName("txtMiniG2",root.parseKitVisual);
      clipTitle.txtMiniG2.text = _loc0_;
      break;
   case 3:
      clipTitle.gotoAndStop(this.gameID);
      clipTitle.txtMiniG3S.text = _loc0_ = root.getInsName("txtMiniG3",root.parseKitVisual);
      clipTitle.txtMiniG3.text = _loc0_;
      break;
   case 4:
      clipTitle.gotoAndStop(this.gameID);
      clipTitle.txtMiniG4S.text = _loc0_ = root.getInsName("txtMiniG4",root.parseKitVisual);
      clipTitle.txtMiniG4.text = _loc0_;
      break;
   case 5:
      clipTitle.gotoAndStop(this.gameID);
      clipTitle.txtMiniG5S.text = _loc0_ = root.getInsName("txtMiniG5",root.parseKitVisual);
      clipTitle.txtMiniG5.text = _loc0_;
      break;
   case 6:
      clipTitle.gotoAndStop(this.gameID);
      clipTitle.txtMiniG6S.text = _loc0_ = root.getInsName("txtMiniG6",root.parseKitVisual);
      clipTitle.txtMiniG6.text = _loc0_;
      break;
   case 7:
      clipTitle.gotoAndStop(this.gameID);
      clipTitle.txtMiniG7S.text = _loc0_ = root.getInsName("txtMiniG7",root.parseKitVisual);
      clipTitle.txtMiniG7.text = _loc0_;
      break;
   default:
      clipTitle.txtMiniG1s.text = _loc0_ = root.getInsName("txtError",root.parseKitVisual);
      clipTitle.txtMiniG1.text = _loc0_;
}
