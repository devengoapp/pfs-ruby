# frozen_string_literal: true

module PFS
  module Resources
    module Validations
      class Bic < Base
        map :bic
        map :valid
        map :sct_inst_supported
      end
    end
  end
end
