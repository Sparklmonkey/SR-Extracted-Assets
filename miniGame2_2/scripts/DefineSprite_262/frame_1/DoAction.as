if(mg2.mySpider == 1)
{
   totalEnergy = 100;
   decay = 0.93;
   decay2 = 0.93;
   speedRebound = -0.6;
   maxSpeed = 5;
   maxSpeed2 = 7;
   resistance = 5;
}
else if(mg2.mySpider == 2)
{
   decay = 0.9;
   decay2 = 0.93;
   totalEnergy = 120;
   speedRebound = -0.6;
   maxSpeed = 5;
   maxSpeed2 = 6;
   resistance = 4;
}
else if(mg2.mySpider == 3)
{
   decay = 0.8;
   decay2 = 0.93;
   totalEnergy = 150;
   speedRebound = -0.5;
   maxSpeed = 4;
   maxSpeed2 = 6;
   resistance = 3;
}
damage = 0;
trust = 0.4;
decRebound = 1;
maxAngle = 351;
turnRate = 9;
xSpeed = 0;
ySpeed = 0;
speed = 0;
lock = isDone = false;
m = 45;
friction = 0.9;
vx = vy = 0;
vSpeed = 0.04;
vSpeedMax = 0.06;
vSpeedMin = 0.05;
vSpeed2 = vSpeed / 2;
modifier = 1;
projectedX = _X;
projectedY = _Y;
seg = 0;
seg2 = 1;
rotOffset = 100;
mid1 = new Object();
mid2 = new Object();
point2 = new Object();
coll = false;
t = 1;
stop();
