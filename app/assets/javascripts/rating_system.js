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

  var sel = {
    dropdown: '.rate-movie-dropdown',
    cont: '#star-rating',
    star: 'label.star.border-only.interactive',
    radio: 'input.rating',
    num: '.rating-num',
    desc: '.rating-description',
    thoughts: '.thoughts-cont',
    btns: '.rating-dropdown-btns',
    saveBtn: '.rating-save',
    cancelBtn: '.rating-cancel'
  };
  var cls = {
    star: 'star',
    borderOnly: 'border-only',
    filled: 'filled',
    interactive: 'interactive',
    hidden: 'hidden'
  };

  var clickedRating = null;
  var initialRating = null;
  var bottomShown = false;

  // Highlights a star
  var addHL = function(number) {
    var hs = $(`${sel.cont} ${sel.star}`).eq(number - 1);
    hs.addClass(cls.filled);
    hs.prevAll(sel.star).addClass(cls.filled);
    hs.nextAll(sel.star).removeClass(cls.filled);
    $(sel.num).text(number);
    $(sel.desc).text("(" + ratingDesc[number] + ")");
  };

  // Clears all highlights
  var clearHL = function() {
    $(sel.star).removeClass(cls.filled);
  };

  // Hides textarea input, "thoughts" label
  var bottom = function(action) {
    if(action === "show" && bottomShown === false) {
      $(sel.thoughts).removeClass(cls.hidden);
      $(sel.btns).removeClass(cls.hidden);
      bottomShown = !bottomShown;
    } else if(action === "hide" && bottomShown === true) {
      $(sel.thoughts).addClass(cls.hidden);
      $(sel.btns).addClass(cls.hidden);
      bottomShown = !bottomShown;
    }
  };

  // Initializes the program, adds stars in place of radio inputs
  var init = function() {
    $('input.rating').each(function() {
    var elemID = $(this).attr("id");
    var label = $('<label>').addClass(cls.star).addClass(cls.borderOnly).addClass(cls.interactive);
    label.attr("for", elemID);
    $(this).before(label);
    var checked = $(this).attr("checked");
    if(checked) {
      var rating = $(this).attr("value");
      addHL(rating);
      clickedRating = rating;
      initialRating = rating;
      bottom("show");
    }
    });
    $(sel.radio).hide();
  }

  init();

  // Event listeners:
  $(sel.star).hover(function() {
    var val = $(this).next().attr("value");
    addHL(val);
    $(this).click(function() {
      clickedRating = val;
      bottom("show");
    });
  });

  $('#star-rating').mouseout(function() {
    if(clickedRating) {
      addHL(clickedRating);
    } else {
      $('label.star-border-only').removeClass(cls.filled);
    }
  });

  $(sel.cancelBtn).click(function() {
    $(sel.dropdown).toggleClass(cls.hidden);
    if(initialRating) {
      clearHL();
      addHL(initialRating);
    } else {
      bottom("hide");
      clearHL();
    }
  });
}
