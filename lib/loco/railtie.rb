require 'loco'
require 'rails'
module Loco
  class Railtie < Rails::Railtie
    rake_tasks do
      load "tasks/loco.rake"
    end
  end
end
