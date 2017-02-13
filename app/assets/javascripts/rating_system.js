$.rating_system = function() {
  var ratingDesc = {
    1: "horrible",
    2: "very bad",
    3: "bad",
    4: "OK",
    5: "average",
    6: "not bad",
    7: "good",
    8: "very good",
    9: "amazing",
    10: "masterpiece"
  };

  var highlightStar = function(number) {

  }

  $('input.rating').each(function() {
    elemID = $(this).attr("id");
    label = $('<label class="star-border-only">');
    label.attr("for", elemID);
    $(this).before(label);
  });
  $('input.rating').hide();

  $('input.rating').each(function() {
    checked = $(this).attr('checked');
    if(checked) {
      console.log('FOUND');
    }
  });

  $('label.star-border-only').hover(function() {
    $(this).addClass('star-filled');
    $(this).prevAll('label.star-border-only').addClass('star-filled');
    $(this).nextAll('label.star-border-only').removeClass('star-filled');
    ratingVal = $(this).next().attr("value");
    $('.rating-num').text(ratingVal);
    $('.rating-description').text("(" + ratingDesc[ratingVal] + ")");
  });

  $('#star-rating').mouseout(function() {
    $('label.star-border-only').removeClass('star-filled');
  });
}
