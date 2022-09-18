require 'sipp/extended_dictionary'
module SIPP

  class Extended
    include ExtendedDictionary

      def self.generate(capabilities)
        category = CATEGORY[capabilities[:category]]
        type = TYPE[capabilities[:type]]
        transmission = TRANSMISSION[capabilities[:transmission]]
        drive = DRIVE[capabilities[:drive]]
        fuel = FUEL[capabilities[:fuel]]
        ac = AC[capabilities[:ac]]

        [
          category, type, transmission, drive, fuel, ac,
          capabilities[:doors],
          capabilities[:seats],
          (capabilities[:bags_big] || capabilities[:bags]),
          capabilities[:bags_small],
        ].map{|cap| cap || '*'}.join
      end


    attr_reader :code
    def initialize(code = nil)
      @code = code.to_s.strip.upcase
    end
  end
end
