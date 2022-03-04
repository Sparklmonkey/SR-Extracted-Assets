if(root.so.data.user != undefined)
{
   user_txt.text = root.so.data.user;
   pass_txt.text = root.so.data.pass;
}
user_txt.onChanged = function()
{
   user_txt.text = root.formatString(user_txt.text);
};
pass_txt.onChanged = function()
{
   pass_txt.text = root.formatString(pass_txt.text);
};
Selection.setFocus("user_txt");
stop();
