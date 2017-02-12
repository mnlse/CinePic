function ready(){                   // Start when document ready
    $('#star-rating').rating(); // Call the rating plugin
    $('.rate-movie-btn').click(function() {
      $('.rate-movie-dropdown').toggleClass("hidden");
      $('.star-img').toggleClass("hidden");
    });
}; 

$(document).ready(ready)
$(document).on("page:load", ready);
