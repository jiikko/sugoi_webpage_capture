module SugoiWebpageCapture
  class Browser
    include Capybara::DSL

    BROWSERS = {
      firefox: { ua: "", browser: :firefox, size: [1024, 768] },
      chrome:  { ua: "", browser: :chrome, size: [1024, 768] },
      iphone5: {
        ua: "Mozilla/5.0 (iPod touch; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12A365 Safari/600.1.4",
        browser: :chrome,
        size:[320, 568],
        required_profile: true
      },
      iphone6: {
        ua: "Mozilla/5.0 (iPod touch; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12A365 Safari/600.1.4",
        browser: :chrome,
        size: [375, 667],
        required_profile: true
      },
    }

    def initialize(browser_name = :firefox)
      @browser_name = browser_name
      init
    end

    def capture(captured_url, &block)
      Capybara.reset_sessions!
      page.current_window.resize_to(*BROWSERS[@browser_name][:size])
      @screenshot = Screenshot.new(Tempfile.new(["ss", ".png"]))
      visit captured_url
      yield(self) if block_given?
      capture_with_retry
      @screenshot
    end

    def quit
      @screenshot.tempfile.unlink if @screenshot
    end

    private

    def init
      raise("not found browser") unless BROWSERS.key?(@browser_name)
      Capybara.run_server = false
      Capybara.register_driver(@browser_name) do |app|
        Capybara::Selenium::Driver.new(app, opts)
      end
      Capybara.current_driver = @browser_name
    end

    def opts
      h = { browser: BROWSERS[@browser_name][:browser] }
      if BROWSERS[@browser_name][:required_profile]
        h.merge!(args: ["--user-agent=#{BROWSERS[@browser_name][:ua]}"])
      end
      h
    end

    def capture_with_retry(retry_counter = 0)
      page.driver.save_screenshot(@screenshot.tempfile, full: true) # TODO Chtome full size capture
    rescue Selenium::WebDriver::Error::UnknownError => e
      # puts e.message
      # puts e.backtrace.join("\n")
      retry_counter = retry_counter + 1
      if retry_counter <= 5
        print "."
        retry
      else
        puts 'count over.'
      end
    end
  end
end
