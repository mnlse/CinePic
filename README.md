# README

Cinema website

## Site functionality

* user system (devise)
* users are able to rate and review movies (jQuery star rating system - written by me)
* every user has a profile page
* admin can put articles written by users onto the front page
* movie ratings are calculated using arithmetic average
* style is customizable via `/app/assets/stylesheets/_variables.scss`

## TODO

* Make the search icon .svg (for some reason it doesn't render)

---
## Important considerations

### for the user

* A movie's runtime cannot be longer than 24 hours (author doesn't think of it as necessary in the next 15 years)
* There are four types of users:  
    * "user" - regular user
    * "janitor" - can remove comments
    * "moderator" - modify user profiles, ban users, modify reviews
    * "admin" - modify articles, approve articles to front page, access to control panel, grant privileges to other users

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

## Credits 
* _All_ of the graphics have been made by me (InkScape)

Inspiration:
* www.filmweb.pl
* www.imdb.com
* www.studiogang.com
* www.rottentomatoes.com
