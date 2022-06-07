# frozen_string_literal: true

module PFS
  module Resources
    module Transfers
      class Transfer < Base
        attr_accessor :bankPaymentReferenceId

        alias payment_reference_id bankPaymentReferenceId
      end
    end
  end
end
