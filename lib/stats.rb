module Loco
  class Stats
    attr_accessor :path, :lines
    def initialize(path)
      @path = path
      @lines = count_lines(path)
    end

    def count_lines path
      File.read(path).split(/\n/).inject(0) {|sum, line| sum + (line.blank? ? 0 : 1) }
    end

    def to_s
      "#{align lines} #{path}"
    end

    def matches options
      options[:size].blank? || (options[:size] == lines)
    end
  end
end
