# Sitnsell INTERNAL GEM
# Shipstation API Rubygem

The easiest and most complete rubygem for [Shipstation](https://www.shipstation.com). Currently supports [API V1](https://www.shipstation.com/docs/api).

## Installation

Add this line to your application's Gemfile:

    gem 'shipstation', github: "sitnsell/shipstation"

And then execute:

    $ bundle

## Usage

To access the API, you'll need to create a `Shipstation::Client` and pass in your API keys. You can find your API keys at [https://https://ship7.shipstation.com/settings/apis](https://ship7.shipstation.com/settings/api)

```ruby
client = Shipstation::Client.new(api_key: ENV["API_KEY"], api_secret: ENV["API_SECRET"])
```

The client then gives you access to each of the resources.

## Resources

The gem maps as closely as we can to the Shipstation API so you can easily convert API examples to gem code.

Responses are created as objects like `Shipstation::Account`. Having types like `Shipstation::User` is handy for understanding what type of object you're working with. They're built using OpenStruct so you can easily access data in a Ruby-ish way.

##### Pagination

 `list` endpoints return pages of results. The result object will have a `data` key to access the results, as well as metadata like `pages` and `page` for retrieving the next and previous pages. You may also specify the

```ruby
results = client.orders.list(per_page: 5)
#=> Shipstation::Collection

results.total
#=> 48

results.data
#=> [#<Shipstation::Application>, #<Shipstation::Application>]

results.next_cursor
#=> "bmV4dF9fMTU="

# Retrieve the next page
client.applications.list(per_page: 5, cursor: results.next_cursor)
#=> Shipstation::Collection
```

### Account

```ruby
client.account.info
```