onClipEvent(load){
   if(_parent.msg == undefined)
   {
      _visible = false;
   }
   else
   {
      msgTxt.text = _parent.msg;
   }
}
