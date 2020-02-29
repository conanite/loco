module Loco
  class Counter
    include Loco::Util

    EXCLUDE = [
               /\.sqlite3/,
               /\.gem/,
               /^db\/schema.rb/,
               /^db\/backups/,
               /^db\/migrate/,
               /^vendor/,
               /^public\/system/,
               /^public\/images/,
               /^public\/stylesheets/,
               /^config\/newrelic.yml/,
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
               /\.pdf$/,
               /\.ico/,
               /lib\/tasks\/.+\.txt/,
               /^README/,
               /^Gemfile.lock/,
               /^public\/javascripts\/jquery/
              ]

    PATTERNS = {
      :all       =>  { :pattern => /.*/               },
      :js        =>  { :pattern => /.*\.js$/          },
      :rb        =>  { :pattern => /.*\.rb$/          },
      :haml      =>  { :pattern => /.*\.haml$/        },
      :views     =>  { :pattern => /^app\/views\//    },
      :app       =>  { :pattern => /^app\//           },
      :models    =>  { :pattern => /^app\/models\//   },
      :migrations=>  { :pattern => /^db\/migrate\//   },
      :spec      =>  { :pattern => /^spec\//          },
      :empty     =>  { :pattern => /.*/, :size => 0   },
      :size      =>  { :pattern => /.*/, :size => ENV["SIZE"].to_i }
    }

    def exclude? path
      EXCLUDE.each { |regex|
        if path =~ regex
          return true
        end
      }
      false
    end

    def analyse_command command=nil
      command ||= :all
      analyse_loc PATTERNS[command.to_sym]
    end

    def analyse_loc opts={ }
      regexp = opts[:pattern]
      @stats = []
      @exts = Hash.new { |h, k| h[k] = 0 }
      @ext_lines = Hash.new { |h, k| h[k] = 0 }
      @sizes = Hash.new { |h, k| h[k] = [] }
      total_lines = 0

      here = File.expand_path "."
      Dir.glob("#{here}/**/*").each do |full_path|
        unless File.stat(full_path).directory?
          path = full_path.sub("#{here}/", '')
          unless exclude?(path) || !regexp.match(path)
            s = Stats.new(path)
            if s.matches(opts)
              @stats << s
              @exts[File.extname(path)] += 1
              @ext_lines[File.extname(path)] += s.lines
              @sizes[s.lines] << path
              total_lines += s.lines
            end
          end
        end
      end

      puts "\n### extensions ###"
      @exts.each { |ext, count| puts "#{align ext} - #{align count} files, #{align @ext_lines[ext]} lines"}

      puts "\n### distribution ###"
      @sizes = @sizes.to_a.sort { |a, b|
        a[0] <=> b[0]
      }

      @sizes.each { |size, files|
        puts "#{align size} lines #{align files.size} #{"*" * files.size}"
      }

      total = @stats.size
      @stats = @stats.sort { |a, b| b.lines <=> a.lines }
      @stats = @stats[0..50] if @stats.size > 50

      puts "\n### longest files ###"
      @stats.each { |s| puts s }

      puts "\n### Total #{regexp.inspect} : #{total} files, #{total_lines} lines, #{"%.3f" % (1.0 * total_lines / total)} avg loc per file ###"
    end
  end
end


def self.load_dot_loco
end
