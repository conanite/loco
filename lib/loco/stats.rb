# -*- coding: utf-8 -*-

module Loco
  class Stats
    include Loco::Util

    attr_accessor :path, :lines

    def initialize(path)
      @path = path
      @lines = File.file?(path) ? count_lines(path) : 0
    end

    def blank? str
      str.nil? || str.strip == ""
    end

    def count_lines path
      File.read(path).split(/\n/).inject(0) {|sum, line| sum + (blank?(line) ? 0 : 1) }
    rescue Exception => e
      puts "ERROR: reading #{path}: #{e.message}"
      puts ""
      puts "consider adding this line to your .loco:"
      puts ""
      puts "Loco::Counter::EXCLUDE << /^#{path.gsub /\//, "\\/"}/"
      puts ""
      0
    end

    def to_s
      "#{align lines} #{path}"
    end

    def matches options
      options[:size].nil? || (options[:size] == lines)
    end
  end
end
