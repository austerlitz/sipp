require 'sipp/extended_dictionary'
module SIPP

  class Extended
    include ExtendedDictionary

      def self.generate(capabilities)
        capabilities = capabilities.inject({}) do |caps, (k, v)|
          val = v.respond_to?(:to_sym) ? v.to_sym : v
          caps[k&.to_sym] = val
          caps
        end
        category = CATEGORY[capabilities[:category]]
        type = TYPE[capabilities[:type]]
        transmission = TRANSMISSION[capabilities[:transmission]]
        drive = DRIVE[capabilities[:drive]]
        fuel = FUEL[capabilities[:fuel]]
        ac = AC[capabilities[:ac]]
        capabilities[:bags_big] = capabilities.delete(:bags) unless capabilities[:bags].nil?
        %i[doors seats bags_big bags_small].each do |cap|
          capabilities[cap] = nil if :unspecified == capabilities[cap]
        end

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
                  .ljust(10, '*') # pad everything absent as :unspecified
    end



    def category
      Category.new CATEGORY.invert[code[0]]
    end

    def type
      Type.new TYPE.invert[code[1]]
    end

    def transmission
      Transmission.new TRANSMISSION.invert[code[2]]
    end
    def drive
      Drive.new DRIVE.invert[code[3]]
    end
    def fuel
      Fuel.new FUEL.invert[code[4]]
    end
    def ac
      Ac.new AC.invert[code[5]]
    end
    def doors
      result = code[6]&.to_i
      if result.zero?
        :unspecified
      else
        result
      end
    end
    def seats
      result = code[7]&.to_i
      if result.zero?
        :unspecified
      else
        result
      end
    end
    def bags
      result = code[8]&.to_i
      if result.zero?
        :unspecified
      else
        result
      end
    end
    alias_method :bags_big, :bags
    def bags_small
      result = code[9]&.to_i
      if result.zero?
        :unspecified
      else
        result
      end
    end

    def to_s
      [
        category, type, transmission, drive, fuel, ac,
        doors, seats, bags_big, bags_small,
      ].join(Code::SEPARATOR)
    end

    def as_json(options = nil)

      [category, type, transmission, drive, fuel, ac].compact.map(&:as_json).inject(&:merge).merge(
        {
          doors: doors,
          seats: seats,
          bags_big: bags,
          bags_small: bags_small
        })
    end
  end
end
