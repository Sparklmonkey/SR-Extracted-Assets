class UI.controls.UIScrollBar.ScrollBarThumb extends MovieClip
{
   function ScrollBarThumb()
   {
      super();
      this.attachMovie("ScrollBar_Thumb_Head","piece1",0);
      this.attachMovie("ScrollBar_Thumb_Body","piece2",2);
      this.attachMovie("ScrollBar_Thumb_Base","piece3",3);
      this.attachMovie("ScrollBar_Thumb_Bars","piece4",4);
      this.piece2._y = this.piece1._height;
      this.piece4._x = 3;
   }
   function setState(i)
   {
      this.piece1.gotoAndStop(i);
      this.piece2.gotoAndStop(i);
      this.piece3.gotoAndStop(i);
      this.piece4.gotoAndStop(i);
   }
   function setSize(size)
   {
      this.piece2._height = size - (this.piece1._height + this.piece3._height);
      this.piece3._y = this.piece2._y + this.piece2._height;
      this.piece4._y = this.piece2._height / 2 - this.piece4._height / 2 + this.piece1._height;
   }
}
