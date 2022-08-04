require 'sipp/dictionary'

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
      CATEGORY[code[0]]
    rescue CategoryError => e
      nil
    end

    def type
      validate_type
      TYPE[code[1]]
    rescue TypeError => e
      nil
    end

    def transmission_drive
      validate_transmission_drive
      TRANSMISSION_DRIVE[code[2]]
    rescue TransmissionDriveError => e
      nil
    end

    def transmission
      validate_transmission_drive
      TRANSMISSION[code[2]]
    rescue TransmissionDriveError => e
      nil
    end

    def transmission_manual?
      validate_transmission_drive
      'Manual' == transmission ? true : false # TODO fix magic string
    rescue TransmissionDriveError => e
      nil
    end

    def transmission_auto?
      validate_transmission_drive
      'Auto' == transmission ? true : false # TODO fix magic string
    rescue TransmissionDriveError => e
      nil
    end

    def drive
      validate_transmission_drive
      DRIVE[code[2]]
    rescue TransmissionDriveError => e
      nil
    end

    def fuel_ac
      validate_fuel_ac
      FUEL_AC[code[3]]
    rescue FuelACError => e
      nil
    end

    def fuel
      validate_fuel_ac
      FUEL[code[3]]
    rescue FuelACError => e
      nil
    end

    def ac
      validate_fuel_ac
      AC[code[3]]
    rescue FuelACError => e
      nil
    end

    def ac?
      validate_fuel_ac
      'Air' == ac ? true : false # TODO fix magic string
    rescue FuelACError => e
      nil
    end

    def to_s
      [category, type, transmission_drive, fuel_ac].join(' - ') if valid?
    end

    private

    def validate_code
      if @code.blank? || 4 != @code.length
        raise CodeError, :invalid_code
      else
        true
      end
    end

    def validate_category
      if @code[0].blank? || !CATEGORY.keys.include?(@code[0])
        raise CategoryError, :invalid_category
      else
        true
      end
    end

    def validate_type
      if @code[1].blank? || !TYPE.keys.include?(@code[1])
        raise TypeError, :invalid_type
      else
        true
      end
    end

    def validate_transmission_drive
      if @code[2].blank? || !TRANSMISSION_DRIVE.keys.include?(@code[2])
        raise TransmissionDriveError, :invalid_transmission_drive
      else
        true
      end
    end

    def validate_fuel_ac
      if @code[3].blank? || !FUEL_AC.keys.include?(@code[3])
        raise FuelACError, :invalid_fuel_ac
      else
        true
      end
    end
  end
end
