on(press){
   mg5.PAUSE = true;
   clearInterval(mg5.bossInt);
   clearInterval(mg5.intID);
   Mouse.show();
   Mouse.removeListener(mg5.mouseListener);
   root.mGameQuitWindow.drawWindow(mg5);
}
