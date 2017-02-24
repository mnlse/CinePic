# README

Cinema website

## Site functionality

* slideshow with dynamically loaded images to reduce network bandwidth usage
* user system (devise)
* users are able to rate and review movies
* every user has a profile page
* admin can put articles written by users onto the front page
* movie ratings are calculated using arithmetic average
* style is customizable via `/app/assets/stylesheets/base/variables.scss`

## TODO

* Make the search icon .svg (for some reason it doesn't render)
* Add dynamic slideshow rendering
* Add responsive people panel via <span>Vue</span>.js
* Add search bar functionality
* Create a simple integrated forums

---
## Important considerations

### for the user

* A movie's runtime cannot be longer than 24 hours (author doesn't think of it as necessary in the next 15 years)
* There are four types of users:  
    * "user" - regular user
    * "janitor" - can remove comments
    * "moderator" - modify user profiles, ban users, modify reviews
    * "admin" - modify articles, approve articles to front page, access to control panel, grant privileges to other users
* Slideshow images have an approximately 2.51 width to height ratio. I've used 1920x762px images(arbitrary).  
<a href="https://www.codecogs.com/eqnedit.php?latex=\frac{1920}{762}&space;\approx&space;2.51" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\frac{1920}{762}&space;\approx&space;2.51" title="\frac{1920}{762} \approx 2.51" /></a>

### for the programmer

#### Trivia
there are 3 types of Trivia based on context:   
**"general"**(displayed on front page), **"movie"**(displayed on movie page),
**"person"**(displayed on person page - actor/director etc.).
When declaring a new Trivium: (`@triv = Trivium.new` => `@triv.context = "general"`)  
The types are represented in the database as integers, and are defined in the Trivium model (`app/models/trivium.rb`)

#### Other
* movie people (actors, directors, writers etc.) are implemented via `Person` model that `has_many` roles.
* `PmRelationship` stands for *Person - Movie* relationship where a Person can be a (director, writer etc.) for a Movie  
* `UserRelationship` is a relationship between two Users - (`user_a` and `user_b`) and can take the form of: `friendship`, `block`, `friend_request`  
   When `block` - `user_a` is blocking `user_b`.   
   `friend_request` - `user_a` has sent a friend req to `user_b`.  
* Slideshow API is done via "Json" controller, accessible via route `/json/get_slideshow_imgs`

## Credits 
* All of the rails code has been written by me (except the gems and mentioned below)
* The integrated & responsive star-rating system has been written by me (jQuery)  
    `app/assets/javascripts/rating_system.js`
* The dynamic slideshow has been written by me (jQuery)  
    `app/assets/javascripts/main_pages.js.erb`
* _All_ of the graphics have been made by me (InkScape)

    ---
Made by other people and used here:
* URL validator regex http://stackoverflow.com/questions/1128168/validation-for-url-domain-using-regex-rails

Inspiration sites:
* www.filmweb.pl
* www.imdb.com
* www.studiogang.com
* www.rottentomatoes.com
