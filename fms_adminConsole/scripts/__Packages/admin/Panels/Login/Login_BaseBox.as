class admin.Panels.Login.Login_BaseBox extends UI.core.movieclip
{
   function Login_BaseBox()
   {
      super();
      this.attachMovie("Login_BFill","base",0);
      this.createEmptyMovieClip("iconSpace",1);
      this.base._x = 629;
      this.iconSpace.attachMovie("Login_g1","g1",0);
      this.iconSpace.attachMovie("Login_g2","g2",1);
      this.iconSpace.attachMovie("Login_g3","g3",2);
      this.addControl("Label","l1",3,{autoSize:"left",_x:433,_y:39,text:"Tour"});
      this.l1.setFormat("bold",true);
      this.addControl("Label","l2",4,{autoSize:"left",_x:433 + this.l1.width + 2,_y:39,text:"- Check out feature highlights for"});
      this.l2.setFormat("color",6710886);
      this.addControl("Label","l3",5,{autoSize:"left",_x:453,_y:55,text:"Flash Media Interactive Server 3.5"});
      this.l3.setFormat("color",2971251);
      this.l3.link = "http://www.adobe.com/products/flashmediainteractive/features";
      this.addControl("Label","l4",6,{autoSize:"left",_x:433,_y:92,text:"Application Developers"});
      this.l4.setFormat("bold",true);
      this.addControl("Label","l5",7,{autoSize:"left",_x:433 + this.l4.width + 2,_y:92,text:"- Create, test, and"});
      this.l5.setFormat("color",6710886);
      this.addControl("Label","l6",8,{autoSize:"left",_x:433,_y:103,text:"   debug Flash Media Server Applications"});
      this.l6.setFormat("color",6710886);
      this.addControl("Label","l7",9,{autoSize:"left",_x:453,_y:121,text:"Developing Media Applications"});
      this.l7.setFormat("color",2971251);
      this.l7.link = "http://www.adobe.com/go/flashmediaserver_devguide";
      this.addControl("Label","l8",10,{autoSize:"left",_x:453,_y:137,text:"Client-Side Media ActionScript Language Reference"});
      this.l8.setFormat("color",2971251);
      this.l8.link = "http://www.adobe.com/go/flashmediaserver_as3reference";
      this.addControl("Label","l9",11,{autoSize:"left",_x:453,_y:153,text:"Server-Side Media ActionScript Language Reference"});
      this.l9.setFormat("color",2971251);
      this.l9.link = "http://www.adobe.com/go/flashmediaserver_ss_asreference";
      this.addControl("Label","l10",12,{autoSize:"left",_x:433,_y:186,text:"Administrators"});
      this.l10.setFormat("bold",true);
      this.addControl("Label","l11",13,{autoSize:"left",_x:433 + this.l10.width + 2,_y:186,text:"- Manage the server, users,"});
      this.l11.setFormat("color",6710886);
      this.addControl("Label","l12",14,{autoSize:"left",_x:433,_y:197,text:"   security, and applications"});
      this.l12.setFormat("color",6710886);
      this.addControl("Label","l13",15,{autoSize:"left",_x:453,_y:215,text:"Managing Flash Media Server"});
      this.l13.setFormat("color",2971251);
      this.l13.link = "http://www.adobe.com/go/flashmediaserver_config";
      this.addControl("Label","l14",16,{autoSize:"left",_x:453,_y:231,text:"Server Management ActionScript Language Reference"});
      this.l14.setFormat("color",2971251);
      this.l14.link = "http://www.adobe.com/go/flashmediaserver_adminapi";
      this.addControl("Label","l15",17,{autoSize:"left",_x:453,_y:70,text:"Flash Media Streaming Server 3.5"});
      this.l15.setFormat("color",2971251);
      this.l15.link = "http://www.adobe.com/products/flashmediastreaming/features";
      this.addControl("Label","l16",18,{autoSize:"right",_x:860,_y:269,text:""});
      this.l16.text = "v" + admin.consoleVersion.getConsoleVersion();
      this.l16.setFormat("color",2971251);
      this.l16.setFormat("size",9);
      this.iconSpace._x = 371;
      this.iconSpace.g1._y = 41;
      this.iconSpace.g2._y = 103;
      this.iconSpace.g3._y = 195;
   }
   function setSize(width, height)
   {
      this.base._visible = width > 629;
      this.base._width = width - 629;
      this.base._height = height;
      this.l16._x = width - 42;
   }
}
