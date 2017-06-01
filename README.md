# Tickle
  Tickle is a pricing engine that calculates the price of insurance from the company TICKLE given a user's age, gender, and existing conditions.

## Installation
To install, add this line to your application's Gemfile:

```ruby
gem 'tickle', path: 'path_to_engine'
```
For example, in development if Tickle and your application are both located on your desktop, then the line added to your Gemfile would look like the following:

```ruby
gem 'tickle', path: '../tickle'
```

And then execute for your application:
```bash
bundle install
```
## Usage
  To make Tickle available in your application, add the following line to the config/routes.rb file of your application:

  ```ruby
  mount Tickle::Engine, at: "/tickle"
  ```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Design Decisions

Tickle is a mountable engine. It was created as an engine instead of a full-stack application to take advantage of PolicyGenius' already existing platform and make it easy to get an MVP up and running or remove it from the application in case TICKLE does not succeed in the future. Everything, including views, are packaged into the engine to make it inclusive of both the front-end and the back-end. Tickle is a mountable engine because of its isolated namespace, which will avoid conflicting routes if the application needs to grow. It also has its own CSS properties to avoid overlap with the already existing application.
