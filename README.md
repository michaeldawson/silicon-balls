# Silicon Balls website

### Getting started
First, your environment will need to be setup for Ruby on Rails development. That's a little beyond the scope of this readme, but this [guide](http://railsapps.github.io/installrubyonrails-mac.html) seems to be a good start.

Once you have a Ruby/Rails environment:
* Pull down the repository: `git clone git@github.com:michaeldawson/silicon-balls.git`
* Move into the new folder: `cd silicon-balls`
* Run `bundle install` to install ruby dependencies
* Run `bundle exec rake db:setup` to setup the database
* Run `bundle exec rails server` to start the dev server
* Visit the app at http://localhost:3000

### Running the application
You'll want mailcatcher running to see emails that are sent:
`gem install mailcatcher`
`mailcatcher`
Then, go to http://localhost:1080/
