module Loco
  module Util
    def align x
      x.to_s.rjust(8, " ")
    end
  end
end
