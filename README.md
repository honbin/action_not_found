# ActionNotFound
This is a Rails plugin to see not found action.

## Usage
In your Gemfile.

```ruby
group :development do
  gem "action_not_found"
end
```

and execute rake task `action_not_found`.

```sh
examples GET  /examples(.:format) examples#index
examples GET  /examples(.:format) examples#index
         POST /examples(.:format) examples#create #=> not found action
   tests GET  /tests(.:format)    tests#index #=> not found controller file
    root      /                   examples#index

4 routes, 1 not found actions, 1 not controller files
```
