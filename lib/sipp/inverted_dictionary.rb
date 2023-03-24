module SIPP
  module InvertedDictionary
    CATEGORY = SIPP::Code::CATEGORY.invert

    TYPE = SIPP::Code::TYPE.invert

    TRANSMISSION_DRIVE = {
      [:manual, :unspecified] => 'M',
      [:manual, :single]      => 'M',
      [:manual, :front]       => 'M',
      [:manual, :rear]        => 'M',
      [:manual, :four_wd]     => 'N',
      [:manual, :awd]         => 'C',
      [:auto, :unspecified]   => 'A',
      [:auto, :single]        => 'A',
      [:auto, :front]         => 'A',
      [:auto, :rear]          => 'A',
      [:auto, :four_wd]       => 'B',
      [:auto, :awd]           => 'D'
    }

    FUEL_AC = {
      [:unspecified, :air]       => 'R',
      [:unspecified, :no_air]    => 'N',
      [:diesel, :air]            => 'D',
      [:diesel, :no_air]         => 'Q',
      [:hybrid, :air]            => 'H',
      [:hybrid_plug_in, :air]    => 'I',
      [:electric, :air]          => 'E',
      [:electric_plus, :air]     => 'C',
      [:compressed_gas, :air]    => 'L',
      [:compressed_gas, :no_air] => 'S',
      [:hydrogen, :air]          => 'A',
      [:hydrogen, :no_air]       => 'B',
      [:multi_fuel, :air]        => 'M',
      [:multi_fuel, :no_air]     => 'F',
      [:petrol, :air]            => 'V',
      [:petrol, :no_air]         => 'Z',
      [:ethanol, :air]           => 'U',
      [:ethanol, :no_air]        => 'X',
    }
  end
end

