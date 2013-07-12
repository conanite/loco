require "loco/version"
require "loco/stats"
require "loco/counter"

module Loco
  require 'loco/railtie' if defined?(Rails)
end
