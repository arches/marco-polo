# marco-polo

MarcoPolo shows your app name and environment in your console prompt so you don't accidentally break production

Officially supporting IRB (standard rails console) and pry (via pry-rails gem).

## Installation

    In your Gemfile: gem "marco-polo"
    $ bundle install
  
**Note:** if you're using pry, make sure to list marco-polo AFTER pry-rails in your gemfile!
  
## Usage

There's nothing to do! Just install the gem and bask in your newfound console security.

Before marco-polo:

    ~/Sites/myapp$ rails c
    >

    ~/Sites/myapp$ heroku run console -a myapp
    >

After marco-polo: 

    ~/Sites/myapp$ rails c
    myapp(dev)>
  
    ~/Sites/myapp$ heroku run console -a myapp
    myapp(prod)>

## Customize app name by ENV

You can customize app name by `MARCO_POLO_APP_NAME` environment variable. In order to customize app name, define this environment variable then run your application.

    $ MARCO_POLO_APP_NAME=app_name rails c

If your application is running on Heroku, set this environment variable by `heroku config:set` command.

    $ heroku config:set MARCO_POLO_APP_NAME=app_name

## Secret Feature (IRB only): custom .irbrc

The central mechanism of marco-polo is adding a `require` flag to the rails command that's starting IRB,
using it to require a file that changes the prompt. It will also let you load your own irbrc, to set up
any console tools you like! And since this file is required after your app is required, you can use all
your app objects inside it.

For example, one of my projects uses the sentient_user gem to help assign
actors to all our papertrail events. Papertrail works great in my app code, but I always forget
to set User.current when I'm in the console. Solution? Prompt myself to "log in" when my console
loads.

    print "Who are you? "
    email = gets.chomp.downcase
    user = User.find_by_email(email)
    user.make_current
    PaperTrail.whodunnit = user

This code lives in a file called `.irbrc.rb` in my project root and is automatically loaded into my console
by marco-polo.

## Self Promotion

If you like MarcoPolo, help spread the word! Tell your friends, or at the very least star the repo on github.

For more console goodness, check out http://github.com/arches/table_print
