require 'capybara/dsl'
require "selenium-webdriver"
require "sugoi_webpage_capture/version"
require "sugoi_webpage_capture/screenshot"

module SugoiWebpageCapture
  BROWSERS = {
    firefox: :selenium,
    chrome: :selenium_chrome
  }

  def self.init(browser)
    raise("not found browser") unless BROWSERS.key?(browser)

    Capybara.run_server = false
    Capybara.register_driver BROWSERS[browser] do |app|
      Capybara::Selenium::Driver.new(app, browser: browser)
    end
    Capybara.current_driver = BROWSERS[browser]
  end
end
