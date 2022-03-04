class admin.Panels.Users.Form_ResetPassword extends UI.core.Form
{
   function Form_ResetPassword()
   {
      super();
      this.addControl("Label","l1",0,{text:"Enter and confirm the new password:",width:300,height:16,_x:20,_y:10});
      this.addControl("Label","l2",1,{text:"New Password: ",width:200,height:16,_y:39,_x:20});
      this.addControl("Label","l3",2,{text:"Confirm Password:",width:200,height:16,_y:63,_x:20});
      this.addControl("TextInput","t1",3,{width:180,height:20,_x:135,_y:39});
      this.addControl("TextInput","t2",4,{width:180,height:20,_x:135,_y:63});
      this.t1.password = true;
      this.t2.password = true;
      this.addControl("Button","b1",5,{label:"Reset Password",width:120,height:24,_x:115,_y:96});
      this.addControl("Button","b2",6,{label:"Cancel",width:70,height:24,_x:245,_y:96});
      this.b1.addListener("click",this.onReset,this);
      this.b2.addListener("click",this.closeForm,this);
      var _loc4_ = "f" + _global.uniqueID();
      _global.tabs.registerContext(_loc4_);
      _global.tabs.registerTab(_loc4_,this.t1,0);
      _global.tabs.registerTab(_loc4_,this.t2,1);
      _global.tabs.registerTab(_loc4_,this.b1,2);
      _global.tabs.registerTab(_loc4_,this.b2,3);
      _global.tabs.setOrder(_loc4_);
   }
   function onReset()
   {
      if(this.t1.text != this.t2.text)
      {
         this.onError("Your passwords do not match");
         return undefined;
      }
      this.owner.updatePassword(this.t1.text);
      this.closeForm();
   }
   function onActivate()
   {
   }
}
