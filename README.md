# marco-polo

MarcoPolo shows your app name and environment in your console prompt so you don't accidentally break production

## Installation

    In your Gemfile: gem "marco-polo", "~> 1.0"
    $ bundle install
  
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

## Help!

So far this has been verified on:

    Ruby Version | Rails Version
    -------------|---------------
    1.9.3        | 3.2           
                 | 4.0
    2.0.0        | 3.2
                 | 4.0

If you're using it with different versions please let me know so we can
fill out this table. Tweet me @archslide or submit a PR to update this README.
If it doesn't work for you please file a bug instead. Thanks everyone!

## Secret Feature: custom .irbrc

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
