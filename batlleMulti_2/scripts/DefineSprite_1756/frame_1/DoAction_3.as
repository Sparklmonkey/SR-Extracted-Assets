function Card(ID)
{
   var _loc1_ = ID;
   if(_loc1_ >= 100 && _loc1_ < 200)
   {
      return TableCardWeapon[_loc1_ - 100];
   }
   if(_loc1_ >= 200 && _loc1_ < 300)
   {
      return TableCardProtection[_loc1_ - 200];
   }
   if(_loc1_ >= 300 && _loc1_ < 400)
   {
      return TableCardItem[_loc1_ - 300];
   }
   if(_loc1_ >= 400 && _loc1_ < 500)
   {
      return TableCardBattleAction[_loc1_ - 400];
   }
   if(_loc1_ >= 500 && _loc1_ < 600)
   {
      return TableCardBoost[_loc1_ - 500];
   }
   return null;
}
var TableRank = new Array(11);
TableRank[0] = {Name:"-",Dice:3,Defence:4,Action:0,LifePoint:10,VictoryPoint:0};
TableRank[1] = {Name:root.getInsName("rankName1",root.parseKitConnect),Dice:4,Defence:5,Action:0,LifePoint:15,VictoryPoint:200};
TableRank[2] = {Name:root.getInsName("rankName2",root.parseKitConnect),Dice:5,Defence:5,Action:0,LifePoint:20,VictoryPoint:1000};
TableRank[3] = {Name:root.getInsName("rankName3",root.parseKitConnect),Dice:5,Defence:6,Action:0,LifePoint:20,VictoryPoint:2600};
TableRank[4] = {Name:root.getInsName("rankName4",root.parseKitConnect),Dice:5,Defence:6,Action:0,LifePoint:25,VictoryPoint:4000};
TableRank[5] = {Name:root.getInsName("rankName5",root.parseKitConnect),Dice:6,Defence:6,Action:0,LifePoint:30,VictoryPoint:7000};
TableRank[6] = {Name:root.getInsName("rankName6",root.parseKitConnect),Dice:6,Defence:7,Action:0,LifePoint:30,VictoryPoint:12000};
TableRank[7] = {Name:root.getInsName("rankName7",root.parseKitConnect),Dice:7,Defence:7,Action:0,LifePoint:35,VictoryPoint:19500};
TableRank[8] = {Name:root.getInsName("rankName8",root.parseKitConnect),Dice:7,Defence:8,Action:0,LifePoint:35,VictoryPoint:30000};
TableRank[9] = {Name:root.getInsName("rankName9",root.parseKitConnect),Dice:8,Defence:8,Action:0,LifePoint:35,VictoryPoint:43500};
TableRank[10] = {Name:root.getInsName("rankName10",root.parseKitConnect),Dice:9,Defence:8,Action:0,LifePoint:40,VictoryPoint:58000};
var TableEncounterObject = new Array(4);
TableEncounterObject[0] = {Name:"Wooden Door",Dice:0,Defence:2,Action:0,LifePoint:1,VictoryPoint:4};
TableEncounterObject[1] = {Name:"Stone Door",Dice:0,Defence:3,Action:0,LifePoint:8,VictoryPoint:16};
TableEncounterObject[2] = {Name:"Status",Dice:0,Defence:4,Action:0,LifePoint:8,VictoryPoint:16};
TableEncounterObject[3] = {Name:"Forest",Dice:0,Defence:6,Action:0,LifePoint:10,VictoryPoint:20};
var TableEncounterDanger = new Array(4);
TableEncounterDanger[0] = {Name:"Falling Rocks",Dice:6,Defence:4,Action:0,LifePoint:1,VictoryPoint:8};
TableEncounterDanger[1] = {Name:"Poisonous Flower",Dice:5,Defence:2,Action:0,LifePoint:1,VictoryPoint:8};
TableEncounterDanger[2] = {Name:"Spike",Dice:12,Defence:10,Action:0,LifePoint:1,VictoryPoint:16};
TableEncounterDanger[3] = {Name:"Explosion",Dice:10,Defence:10,Action:0,LifePoint:1,VictoryPoint:0};
var TableEncounterMonster = new Array(19);
TableEncounterMonster[0] = {Name:"Cave Bat",Dice:4,Defence:2,Action:0,LifePoint:1,VictoryPoint:6};
TableEncounterMonster[1] = {Name:"BuzzBit",Dice:4,Defence:2,Action:0,LifePoint:5,VictoryPoint:15};
TableEncounterMonster[2] = {Name:"Small Nasty-Tat",Dice:5,Defence:3,Action:0,LifePoint:6,VictoryPoint:18};
TableEncounterMonster[3] = {Name:"Big Nasty-Tat",Dice:6,Defence:4,Action:0,LifePoint:7,VictoryPoint:21};
TableEncounterMonster[4] = {Name:"Chiggerwigz",Dice:8,Defence:6,Action:0,LifePoint:8,VictoryPoint:24};
TableEncounterMonster[5] = {Name:"Ice lice",Dice:9,Defence:5,Action:0,LifePoint:9,VictoryPoint:27};
TableEncounterMonster[6] = {Name:"Pinchmite",Dice:9,Defence:8,Action:0,LifePoint:9,VictoryPoint:27};
TableEncounterMonster[7] = {Name:"Chompede",Dice:11,Defence:9,Action:0,LifePoint:11,VictoryPoint:33};
TableEncounterMonster[8] = {Name:"Assisin Bee",Dice:12,Defence:6,Action:0,LifePoint:12,VictoryPoint:60};
TableEncounterMonster[9] = {Name:"PinchPounce",Dice:13,Defence:6,Action:0,LifePoint:13,VictoryPoint:39};
TableEncounterMonster[10] = {Name:"Hopfopper",Dice:13,Defence:8,Action:0,LifePoint:13,VictoryPoint:39};
TableEncounterMonster[11] = {Name:"Punch Hopper",Dice:14,Defence:8,Action:0,LifePoint:14,VictoryPoint:39};
TableEncounterMonster[12] = {Name:"Shumdigger",Dice:14,Defence:12,Action:0,LifePoint:14,VictoryPoint:42};
TableEncounterMonster[13] = {Name:"School of Weewogs",Dice:10,Defence:2,Action:0,LifePoint:15,VictoryPoint:45};
TableEncounterMonster[14] = {Name:"Clampray",Dice:15,Defence:12,Action:0,LifePoint:15,VictoryPoint:45};
TableEncounterMonster[15] = {Name:"Gasplash",Dice:16,Defence:12,Action:0,LifePoint:16,VictoryPoint:50};
TableEncounterMonster[16] = {Name:"Talonpole",Dice:17,Defence:12,Action:0,LifePoint:17,VictoryPoint:60};
TableEncounterMonster[17] = {Name:"Spined Krail",Dice:15,Defence:12,Action:0,LifePoint:16,VictoryPoint:80};
TableEncounterMonster[18] = {Name:"Sector",Dice:19,Defence:14,Action:0,LifePoint:19,VictoryPoint:100};
var TableEncounterInvectid = new Array(5);
TableEncounterInvectid[0] = {Name:"Invectid soldier",Dice:6,Defence:3,Action:0,LifePoint:7,VictoryPoint:27};
TableEncounterInvectid[1] = {Name:"Flying Invectid",Dice:11,Defence:9,Action:0,LifePoint:10,VictoryPoint:30};
TableEncounterInvectid[2] = {Name:"Invectid Commander",Dice:10,Defence:7,Action:0,LifePoint:10,VictoryPoint:50};
TableEncounterInvectid[3] = {Name:"Invectid Champion",Dice:8,Defence:8,Action:0,LifePoint:11,VictoryPoint:60};
TableEncounterInvectid[4] = {Name:"Invectid Warrior",Dice:10,Defence:9,Action:0,LifePoint:15,VictoryPoint:80};
TableEncounterInvectid[5] = {Name:"Dark Flying Invectid",Dice:10,Defence:10,Action:0,LifePoint:18,VictoryPoint:65};
TableEncounterInvectid[6] = {Name:"Invectid Trooper",Dice:8,Defence:8,Action:0,LifePoint:11,VictoryPoint:60};
TableEncounterInvectid[7] = {Name:"Stag\'s Soldier",Dice:12,Defence:14,Action:0,LifePoint:20,VictoryPoint:95};
TableEncounterInvectid[8] = {Name:"Invectid Driver",Dice:12,Defence:14,Action:0,LifePoint:20,VictoryPoint:95};
var TableEncounterSpiderRider = new Array(19);
TableEncounterSpiderRider[0] = {Name:"Corona",Dice:8,Defence:8,Action:0,LifePoint:15,VictoryPoint:100};
TableEncounterSpiderRider[1] = {Name:"Igneous",Dice:11,Defence:9,Action:0,LifePoint:16,VictoryPoint:140};
TableEncounterSpiderRider[2] = {Name:"Magma",Dice:16,Defence:10,Action:0,LifePoint:20,VictoryPoint:150};
TableEncounterSpiderRider[3] = {Name:"Prince Lumen",Dice:15,Defence:15,Action:0,LifePoint:15,VictoryPoint:140};
var TableEncounterMantisSqad = new Array(19);
TableEncounterMantisSqad[0] = {Name:"Dungobeet",Dice:8,Defence:10,Action:0,LifePoint:12,VictoryPoint:150};
TableEncounterMantisSqad[1] = {Name:"Grasshop",Dice:11,Defence:8,Action:0,LifePoint:20,VictoryPoint:180};
TableEncounterMantisSqad[2] = {Name:"Aquine",Dice:12,Defence:10,Action:0,LifePoint:20,VictoryPoint:200};
TableEncounterMantisSqad[3] = {Name:"Beerain",Dice:21,Defence:10,Action:0,LifePoint:20,VictoryPoint:200};
TableEncounterMantisSqad[4] = {Name:"Stag",Dice:22,Defence:15,Action:0,LifePoint:25,VictoryPoint:270};
TableEncounterMantisSqad[5] = {Name:"Buguese",Dice:24,Defence:20,Action:0,LifePoint:30,VictoryPoint:400};
TableEncounterMantisSqad[6] = {Name:"Grasshop\'s Monster",Dice:8,Defence:6,Action:0,LifePoint:8,VictoryPoint:25};
TableEncounterMantisSqad[7] = {Name:"Grasshop\'s Monster",Dice:8,Defence:6,Action:0,LifePoint:8,VictoryPoint:25};
TableEncounterMantisSqad[8] = {Name:"Grasshop\'s Monster",Dice:11,Defence:9,Action:0,LifePoint:11,VictoryPoint:50};
TableEncounterMantisSqad[9] = {Name:"Grasshop\'s Monster",Dice:15,Defence:12,Action:0,LifePoint:15,VictoryPoint:200};
TableEncounterMantisSqad[10] = {Name:"Grasshop\'s Monster",Dice:14,Defence:8,Action:0,LifePoint:14,VictoryPoint:150};
TableEncounterMantisSqad[11] = {Name:"Grasshop\'s Monster",Dice:11,Defence:9,Action:0,LifePoint:11,VictoryPoint:125};
TableEncounterMantisSqad[12] = {Name:"Grasshop\'s Monster",Dice:8,Defence:6,Action:0,LifePoint:8,VictoryPoint:100};
var TableCardWeapon = new Array(11);
TableCardWeapon[0] = {Name:"Bug Blade",Legend:root.getInsName("bugBladeCmmnt",root.parseKitCards),Dice:1,Defence:0,Action:0,Hand:1,Duration:0,Disarm:0};
TableCardWeapon[1] = {Name:"Arachna Needle",Legend:root.getInsName("arachnaNeedleCmmnt",root.parseKitCards),Dice:2,Defence:0,Action:0,Hand:1,Duration:0,Disarm:0};
TableCardWeapon[2] = {Name:"Light Impaler",Legend:root.getInsName("lightImpalerCmmnt",root.parseKitCards),Dice:2,Defence:0,Action:0,Hand:1,Duration:0,Defence:0,Disarm:0};
TableCardWeapon[3] = {Name:"Sting-Slinger",Legend:root.getInsName("stingslingerCmmnt",root.parseKitCards),Dice:2,Defence:0,Action:0,Hand:1,Duration:0,Disarm:0};
TableCardWeapon[4] = {Name:"Axial Pike",Legend:root.getInsName("axialPikeCmmnt",root.parseKitCards),Dice:3,Defence:0,Action:0,Hand:2,Duration:0,Disarm:0};
TableCardWeapon[5] = {Name:"Swordshot",Legend:root.getInsName("swordShotCmmnt",root.parseKitCards),Dice:3,Defence:0,Action:0,Hand:1,Duration:0,Disarm:0};
TableCardWeapon[6] = {Name:"The Kleaver",Legend:root.getInsName("theKleaverCmmnt",root.parseKitCards),Dice:4,Defence:0,Action:0,Hand:2,Duration:0,Disarm:0};
TableCardWeapon[7] = {Name:"Balistic Mace",Legend:root.getInsName("balisticMaceCmmnt",root.parseKitCards),Dice:3,Defence:0,Action:0,Hand:1,Duration:0,Disarm:1,Activate:function()
{
   root.Trace("Activate ");
   if(HasCardToDisarm(CARD_GREEN))
   {
      root.Trace("HasCardToDisarm ");
      if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
      {
         deactivationScreen.CardType = CARD_GREEN;
         deactivationScreen.Show();
      }
   }
}};
TableCardWeapon[8] = {Name:"Boom Ball Bow",Legend:root.getInsName("boomBallBowCmmnt",root.parseKitCards),Dice:3,Defence:0,Action:0,Hand:2,Duration:0,Disarm:1,Activate:function()
{
   if(HasCardToDisarm(CARD_YELLOW))
   {
      if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
      {
         deactivationScreen.CardType = CARD_YELLOW;
         deactivationScreen.Show();
      }
   }
}};
TableCardWeapon[9] = {Name:"SpiderLance",Legend:root.getInsName("spiderLanceCmmnt",root.parseKitCards),Dice:3,Defence:1,Action:0,Hand:1,Duration:0,Disarm:0};
TableCardWeapon[10] = {Name:"Oracle Spear",Legend:root.getInsName("oracleSpearCmmnt",root.parseKitCards),Dice:4,Defence:2,Action:0,Hand:1,Duration:0,Disarm:0};
var TableCardProtection = new Array(9);
TableCardProtection[0] = {Name:"Heart Shield",Legend:root.getInsName("heartShieldCmmnt",root.parseKitCards),Dice:0,Defence:1,Action:0,Hand:1,Duration:0};
TableCardProtection[1] = {Name:"Melee Shield",Legend:root.getInsName("meleeShieldCmmnt",root.parseKitCards),Dice:0,Defence:3,Action:0,Hand:1,Duration:0};
TableCardProtection[2] = {Name:"Vanguard Shield",Legend:root.getInsName("vanguardShieldCmmnt",root.parseKitCards),Dice:0,Defence:3,Action:0,Hand:1,Duration:0};
TableCardProtection[3] = {Name:"Skirmish Shield",Legend:root.getInsName("skirmishShieldCmmnt",root.parseKitCards),Dice:0,Defence:2,Action:0,Hand:1,Duration:0};
TableCardProtection[4] = {Name:"Jousting Shield",Legend:root.getInsName("joustingShieldCmmnt",root.parseKitCards),Dice:0,Defence:5,Action:0,Hand:1,Duration:0};
TableCardProtection[5] = {Name:"Assault Shield",Legend:root.getInsName("assaultShieldCmmnt",root.parseKitCards),Dice:0,Defence:6,Action:0,Hand:1,Duration:0};
TableCardProtection[6] = {Name:"Rider Scale",Legend:root.getInsName("riderScaleCmmnt",root.parseKitCards),Dice:0,Defence:6,Action:0,Hand:0,Duration:0};
TableCardProtection[7] = {Name:"Spider Armor",Legend:root.getInsName("spiderArmorCmmnt",root.parseKitCards),Dice:0,Defence:3,Action:0,Hand:0,Duration:0};
TableCardProtection[8] = {Name:"Elite Plate Armor",Legend:root.getInsName("elitePlateArmorCmmnt",root.parseKitCards),Dice:0,Defence:8,Action:0,Hand:0,Duration:0};
var TableCardItem = new Array(5);
TableCardItem[0] = {Name:"Red Manacle",Legend:root.getInsName("redManacleCmmnt",root.parseKitCards),Dice:1,Defence:0,Action:0,Hand:0,Duration:0};
TableCardItem[1] = {Name:"Blue Manacle",Legend:root.getInsName("blueManacleCmmnt",root.parseKitCards),Dice:0,Defence:4,Action:0,Hand:0,Duration:0};
TableCardItem[2] = {Name:"Yellow Manacle",Legend:root.getInsName("yellowManacleCmmnt",root.parseKitCards),Dice:0,Defence:0,Action:0,Hand:0,Duration:1,Activate:function()
{
   BattleSystem.yellowManacle = true;
   BattleSystem.addLifePoint += 5;
},Deactivate:function()
{
   BattleSystem.yellowManacle = false;
}};
TableCardItem[3] = {Name:"Spy",Legend:root.getInsName("spyCmmnt",root.parseKitCards),Dice:0,Defence:0,Action:0,Hand:0,Duration:0,Activate:function()
{
   if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.MalusOpponent += 1;
   }
   else
   {
      BattleSystem.MalusPlayer += 1;
   }
},Deactivate:function(TurnPlayer)
{
   var _loc1_ = TurnPlayer;
   if(_loc1_ == undefined)
   {
      _loc1_ = BattleSystem.CurrentPlayer;
   }
   if(_loc1_ == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.MalusOpponent -= 1;
   }
   else
   {
      BattleSystem.MalusPlayer -= 1;
   }
}};
TableCardItem[4] = {Name:"Bug Zapper",Legend:root.getInsName("bugZapperCmmnt",root.parseKitCards),Dice:1,Defence:0,Action:0,Hand:1,Duration:0};
var TableCardFusion = new Array(2);
TableCardFusion[0] = {Name:"Red Oracle key",Legend:root.getInsName("redOracleKeyCmmnt",root.parseKitCards),Dice:0,Defence:0,Action:0,Hand:0,Duration:0,FuseTypeCard:BattleSystem.CARD_WEAPON,MAX_FUSE:2};
TableCardFusion[1] = {Name:"Green Oracle key",Legend:root.getInsName("greenOracleKeyCmmnt",root.parseKitCards),Dice:0,Defence:0,Action:0,Hand:0,Duration:0,FuseTypeCard:BattleSystem.CARD_SHIELD,MAX_FUSE:2};
var TableCardBoost = new Array(10);
TableCardBoost[0] = {Name:"Bounce",Legend:root.getInsName("bounceCmmnt",root.parseKitCards),Dice:1,Defence:0,Action:0,Duration:1};
TableCardBoost[1] = {Name:"Impact",Legend:root.getInsName("impactCmmnt",root.parseKitCards),Dice:1,Defence:0,Action:0,Duration:1};
TableCardBoost[2] = {Name:"Boo!",Legend:root.getInsName("booCmmnt",root.parseKitCards),Dice:2,Defence:0,Action:0,Duration:1};
TableCardBoost[3] = {Name:"Surprise Attack",Legend:root.getInsName("surpriseAttackCmmnt",root.parseKitCards),Dice:2,Defence:0,Action:0,Duration:1};
TableCardBoost[4] = {Name:"Starburst",Legend:root.getInsName("starburstCmmnt",root.parseKitCards),Dice:2,Defence:0,Action:0,Duration:1};
TableCardBoost[5] = {Name:"Deep Freeze",Legend:root.getInsName("deepFreezeCmmnt",root.parseKitCards),Dice:3,Defence:0,Action:0,Duration:1};
TableCardBoost[6] = {Name:"Super Size",Legend:root.getInsName("superSizeCmmnt",root.parseKitCards),Dice:3,Defence:0,Action:0,Duration:1};
TableCardBoost[7] = {Name:"Poison Fang",Legend:root.getInsName("poisonFangCmmnt",root.parseKitCards),Dice:4,Defence:0,Action:0,Duration:1};
TableCardBoost[8] = {Name:"Barbecue",Legend:root.getInsName("barbecueCmmnt",root.parseKitCards),Dice:5,Defence:0,Action:0,Duration:1};
TableCardBoost[9] = {Name:"Intervention",Legend:root.getInsName("interventionCmmnt",root.parseKitCards),Dice:7,Defence:0,Action:0,Duration:1};
TableCardBoost[10] = {Name:"Warrior path",Legend:root.getInsName("warriorPathCmmnt",root.parseKitCards),Dice:8,Defence:0,Action:0,Duration:1};
TableCardBoost[11] = {Name:"Arachna power",Legend:root.getInsName("arachnaPowerCmmnt",root.parseKitCards),Dice:10,Defence:0,Action:0,Duration:1};
var TableCardBattleAction = new Array(24);
TableCardBattleAction[0] = {Name:"Fail",Legend:root.getInsName("failCmmnt",root.parseKitCards),Dice:0,Defence:0,Action:0,Duration:2,Activate:function()
{
   if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.MalusOpponent += 1;
   }
   else
   {
      BattleSystem.MalusPlayer += 1;
   }
},Deactivate:function(TurnPlayer)
{
   var _loc1_ = TurnPlayer;
   if(_loc1_ == undefined)
   {
      _loc1_ = BattleSystem.CurrentPlayer;
   }
   if(_loc1_ == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.MalusOpponent -= 1;
   }
   else
   {
      BattleSystem.MalusPlayer -= 1;
   }
}};
TableCardBattleAction[1] = {Name:"Evasion",Legend:root.getInsName("evasionCmmnt",root.parseKitCards),Dice:0,Defence:0,Action:0,Duration:2,Activate:function()
{
   if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.MalusOpponent += 2;
   }
   else
   {
      BattleSystem.MalusPlayer += 2;
   }
},Deactivate:function(TurnPlayer)
{
   var _loc1_ = TurnPlayer;
   if(_loc1_ == undefined)
   {
      _loc1_ = BattleSystem.CurrentPlayer;
   }
   if(_loc1_ == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.MalusOpponent -= 2;
   }
   else
   {
      BattleSystem.MalusPlayer -= 2;
   }
}};
TableCardBattleAction[2] = {Name:"Trap",Legend:root.getInsName("trapCmmnt",root.parseKitCards),Dice:0,Defence:0,Action:0,Hand:0,Duration:2,Activate:function()
{
   if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.MalusOpponent += 4;
   }
   else
   {
      BattleSystem.MalusPlayer += 4;
   }
},Deactivate:function(TurnPlayer)
{
   var _loc1_ = TurnPlayer;
   if(_loc1_ == undefined)
   {
      _loc1_ = BattleSystem.CurrentPlayer;
   }
   if(_loc1_ == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.MalusOpponent -= 4;
   }
   else
   {
      BattleSystem.MalusPlayer -= 4;
   }
}};
TableCardBattleAction[3] = {Name:"False Order",Legend:root.getInsName("falseOrderCmmnt",root.parseKitCards),Dice:0,Defence:0,Action:0,Hand:0,Duration:1,Activate:function()
{
   if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
   {
      RemoveOpponentCard();
   }
}};
TableCardBattleAction[4] = {Name:"Luck",Legend:root.getInsName("luckCmmnt",root.parseKitCards),Dice:0,Defence:0,Action:0,Duration:1,Activate:function()
{
   if(HasCardToDisarm(CARD_YELLOW))
   {
      if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
      {
         deactivationScreen.CardType = CARD_YELLOW;
         deactivationScreen.Show();
      }
   }
   else
   {
      BattleSystem.LastActivatedCardSocket.Card.Socket = BattleSystem.Cemetery.Socket;
      BattleSystem.LastActivatedCardSocket.Card.onEnterFrame = BattleSystem.MoveToSocket;
      BattleSystem.LastActivatedCardSocket.Card = BattleSystem.VoidCard;
   }
},Deactivate:function()
{
}};
TableCardBattleAction[5] = {Name:"Disarm",Legend:root.getInsName("disarmCmmnt",root.parseKitCards),Dice:0,Defence:0,Action:0,Duration:1,Activate:function()
{
   if(HasCardToDisarm(CARD_GREEN))
   {
      if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
      {
         deactivationScreen.CardType = CARD_GREEN;
         deactivationScreen.Show();
      }
   }
   else
   {
      BattleSystem.LastActivatedCardSocket.Card.Socket = BattleSystem.Cemetery.Socket;
      BattleSystem.LastActivatedCardSocket.Card.onEnterFrame = BattleSystem.MoveToSocket;
      BattleSystem.LastActivatedCardSocket.Card = BattleSystem.VoidCard;
   }
},Deactivate:function()
{
}};
TableCardBattleAction[6] = {Name:"Web trap",Legend:root.getInsName("webTrapCmmnt",root.parseKitCards),Dice:0,Defence:0,Action:0,Duration:2,Activate:function()
{
   if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.MalusOpponent += 6;
   }
   else
   {
      BattleSystem.MalusPlayer += 6;
   }
},Deactivate:function(TurnPlayer)
{
   var _loc1_ = TurnPlayer;
   if(_loc1_ == undefined)
   {
      _loc1_ = BattleSystem.CurrentPlayer;
   }
   if(_loc1_ == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.MalusOpponent -= 6;
   }
   else
   {
      BattleSystem.MalusPlayer -= 6;
   }
}};
TableCardBattleAction[7] = {Name:"Shadow",Legend:root.getInsName("shadowCmmnt",root.parseKitCards),Dice:0,Defence:0,Action:0,Duration:2,Activate:function()
{
   if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.DefendMalusOpponent += 2;
   }
   else
   {
      BattleSystem.DefendMalusPlayer += 2;
   }
},Deactivate:function(TurnPlayer)
{
   var _loc1_ = TurnPlayer;
   if(_loc1_ == undefined)
   {
      _loc1_ = BattleSystem.CurrentPlayer;
   }
   if(_loc1_ == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.DefendMalusOpponent -= 2;
   }
   else
   {
      BattleSystem.DefendMalusPlayer -= 2;
   }
}};
TableCardBattleAction[8] = {Name:"Positive Attitude",Legend:root.getInsName("positiveAttitudeCmmnt",root.parseKitCards),Dice:0,Defence:0,Action:0,Duration:1,Activate:function()
{
   if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.RemoveDice();
      BattleSystem.ThrowDice();
   }
},Deactivate:function()
{
}};
TableCardBattleAction[9] = {Name:"Lightning bolt",Legend:root.getInsName("lightningBoltCmmnt",root.parseKitCards),Dice:0,Defence:0,Action:0,Duration:1,Activate:function()
{
   if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.CardsIDToKill = BattleSystem.GetStringCardIDInDeckWithCode(false,false);
      var _loc2_ = new Array();
      var _loc3_ = new Array();
      _loc2_ = BattleSystem.GetStringCardIDInDeckWithCode(true,false).split(",");
      var _loc1_ = 0;
      while(_loc1_ < _loc2_.length)
      {
         _loc3_ = _loc2_[_loc1_].split("~");
         if(_loc3_[0] == "409")
         {
            _loc2_.splice(_loc1_,1);
            break;
         }
         _loc1_ = _loc1_ + 1;
      }
      KillCards(BattleSystem.GetStringCardIDInDeckWithCode(false,false),false);
      KillCards(_loc2_.join(","),true);
   }
},Deactivate:null};
TableCardBattleAction[10] = {Name:"Weapon Master",Legend:root.getInsName("weaponMasterCmmnt",root.parseKitCards),Dice:0,Defence:0,Action:0,Duration:1,Activate:function()
{
   if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.wpnMasterEq = true;
   }
},Deactivate:function()
{
   if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.wpnMasterEq = false;
   }
}};
TableCardBattleAction[11] = {Name:"Boost blaze",Legend:root.getInsName("boostBlazeCmmnt",root.parseKitCards),Dice:0,Defence:0,Action:0,Hand:0,Duration:1,Activate:function()
{
   if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.bstBlazeEq = true;
   }
},Deactivate:function()
{
   if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.bstBlazeEq = false;
   }
}};
TableCardBattleAction[12] = {Name:"Light of the Oracle",Legend:root.getInsName("lightOfTheOracleCmmnt",root.parseKitCards),Dice:0,Defence:0,Action:0,Hand:0,Duration:1,Activate:function()
{
   if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.LghtOracleEq = true;
   }
},Deactivate:function()
{
   if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.LghtOracleEq = false;
   }
   BattleSystem.WhiteDice = 0;
}};
TableCardBattleAction[13] = {Name:"Blessing",Legend:root.getInsName("blessingCmmnt",root.parseKitCards),Dice:0,Defence:0,Action:0,Hand:0,Duration:1,Activate:function()
{
   if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.blessingCardEq = true;
      BattleSystem.DrawCardReserve = BattleSystem.DiceYellowTotal() + BattleSystem.YellowDicesUsed + BattleSystem.WhiteDice;
      root.Trace("BattleSystem.DrawCardReserve : " + BattleSystem.DrawCardReserve);
      BattleSystem.DrawCounter = 0;
      if(!BattleSystem.CardOnTop)
      {
         BattleSystem.DrawCounter = 1;
         BattleSystem.DrawCardPlayer();
      }
   }
},Deactivate:function(TurnPlayer)
{
   var _loc1_ = TurnPlayer;
   if(_loc1_ == undefined)
   {
      _loc1_ = BattleSystem.CurrentPlayer;
   }
   if(_loc1_ == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.blessingCardEq = false;
   }
}};
TableCardBattleAction[14] = {Name:"Cutie pie",Legend:root.getInsName("cutiePieCmmnt",root.parseKitCards),Dice:0,Defence:0,Action:0,Hand:0,Duration:1,Activate:function()
{
   BattleSystem.CutiePieEq = true;
   root.Trace("BattleSystem.DrawCardReserve : " + BattleSystem.DrawCardReserve);
   BattleSystem.DrawCardReserve = 7;
   BattleSystem.DrawCounter = 0;
   if(!BattleSystem.CardOnTop)
   {
      BattleSystem.DrawCounter = 1;
      BattleSystem.DrawCardPlayer();
   }
},Deactivate:function(TurnPlayer)
{
   var _loc1_ = TurnPlayer;
   if(_loc1_ == undefined)
   {
      _loc1_ = BattleSystem.CurrentPlayer;
   }
   if(_loc1_ == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.CutiePieEq = false;
   }
}};
TableCardBattleAction[15] = {Name:"Rider Master",Legend:root.getInsName("riderMasterCmmnt",root.parseKitCards),Dice:0,Defence:0,Action:0,Hand:0,Duration:1,Activate:function()
{
   if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.riderMasterEq = true;
   }
},Deactivate:function()
{
   if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.riderMasterEq = false;
   }
}};
TableCardBattleAction[16] = {Name:"Shield Master",Legend:root.getInsName("shieldMasterCmmnt",root.parseKitCards),Dice:0,Defence:0,Action:0,Hand:0,Duration:2,Activate:function()
{
   if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.DefPlusPlayer = Number(PlayerShieldCardInGame() * 2);
      BattleSystem.DefendMalusPlayer = Number(BattleSystem.DefendMalusPlayer);
      BattleSystem.DefendMalusPlayer -= Number(BattleSystem.DefPlusPlayer);
   }
},Deactivate:function(TurnPlayer)
{
   var _loc1_ = TurnPlayer;
   if(_loc1_ == undefined)
   {
      _loc1_ = BattleSystem.CurrentPlayer;
   }
   if(_loc1_ == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.DefendMalusPlayer = Number(BattleSystem.DefendMalusPlayer);
      BattleSystem.DefendMalusPlayer += Number(BattleSystem.DefPlusPlayer);
      BattleSystem.DefPlusPlayer = 0;
   }
   else
   {
      BattleSystem.DefendMalusOpponent = Number(BattleSystem.DefendMalusOpponent);
      BattleSystem.DefendMalusOpponent += Number(BattleSystem.DefPlusOpponent);
      BattleSystem.DefPlusOpponent = 0;
   }
}};
TableCardBattleAction[17] = {Name:"Sparkle Help",Legend:root.getInsName("sparkleHelpCmmnt",root.parseKitCards),Dice:0,Defence:0,Action:0,Hand:0,Duration:1,Activate:function()
{
   BattleSystem.SprklHelpEq = true;
   BattleSystem.addLifePoint += 5;
},Deactivate:function()
{
   BattleSystem.SprklHelpEq = false;
}};
TableCardBattleAction[18] = {Name:"Sanctuary",Legend:root.getInsName("sanctuaryCmmnt",root.parseKitCards),Dice:0,Defence:0,Action:0,Hand:0,Duration:1,Activate:function()
{
   BattleSystem.blessingEq = true;
   BattleSystem.addLifePoint += 10;
},Deactivate:function()
{
   BattleSystem.blessingEq = false;
}};
TableCardBattleAction[19] = {Name:"Gift from Oracle",Legend:root.getInsName("giftFromOracleCmmnt",root.parseKitCards),Dice:0,Defence:0,Action:0,Hand:0,Duration:1,Activate:function()
{
   BattleSystem.giftOracleEq = true;
   BattleSystem.addLifePoint += 10;
},Deactivate:function()
{
   BattleSystem.giftOracleEq = false;
}};
TableCardBattleAction[20] = {Name:"Oracle’s fury",Legend:root.getInsName("oraclesFuryCmmnt",root.parseKitCards),Dice:0,Defence:0,Action:0,Hand:0,Duration:2,Activate:function()
{
   if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.DefendMalusOpponent += 6;
   }
   else
   {
      BattleSystem.DefendMalusPlayer += 6;
   }
},Deactivate:function(TurnPlayer)
{
   var _loc1_ = TurnPlayer;
   if(_loc1_ == undefined)
   {
      _loc1_ = BattleSystem.CurrentPlayer;
   }
   if(_loc1_ == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.DefendMalusOpponent -= 6;
   }
   else
   {
      BattleSystem.DefendMalusPlayer -= 6;
   }
}};
TableCardBattleAction[21] = {Name:"Invasion",Legend:root.getInsName("invasionCmmnt",root.parseKitCards),Dice:0,Defence:0,Action:0,Hand:0,Duration:2,Activate:function()
{
   if(BattleSystem.CurrentPlayer == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.DefendMalusOpponent += 4;
   }
   else
   {
      BattleSystem.DefendMalusPlayer += 4;
   }
},Deactivate:function(TurnPlayer)
{
   var _loc1_ = TurnPlayer;
   if(_loc1_ == undefined)
   {
      _loc1_ = BattleSystem.CurrentPlayer;
   }
   if(_loc1_ == BattleSystem.TURN_PLAYER)
   {
      BattleSystem.DefendMalusOpponent -= 4;
   }
   else
   {
      BattleSystem.DefendMalusPlayer -= 4;
   }
}};
