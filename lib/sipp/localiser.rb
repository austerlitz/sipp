module SIPP
  module Localiser
    def translate(scope, item)
      I18n.translate("sipp.#{scope}.#{item}")
    end
    alias_method :t, :translate
  end
end
