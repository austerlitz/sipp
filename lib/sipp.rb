require "sipp/version"

module Sipp
  class Error < StandardError; end
  class CodeError < StandardError; end
  class CategoryError < StandardError; end
  class TypeError < StandardError; end
  class TransmissionError < StandardError; end
  class FuelACError < StandardError; end
  # Your code goes here...
end

require 'active_support/all'
require "sipp/code"
require "sipp/dictionary"