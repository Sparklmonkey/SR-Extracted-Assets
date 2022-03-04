attachMovie("admin.stage","admin_stage",0);
if(this == _level0)
{
   Stage.align = "TL";
   Stage.scaleMode = "noscale";
   Stage.addListener(this);
   Stage.showMenu = false;
   this.onResize = function()
   {
      admin_stage.setSize(Stage.width,Stage.height);
   };
   admin_stage.setSize(Stage.width,Stage.height);
}
else
{
   this.setSize = function(p_w, p_h)
   {
      admin_stage.setSize(p_w,p_h);
   };
}
