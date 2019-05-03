# har-viewer

Service to render HAR as html.

## Install

* `brew install crystal`
* `git clone https://github.com/weaming/har-viewer && cd har-viewer`
* `shards build -v --release && mv ./bin/har-viewer /usr/local/bin`

## Usage

```
xhr-viewer <path-of-har>|<command>

commands
    serve <port>  : serve http
```

## About `.har`

* [json_mapping](https://github.com/NeuraLegion/har/blob/master/src/har/json_mapping.cr)
* [.har wikipedia](https://en.wikipedia.org/wiki/.har)



## Contributing

1. Fork it (<https://github.com/weaming/har-viewer/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Rebuild automatically after code saved
    1. `brew install watchexec`
    2. `make watch`
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [weaming](https://github.com/weaming) - creator and maintainer
