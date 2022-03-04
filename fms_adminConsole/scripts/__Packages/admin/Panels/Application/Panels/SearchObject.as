class admin.Panels.Application.Panels.SearchObject
{
   function SearchObject(a, b)
   {
      this.selectionStartPt = a;
      this.selectionEndPt = b;
   }
   function set startPt(i)
   {
      this.selectionStartPt = i;
   }
   function get startPt()
   {
      return this.selectionStartPt;
   }
   function set endPt(i)
   {
      this.selectionEndPt = i;
   }
   function get endPt()
   {
      return this.selectionEndPt;
   }
}
