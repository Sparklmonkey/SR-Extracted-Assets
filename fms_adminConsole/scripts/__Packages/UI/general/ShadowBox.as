class UI.general.ShadowBox extends UI.core.movieclip
{
   var __fill = 16777215;
   var __alpha = 20;
   function ShadowBox()
   {
      super();
      this.createEmptyMovieClip("space1",0);
      this.createEmptyMovieClip("space2",1);
      this.createEmptyMovieClip("space3",2);
      this.createEmptyMovieClip("space4",3);
      this.createEmptyMovieClip("space5",4);
      this.space1.attachMovie("SB_1","p1",0);
      this.space1.attachMovie("SB_2","p2",1);
      this.space1.attachMovie("SB_3","p3",2);
      this.space1.attachMovie("SB_4","p4",3);
      this.space1.attachMovie("SB_5","p5",4);
      this.space1.attachMovie("SB_6","p6",5);
      this.space1.attachMovie("SB_7","p7",6);
      this.space1.p3._y = this.space1.p1._height;
      this.space1.p4._y = this.space1.p2._height;
      this.space1.p6._x = this.space1.p5._width;
      this.space1._alpha = 20;
      this.space4.attachMovie("SB_S1","p1",0);
      this.space4.attachMovie("SB_S2","p2",1);
      this.space4.attachMovie("SB_S3","p3",2);
      this.space4.p1._y = this.space4.p2._y = this.space4.p3._y = 2;
      this.space4.p1._x = 5;
      this.space4.p2._x = 5 + this.space4.p1._width;
      this.space5.attachMovie("SB_O1","p1",0);
      this.space5.attachMovie("SB_O2","p2",1);
      this.space5.attachMovie("SB_O3","p3",2);
      this.space5.attachMovie("SB_O4","p4",3);
      this.space5.attachMovie("SB_O4","p5",4);
      this.space5.attachMovie("SB_O5","p6",5);
      this.space5.attachMovie("SB_O6","p7",6);
      this.space5.attachMovie("SB_O7","p8",7);
      this.space5.p1._y = this.space5.p2._y = this.space5.p3._y = 2;
      this.space5.p1._x = 4;
      this.space5.p2._x = 4 + this.space5.p1._width;
      this.space5.p4._y = this.space5.p5._y = this.space5.p1._y + this.space5.p1._height;
      this.space5.p4._x = 4;
      this.space5.p6._x = 4;
      this.space5.p7._x = this.space5.p6._x + this.space5.p6._width;
      this.space4._alpha = 70;
   }
   function set height(h)
   {
      this.setSize(this.__width,h);
   }
   function set width(w)
   {
      this.setSize(w,this.__height);
   }
   function setSize(width, height)
   {
      this.__width = width;
      this.__height = height;
      this.space1.p2._x = width - this.space1.p2._width;
      this.space1.p3._height = height - (this.space1.p1._height + this.space1.p5._height);
      this.space1.p4._x = width - this.space1.p4._width;
      this.space1.p4._height = height - (this.space1.p2._height + this.space1.p7._height);
      this.space1.p5._y = height - this.space1.p5._height;
      this.space1.p6._width = width - (this.space1.p5._width + this.space1.p7._width);
      this.space1.p6._y = height - this.space1.p6._height;
      this.space1.p7._x = width - this.space1.p7._width;
      this.space1.p7._y = height - this.space1.p7._height;
      this.space2.clear();
      this.drawRect(this.space2,3.5,1,width - 7.3,height - 5,this.__fill,this.__alpha,6);
      this.space4.p2._width = width - (10 + this.space4.p1._width + this.space4.p3._width);
      this.space4.p3._x = width - (this.space4.p3._width + 5);
      this.space5.p2._width = width - (this.space5.p1._width + this.space5.p3._width + 8);
      this.space5.p3._x = width - (4 + this.space5.p3._width);
      this.space5.p4._height = this.space5.p5._height = height - (this.space5.p1._height + this.space5.p6._height + 6);
      this.space5.p5._x = width - (4 + this.space5.p4._width);
      this.space5.p6._y = this.space5.p8._y = height - this.space5.p6._height - 4;
      this.space5.p7._y = height - this.space5.p7._height - 4;
      this.space5.p7._width = width - (8 + this.space5.p6._width + this.space5.p8._width);
      this.space5.p8._x = width - (4 + this.space5.p8._width);
   }
}
