
module SugoiWebpageCapture
  class Screenshot
    include Capybara::DSL

    def initialize(browser: :firefox)
      SugoiWebpageCapture.init(browser)
    end

    def capture(captured_url)
      page.current_window.resize_to(1024, 768)

      tempfile = Tempfile.new(["ss", ".png"])
      visit captured_url
      # TODO Chtome full size capture
      page.driver.save_screenshot(tempfile, full: true)
      tempfile
    end
  end
end
