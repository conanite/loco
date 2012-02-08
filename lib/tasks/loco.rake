namespace :loco do
  @exclude = [
              /^db\/schema.rb/,
              /^db\/epg_timetable.yml/,
              /^db\/backups/,
              /^vendor/,
              /^public\/system/,
              /^public\/images/,
              /^public\/stylesheets/,
              /^tmp/,
              /^coverage/,
              /^log/,
              /^doc/,
              /^script/,
              /^stories/,
              /^static/,
              /^public\/fonts/,
              /\.#.+/,
              /\.png/,
              /\.pdf/,
              /\.ico/,
              /lib\/tasks\/.+\.txt/,
              /^README/,
              /^Gemfile.lock/,
              /^public\/javascripts\/jquery/
            ]

  def exclude? path
    @exclude.each { |regex|
      if path =~ regex
        return true
      end
    }
    false
  end

  def align x
    x.to_s.rjust(8, " ")
  end

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
  end

  def analyse_loc regexp
    @stats = []
    @exts = Hash.new { |h, k| h[k] = 0 }
    @ext_lines = Hash.new { |h, k| h[k] = 0 }
    @sizes = Hash.new { |h, k| h[k] = [] }
    total_lines = 0

    Dir.glob("#{Rails.root}/**/*").each do |full_path|
      unless File.stat(full_path).directory?
        path = full_path.sub(Rails.root.to_s + "/", '')
        unless exclude?(path) || !regexp.match(path)
          s = Stats.new(path)
          @stats << s
          @exts[File.extname(path)] += 1
          @ext_lines[File.extname(path)] += s.lines
          @sizes[s.lines] << path
          total_lines += s.lines
        end
      end
    end

    total = @stats.size
    @stats = @stats.sort { |a, b| b.lines <=> a.lines }
    @stats = @stats[0..30] if @stats.size > 30

    puts "\n### longest files ###"
    @stats.each { |s| puts s }

    puts "\n### distribution ###"
    @sizes = @sizes.to_a.sort { |a, b|
      a[0] <=> b[0]
    }

    @sizes.each { |size, files|
      puts "#{align size} lines #{align files.size} #{"*" * files.size}"
    }

    puts "\n### extensions ###"
    @exts.each { |ext, count| puts "#{align ext} - #{align count} files, #{align @ext_lines[ext]} lines"}

    puts "\n### Total #{regexp.inspect} : #{total} files, #{total_lines} lines, #{"%.3f" % (1.0 * total_lines / total)} avg loc per file ###"
  end

  desc "show loc for all files"
  task(:all) { analyse_loc /.*/ }

  desc "show loc for all .js files"
  task(:js) { analyse_loc /.*\.js$/ }

  desc "show loc for all .rb files"
  task(:rb) { analyse_loc /.*\.rb$/ }

  desc "show loc for all .haml files"
  task(:haml) { analyse_loc /.*\.haml$/ }

  desc "show loc for all app/** files"
  task(:app) { analyse_loc /^app\// }

  desc "show loc for all spec/** files"
  task(:spec) { analyse_loc /^spec\// }

  desc "show loc for all app/models/epg/** files"
  task(:epg) { analyse_loc /^app\/models\/epg\// }

end

task :loco => "loco:all"


