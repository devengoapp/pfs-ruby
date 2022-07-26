# frozen_string_literal: true

module PFS
  module Resources
    module Transfers
      class InternalTransfer < Base
        attr_reader :from,
                    :to
        def initialize(response, attributes = {})
          super(response, attributes)
          @from = InternalTransferFrom.new(response, attributes[:from])
          @to = InternalTransferTo.new(response, attributes[:to])
        end
      end
    end
  end
end
