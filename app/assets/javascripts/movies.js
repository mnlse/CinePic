function ready(){
    $.rating_system()
    $('.dropdown-toggle-btn').click(function() {
      $('.rate-movie-dropdown').toggleClass("hidden");
      $('.star-img').toggleClass("hidden");
    });
}; 

$(document).ready(ready)
$(document).on("page:load", ready);
