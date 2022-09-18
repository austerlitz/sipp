module SIPP
  WILDCARDS = {
    nil          => '*',
    :unspecified => '*',
  }
  module ExtendedDictionary
    # SIPP-compatible category
    CATEGORY = SIPP::Code::CATEGORY.invert.merge(WILDCARDS)

    # SIPP-compatible body type
    TYPE = SIPP::Code::TYPE.invert.merge(WILDCARDS)

    # Transmission type. SIPP-compatible but extended with robot/tiptronic (I wonder if anyone needs it)
    TRANSMISSION = {
      manual: 'M',
      auto:   'A',
      robot:  'R', # variations of robot/tiptronic etc
    }.merge(WILDCARDS)

    # Drive type. Incompatible with SIPP because the original SIPP is completely weird and more transmission-oriented
    DRIVE = {
      single: 'S',
      front:  'F',
      rear:   'R',
      all:    'A', # AWD
      fwd: 'X', # 4x4
    }.merge(WILDCARDS)

    # Fuel type. Mostly compatible with SIPP but you know... Made more human-guessable
    FUEL = {
      compressed_gas: "G",
      diesel:         "D",
      electric:       "E",
      electric_plus:  "C",
      ethanol:        "U",
      hybrid:         "H",
      hybrid_plug_in: "I",
      hydrogen:       "A",
      multi_fuel:     "M",
      petrol:         "P",
    }.merge(WILDCARDS)

    # Most probably is subject to change in the future
    # Surprisingly is compatible with SIPP
    AC = {
      multi_zone: 'M',
      present:    'A',
      absent:     'N',
      false       => 'N',
      true        => 'A',
      air:        'A',
      no_air:     'N',
    }.merge(WILDCARDS)

  end
end

