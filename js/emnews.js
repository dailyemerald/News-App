function fixHardStyles() {

  var wpcaptions = document.getElementsByClassName('wp-caption');
  for(var i=0;i<wpcaptions.length;i++) {
    wpcaptions[i].removeAttribute("height");
    wpcaptions[i].removeAttribute("width");
    wpcaptions[i].removeAttribute("style");
  }
  
  var imgs = document.getElementsByTagName('img');
  for(var i=0;i<imgs.length;i++) {
    imgs[i].removeAttribute("height");
    imgs[i].removeAttribute("width");
  }

}