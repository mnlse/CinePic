$.star_rating = function() {
  ratingDesc = {
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

  $('input.rating').each(function() {
    elemID = $(this).attr("id");
    label = $('<label class="star-border-only">');
    label.attr("for", elemID);
    $(this).before(label);
  });
  $('input.rating').hide();

  $('label.star-border-only').hover(function() {
    $(this).toggleClass('star-filled');
    $(this).prevAll('label.star-border-only').toggleClass('star-filled');
    ratingVal = $(this).next().attr("value");
    $('.rating-num').text(ratingVal);
    $('.rating-description').text("(" + ratingDesc[ratingVal] + ")");
  });
}
