function moviesReady(){
    $.rating_system()
    $('.dropdown-toggle-btn').click(function() {
      $('.rate-movie-dropdown').toggleClass("hidden");
      $('.star-img').toggleClass("hidden");
    });
}; 

$(document).ready(moviesReady)
$(document).on("page:load", moviesReady);
