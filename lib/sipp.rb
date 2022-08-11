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
      t self.class.name.split('::').last.underscore, @sym
    end

    def to_sym
      @sym
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
require 'active_support/core_ext/object'
require "sipp/code"
require "sipp/dictionary"
I18n.load_path << Dir[File.expand_path("lib/config/locales") + "/*.yml"]
# I18n.available_locales = [:en, :ru]