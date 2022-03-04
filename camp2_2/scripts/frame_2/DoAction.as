function getNewDepths()
{
   return ++d;
}
function setSpecial(tileLvl, xtile, ytile, tileType)
{
   tileSpecial.push({lvl:tileLvl,xt:xtile,yt:ytile,type:tileType});
}
function setTransit(btn, scr, k1, j1)
{
   tileTransit.push({tname:btn,bkg:scr,xt:j1,yt:k1});
}
function getCollMapPos(lvl, x, y)
{
   var _loc1_ = Math.floor(lvl / 2);
   return {j1:(x + _loc1_) * 2 + 1,j2:(x + _loc1_) * 2,k1:(y + _loc1_) * 2 + 1,k2:(y + _loc1_) * 2};
}
function initMapHeight()
{
   heightMap = new Array(collMap.length);
   var xl = collMap.length;
   var _loc3_ = collMap[0].length;
   var _loc2_ = 0;
   while(_loc2_ < xl)
   {
      heightMap[_loc2_] = new Array(_loc3_);
      var _loc1_ = 0;
      while(_loc1_ < _loc3_)
      {
         heightMap[_loc2_][_loc1_] = 0;
         _loc1_ = _loc1_ + 1;
      }
      _loc2_ = _loc2_ + 1;
   }
}
function cleanUpScr()
{
   obArray = [char];
   interupt = false;
   endInterupt = true;
   arrowArray = new Array();
   interuptArray = new Array();
   walkZoneArray = new Array();
   zoneArray = new Array();
   tileSpecial = new Array();
   tileTransit = new Array();
   for(var _loc2_ in itemContainer)
   {
      var _loc1_ = itemContainer[_loc2_];
      if(typeof _loc1_ == "movieclip")
      {
         if(_loc2_ != "char")
         {
            removeMovieClip(itemContainer[_loc2_]);
            delete itemContainer[_loc2_];
         }
      }
   }
   for(_loc2_ in btnContainer)
   {
      removeMovieClip(btnContainer[_loc2_]);
      delete btnContainer[_loc2_];
   }
}
function setInstantBtn(lvl, x, y)
{
   levelTarget = eval("btnContainer.level" + lvl);
   var x2 = y * tileW;
   var y2 = x * tileW;
   var xiso = x2 - y2;
   var yiso = (x2 + y2) / 2;
   var pos = getCollMapPos(lvl,x,y);
   var nameTile = "t_" + lvl + "_" + x + "_" + y;
   ref = levelTarget.attachMovie("tileBtn",nameTile,getNewDepths());
   ref.frameToGo = map[lvl][x][y];
   ref._x = xiso;
   ref._y = yiso;
   ref.lvl = lvl;
   ref.xtile = x;
   ref.ytile = y;
   ref.k1 = pos.k1;
   ref.j1 = pos.j1;
   heightMap[pos.k1][pos.j1] = ref.frameToGo <= 1 ? lvl : lvl + 0.5;
}
function setBtn()
{
   var x = 0;
   var y = visx * tileW;
   offsetIsoX = - (x - y) - tileW;
   offsetIsoY = - (x + y) / 2 - tileH + 1;
   var i = 0;
   while(i < map.length)
   {
      levelTarget = btnContainer.attachMovie("empty","level" + i,i);
      levelTarget._x = offsetIsoX;
      levelTarget._y = offsetIsoY - i % 2 * tileH;
      var x = 0;
      while(x < map[i].length)
      {
         var y = 0;
         while(y < map[i][x].length)
         {
            if(map[i][x][y] != 0)
            {
               var x2 = y * tileW;
               var y2 = x * tileW;
               var xiso = x2 - y2;
               var yiso = (x2 + y2) / 2;
               var pos = getCollMapPos(i,x,y);
               var nameTile = "t_" + i + "_" + x + "_" + y;
               ref = levelTarget.attachMovie("tileBtn",nameTile,getNewDepths());
               ref.frameToGo = map[i][x][y];
               ref._x = xiso;
               ref._y = yiso;
               ref.lvl = i;
               ref.xtile = x;
               ref.ytile = y;
               ref.k1 = pos.k1;
               ref.j1 = pos.j1;
               heightMap[pos.k1][pos.j1] = ref.frameToGo <= 1 ? i : i + 0.5;
            }
            y++;
         }
         x++;
      }
      i++;
   }
   for(var i in tileTransit)
   {
      var infoT = tileTransit[i];
      var pname = infoT.tname.split("_");
      var trgt = eval("btnContainer.level" + pname[1] + "." + infoT.tname);
      trgt.tile = infoT;
      trgt.transit = true;
      trgt.fct = function()
      {
         var _loc2_ = this;
         startX = _loc2_.tile.xt;
         startY = _loc2_.tile.yt;
         var _loc1_ = getTileInfo(startX,startY);
         char._x = _loc1_.x;
         char._y = _loc1_.y;
         gotoAndPlay("spr_bkg" + _loc2_.tile.bkg);
      };
   }
}
function setInstantTransit(btn, scr, k1, j1)
{
   var infoT = {tname:btn,bkg:scr,xt:j1,yt:k1};
   var pname = infoT.tname.split("_");
   var trgt = eval("btnContainer.level" + pname[1] + "." + infoT.tname);
   trgt.tile = infoT;
   trgt.transit = true;
   trgt.fct = function()
   {
      var _loc2_ = this;
      startX = _loc2_.tile.xt;
      startY = _loc2_.tile.yt;
      var _loc1_ = getTileInfo(startX,startY);
      char._x = _loc1_.x;
      char._y = _loc1_.y;
      gotoAndPlay("spr_bkg" + _loc2_.tile.bkg);
   };
}
function setScr()
{
   itemContainer._x = offsetIsoX;
   itemContainer._y = offsetIsoY;
   lvlBkg._x = - offsetIsoX;
   lvlBkg._y = - offsetIsoY;
   var posInfo = getTileInfo(startY,startX);
   char.depth = depthMap[Math.floor(posInfo.lvl)][posInfo.xtile2][posInfo.ytile2] * itemDepth;
   char.offDepth = obArray.length;
   setObDepth();
   char.swapDepths(char.depth + char.offDepth);
   newTile = posInfo;
   char._x = posInfo.x;
   char._y = posInfo.y;
   var _loc2_ = 0;
   while(_loc2_ < tileSpecial.length)
   {
      var _loc1_ = tileSpecial[_loc2_];
      var x2 = _loc1_.xt * tileW;
      var _loc3_ = _loc1_.yt * tileW;
      var xPos = x2 - _loc3_ + 2 * tileH;
      var yPos = (x2 + _loc3_) / 2 - _loc1_.lvl % 2 * tileH + tileW;
      targetItem = itemContainer.attachMovie(_loc1_.type,"item" + _loc2_,depthMap[_loc1_.lvl][_loc1_.yt][_loc1_.xt] * itemDepth);
      targetItem._x = xPos;
      targetItem._y = yPos;
      _loc2_ = _loc2_ + 1;
   }
}
function getLvlHeight(xt, yt)
{
   var _loc3_ = yt;
   var _loc1_ = 0;
   while(_loc1_ < map.length)
   {
      var _loc2_ = map[_loc1_][xt][_loc3_];
      if(_loc2_ > 0)
      {
         if(_loc2_ == 1)
         {
            return _loc1_;
         }
         return _loc1_ + 0.5;
      }
      _loc1_ = _loc1_ + 1;
   }
   return null;
}
function getTileInfo(newX, newY)
{
   var lvl = heightMap[newX][newY];
   var _loc1_ = Math.floor(lvl);
   var adj = Math.floor(lvl / 2);
   var xt = (newX - 1) / 2 - adj;
   var yt = (newY - 1) / 2 - adj;
   var _loc3_ = xt * tileW;
   var _loc2_ = yt * tileW;
   var xiso = _loc3_ - _loc2_;
   var yiso = (_loc3_ + _loc2_) / 2 - (_loc1_ % 2 + (lvl - _loc1_)) * tileH;
   return {x:xiso,y:yiso,xtile:newX,ytile:newY,xtile2:Math.ceil(xt),ytile2:Math.ceil(yt),lvl:_loc1_};
}
function convertTile(tile)
{
   var _loc1_ = tile;
   return {j1:_loc1_.ytile,k1:_loc1_.xtile,ytile:_loc1_.xtile2,xtile:_loc1_.ytile2,lvl:Math.floor(_loc1_.lvl)};
}
function tileTriggered(tile)
{
   var _loc2_ = tile;
   lastTile = _loc2_;
   for(var _loc1_ in _loc2_)
   {
      trace(_loc1_ + " = " + _loc2_[_loc1_]);
   }
   trace("");
   if(game.char.char.pickUpFct != undefined)
   {
      game.char.char.pickUpFct();
      delete game.char.char.pickUpFct;
   }
   if(_loc2_.transit != null)
   {
      upPanel.transit = true;
      upPanel.endFct = _loc2_.fct;
      upPanel.tile = _loc2_.tile;
   }
   else
   {
      delete upPanel.endFct;
      delete upPanel.tile;
   }
   path = findPath(collMap,startY,startX,_loc2_.k1,_loc2_.j1);
   invertPath = new Array();
   pathPos = new Array();
   _loc1_ = path.length - 1;
   while(_loc1_ >= 0)
   {
      var newX = path[_loc1_][1];
      var _loc3_ = path[_loc1_][0];
      posInfo = getTileInfo(newX,_loc3_);
      if(!(_loc1_ % 2))
      {
         pathPos.push(posInfo);
      }
      invertPath.push(posInfo);
      _loc1_ = _loc1_ - 1;
   }
   if(path.length > 0)
   {
      root.callMovement(root._xmouse,root._ymouse);
      moveCharTween(pathPos,_loc2_);
   }
}
function testForInterupt(pathPos)
{
   var _loc2_ = pathPos;
   var _loc1_ = 0;
   while(_loc1_ < interuptArray.length)
   {
      var k = 0;
      while(k < _loc2_.length)
      {
         var j = 0;
         while(j < interuptArray[_loc1_].inT.length)
         {
            if(interuptArray[_loc1_].inT[j][0] == _loc2_[k].ytile)
            {
               if(interuptArray[_loc1_].inT[j][1] == _loc2_[k].xtile)
               {
                  var l = 0;
                  while(l < interuptArray[_loc1_].outT.length)
                  {
                     var _loc3_ = k;
                     while(_loc3_ < _loc2_.length)
                     {
                        if(interuptArray[_loc1_].outT[l][0] == _loc2_[_loc3_].ytile)
                        {
                           if(interuptArray[_loc1_].outT[l][1] == _loc2_[_loc3_].xtile)
                           {
                              interuptArray[_loc1_].endP = _loc2_[_loc2_.length - 1];
                              return interuptArray[_loc1_];
                           }
                        }
                        if(interuptArray[_loc1_].outP[0] == _loc2_[_loc3_].ytile)
                        {
                           if(interuptArray[_loc1_].outP[1] == _loc2_[_loc3_].xtile)
                           {
                              return interuptArray[_loc1_];
                           }
                        }
                        _loc3_ = _loc3_ + 1;
                     }
                     l++;
                  }
               }
            }
            j++;
         }
         if(interuptArray[_loc1_].inP[0] == _loc2_[k].ytile)
         {
            if(interuptArray[_loc1_].inP[1] == _loc2_[k].xtile)
            {
               k = _loc2_.length;
               j = interuptArray[_loc1_].inT.length;
            }
         }
         k++;
      }
      _loc1_ = _loc1_ + 1;
   }
   return null;
}
function moveCharTween(pathPos, obj)
{
   if(!interupt && endInterupt)
   {
      zoneActive = testForInterupt(invertPath);
   }
   this.onEnterFrame = function()
   {
      if(!root.paused)
      {
         if(t < t2)
         {
            if(t > t2 / 2)
            {
               startY = newTile.xtile;
               startX = newTile.ytile;
            }
            char._x = Math.linearTween(t,bX,cX,t2);
            char._y = Math.linearTween(t,bY,cY,t2);
            t++;
         }
         else
         {
            var doAction = false;
            if(root.tweenStop)
            {
               root.tweenStop = false;
               char.char.gotoAndStop("idle" + dir);
               doAction = true;
               delete this.onEnterFrame;
            }
            if(!doAction)
            {
               for(var i in walkZoneArray)
               {
                  if(walkZoneArray[i].hitTest(char._x + offsetIsoX,char._y + offsetIsoY,true))
                  {
                     doAction = true;
                     char.char.gotoAndStop("idle" + dir);
                     walkZoneArray[i].fct();
                     delete this.onEnterFrame;
                     break;
                  }
               }
            }
            if(!doAction)
            {
               if(zoneActive != null)
               {
                  trace("check for hitTest with " + eval(zoneActive.zone));
                  if(eval(zoneActive.zone).hitTest(char._x + offsetIsoX,char._y + offsetIsoY,true))
                  {
                     trace("COLLISION");
                     moveChar([getTileInfo(zoneActive.inP[1],zoneActive.inP[0])]);
                     char.char.gotoAndStop(zoneActive.anim);
                     interupt = true;
                     endInterupt = false;
                     endInteruptFct = function()
                     {
                        trace("endInteruptFct");
                        moveChar([getTileInfo(zoneActive.outP[1],zoneActive.outP[0])]);
                        tileTriggered(lastTile);
                        zoneActive = null;
                        interupt = false;
                        endInterupt = true;
                     };
                  }
               }
               if(!interupt)
               {
                  cTile = pathPos.shift();
                  char._x = bX = cTile.x;
                  char._y = bY = cTile.y;
                  char.depth = depthMap[Math.floor(newTile.lvl)][newTile.ytile2][newTile.xtile2] * itemDepth;
                  setObDepth();
                  char.swapDepths(char.depth + char.offDepth);
                  if(pathPos.length > 0)
                  {
                     newTile = pathPos[0];
                     t = 0;
                     t2 = 6;
                     cX = newTile.x - bX;
                     cY = newTile.y - bY;
                     if(cTile.xtile < newTile.xtile)
                     {
                        if(cTile.ytile > newTile.ytile)
                        {
                           dir = "D";
                        }
                        else if(cTile.ytile < newTile.ytile)
                        {
                           dir = "B";
                        }
                        else
                        {
                           dir = "C";
                        }
                     }
                     else if(cTile.xtile > newTile.xtile)
                     {
                        if(cTile.ytile > newTile.ytile)
                        {
                           dir = "F";
                        }
                        else if(cTile.ytile < newTile.ytile)
                        {
                           dir = "H";
                        }
                        else
                        {
                           dir = "G";
                        }
                     }
                     else if(cTile.ytile > newTile.ytile)
                     {
                        dir = "E";
                     }
                     else if(cTile.ytile < newTile.ytile)
                     {
                        dir = "A";
                     }
                     else
                     {
                        dir = null;
                     }
                     char.char.gotoAndStop("run" + dir);
                  }
                  else
                  {
                     endInterupt = true;
                     char.char.gotoAndStop("idle" + dir);
                     if(obj.transit)
                     {
                        upPanel.endFct = obj.fct;
                        upPanel.gotoAndPlay("close");
                        downPanel.gotoAndPlay("close");
                     }
                     else
                     {
                        obj.fct();
                     }
                     delete this.onEnterFrame;
                  }
               }
            }
         }
      }
   };
}
function moveChar(pathArray)
{
   obj = pathArray.shift();
   root.tweenStop = false;
   char.char.gotoAndStop("idle" + dir);
   doAction = true;
   char._x = obj.x;
   char._y = obj.y;
   char.depth = depthMap[Math.floor(obj.lvl)][obj.ytile2][obj.xtile2] * itemDepth;
   setObDepth();
   char.swapDepths(char.depth + char.offDepth);
   cTile = newTile = obj;
   startX = newTile.ytile;
   startY = newTile.xtile;
   delete this.onEnterFrame;
}
function setObDepth()
{
   var _loc2_ = 0;
   while(_loc2_ < obArray.length - 1)
   {
      var _loc1_ = _loc2_ + 1;
      while(_loc1_ < obArray.length)
      {
         if(obArray[_loc2_].depth == obArray[_loc1_].depth)
         {
            var _loc3_ = false;
            if(_loc2_ == 0)
            {
               if(obArray[_loc2_]._y + 10 > obArray[_loc1_]._y)
               {
                  if(obArray[_loc2_].offDepth < obArray[_loc1_].offDepth)
                  {
                     _loc3_ = true;
                  }
               }
               else if(obArray[_loc2_]._y + 10 < obArray[_loc1_]._y)
               {
                  if(obArray[_loc2_].offDepth > obArray[_loc1_].offDepth)
                  {
                     _loc3_ = true;
                  }
               }
            }
            else if(obArray[_loc2_]._y > obArray[_loc1_]._y)
            {
               if(obArray[_loc2_].offDepth < obArray[_loc1_].offDepth)
               {
                  _loc3_ = true;
               }
            }
            else if(obArray[_loc2_]._y < obArray[_loc1_]._y)
            {
               if(obArray[_loc2_].offDepth > obArray[_loc1_].offDepth)
               {
                  _loc3_ = true;
               }
            }
            if(_loc3_)
            {
               var tempD = obArray[_loc2_].offDepth;
               obArray[_loc2_].offDepth = obArray[_loc1_].offDepth;
               obArray[_loc1_].offDepth = tempD;
               obArray[_loc2_].swapDepths(obArray[_loc2_].depth + obArray[_loc2_].offDepth);
               obArray[_loc1_].swapDepths(obArray[_loc1_].depth + obArray[_loc1_].offDepth);
            }
         }
         _loc1_ = _loc1_ + 1;
      }
      _loc2_ = _loc2_ + 1;
   }
}
function setInterupt(inTile, outTile, inPos, outPos, zoneAction, animLabel)
{
   interuptArray.push({inT:inTile,outT:outTile,inP:inPos,outP:outPos,zone:zoneAction,anim:animLabel});
}
function placeObject(lvl, xt, yt, obj, id)
{
   var _loc3_ = yt;
   var _loc2_ = xt * tileW;
   var _loc1_ = _loc3_ * tileW;
   var xPos = _loc2_ - _loc1_ + tileH;
   var yPos = (_loc2_ + _loc1_) / 2 - lvl % 2 * tileH;
   targetItem = itemContainer.attachMovie(obj,obj + id,depthMap[lvl][_loc3_][xt] * itemDepth + (obArray.length + 1));
   targetItem.depth = depthMap[lvl][_loc3_][xt] * itemDepth;
   targetItem.offDepth = obArray.length + 1;
   targetItem._x = xPos + tileW;
   targetItem._y = yPos + tileH;
   obArray.push(targetItem);
   return targetItem;
}
function addBattleCard(id)
{
   root.sfx.gotoAndPlay("getCard");
   root.pushCard(id);
}
function addObject(obj)
{
   root.sfx.gotoAndPlay("useObj");
   inventory.push({item:obj});
}
function removeObject(obj)
{
   var _loc2_ = obj;
   var _loc1_ = 0;
   while(_loc1_ < inventory.length)
   {
      if(inventory[_loc1_].item == _loc2_)
      {
         inventory.splice(_loc1_,1);
         break;
      }
      _loc1_ = _loc1_ + 1;
   }
}
function registerWalkZone(zone)
{
   walkZoneArray.push(zone);
}
function unregisterWalkZone(zone)
{
   var _loc2_ = zone;
   for(var _loc1_ in walkZoneArray)
   {
      if(walkZoneArray[_loc1_] == _loc2_)
      {
         walkZoneArray.splice(_loc1_,1);
      }
   }
}
function registerDropZone(zone)
{
   zoneArray.push(zone);
}
function unregisterDropZone(zone)
{
   var _loc2_ = zone;
   for(var _loc1_ in zoneArray)
   {
      if(zoneArray[_loc1_] == _loc2_)
      {
         zoneArray.splice(_loc1_,1);
      }
   }
}
function addArrow(obj)
{
   if(arrowArray.length == 0)
   {
      obj.onEnterFrame = function()
      {
         for(var _loc1_ in arrowArray)
         {
            arrowArray[_loc1_]._visible = arrowArray[_loc1_].hitTest(_xmouse,_ymouse,true);
         }
      };
   }
   arrowArray.push(obj);
}
function showInventory(pageNb)
{
   itemWindow.page = pageNb;
   itemWindow.pageNb.text = pageNb;
   var firstItem = (pageNb - 1) * 8;
   itemWindow.objArray = new Array();
   var i = firstItem;
   while(i < firstItem + 8)
   {
      var targetItem = eval("itemWindow.item" + (i - firstItem));
      targetItem._visible = true;
      if(i < inventory.length)
      {
         targetItem.icoItem = targetItem.attachMovie(inventory[i].item,"obj" + i - firstItem,i - firstItem);
         targetItem.itemId = inventory[i].item;
         itemWindow.objArray.push(targetItem.icoItem);
         targetItem.onRollOver = function()
         {
            this.gotoAndStop(2);
         };
         targetItem.onRollOut = function()
         {
            this.gotoAndStop(1);
         };
         targetItem.onPress = function()
         {
            var _loc1_ = this;
            delete _loc1_.onRollOver;
            delete _loc1_.onRollOut;
            _loc1_.gotoAndStop(1);
            for(var _loc2_ in itemWindow.objArray)
            {
               if(itemWindow.objArray[_loc2_] != _loc1_.icoItem)
               {
                  itemWindow.objArray[_loc2_]._visible = false;
                  itemWindow.objArray[_loc2_].removeMovieClip();
               }
            }
            _loc1_.startDrag(true);
            itemWindow.gotoAndPlay("close");
         };
         targetItem.onRelease = targetItem.onReleaseOutside = function()
         {
            var _loc1_ = this;
            if(itemWindow._currentframe < itemWindow._totalframes)
            {
               _loc1_.onPress = function()
               {
                  var _loc1_ = this;
                  itemWindow.gotoAndStop(0);
                  for(var _loc2_ in zoneArray)
                  {
                     if(zoneArray[_loc2_].hitTest(_xmouse,_ymouse,true))
                     {
                        zoneArray[_loc2_].fct(_loc1_.itemId);
                        break;
                     }
                  }
               };
            }
            else
            {
               _loc1_._visible = false;
               itemWindow.gotoAndStop(0);
               var _loc2_ = false;
               for(var _loc3_ in zoneArray)
               {
                  if(zoneArray[_loc3_].hitTest(_xmouse,_ymouse,true))
                  {
                     zoneArray[_loc3_].fct(_loc1_.itemId);
                     _loc2_ = true;
                     break;
                  }
               }
               if(!_loc2_)
               {
                  root.sfx.gotoAndPlay("errorBeep");
               }
            }
         };
      }
      else
      {
         targetItem._visible = false;
      }
      i++;
   }
}
gameW = 640;
gameH = 480;
tileW = 28;
tileH = 15;
d = 0;
itemDepth = 100;
inventory = new Array();
root.tweenStop = false;
itemContainer.typeSex = root.typeSex;
itemContainer.typeHair = root.typeHair;
itemContainer.typeEyes = root.typeEyes;
itemContainer.typeSkin = root.typeSkin;
itemContainer.typeBody = root.typeBody;
itemContainer.typeLegs = root.typeLegs;
itemContainer.typeManacle = root.typeManacle;
Math.linearTween = function(t, b, c, d)
{
   return c * t / d + b;
};
findPath = function(map, startX, startY, endX, endY)
{
   var HV_COST = 10;
   var D_COST = 14;
   var ALLOW_DIAGONAL = true;
   var ALLOW_DIAGONAL_CORNERING = false;
   isOpen = function(y, x)
   {
      return mapStatus[y][x].open;
   };
   isClosed = function(y, x)
   {
      return mapStatus[y][x].closed;
   };
   nearerSquare = function()
   {
      var minimum = 999999;
      var indexFound = 0;
      var _loc2_ = undefined;
      var _loc3_ = undefined;
      var _loc1_ = openList.length;
      while(true)
      {
         _loc1_;
         if(_loc1_-- <= 0)
         {
            break;
         }
         _loc3_ = mapStatus[openList[_loc1_][0]][openList[_loc1_][1]];
         _loc2_ = _loc3_.heuristic + _loc3_.movementCost;
         if(_loc2_ <= minimum)
         {
            minimum = _loc2_;
            indexFound = _loc1_;
         }
      }
      return indexFound;
   };
   closeSquare = function(y, x)
   {
      var _loc3_ = y;
      var _loc2_ = openList.length;
      var _loc1_ = 0;
      while(_loc1_ < _loc2_)
      {
         if(openList[_loc1_][0] == _loc3_)
         {
            if(openList[_loc1_][1] == x)
            {
               openList.splice(_loc1_,1);
               break;
            }
         }
         _loc1_ = _loc1_ + 1;
      }
      mapStatus[_loc3_][x].open = false;
      mapStatus[_loc3_][x].closed = true;
   };
   openSquare = function(y, x, parent, movementCost, heuristic, replacing)
   {
      var _loc1_ = y;
      var _loc2_ = x;
      if(!replacing)
      {
         openList.push([_loc1_,_loc2_]);
         mapStatus[_loc1_][_loc2_] = {heuristic:heuristic,open:true,closed:false};
      }
      mapStatus[_loc1_][_loc2_].parent = parent;
      mapStatus[_loc1_][_loc2_].movementCost = movementCost;
   };
   var mapH = map.length;
   var mapW = map[0].length;
   var mapStatus = new Array();
   var i = 0;
   while(i < mapH)
   {
      mapStatus[i] = new Array();
      i++;
   }
   if(startY == undefined || startX == undefined)
   {
      return null;
   }
   if(endY == undefined || endX == undefined)
   {
      return null;
   }
   var openList = new Array();
   openSquare(startY,startX,undefined,0);
   while(openList.length > 0 && !isClosed(endY,endX))
   {
      var i = nearerSquare();
      var nowY = openList[i][0];
      var nowX = openList[i][1];
      closeSquare(nowY,nowX);
      var _loc2_ = nowY - 1;
      while(_loc2_ < nowY + 2)
      {
         var _loc1_ = nowX - 1;
         while(_loc1_ < nowX + 2)
         {
            if(_loc2_ >= 0 && _loc2_ < mapH && _loc1_ >= 0 && _loc1_ < mapW && !(_loc2_ == nowY && _loc1_ == nowX) && (ALLOW_DIAGONAL || _loc2_ == nowY || _loc1_ == nowX) && (ALLOW_DIAGONAL_CORNERING || _loc2_ == nowY || _loc1_ == nowX || map[_loc2_][nowX] == 0 && !map[nowY][_loc1_]))
            {
               if(map[_loc2_][_loc1_] == 0)
               {
                  if(!isClosed(_loc2_,_loc1_))
                  {
                     var _loc3_ = mapStatus[nowY][nowX].movementCost + (!(_loc2_ == nowY || _loc1_ == nowX) ? D_COST : HV_COST) * !map[_loc2_][_loc1_];
                     if(isOpen(_loc2_,_loc1_))
                     {
                        if(_loc3_ < mapStatus[_loc2_][_loc1_].movementCost)
                        {
                           openSquare(_loc2_,_loc1_,[nowY,nowX],_loc3_,undefined,true);
                        }
                     }
                     else
                     {
                        var heuristic = (Math.abs(_loc2_ - endY) + Math.abs(_loc1_ - endX)) * 10;
                        openSquare(_loc2_,_loc1_,[nowY,nowX],_loc3_,heuristic,false);
                     }
                  }
               }
            }
            _loc1_ = _loc1_ + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   var pFound = isClosed(endY,endX);
   delete isOpen;
   delete isClosed;
   delete nearerSquare;
   delete closeSquare;
   delete openSquare;
   if(pFound)
   {
      var returnPath = new Array();
      var nowY = endY;
      var nowX = endX;
      while(nowY != startY || nowX != startX)
      {
         returnPath.push([nowY,nowX]);
         var newY = mapStatus[nowY][nowX].parent[0];
         var newX = mapStatus[nowY][nowX].parent[1];
         nowY = newY;
         nowX = newX;
      }
      returnPath.push([startY,startX]);
      return returnPath;
   }
   return null;
};
visx = 11;
visy = 36;
startX = 30;
startY = 30;
char = itemContainer.createEmptyMovieClip("char",itemDepth - 1);
char._xscale = char._yscale = 80;
char.loadMovie("character_" + root.charVersion + ".swf");
char.fct = function()
{
   char.gotoAndStop(root.typeSex);
   root.criticMsgWindow.closeWindow();
};
root.loadWindow.setLoader(char,char.fct);
upPanel.onPress = downPanel.onPress = null;
upPanel.useHandCursor = downPanel.useHandCursor = false;
root.FirstEnter = false;
comeFrom = "";
invBook = 0;
digHole = 0;
keyItem = 0;
battle1 = 0;
battle2 = 0;
battle3 = 0;
battle4 = 0;
text1 = 0;
card1 = 0;
card2 = 0;
openedGate = 0;
gameTrigger = 1;
gotoAndStop("spr_bkg7");
play();
