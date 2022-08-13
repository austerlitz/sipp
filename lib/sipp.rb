require "sipp/version"

require "sipp/localiser"
module SIPP
  Error                  = Class.new StandardError
  CodeError              = Class.new Error
  CategoryError          = Class.new Error
  TypeError              = Class.new Error
  TransmissionDriveError = Class.new Error
  FuelACError            = Class.new Error

  class SIPPCodeWrapper
    include Localiser

    def initialize(symbol)
      @sym = symbol
    end

    def to_s
      t klass_name, @sym
    end

    def klass_name
      self.class.name.split('::').last
          .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
          .gsub(/([a-z\d])([A-Z])/, '\1_\2')
          .tr(' ', '_')
          .downcase
    end

    def to_sym
      @sym
    end

    def as_json
      { klass_name.to_sym => @sym }
    end
  end

  Category          = Class.new SIPPCodeWrapper
  Type              = Class.new SIPPCodeWrapper
  TransmissionDrive = Class.new SIPPCodeWrapper
  Transmission      = Class.new SIPPCodeWrapper
  Drive             = Class.new SIPPCodeWrapper
  FuelAC            = Class.new SIPPCodeWrapper
  Fuel              = Class.new SIPPCodeWrapper
  Ac                = Class.new SIPPCodeWrapper
end
require "sipp/code"
require "sipp/dictionary"
require 'i18n'
I18n.load_path << Dir[File.expand_path("lib/config/locales") + "/*.yml"]
# I18n.available_locales = [:en, :ru]