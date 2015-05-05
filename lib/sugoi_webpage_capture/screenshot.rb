module SugoiWebpageCapture
  attr_reader :tempfile

  class Screenshot
    def initialize(tempfile)
      @tempfile = tempfile
    end

    def unlink
      @tempfile.unlink
    end

    def path
      @tempfile.path
    end
  end
end
