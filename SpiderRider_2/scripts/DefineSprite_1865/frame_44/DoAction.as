txtEvents.text = root.getInsName("btnEvents",root.parseKitSheets);
txtMentor.text = root.getInsName("txtMentor",root.parseKitSheets);
txtGuild = root.getInsName("txtGuild",root.parseKitSheets);
txtPos.text = root.getInsName("txtPos",root.parseKitSheets);
txtAvPts.text = root.getInsName("txtAvPts",root.parseKitSheets);
txtHigh.text = root.getInsName("txtHigh",root.parseKitSheets);
txtReward.text = root.getInsName("txtReward",root.parseKitSheets);
txtEvEnd.text = root.getInsName("txtEvEnd",root.parseKitSheets);
if(root.crntEvent != undefined && root.crntEvent != "")
{
   stateTxt.text = root.crntEvent.state;
   eventTitle.text = root.getInsName("ev" + root.crntEvent.id + "_title",root.parseKitMEvents);
   eventDesc.text = root.getInsName("ev" + root.crntEvent.id + "_desc",root.parseKitMEvents);
   rewardTxt.text = root.getInsName("ev" + root.crntEvent.id + "_reward",root.parseKitMEvents);
   if(root.crntEvent.state != "result" && root.crntEvent.state != "done")
   {
      endTxt.text = root.getInsName("nextWednesday",root.parseKitEvents);
   }
   else
   {
      endTxt.text = root.getInsName("noEvent",root.parseKitEvents);
   }
}
else
{
   eventTitle.text = rewardTxt.text = endTxt.text = "";
   eventDesc.text = root.getInsName("nameNoEvent",root.parseKitMEvents);
}
if(guild == 1)
{
   guildName1.text = guildName2.text = "HUNTER";
}
else if(guild == 2)
{
   guildName1.text = guildName2.text = "PRINCE LUMEN";
}
else if(guild == 3)
{
   guildName1.text = guildName2.text = "IGNEOUS";
}
else if(guild == 4)
{
   guildName1.text = guildName2.text = "MAGMA";
}
pointsTxt.text = posTxt.text = score0.text = score1.text = score2.text = score3.text = score4.text = "";
root.scoreGuild = guild;
root.returnGuildsLeader();
