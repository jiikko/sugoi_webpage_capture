module SugoiWebpageCapture
  class Screenshot
    attr_reader :tempfile

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
