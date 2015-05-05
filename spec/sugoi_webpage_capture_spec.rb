require 'spec_helper'

describe SugoiWebpageCapture do
  it 'has a version number' do
    expect(SugoiWebpageCapture::VERSION).not_to be nil
  end

  describe "browsers" do
    let(:url) { "http://search.yahoo.co.jp" }
    context 'firefox' do
      describe 'within' do
        it 'be success' do
          screenshot = SugoiWebpageCapture::Browser.new
          tempfile = screenshot.capture(url) do |x|
            x.fill_in 'yschsp', with: "あげぽよ"
            x.find(".b").click
          end
          expect(tempfile).to be_a SugoiWebpageCapture::Screenshot
          expect(Capybara.current_driver).to eq :firefox
        end
      end

      it 'be success' do
        screenshot = SugoiWebpageCapture::Browser.new
        expect(screenshot.capture(url)).to be_a SugoiWebpageCapture::Screenshot
        expect(Capybara.current_driver).to eq :firefox
      end
    end

    context 'iphone5' do
      it 'be success' do
        screenshot = SugoiWebpageCapture::Browser.new(:iphone5)
        expect(Capybara.current_driver).to eq :iphone5
        expect(screenshot.capture(url)).to be_a SugoiWebpageCapture::Screenshot
      end
    end

    context 'chrome' do
      it 'be success' do
        screenshot = SugoiWebpageCapture::Browser.new(:chrome)
        expect(Capybara.current_driver).to eq :chrome
        expect(screenshot.capture(url)).to be_a SugoiWebpageCapture::Screenshot
      end
    end
  end
end
