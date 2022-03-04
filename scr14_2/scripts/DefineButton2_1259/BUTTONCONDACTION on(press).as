on(press){
   root.tweenStop = true;
   root.upPanel.endFct = root.charWindow.drawWindow;
   root.askWindow.closeWindow();
   root.upPanel.gotoAndPlay("close");
   root.downPanel.gotoAndPlay("close");
}
