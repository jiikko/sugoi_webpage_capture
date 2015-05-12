# SugoiWebpageCapture
Simple webpage capture, using selenium.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sugoi_webpage_capture'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sugoi_webpage_capture

## Usage

```ruby
require "sugoi_webpage_capture"
captured_url = "http://google.com"

browser = SugoiWebpageCapture::Browser.new
screenshot = browser.capture(captured_url) # return tempfile wrapper instance.
screenshot.path # /var/tmp.........
browser.quit

browser = SugoiWebpageCapture::Browser.new(:iphone5)
screenshot = browser.capture(captured_url)
screenshot.path
browser.quit

# require Xvfb
screenshot = SugoiWebpageCapture::Browser.new(
    browser: :firefox,
    options: { headless: true }
  )
screenshot = browser.capture(captured_url)
screenshot.path
browser.quit
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/sugoi_webpage_capture/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
