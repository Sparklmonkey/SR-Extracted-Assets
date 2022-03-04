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
            delete this.onRollOver;
            delete this.onRollOut;
            var i = firstItem;
            while(i < firstItem + 8)
            {
               delRoll = eval("itemWindow.item" + (i - firstItem));
               delete delRoll.onRollOver;
               delete delRoll.onRollOut;
               i++;
            }
            this.gotoAndStop(1);
            for(var i in itemWindow.objArray)
            {
               if(itemWindow.objArray[i] != this.icoItem)
               {
                  itemWindow.objArray[i]._visible = false;
                  itemWindow.objArray[i].removeMovieClip();
               }
            }
            this.startDrag(true);
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
function setChar(id, xtile, ytile, level)
{
   var tempID = id;
   var chkOcc = tempID.indexOf(",");
   var tempObj = new Object();
   if(chkOcc != -1)
   {
      trace("Quantity = " + tempID[1]);
      if(tempID[1] != "0" || tempID[1] != 0)
      {
         var charObj = eval("obj_" + tempID[0]);
         for(var y in charObj)
         {
            tempObj[y] = charObj[y];
         }
         tempObj.invectid = true;
         tempObj.qty = tempID[1];
      }
      else
      {
         tempObj = undefined;
      }
   }
   else
   {
      var charObj = eval("obj_" + tempID);
      for(var y in charObj)
      {
         tempObj[y] = charObj[y];
      }
      tempObj.invectid = false;
   }
   trace("MAP encounter : " + tempObj.name);
   tempObj.xTile = xtile;
   tempObj.yTile = ytile;
   tempObj.level = level;
   trace("tempID : " + tempID);
   return tempObj;
}
function resetZone(zone)
{
   zone.onEnterFrame = function()
   {
      zone.timer = zone.timer + 1;
      if(zone.timer >= game.zoneLimitDelay)
      {
         game.registerWalkZone(zone);
         zone.timer = 0;
         delete zone.onEnterFrame;
      }
   };
}
function setBattle(obj, zone)
{
   root.googleAnalytic("javascript:urchinTracker(\'/arachna/fight/" + obj.id + "\');");
   root.textWindow.closeWindow();
   var ennemyStats = new Object();
   ennemyStats.type = obj.id;
   ennemyStats.card = obj.cardArr;
   trace("Ennemy Type : " + ennemyStats.type);
   trace(zone + " : " + _parent);
   if(obj.invectid || obj.id >= 600)
   {
      root.sfx.gotoAndPlay("battleInvectid");
   }
   else if(obj.id >= 500 && obj.id < 600)
   {
      root.sfx.gotoAndPlay("battleRider");
   }
   else
   {
      root.sfx.gotoAndPlay("battleMonster");
   }
   var param = 2;
   root.battleSystem.initBattle(ennemyStats,root.playerStats,param);
   game._visible = false;
   root.battleSystem.CallbackEndBattle = function(battleResult, ptsVictory)
   {
      game._visible = true;
      root.battleSystem.clearBattle();
      if(battleResult)
      {
         root.getRewardType(ptsVictory);
         if(obj.invectid)
         {
            zoneID = "" + zone._name;
            infoID = zoneID.split("_");
            arrName = infoID[0];
            arrID = infoID[1];
            trace("arrName Length = " + arrName.length);
            if(arrName.length >= 2)
            {
               arrZone = arrName.slice(0,1);
               arrPart = arrName.slice(1,2);
               crntArr = eval("root.zone" + arrZone + "Arr" + arrPart);
            }
            else
            {
               crntArr = eval("root.zone" + arrName + "Arr");
            }
            if(crntArr[arrID][0] != "-")
            {
               crntArr[arrID][1]--;
               trace("UPDATED QTY : " + crntArr[arrID][1]);
               zone.counter.outputTxt.text = crntArr[arrID][1];
               root.callInvectidKill(arrName,arrID);
               if(crntArr[arrID][1] <= 0)
               {
                  zone._visible = false;
                  eval("game.itemContainer." + obj.name + obj.objID)._visible = false;
                  crntArr[arrID][0] = "-";
               }
               else
               {
                  game.resetZone(zone);
               }
            }
         }
         else
         {
            eval("game.itemContainer." + obj.name + obj.objID)._visible = false;
         }
         root.playerStats.victory += ptsVictory;
      }
      else
      {
         game.resetZone(zone);
      }
      root.sfx.gotoAndPlay(game.ContxtMusic);
   };
}
function setZone(obj, zone)
{
   zone.shape._visible = false;
   trace("crntFrame = " + game._currentframe);
   zone._x = game.itemContainer._x + eval("game.itemContainer." + obj.name + obj.objID)._x;
   zone._y = game.itemContainer._y + eval("game.itemContainer." + obj.name + obj.objID)._y;
   if(obj.invectid)
   {
      zone.counter._visible = true;
      zone.counter.outputTxt.text = obj.qty;
   }
   else
   {
      zone.counter._visible = false;
   }
   switch(obj.eType)
   {
      case "npc":
         endFct1 = function()
         {
            function endFct2()
            {
               root.textWindow.closeWindow();
               delete endFct1;
            }
            txtArr = new Array();
            txtArr = obj.tVal;
            arrSrc = txtArr.length - 1;
            randTxt = 0;
            randTxt += random(arrSrc);
            root.textWindow.drawWindow([txtArr[randTxt]],obj.pic,endFct2);
         };
         break;
      case "aBattle":
         endFct1 = function()
         {
            function endFct2()
            {
               trace("ENCOUNTER RIDER/MANTID : " + zone);
               delete root.textWindow.fct;
               setBattle(obj,zone);
               delete endFct1;
            }
            root.textWindow.drawWindow(obj.tVal,obj.pic,endFct2);
         };
         break;
      case "mBattle":
         endFct1 = function()
         {
            function endFct2()
            {
               delete endFct2;
            }
            trace("ENCOUNTER MONSTER : " + zone);
            setBattle(obj,zone);
            delete endFct1;
         };
         break;
      default:
         endFct1 = function()
         {
            return undefined;
         };
   }
   game.registerWalkZone(zone);
   return endFct1;
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
startX = 25;
startY = 27;
if(root.playerStats.rewardAccess == 1 || root.playerStats.rewardAccess == true || root.playerStats.rewardAccess == "1")
{
   root.playerStats.rewardAccess = "true";
}
if(root.playerStats.rewardAccess == 0 || root.playerStats.rewardAccess == false || root.playerStats.rewardAccess == "0")
{
   root.playerStats.rewardAccess = "false";
}
eventAccess = root.playerStats.rewardAccess;
char = itemContainer.createEmptyMovieClip("char",itemDepth - 1);
char._xscale = char._yscale = 80;
char.loadMovie("character_" + root.charVersion + ".swf");
char.fct = function()
{
   char.gotoAndStop(root.typeSex);
   root.criticMsgWindow.closeWindow();
};
ContxtMusic = "area1";
root.loadWindow.setLoader(char,char.fct);
upPanel.onPress = downPanel.onPress = null;
upPanel.useHandCursor = downPanel.useHandCursor = false;
root.FirstEnter = false;
comeFrom = "";
completed = 0;
trace("event ID  = " + root.crntEvent.id);
trace("event STATE  = " + root.crntEvent.state);
randWoodSet = 40;
logInv = 0;
randStoneSet = 40;
stone1Inv = 0;
stone2Inv = 0;
stone3Inv = 0;
stone4Inv = 0;
randWheatSet = 40;
wheatInv = 0;
randFlagSet = 40;
flagInv = 0;
humanHeadInv = 0;
lumensHeadInv = 0;
nbrPieces = 4;
machine1Inv = 0;
machine2Inv = 0;
machine3Inv = 0;
machine4Inv = 0;
invectidInv = 0;
flowerInv = 0;
starInv = 0;
humanInv = 0;
zoneLimitDelay = 100;
aquineDeck = new Array(103,104,104,105,106,201,201,204,300,507,508,505,503,503,506,507,508,509);
beerainDeck = new Array(100,101,102,102,104,201,202,204,302,302,502,503,503,504,504,508,508,506);
bugueseDeck = new Array(103,104,105,106,106,300,207,202,301,206,208,503,504,505,505,506,508,508,509,509,510);
coronaDeck = new Array(101,103,104,108,108,203,206,207,300,500,503,505,507,508,510,511);
dungobeetDeck = new Array(102,103,104,202,204,206,207,301,500,503,503,504,505,505,506,506,509);
grasshopDeck = new Array(101,103,107,107,205,202,204,206,503,503,506,507,508,509,509,510);
igneousDeck = new Array(102,103,104,105,109,110,204,204,205,206,301,504,504,506,507,507,511);
magmaDeck = new Array(109,107,107,106,204,205,207,206,300,508,508,508,508,508,509,509,510,510,511);
stagDeck = new Array(104,105,106,106,109,202,204,207,208,300,503,503,507,508,508,508,508,508,509,510,510);
obj_0100 = new Object({eType:"npc",name:"chamberlain",pic:25});
obj_0100.tVal = new Array(root.getInsName("txt0100p1",root.parseKitWorld),root.getInsName("txt0100p2",root.parseKitWorld),root.getInsName("txt0100p3",root.parseKitWorld));
obj_0101 = new Object({eType:"npc",name:"corona",pic:13});
obj_0101.tVal = new Array(root.getInsName("txt0101p1",root.parseKitWorld),root.getInsName("txt0101p2",root.parseKitWorld),root.getInsName("txt0101p3",root.parseKitWorld));
obj_0102 = new Object({eType:"npc",name:"flame",pic:35});
obj_0102.tVal = new Array(root.getInsName("txt0102p1",root.parseKitWorld),root.getInsName("txt0102p2",root.parseKitWorld),root.getInsName("txt0102p3",root.parseKitWorld));
obj_0103 = new Object({eType:"npc",name:"guardA",pic:32});
obj_0103.tVal = new Array(root.getInsName("txt0103p1",root.parseKitWorld),root.getInsName("txt0103p2",root.parseKitWorld),root.getInsName("txt0103p3",root.parseKitWorld));
obj_0104 = new Object({eType:"npc",name:"guardB",pic:33});
obj_0104.tVal = new Array(root.getInsName("txt0104p1",root.parseKitWorld),root.getInsName("txt0104p2",root.parseKitWorld),root.getInsName("txt0104p3",root.parseKitWorld));
obj_0105 = new Object({eType:"npc",name:"guardC",pic:34});
obj_0105.tVal = new Array(root.getInsName("txt0105p1",root.parseKitWorld),root.getInsName("txt0105p2",root.parseKitWorld),root.getInsName("txt0105p3",root.parseKitWorld));
obj_0106 = new Object({eType:"npc",name:"hortala",pic:37});
obj_0106.tVal = new Array(root.getInsName("txt0106p1",root.parseKitWorld),root.getInsName("txt0106p2",root.parseKitWorld),root.getInsName("txt0106p3",root.parseKitWorld));
obj_0107 = new Object({eType:"npc",name:"igneous",pic:27});
obj_0107.tVal = new Array(root.getInsName("txt0107p1",root.parseKitWorld),root.getInsName("txt0107p2",root.parseKitWorld),root.getInsName("txt0107p3",root.parseKitWorld));
obj_0108 = new Object({eType:"npc",name:"magma",pic:56});
obj_0108.tVal = new Array(root.getInsName("txt0108p1",root.parseKitWorld),root.getInsName("txt0108p2",root.parseKitWorld),root.getInsName("txt0108p3",root.parseKitWorld));
obj_0109 = new Object({eType:"npc",name:"officier",pic:24});
obj_0109.tVal = new Array(root.getInsName("txt0109p1",root.parseKitWorld),root.getInsName("txt0109p2",root.parseKitWorld),root.getInsName("txt0109p3",root.parseKitWorld));
obj_0110 = new Object({eType:"npc",name:"lumen",pic:26});
obj_0110.tVal = new Array(root.getInsName("txt0110p1",root.parseKitWorld),root.getInsName("txt0110p2",root.parseKitWorld),root.getInsName("txt0110p3",root.parseKitWorld));
obj_0111 = new Object({eType:"npc",name:"sparkle",pic:30});
obj_0111.tVal = new Array(root.getInsName("txt0111p1",root.parseKitWorld),root.getInsName("txt0111p2",root.parseKitWorld),root.getInsName("txt0111p3",root.parseKitWorld));
obj_0112 = new Object({eType:"aBattle",name:"corona",pic:13,id:500});
obj_0112.tVal = new Array(root.getInsName("txt0112p1",root.parseKitWorld));
obj_0112.cardArr = coronaDeck;
obj_0113 = new Object({eType:"aBattle",name:"igneous",pic:27,id:501});
obj_0113.tVal = new Array(root.getInsName("txt0113p1",root.parseKitWorld));
obj_0113.cardArr = igneousDeck;
obj_0114 = new Object({eType:"aBattle",name:"magma",pic:56,id:502});
obj_0114.tVal = new Array(root.getInsName("txt0114p1",root.parseKitWorld));
obj_0114.cardArr = magmaDeck;
obj_0200 = new Object({eType:"npc",name:"brutus",pic:57});
obj_0200.tVal = new Array(root.getInsName("txt0200p1",root.parseKitWorld),root.getInsName("txt0200p2",root.parseKitWorld),root.getInsName("txt0200p3",root.parseKitWorld));
obj_0201 = new Object({eType:"npc",name:"cathy",pic:60});
obj_0201.tVal = new Array(root.getInsName("txt0201p1",root.parseKitWorld),root.getInsName("txt0201p2",root.parseKitWorld),root.getInsName("txt0201p3",root.parseKitWorld));
obj_0202 = new Object({eType:"npc",name:"childA",pic:45});
obj_0202.tVal = new Array(root.getInsName("txt0202p1",root.parseKitWorld),root.getInsName("txt0202p2",root.parseKitWorld),root.getInsName("txt0202p3",root.parseKitWorld));
obj_0203 = new Object({eType:"npc",name:"childB",pic:46});
obj_0203.tVal = new Array(root.getInsName("txt0203p1",root.parseKitWorld),root.getInsName("txt0203p2",root.parseKitWorld),root.getInsName("txt0203p3",root.parseKitWorld));
obj_0204 = new Object({eType:"npc",name:"corona",pic:13});
obj_0204.tVal = new Array(root.getInsName("txt0204p1",root.parseKitWorld),root.getInsName("txt0204p2",root.parseKitWorld),root.getInsName("txt0204p3",root.parseKitWorld));
obj_0205 = new Object({eType:"npc",name:"flame",pic:35});
obj_0205.tVal = new Array(root.getInsName("txt0205p1",root.parseKitWorld),root.getInsName("txt0205p2",root.parseKitWorld),root.getInsName("txt0205p3",root.parseKitWorld));
obj_0206 = new Object({eType:"npc",name:"guardA",pic:32});
obj_0206.tVal = new Array(root.getInsName("txt0206p1",root.parseKitWorld),root.getInsName("txt0206p2",root.parseKitWorld),root.getInsName("txt0206p3",root.parseKitWorld));
obj_0207 = new Object({eType:"npc",name:"guardB",pic:33});
obj_0207.tVal = new Array(root.getInsName("txt0207p1",root.parseKitWorld),root.getInsName("txt0207p2",root.parseKitWorld),root.getInsName("txt0207p3",root.parseKitWorld));
obj_0208 = new Object({eType:"npc",name:"guardC",pic:34});
obj_0208.tVal = new Array(root.getInsName("txt0208p1",root.parseKitWorld),root.getInsName("txt0208p2",root.parseKitWorld),root.getInsName("txt0208p3",root.parseKitWorld));
obj_0209 = new Object({eType:"npc",name:"hortala",pic:37});
obj_0209.tVal = new Array(root.getInsName("txt0209p1",root.parseKitWorld),root.getInsName("txt0209p2",root.parseKitWorld),root.getInsName("txt0209p3",root.parseKitWorld));
obj_0210 = new Object({eType:"npc",name:"igneous",pic:27});
obj_0210.tVal = new Array(root.getInsName("txt0210p1",root.parseKitWorld),root.getInsName("txt0210p2",root.parseKitWorld),root.getInsName("txt0210p3",root.parseKitWorld));
obj_0211 = new Object({eType:"npc",name:"magma",pic:56});
obj_0211.tVal = new Array(root.getInsName("txt0211p1",root.parseKitWorld),root.getInsName("txt0211p2",root.parseKitWorld),root.getInsName("txt0211p3",root.parseKitWorld));
obj_0212 = new Object({eType:"npc",name:"manA",pic:15});
obj_0212.tVal = new Array(root.getInsName("txt0212p1",root.parseKitWorld),root.getInsName("txt0212p2",root.parseKitWorld),root.getInsName("txt0212p3",root.parseKitWorld));
obj_0213 = new Object({eType:"npc",name:"manB",pic:16});
obj_0213.tVal = new Array(root.getInsName("txt0213p1",root.parseKitWorld),root.getInsName("txt0213p2",root.parseKitWorld),root.getInsName("txt0213p3",root.parseKitWorld));
obj_0214 = new Object({eType:"npc",name:"manC",pic:18});
obj_0214.tVal = new Array(root.getInsName("txt0214p1",root.parseKitWorld),root.getInsName("txt0214p2",root.parseKitWorld),root.getInsName("txt0214p3",root.parseKitWorld));
obj_0215 = new Object({eType:"npc",name:"officier",pic:24});
obj_0215.tVal = new Array(root.getInsName("txt0215p1",root.parseKitWorld),root.getInsName("txt0215p2",root.parseKitWorld),root.getInsName("txt0215p3",root.parseKitWorld));
obj_0216 = new Object({eType:"npc",name:"sparkle",pic:30});
obj_0216.tVal = new Array(root.getInsName("txt0216p1",root.parseKitWorld),root.getInsName("txt0216p2",root.parseKitWorld),root.getInsName("txt0216p3",root.parseKitWorld));
obj_0217 = new Object({eType:"npc",name:"venus",pic:36});
obj_0217.tVal = new Array(root.getInsName("txt0217p1",root.parseKitWorld),root.getInsName("txt0217p2",root.parseKitWorld),root.getInsName("txt0217p3",root.parseKitWorld));
obj_0218 = new Object({eType:"npc",name:"womanA",pic:14});
obj_0218.tVal = new Array(root.getInsName("txt0218p1",root.parseKitWorld),root.getInsName("txt0218p2",root.parseKitWorld),root.getInsName("txt0218p3",root.parseKitWorld));
obj_0219 = new Object({eType:"npc",name:"womanB",pic:50});
obj_0219.tVal = new Array(root.getInsName("txt0219p1",root.parseKitWorld),root.getInsName("txt0219p2",root.parseKitWorld),root.getInsName("txt0219p3",root.parseKitWorld));
obj_0220 = new Object({eType:"npc",name:"womanC",pic:51});
obj_0220.tVal = new Array(root.getInsName("txt0220p1",root.parseKitWorld),root.getInsName("txt0220p2",root.parseKitWorld),root.getInsName("txt0220p3",root.parseKitWorld));
obj_0221 = new Object({eType:"aBattle",name:"corona",pic:13,id:500});
obj_0221.tVal = new Array(root.getInsName("txt0221p1",root.parseKitWorld));
obj_0221.cardArr = coronaDeck;
obj_0222 = new Object({eType:"aBattle",name:"igneous",pic:27,id:501});
obj_0222.tVal = new Array(root.getInsName("txt0222p1",root.parseKitWorld));
obj_0222.cardArr = igneousDeck;
obj_0223 = new Object({eType:"aBattle",name:"magma",pic:56,id:502});
obj_0223.tVal = new Array(root.getInsName("txt0223p1",root.parseKitWorld));
obj_0223.cardArr = magmaDeck;
obj_0300 = new Object({eType:"npc",name:"cathy",pic:60});
obj_0300.tVal = new Array(root.getInsName("txt0300p1",root.parseKitWorld),root.getInsName("txt0300p2",root.parseKitWorld),root.getInsName("txt0300p3",root.parseKitWorld));
obj_0301 = new Object({eType:"npc",name:"corona",pic:13});
obj_0301.tVal = new Array(root.getInsName("txt0301p1",root.parseKitWorld),root.getInsName("txt0301p2",root.parseKitWorld),root.getInsName("txt0301p3",root.parseKitWorld));
obj_0302 = new Object({eType:"npc",name:"guardA",pic:32});
obj_0302.tVal = new Array(root.getInsName("txt0302p1",root.parseKitWorld),root.getInsName("txt0302p2",root.parseKitWorld),root.getInsName("txt0302p3",root.parseKitWorld));
obj_0303 = new Object({eType:"npc",name:"guardB",pic:33});
obj_0303.tVal = new Array(root.getInsName("txt0303p1",root.parseKitWorld),root.getInsName("txt0303p2",root.parseKitWorld),root.getInsName("txt0303p3",root.parseKitWorld));
obj_0304 = new Object({eType:"npc",name:"healer",pic:5});
obj_0304.tVal = new Array(root.getInsName("txt0304p1",root.parseKitWorld),root.getInsName("txt0304p2",root.parseKitWorld),root.getInsName("txt0304p3",root.parseKitWorld));
obj_0305 = new Object({eType:"npc",name:"officier",pic:24});
obj_0305.tVal = new Array(root.getInsName("txt0305p1",root.parseKitWorld),root.getInsName("txt0305p2",root.parseKitWorld),root.getInsName("txt0305p3",root.parseKitWorld));
obj_0306 = new Object({eType:"npc",name:"sparkle",pic:30});
obj_0306.tVal = new Array(root.getInsName("txt0306p1",root.parseKitWorld),root.getInsName("txt0306p2",root.parseKitWorld),root.getInsName("txt0306p3",root.parseKitWorld));
obj_0307 = new Object({eType:"npc",name:"venus",pic:36});
obj_0307.tVal = new Array(root.getInsName("txt0307p1",root.parseKitWorld),root.getInsName("txt0307p2",root.parseKitWorld),root.getInsName("txt0307p3",root.parseKitWorld));
obj_0308 = new Object({eType:"mBattle",name:"chiggerwigz",id:304});
obj_0309 = new Object({eType:"mBattle",name:"greatNastyTat",id:303});
obj_0310 = new Object({eType:"mBattle",name:"smallNastyTat",id:302});
obj_0311 = new Object({eType:"mBattle",name:"pinchmite",id:306});
obj_0312 = new Object({eType:"mBattle",name:"pinchpounce",id:309});
obj_0313 = new Object({eType:"mBattle",name:"poisonousFlower",id:201});
obj_0314 = new Object({eType:"mBattle",name:"buzzbit",id:301});
obj_0315 = new Object({eType:"mBattle",name:"invectidCommander",id:402});
obj_0316 = new Object({eType:"mBattle",name:"invectidDriver",id:408});
obj_0317 = new Object({eType:"mBattle",name:"invectidSoldier",id:400});
obj_0318 = new Object({eType:"mBattle",name:"invectidWarrior",id:404});
obj_0319 = new Object({eType:"aBattle",name:"corona",pic:13,id:500});
obj_0319.tVal = new Array(root.getInsName("txt0319p1",root.parseKitWorld));
obj_0319.cardArr = coronaDeck;
obj_0320 = new Object({eType:"aBattle",name:"igneous",pic:27,id:501});
obj_0320.tVal = new Array(root.getInsName("txt0320p1",root.parseKitWorld));
obj_0320.cardArr = igneousDeck;
obj_0321 = new Object({eType:"aBattle",name:"magma",pic:56,id:502});
obj_0321.tVal = new Array(root.getInsName("txt0321p1",root.parseKitWorld));
obj_0321.cardArr = magmaDeck;
obj_0322 = new Object({eType:"aBattle",name:"dungobeet",pic:40,id:600});
obj_0322.tVal = new Array(root.getInsName("txt0322p1",root.parseKitWorld));
obj_0322.cardArr = dungobeetDeck;
obj_0323 = new Object({eType:"aBattle",name:"grasshop",pic:39,id:601});
obj_0323.tVal = new Array(root.getInsName("txt0323p1",root.parseKitWorld));
obj_0323.cardArr = grasshopDeck;
obj_0324 = new Object({eType:"npc",name:"brutus",pic:57});
obj_0324.tVal = new Array(root.getInsName("txt0324p1",root.parseKitWorld),root.getInsName("txt0324p2",root.parseKitWorld),root.getInsName("txt0324p3",root.parseKitWorld));
obj_0325 = new Object({eType:"npc",name:"cathy",pic:60});
obj_0325.tVal = new Array(root.getInsName("txt0325p1",root.parseKitWorld),root.getInsName("txt0325p2",root.parseKitWorld),root.getInsName("txt0325p3",root.parseKitWorld));
obj_0326 = new Object({eType:"npc",name:"childA",pic:45});
obj_0326.tVal = new Array(root.getInsName("txt0326p1",root.parseKitWorld),root.getInsName("txt0326p2",root.parseKitWorld),root.getInsName("txt0326p3",root.parseKitWorld));
obj_0327 = new Object({eType:"npc",name:"childB",pic:46});
obj_0327.tVal = new Array(root.getInsName("txt0327p1",root.parseKitWorld),root.getInsName("txt0327p2",root.parseKitWorld),root.getInsName("txt0327p3",root.parseKitWorld));
obj_0328 = new Object({eType:"npc",name:"healer",pic:5});
obj_0328.tVal = new Array(root.getInsName("txt0328p1",root.parseKitWorld),root.getInsName("txt0328p2",root.parseKitWorld),root.getInsName("txt0328p3",root.parseKitWorld));
obj_0329 = new Object({eType:"npc",name:"magma",pic:56});
obj_0329.tVal = new Array(root.getInsName("txt0329p1",root.parseKitWorld),root.getInsName("txt0329p2",root.parseKitWorld),root.getInsName("txt0329p3",root.parseKitWorld));
obj_0330 = new Object({eType:"npc",name:"manA",pic:15});
obj_0330.tVal = new Array(root.getInsName("txt0330p1",root.parseKitWorld),root.getInsName("txt0330p2",root.parseKitWorld),root.getInsName("txt0330p3",root.parseKitWorld));
obj_0331 = new Object({eType:"npc",name:"manB",pic:16});
obj_0331.tVal = new Array(root.getInsName("txt0331p1",root.parseKitWorld),root.getInsName("txt0331p2",root.parseKitWorld),root.getInsName("txt0331p3",root.parseKitWorld));
obj_0332 = new Object({eType:"npc",name:"manC",pic:18});
obj_0332.tVal = new Array(root.getInsName("txt0332p1",root.parseKitWorld),root.getInsName("txt0332p2",root.parseKitWorld),root.getInsName("txt0332p3",root.parseKitWorld));
obj_0333 = new Object({eType:"npc",name:"monk",pic:49});
obj_0333.tVal = new Array(root.getInsName("txt0333p1",root.parseKitWorld),root.getInsName("txt0333p2",root.parseKitWorld),root.getInsName("txt0333p3",root.parseKitWorld));
obj_0334 = new Object({eType:"npc",name:"officier",pic:24});
obj_0334.tVal = new Array(root.getInsName("txt0334p1",root.parseKitWorld),root.getInsName("txt0334p2",root.parseKitWorld),root.getInsName("txt0334p3",root.parseKitWorld));
obj_0335 = new Object({eType:"npc",name:"womanA",pic:14});
obj_0335.tVal = new Array(root.getInsName("txt0335p1",root.parseKitWorld),root.getInsName("txt0335p2",root.parseKitWorld),root.getInsName("txt0335p3",root.parseKitWorld));
obj_0336 = new Object({eType:"npc",name:"womanB",pic:50});
obj_0336.tVal = new Array(root.getInsName("txt0336p1",root.parseKitWorld),root.getInsName("txt0336p2",root.parseKitWorld),root.getInsName("txt0336p3",root.parseKitWorld));
obj_0337 = new Object({eType:"npc",name:"womanC",pic:51});
obj_0337.tVal = new Array(root.getInsName("txt0337p1",root.parseKitWorld),root.getInsName("txt0337p2",root.parseKitWorld),root.getInsName("txt0337p3",root.parseKitWorld));
obj_0338 = new Object({eType:"mBattle",name:"invectidCommander",id:402});
obj_0339 = new Object({eType:"mBattle",name:"invectidDriver",id:408});
obj_0340 = new Object({eType:"mBattle",name:"invectidSoldier",id:400});
obj_0341 = new Object({eType:"mBattle",name:"invectidTrooper",id:406});
obj_0341 = new Object({eType:"mBattle",name:"invectidWarrior",id:404});
obj_0343 = new Object({eType:"aBattle",name:"magma",pic:56,id:502});
obj_0343.tVal = new Array(root.getInsName("txt0343p1",root.parseKitWorld));
obj_0343.cardArr = magmaDeck;
obj_0344 = new Object({eType:"aBattle",name:"beerain",pic:59,id:603});
obj_0344.tVal = new Array(root.getInsName("txt0344p1",root.parseKitWorld));
obj_0344.cardArr = beerainDeck;
obj_0345 = new Object({eType:"aBattle",name:"dungobeet",pic:40,id:600});
obj_0345.tVal = new Array(root.getInsName("txt0345p1",root.parseKitWorld));
obj_0345.cardArr = dungobeetDeck;
obj_0346 = new Object({eType:"aBattle",name:"grasshop",pic:39,id:601});
obj_0346.tVal = new Array(root.getInsName("txt0346p1",root.parseKitWorld));
obj_0346.cardArr = grasshopDeck;
obj_0400 = new Object({eType:"npc",name:"brutus",pic:57});
obj_0400.tVal = new Array(root.getInsName("txt0400p1",root.parseKitWorld),root.getInsName("txt0400p2",root.parseKitWorld),root.getInsName("txt0400p3",root.parseKitWorld));
obj_0401 = new Object({eType:"npc",name:"cathy",pic:60});
obj_0401.tVal = new Array(root.getInsName("txt0401p1",root.parseKitWorld),root.getInsName("txt0401p2",root.parseKitWorld),root.getInsName("txt0401p3",root.parseKitWorld));
obj_0402 = new Object({eType:"npc",name:"magma",pic:56});
obj_0402.tVal = new Array(root.getInsName("txt0402p1",root.parseKitWorld),root.getInsName("txt0402p2",root.parseKitWorld),root.getInsName("txt0402p3",root.parseKitWorld));
obj_0403 = new Object({eType:"npc",name:"monk",pic:49});
obj_0403.tVal = new Array(root.getInsName("txt0403p1",root.parseKitWorld),root.getInsName("txt0403p2",root.parseKitWorld),root.getInsName("txt0403p3",root.parseKitWorld));
obj_0404 = new Object({eType:"npc",name:"woodman",pic:8});
obj_0404.tVal = new Array(root.getInsName("txt0404p1",root.parseKitWorld),root.getInsName("txt0404p2",root.parseKitWorld),root.getInsName("txt0404p3",root.parseKitWorld));
obj_0405 = new Object({eType:"mBattle",name:"assassinBee",id:308});
obj_0406 = new Object({eType:"mBattle",name:"chiggerwigz",id:304});
obj_0407 = new Object({eType:"mBattle",name:"chompede",id:307});
obj_0408 = new Object({eType:"mBattle",name:"clampray",id:314});
obj_0409 = new Object({eType:"mBattle",name:"hopfopper",id:310});
obj_0410 = new Object({eType:"mBattle",name:"greatNastyTat",id:303});
obj_0411 = new Object({eType:"mBattle",name:"smallNastyTat",id:302});
obj_0412 = new Object({eType:"mBattle",name:"pinchmite",id:306});
obj_0413 = new Object({eType:"mBattle",name:"pinchpounce",id:309});
obj_0414 = new Object({eType:"mBattle",name:"punchHopper",id:311});
obj_0415 = new Object({eType:"mBattle",name:"buzzbit",id:301});
obj_0416 = new Object({eType:"mBattle",name:"invectidChampion",id:403});
obj_0417 = new Object({eType:"mBattle",name:"invectidCommander",id:402});
obj_0418 = new Object({eType:"mBattle",name:"invectidDarkFlying",id:405});
obj_0419 = new Object({eType:"mBattle",name:"invectidDriver",id:408});
obj_0420 = new Object({eType:"mBattle",name:"invectidFlying",id:401});
obj_0421 = new Object({eType:"mBattle",name:"invectidSoldier",id:400});
obj_0422 = new Object({eType:"mBattle",name:"invectidWarrior",id:404});
obj_0423 = new Object({eType:"aBattle",name:"aquine",pic:31,id:602});
obj_0423.tVal = new Array(root.getInsName("txt0423p1",root.parseKitWorld));
obj_0423.cardArr = aquineDeck;
obj_0424 = new Object({eType:"aBattle",name:"beerain",pic:59,id:603});
obj_0424.tVal = new Array(root.getInsName("txt0424p1",root.parseKitWorld));
obj_0424.cardArr = beerainDeck;
obj_0425 = new Object({eType:"aBattle",name:"grasshop",pic:39,id:601});
obj_0425.tVal = new Array(root.getInsName("txt0425p1",root.parseKitWorld));
obj_0425.cardArr = grasshopDeck;
obj_0427 = new Object({eType:"npc",name:"brutus",pic:57});
obj_0427.tVal = new Array(root.getInsName("txt0427p1",root.parseKitWorld),root.getInsName("txt0427p2",root.parseKitWorld),root.getInsName("txt0427p3",root.parseKitWorld));
obj_0428 = new Object({eType:"npc",name:"cathy",pic:60});
obj_0428.tVal = new Array(root.getInsName("txt0428p1",root.parseKitWorld),root.getInsName("txt0428p2",root.parseKitWorld),root.getInsName("txt0428p3",root.parseKitWorld));
obj_0429 = new Object({eType:"npc",name:"childA",pic:45});
obj_0429.tVal = new Array(root.getInsName("txt0429p1",root.parseKitWorld),root.getInsName("txt0429p2",root.parseKitWorld),root.getInsName("txt0429p3",root.parseKitWorld));
obj_0430 = new Object({eType:"npc",name:"childB",pic:46});
obj_0430.tVal = new Array(root.getInsName("txt0430p1",root.parseKitWorld),root.getInsName("txt0430p2",root.parseKitWorld),root.getInsName("txt0430p3",root.parseKitWorld));
obj_0431 = new Object({eType:"npc",name:"dungobeet",pic:40});
obj_0431.tVal = new Array(root.getInsName("txt0431p1",root.parseKitWorld),root.getInsName("txt0431p2",root.parseKitWorld),root.getInsName("txt0431p3",root.parseKitWorld));
obj_0432 = new Object({eType:"npc",name:"magma",pic:56});
obj_0432.tVal = new Array(root.getInsName("txt0432p1",root.parseKitWorld),root.getInsName("txt0432p2",root.parseKitWorld),root.getInsName("txt0432p3",root.parseKitWorld));
obj_0433 = new Object({eType:"npc",name:"monk",pic:49});
obj_0433.tVal = new Array(root.getInsName("txt0433p1",root.parseKitWorld),root.getInsName("txt0433p2",root.parseKitWorld),root.getInsName("txt0433p3",root.parseKitWorld));
obj_0434 = new Object({eType:"mBattle",name:"assassinBee",id:308});
obj_0435 = new Object({eType:"mBattle",name:"chiggerwigz",id:304});
obj_0436 = new Object({eType:"mBattle",name:"chompede",id:307});
obj_0437 = new Object({eType:"mBattle",name:"greatNastyTat",id:303});
obj_0438 = new Object({eType:"mBattle",name:"smallNastyTat",id:302});
obj_0440 = new Object({eType:"mBattle",name:"pinchmite",id:306});
obj_0441 = new Object({eType:"mBattle",name:"buzzbit",id:301});
obj_0442 = new Object({eType:"mBattle",name:"invectidChampion",id:403});
obj_0443 = new Object({eType:"mBattle",name:"invectidCommander",id:402});
obj_0444 = new Object({eType:"mBattle",name:"invectidDarkFlying",id:405});
obj_0445 = new Object({eType:"mBattle",name:"invectidDriver",id:408});
obj_0446 = new Object({eType:"mBattle",name:"invectidFlying",id:401});
obj_0447 = new Object({eType:"mBattle",name:"invectidSoldier",id:400});
obj_0448 = new Object({eType:"mBattle",name:"invectidWarrior",id:404});
obj_0449 = new Object({eType:"aBattle",name:"aquine",pic:31,id:602});
obj_0449.tVal = new Array(root.getInsName("txt0449p1",root.parseKitWorld));
obj_0449.cardArr = aquineDeck;
obj_0450 = new Object({eType:"aBattle",name:"beerain",pic:59,id:603});
obj_0450.tVal = new Array(root.getInsName("txt0450p1",root.parseKitWorld));
obj_0450.cardArr = beerainDeck;
obj_0451 = new Object({eType:"aBattle",name:"stag",pic:58,id:604});
obj_0451.tVal = new Array(root.getInsName("txt0451p1",root.parseKitWorld));
obj_0451.cardArr = stagDeck;
obj_0500 = new Object({eType:"npc",name:"corona",pic:13});
obj_0500.tVal = new Array(root.getInsName("txt0500p1",root.parseKitWorld),root.getInsName("txt0500p2",root.parseKitWorld),root.getInsName("txt0500p3",root.parseKitWorld));
obj_0501 = new Object({eType:"npc",name:"igneous",pic:27});
obj_0501.tVal = new Array(root.getInsName("txt0501p1",root.parseKitWorld),root.getInsName("txt0501p2",root.parseKitWorld),root.getInsName("txt0501p3",root.parseKitWorld));
obj_0502 = new Object({eType:"mBattle",name:"assassinBee",id:308});
obj_0503 = new Object({eType:"mBattle",name:"chiggerwigz",id:304});
obj_0504 = new Object({eType:"mBattle",name:"chompede",id:307});
obj_0505 = new Object({eType:"mBattle",name:"clampray",id:314});
obj_0506 = new Object({eType:"mBattle",name:"gasplash",id:315});
obj_0507 = new Object({eType:"mBattle",name:"hopfopper",id:310});
obj_0508 = new Object({eType:"mBattle",name:"sector",id:318});
obj_0509 = new Object({eType:"mBattle",name:"pinchmite",id:306});
obj_0510 = new Object({eType:"mBattle",name:"pinchpounce",id:309});
obj_0511 = new Object({eType:"mBattle",name:"poisonousFlower",id:201});
obj_0512 = new Object({eType:"mBattle",name:"punchHopper",id:311});
obj_0513 = new Object({eType:"mBattle",name:"schoolWeewogs",id:313});
obj_0514 = new Object({eType:"mBattle",name:"talonpole",id:316});
obj_0515 = new Object({eType:"mBattle",name:"talonpole",id:316});
obj_0516 = new Object({eType:"mBattle",name:"invectidChampion",id:403});
obj_0517 = new Object({eType:"mBattle",name:"invectidDriver",id:408});
obj_0518 = new Object({eType:"mBattle",name:"invectidSoldier",id:400});
obj_0519 = new Object({eType:"mBattle",name:"invectidTrooper",id:406});
obj_0520 = new Object({eType:"mBattle",name:"invectidWarrior",id:404});
obj_0521 = new Object({eType:"mBattle",name:"shumdigger",id:312});
obj_0522 = new Object({eType:"aBattle",name:"aquine",pic:31,id:602});
obj_0522.tVal = new Array(root.getInsName("txt0522p1",root.parseKitWorld));
obj_0522.cardArr = aquineDeck;
obj_0523 = new Object({eType:"aBattle",name:"dungobeet",pic:40,id:600});
obj_0523.tVal = new Array(root.getInsName("txt0523p1",root.parseKitWorld));
obj_0523.cardArr = dungobeetDeck;
obj_0524 = new Object({eType:"aBattle",name:"beerain",pic:59,id:603});
obj_0524.tVal = new Array(root.getInsName("txt0524p1",root.parseKitWorld));
obj_0524.cardArr = beerainDeck;
obj_0600 = new Object({eType:"npc",name:"brutus",pic:57});
obj_0600.tVal = new Array(root.getInsName("txt0600p1",root.parseKitWorld),root.getInsName("txt0600p2",root.parseKitWorld),root.getInsName("txt0600p3",root.parseKitWorld));
obj_0601 = new Object({eType:"npc",name:"dungobeet",pic:40});
obj_0601.tVal = new Array(root.getInsName("txt0601p1",root.parseKitWorld),root.getInsName("txt0601p2",root.parseKitWorld),root.getInsName("txt0601p3",root.parseKitWorld));
obj_0602 = new Object({eType:"npc",name:"magma",pic:56});
obj_0602.tVal = new Array(root.getInsName("txt0602p1",root.parseKitWorld),root.getInsName("txt0602p2",root.parseKitWorld),root.getInsName("txt0602p3",root.parseKitWorld));
obj_0603 = new Object({eType:"mBattle",name:"chompede",id:307});
obj_0604 = new Object({eType:"mBattle",name:"clampray",id:314});
obj_0605 = new Object({eType:"mBattle",name:"gasplash",id:315});
obj_0606 = new Object({eType:"mBattle",name:"hopfopper",id:310});
obj_0607 = new Object({eType:"mBattle",name:"sector",id:318});
obj_0608 = new Object({eType:"mBattle",name:"punchHopper",id:311});
obj_0609 = new Object({eType:"mBattle",name:"talonpole",id:316});
obj_0610 = new Object({eType:"mBattle",name:"sector",id:318});
obj_0611 = new Object({eType:"mBattle",name:"gasplash",id:315});
obj_0612 = new Object({eType:"mBattle",name:"invectidChampion",id:403});
obj_0613 = new Object({eType:"mBattle",name:"invectidCommander",id:402});
obj_0614 = new Object({eType:"mBattle",name:"invectidStagSoldier",id:407});
obj_0615 = new Object({eType:"mBattle",name:"chompede",id:307});
obj_0616 = new Object({eType:"mBattle",name:"spinedKrail",id:317});
obj_0617 = new Object({eType:"aBattle",name:"aquine",pic:31,id:602});
obj_0617.tVal = new Array(root.getInsName("txt0617p1",root.parseKitWorld));
obj_0617.cardArr = aquineDeck;
obj_0618 = new Object({eType:"aBattle",name:"beerain",pic:59,id:603});
obj_0618.tVal = new Array(root.getInsName("txt0618p1",root.parseKitWorld));
obj_0618.cardArr = beerainDeck;
obj_0619 = new Object({eType:"aBattle",name:"buguese",pic:38,id:605});
obj_0619.tVal = new Array(root.getInsName("txt0619p1",root.parseKitWorld));
obj_0619.cardArr = bugueseDeck;
obj_0620 = new Object({eType:"aBattle",name:"grasshop",pic:39,id:601});
obj_0620.tVal = new Array(root.getInsName("txt0620p1",root.parseKitWorld));
obj_0620.cardArr = grasshopDeck;
obj_0621 = new Object({eType:"aBattle",name:"stag",pic:58,id:604});
obj_0621.tVal = new Array(root.getInsName("txt0621p1",root.parseKitWorld));
obj_0621.cardArr = stagDeck;
obj_0622 = new Object({eType:"mBattle",name:"aquineMonster",id:614});
obj_0623 = new Object({eType:"mBattle",name:"bugueseMonster",id:613});
obj_0624 = new Object({eType:"mBattle",name:"scarab",id:615});
if(root.playerStats.guild == 1)
{
   startX = 33;
   startY = 37;
   gotoAndStop("spr_bkg41");
   play();
}
else if(root.playerStats.guild == 2)
{
   startX = 17;
   startY = 27;
   gotoAndStop("spr_bkg42");
   play();
}
else if(root.playerStats.guild == 3)
{
   startX = 19;
   startY = 21;
   gotoAndStop("spr_bkg43");
   play();
}
else if(root.playerStats.guild == 4)
{
   startX = 35;
   startY = 21;
   gotoAndStop("spr_bkg46");
   play();
}
