var respond = function(

var initSlides = function(data) {
  for(i=0; i<3; i++) {
    currentImg = $("#sl_img" + i);
    currentImg.css("background-image", 'url("' + data[i].pic_url) + '")';
    images.push(currentImg);
  }

  images[0].addClass("sl-display");
  images[1].addClass("sl-right");
  images[2].addClass("sl-right");

  var currentPos = 0;
  var maxPos = data.length;
  var images = [];
  var leftCtl = $(".left");
  var rightCtl = $(".right");

  respond();
}

function mainPagesReady() {
  slidesImg = $.getJSON('json/get_slideshow_imgs', function(data) {
    initSlides(data);
  });
  // $('.slideshow-all-images img')
}

$(document).ready(mainPagesReady);
$(document).on("page:load", mainPagesReady);
