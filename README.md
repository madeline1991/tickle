# Tickle
Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'tickle'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install tickle
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Design Decisions

Tickle is a mountable engine. It was created as an engine instead of a full-stack application to take advantage of PolicyGenius' already existing platform and make it easy to get an MVP up and running or remove it from the application in case TICKLE does not succeed in the future. Everything, including views, are packaged into engine to make it inclusive of both the front-end and the back-end. Tickle is a mountable engine because of its isolated namespace. As it grows, having an isolated namespace will help avoid conflicts of routes in the future. It also has its own css properties to help avoid overlap with the already existing application. 
