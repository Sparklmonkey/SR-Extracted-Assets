for(var i in this)
{
   removeMovieClip(this[i]);
   delete this[i];
}
prevFrame();
