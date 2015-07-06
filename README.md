# Simple ToDo Application 

## The application is using elasticsearch for search, so make sure that's [installed](https://github.com/ankane/searchkick) and running or else it won't work. Running brew install elasticsearch and running sudo elasticsearch start from the command line, then "rake searchkick:reindex CLASS=Task" should do the trick. 
=======

## From there do the typical rake db:create db:migrate and rails s, then have fun creating a small todo list. 
## Happy coding