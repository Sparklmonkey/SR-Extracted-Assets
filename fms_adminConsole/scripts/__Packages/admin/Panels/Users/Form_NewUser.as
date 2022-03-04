class admin.Panels.Users.Form_NewUser extends UI.core.Form
{
   function Form_NewUser()
   {
      super();
      this.addControl("Label","l1",0,{text:"New User",width:100,height:20,_x:20,_y:10});
      this.l1.setFormat("bold",true);
      this.l1.setFormat("size",14);
      this.addControl("Label","l2",1,{text:"Enter information for the new user below.",width:250,height:20,_y:33,_x:20});
      this.addControl("Label","l3",2,{text:"Username:",width:200,height:16,_y:60,_x:20});
      this.addControl("Label","l4",3,{text:"Password:",width:200,height:16,_y:85,_x:20});
      this.addControl("Label","l5",4,{text:"Confirm password:",width:200,height:16,_y:110,_x:20});
      this.addControl("TextInput","t1",6,{width:180,height:20,_x:135,_y:60});
      this.addControl("TextInput","t2",7,{width:180,height:20,_x:135,_y:85});
      this.addControl("TextInput","t3",8,{width:180,height:20,_x:135,_y:110});
      this.t2.password = true;
      this.t3.password = true;
      this.addControl("Button","b1",10,{label:"Save",width:50,height:24,_x:95,_y:150});
      this.addControl("Button","b2",11,{label:"Save and Add Another",width:140,height:24,_x:150,_y:150});
      this.addControl("Button","b3",12,{label:"Cancel",width:70,height:24,_x:295,_y:150});
      this.b1.addListener("click",this.onSave,this);
      this.b2.addListener("click",this.onSaveAnother,this);
      this.b3.addListener("click",this.closeForm,this);
      var _loc4_ = "f" + _global.uniqueID();
      _global.tabs.registerContext(_loc4_);
      _global.tabs.registerTab(_loc4_,this.t1,0);
      _global.tabs.registerTab(_loc4_,this.t2,1);
      _global.tabs.registerTab(_loc4_,this.t3,2);
      _global.tabs.registerTab(_loc4_,this.b1,3);
      _global.tabs.registerTab(_loc4_,this.b2,4);
      _global.tabs.registerTab(_loc4_,this.b3,5);
      _global.tabs.setOrder(_loc4_);
   }
   function onSave()
   {
      this.save(true);
   }
   function onSaveAnother()
   {
      this.save(false);
   }
   function save(closeWhenDone)
   {
      if(this.t2.text != this.t3.text)
      {
         this.onError("Your passwords do not match");
         return undefined;
      }
      if(this.t1.text == "")
      {
         this.onError("You must enter a username in the username field");
         return undefined;
      }
      if(this.t2.text == "")
      {
         this.onError("You cannot have an empty password");
         return undefined;
      }
      this.owner.addUser(this.t1.text,this.t2.text);
      if(closeWhenDone)
      {
         this.closeForm();
      }
      else
      {
         this.t1.text = "";
         this.t2.text = "";
         this.t3.text = "";
      }
   }
   function onActivate()
   {
   }
}
