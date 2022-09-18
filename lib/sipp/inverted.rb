require 'sipp/inverted_dictionary'
module SIPP
  class Inverted
    include InvertedDictionary

      def self.generate(capabilities)
        category = CATEGORY[capabilities[:category]] || '*'
        type = TYPE[capabilities[:type]] || '*'
        transmission_dive = TRANSMISSION_DRIVE[[capabilities[:transmission], (capabilities[:drive] || :unspecified)]] || '*'
        fuel_ac = FUEL_AC[[(capabilities[:fuel] || :unspecified), capabilities[:ac]]] || '*'

        [category, type, transmission_dive, fuel_ac].join
      end
  end
end
