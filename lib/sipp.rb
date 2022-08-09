require "sipp/version"

module SIPP
  class Error < StandardError; end
  class CodeError < StandardError; end
  class CategoryError < StandardError; end
  class TypeError < StandardError; end
  class TransmissionDriveError < StandardError; end
  class FuelACError < StandardError; end
  # Your code goes here...
end

require 'active_support/core_ext/object'
require "sipp/code"
require "sipp/dictionary"
I18n.load_path += Dir[File.expand_path("lib/config/locales") + "/*.yml"]
# I18n.available_locales = [:en, :ru]