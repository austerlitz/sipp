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
      CATEGORY[code[0]] if valid?
    end

    def type
      TYPE[code[1]] if valid?
    end

    def transmission_drive
      TRANSMISSION_DRIVE[code[2]] if valid?
    end

    def transmission
      TRANSMISSION[code[2]] if valid?
    end

    def transmission_manual?
      if valid?
        'Manual' == transmission ? true : false # TODO fix magic string
      else
        nil
      end
    end
    def transmission_auto?
      if valid?
        'Auto' == transmission ? true : false # TODO fix magic string
      else
        nil
      end
    end
    def drive
      DRIVE[code[2]] if valid?
    end

    def fuel_ac
      FUEL_AC[code[3]] if valid?
    end

    def fuel
      FUEL[code[3]] if valid?
    end

    def ac
      AC[code[3]] if valid?
    end

    def ac?
      if valid?
        'Air' == ac ? true : false # TODO fix magic string
      else
        nil
      end
    end

    def to_s
      [category, type, transmission_drive, fuel_ac].join(' - ')
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
