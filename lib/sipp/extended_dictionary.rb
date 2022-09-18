module SIPP
  WILDCARDS = {
    :unspecified => '*',
    nil          => '*',
  }
  module ExtendedDictionary
    # SIPP-compatible category
    CATEGORY = SIPP::Code::CATEGORY.invert.merge(WILDCARDS)

    # SIPP-compatible body type
    TYPE = SIPP::Code::TYPE.invert.merge(WILDCARDS)

    # Transmission type. Incompatible with SIPP
    TRANSMISSION = {
      manual: 'M',
      auto:   'A',
      robot:  'R', # variations of robot/tiptronic etc
    }.merge(WILDCARDS)

    # Drive type. Incompatible with SIPP
    DRIVE = {
      single: 'S',
      front:  'F',
      rear:   'R',
      all:    'A', # AWD
      fwd: 'X', # 4x4
    }.merge(WILDCARDS)

    # Fuel type. Patrly compatible with SIPP but you know...
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
    AC = {
      air:        'A',
      no_air:     'N',
      multi_zone: 'M',
      present:    'A',
      absent:     'N',
      false       => 'N',
      true        => 'A',
    }.merge(WILDCARDS)

  end
end

