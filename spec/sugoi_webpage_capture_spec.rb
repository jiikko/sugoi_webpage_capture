require 'spec_helper'

describe SugoiWebpageCapture do
  it 'has a version number' do
    expect(SugoiWebpageCapture::VERSION).not_to be nil
  end

  describe "webdriber" do
    context 'firefox' do
      describe 'within' do
        it 'be success' do
          screenshot = SugoiWebpageCapture::Screenshot.new
          tempfile = screenshot.capture("http://search.yahoo.co.jp") do |x|
            x.fill_in 'yschsp', with: "あげぽよ"
            x.find(".b").click
          end
          expect(tempfile).to be_a Tempfile
          expect(Capybara.current_driver).to eq :selenium
        end
      end

      it 'be success' do
        screenshot = SugoiWebpageCapture::Screenshot.new
        expect(screenshot.capture("http://google.com")).to be_a Tempfile
        expect(Capybara.current_driver).to eq :selenium
      end
    end

    context 'chrome' do
      it 'be success' do
        screenshot = SugoiWebpageCapture::Screenshot.new(browser: :chrome)
        expect(Capybara.current_driver).to eq :selenium_chrome
        expect(screenshot.capture("http://google.com")).to be_a Tempfile
      end
    end
  end
end
