user_txt.tabIndex = 1;
pass_txt.tabIndex = 1;
confirmPass_txt.tabIndex = 1;
user_txt.onChanged = function()
{
   user_txt.text = root.formatString(user_txt.text);
};
pass_txt.onChanged = function()
{
   pass_txt.text = root.formatString(pass_txt.text);
};
confirmPass_txt.onChanged = function()
{
   confirmPass_txt.text = root.formatString(confirmPass_txt.text);
};
stop();
