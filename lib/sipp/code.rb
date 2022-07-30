require 'sipp/dictionary'

module Sipp
  class Code
    include Dictionary

    attr_reader :code

    def initialize(code = nil)
      @code = code.to_s.upcase

    end

    def validate!
      validate_code &&
      validate_category &&
      validate_type &&
      validate_transmission &&
      validate_fuel_ac
    end

    def valid?
      validate!
    rescue CodeError, CategoryError, TypeError, TransmissionError, FuelACError
      false
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

    def validate_transmission
      if @code[2].blank? || !TRANSMISSION.keys.include?(@code[2])
        raise TransmissionError, :invalid_transmission
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
