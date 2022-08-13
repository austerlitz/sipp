require "sipp/version"

module SIPP
  Error = Class.new StandardError
  CodeError = Class.new Error
  CategoryError = Class.new Error
  TypeError = Class.new Error
  TransmissionDriveError = Class.new Error
  FuelACError = Class.new Error

end

require 'active_support/core_ext/object'
require "sipp/code"
require "sipp/dictionary"
I18n.load_path += Dir[File.expand_path("lib/config/locales") + "/*.yml"]
# I18n.available_locales = [:en, :ru]