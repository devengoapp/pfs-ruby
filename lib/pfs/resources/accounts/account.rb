# frozen_string_literal: true

module PFS
  module Resources
    module Accounts
      class Account < Base
        attr_reader :info,
                    :holder

        map :currencies, :currencies

        def initialize(response, attributes = {})
          super(response, attributes)
          @holder = AccountHolder.new(response, attributes.dig(:accountInfo, :cardholder))
          @info = AccountInfo.new(response, attributes.dig(:accountInfo, :card))
        end
      end
    end
  end
end
