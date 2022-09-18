module SIPP
  module Dictionary
    CATEGORY = {
      'M' => :mini,
      'N' => :mini_elite,
      'E' => :economy,
      'H' => :economy_elite,
      'C' => :compact,
      'D' => :compact_elite,
      'I' => :intermediate,
      'J' => :intermediate_elite,
      'S' => :standard,
      'R' => :standard_elite,
      'F' => :fullsize,
      'G' => :fullsize_elite,
      'P' => :premium,
      'U' => :premium_elite,
      'L' => :luxury,
      'W' => :luxury_elite,
      'O' => :oversize,
      'X' => :special,
    }

    TYPE = {
      'B' => :two_three_door,
      'C' => :two_four_door,
      'D' => :four_five_door,
      'W' => :wagon_estate,
      'V' => :passenger_van,
      'L' => :limousine_sedan,
      'S' => :sport,
      'T' => :convertible,
      'F' => :suv,
      'J' => :open_air_all_terrain,
      'X' => :special,
      'P' => :pick_up_2_door,
      'Q' => :pick_up_4_door,
      'Z' => :special_offer_car,
      'E' => :coupe,
      'M' => :monospace,
      'R' => :recreational_vehicle,
      'H' => :motor_home,
      'Y' => :two_wheel_vehicle,
      'N' => :roadster,
      'G' => :crossover,
      'K' => :commercial,
    }

    TRANSMISSION_DRIVE = {
      'M' => :manual_unspecified_drive,
      'N' => :manual_4wd,
      'C' => :manual_awd,
      'A' => :auto_unspecified_drive,
      'B' => :auto_4wd,
      'D' => :auto_awd,
    }
    TRANSMISSION       = {
      'M' => :manual,
      'N' => :manual,
      'C' => :manual,
      'A' => :auto,
      'B' => :auto,
      'D' => :auto,
    }

    DRIVE = {
      'M' => :unspecified,
      'N' => :four_wd,
      'C' => :awd,
      'A' => :unspecified,
      'B' => :four_wd,
      'D' => :awd,
    }

    FUEL_AC = {
      'R' => :unspecified_air,
      'N' => :unspecified_no_air,
      'D' => :diesel_air,
      'Q' => :diesel_no_air,
      'H' => :hybrid_air,
      'I' => :hybrid_plug_in_air,
      'E' => :electric_air,
      'C' => :electric_plus_air,
      'L' => :compressed_gas_air,
      'S' => :compressed_gas_no_air,
      'A' => :hydrogen_air,
      'B' => :hydrogen_no_air,
      'M' => :multi_fuel_air,
      'F' => :multi_fuel_no_air,
      'V' => :petrol_air,
      'Z' => :petrol_no_air,
      'U' => :ethanol_air,
      'X' => :ethanol_no_air
    }

    FUEL = {
      'R' => :unspecified,
      'N' => :unspecified,
      'D' => :diesel,
      'Q' => :diesel,
      'H' => :hybrid,
      'I' => :hybrid_plug_in,
      'E' => :electric,
      'C' => :electric_plus,
      'L' => :compressed_gas,
      'S' => :compressed_gas,
      'A' => :hydrogen,
      'B' => :hydrogen,
      'M' => :multi_fuel,
      'F' => :multi_fuel,
      'V' => :petrol,
      'Z' => :petrol,
      'U' => :ethanol,
      'X' => :ethanol
    }

    AC = {
      'R' => :air,
      'N' => :no_air,
      'D' => :air,
      'Q' => :no_air,
      'H' => :air,
      'I' => :air,
      'E' => :air,
      'C' => :air,
      'L' => :air,
      'S' => :no_air,
      'A' => :air,
      'B' => :no_air,
      'M' => :air,
      'F' => :no_air,
      'V' => :air,
      'Z' => :no_air,
      'U' => :air,
      'X' => :no_air
    }
  end
end

