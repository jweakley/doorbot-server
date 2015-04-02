# Project Doorbot
Project Doorbot is an open source access control system.

It is current made up of two parts:

- [Doorbot Pi](https://github.com/jweakley/doorbot-pi)
- [Doorbot Server](https://github.com/jweakley/doorbot-server)

## Doorbot Server

[![Dependency Status](https://gemnasium.com/jweakley/doorbot-server.svg)](https://gemnasium.com/jweakley/doorbot-server)[![Build Status](https://travis-ci.org/jweakley/doorbot-server.svg?branch=master)](https://travis-ci.org/jweakley/doorbot-server)[![Coverage Status](https://coveralls.io/repos/jweakley/doorbot-server/badge.png)](https://coveralls.io/r/jweakley/doorbot-server)

Doorbot Server is a rails app that serves as the authority on who can access doors.

### Features:
- [x] One click deploy to heroku
- [ ] Straightforward version updating
- [x] Connect any number of Doorbot Pies
- [x] Ability to create different access zones
- [x] Ability to manage access credentials (RFID cards)
- [ ] Ability to setup access schedules

## Want to get this up and running?
[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

## Badge Sources
- [Gemnasium](https://gemnasium.com/) Dependency monitoring.
- [Travis CI](https://travis-ci.com/) Automatic testing.
- [Coveralls](https://coveralls.io/) Code coverage.

## Gems Used
### Production & Development
- [thin](https://github.com/macournoyer/thin/) Webserver. May switch to unicorn.
- [devise](https://github.com/plataformatec/devise) User authentication.
- [pundit](https://github.com/elabs/pundit) User authorization.
- [twitter-bootstrap-rails](https://github.com/seyhunak/twitter-bootstrap-rails) Twitter bootstrap for rails. Adds css and html to make things look good.
- [haml-rails](https://github.com/indirect/haml-rails) Adds [haml](https://github.com/haml/haml) generators to rails. Alternative to ERB (Embedded RuBy).
- [responders](https://github.com/plataformatec/responders) A set of Rails responders.
- [kaminari](https://github.com/amatsuda/kaminari) Solution for pagination.
- [paper_trail](https://github.com/airblade/paper_trail) Solution for tracking who did what.

### Development and Testing
- [pry-rails](https://github.com/rweng/pry-rails): Causes Rails console to open Pry as an irb alternative.
- [pry-buybug](https://github.com/deivid-rodriguez/pry-byebug): Uses [Buybug](https://github.com/deivid-rodriguez/byebug) as an alternative to [debugger](https://github.com/cldwalker/debugger) for Ruby >= 2.0.
- [rspec-rails](https://github.com/rspec/rspec-rails): Uses rspec testing framework instead of the default.
- [spring-commands-rspec](https://github.com/jonleighton/spring-commands-rspec): `rspec` command for [spring](https://github.com/rails/spring).
- [factory\_girl\_rails](https://github.com/thoughtbot/factory_girl_rails) Adds [factory-girl](https://github.com/thoughtbot/factory_girl) to rails as an alternative to fixtures for generating test data.
- [simplecov](https://github.com/colszowka/simplecov) Code coverage tool.
- [annotate](https://github.com/ctran/annotate_models) Annotates ActiveRecord models with schema summary.
- [better_errors](https://github.com/charliesome/better_errors) Replaces standard Rails error page with better information.
- [brakeman](https://github.com/presidentbeef/brakeman) A static analysis security vulnerability scanner.
- [rubocop](https://github.com/bbatsov/rubocop) A Ruby static code analyzer.
- [ruby-git](https://github.com/schacon/ruby-git) Used to turn commit messages into changelog summaries.
