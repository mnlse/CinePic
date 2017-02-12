function ready(){
    $('.rate-movie-btn').click(function() {
      $('.rate-movie-dropdown').toggleClass("hidden");
      $('.star-img').toggleClass("hidden");
    });
}; 

$(document).ready(ready)
$(document).on("page:load", ready);
