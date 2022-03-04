on(press){
   totalPage = game.inventory.length / 8;
   if(totalPage > 1 && page <= totalPage)
   {
      page++;
      game.showInventory(page);
   }
}
