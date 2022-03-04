onClipEvent(load){
   missionTxt = root.getInsName("nameArachna",root.parseKitMEvents);
   trace(root.crntEvent.state);
   §§push(function endFct()
   {
      game.play();
      root.nextFrame();
   });
   if(root.crntEvent.state != "result" && root.crntEvent.state != "done")
   {
      switch(root.crntEvent.id)
      {
         case 1:
            eventTxt = root.getInsName("nameEvent1",root.parseKitMEvents);
            goalTxt = root.getInsName("nameGoal1",root.parseKitMEvents);
            break;
         case 2:
            eventTxt = root.getInsName("nameEvent2",root.parseKitMEvents);
            goalTxt = root.getInsName("nameGoal2",root.parseKitMEvents);
            break;
         case 3:
            eventTxt = root.getInsName("nameEvent3",root.parseKitMEvents);
            goalTxt = root.getInsName("nameGoal3",root.parseKitMEvents);
            break;
         case 4:
            eventTxt = root.getInsName("nameEvent4",root.parseKitMEvents);
            goalTxt = root.getInsName("nameGoal4",root.parseKitMEvents);
            break;
         case 5:
            eventTxt = root.getInsName("nameEvent5",root.parseKitMEvents);
            goalTxt = root.getInsName("nameGoal5",root.parseKitMEvents);
            break;
         case 6:
            eventTxt = root.getInsName("nameEvent6",root.parseKitMEvents);
            goalTxt = root.getInsName("nameGoal6",root.parseKitMEvents);
            break;
         case 7:
            eventTxt = root.getInsName("nameEvent7",root.parseKitMEvents);
            goalTxt = root.getInsName("nameGoal7",root.parseKitMEvents);
            break;
         case 8:
            eventTxt = root.getInsName("nameEvent8",root.parseKitMEvents);
            goalTxt = root.getInsName("nameGoal8",root.parseKitMEvents);
            break;
         case 9:
            eventTxt = root.getInsName("nameEvent9",root.parseKitMEvents);
            goalTxt = root.getInsName("nameGoal9",root.parseKitMEvents);
            break;
         case 10:
            eventTxt = root.getInsName("nameEvent10",root.parseKitMEvents);
            goalTxt = root.getInsName("nameGoal10",root.parseKitMEvents);
            break;
         case 11:
            eventTxt = root.getInsName("nameEvent11",root.parseKitMEvents);
            goalTxt = root.getInsName("nameGoal11",root.parseKitMEvents);
            break;
         case 12:
            eventTxt = root.getInsName("nameEvent12",root.parseKitMEvents);
            goalTxt = root.getInsName("nameGoal12",root.parseKitMEvents);
            break;
         default:
            eventTxt = root.getInsName("nameEvent13",root.parseKitMEvents);
            goalTxt = root.getInsName("nameGoal13",root.parseKitMEvents);
      }
   }
   else
   {
      goalTxt = "";
      eventTxt = root.getInsName("nextEventDate",root.parseKitEvents);
   }
}
