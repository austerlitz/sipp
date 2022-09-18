require 'sipp/inverted_dictionary'
module SIPP
  class Inverted
    include InvertedDictionary

      def self.generate(capabilities)
        category = CATEGORY[capabilities[:category]]
        type = TYPE[capabilities[:type]]
        transmission_drive = TRANSMISSION_DRIVE[[capabilities[:transmission], (capabilities[:drive] || :unspecified)]]
        fuel_ac = FUEL_AC[[(capabilities[:fuel] || :unspecified), capabilities[:ac]]]

        [category, type, transmission_drive, fuel_ac].map{|cap| cap || '*'}.join
      end
  end
end
