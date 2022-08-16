require 'sipp/dictionary'
require 'sipp/localiser'

module SIPP
  class Code
    include Dictionary

    attr_reader :code

    def initialize(code = nil)
      @code = code.to_s.strip.upcase

    end

    def validate!
      validate_code &&
        validate_category &&
        validate_type &&
        validate_transmission_drive &&
        validate_fuel_ac
    end

    def valid?
      validate!
    rescue CodeError, CategoryError, TypeError, TransmissionDriveError, FuelACError
      false
    end

    def category
      validate_category
      Category.new CATEGORY[code[0]]
    rescue CategoryError => e
      nil
    end

    def type
      validate_type
      Type.new TYPE[code[1]]
    rescue TypeError => e
      nil
    end

    def transmission_drive
      validate_transmission_drive
      TransmissionDrive.new TRANSMISSION_DRIVE[code[2]]
    rescue TransmissionDriveError => e
      nil
    end

    def transmission
      validate_transmission_drive
      Transmission.new TRANSMISSION[code[2]]
    rescue TransmissionDriveError => e
      nil
    end

    def transmission_manual?
      validate_transmission_drive
      :manual == transmission.to_sym ? true : false
    rescue TransmissionDriveError => e
      nil
    end

    def transmission_auto?
      validate_transmission_drive
      :auto == transmission.to_sym ? true : false
    rescue TransmissionDriveError => e
      nil
    end

    def drive
      validate_transmission_drive
      Drive.new DRIVE[code[2]]
    rescue TransmissionDriveError => e
      nil
    end

    def fuel_ac
      validate_fuel_ac
      FuelAC.new FUEL_AC[code[3]]
    rescue FuelACError => e
      nil
    end

    def fuel
      validate_fuel_ac
      Fuel.new FUEL[code[3]]
    rescue FuelACError => e
      nil
    end

    def ac
      validate_fuel_ac
      Ac.new AC[code[3]]
    rescue FuelACError => e
      nil
    end

    def ac?
      validate_fuel_ac
      :air == ac.to_sym ? true : false
    rescue FuelACError => e
      nil
    end

    def to_s
      [category, type, transmission_drive, fuel_ac].map{|c| c.nil? ? '#N/A' : c}.join(' - ')
    rescue CodeError, CategoryError, TypeError, TransmissionDriveError, FuelACError
      ''
    end

    def as_json(options = nil)
      [category, type, transmission, drive, fuel, ac].compact.map(&:as_json).inject(&:merge).merge({code: @code})
    end

    private

    def validate_code
      if !@code || @code.empty? || 4 != @code.length
        raise CodeError, :invalid_code
      else
        true
      end
    end

    def validate_category
      if !@code[0] || @code[0].empty? || !CATEGORY.keys.include?(@code[0])
        raise CategoryError, :invalid_category
      else
        true
      end
    end

    def validate_type
      if !@code[1] || @code[1].empty? || !TYPE.keys.include?(@code[1])
        raise TypeError, :invalid_type
      else
        true
      end
    end

    def validate_transmission_drive
      if !@code[2] || @code[2].empty? || !TRANSMISSION_DRIVE.keys.include?(@code[2])
        raise TransmissionDriveError, :invalid_transmission_drive
      else
        true
      end
    end

    def validate_fuel_ac
      if !@code[3] || @code[3].empty? || !FUEL_AC.keys.include?(@code[3])
        raise FuelACError, :invalid_fuel_ac
      else
        true
      end
    end
  end
end
