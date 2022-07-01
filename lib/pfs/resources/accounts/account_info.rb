# frozen_string_literal: true

module PFS
  module Resources
    module Accounts
      class AccountInfo < Base
        attr_reader :balance

        map :accountBaseCurrency, :account_base_currency
        map :cardType, :card_type
        map :accountNumber, :account_number
        map :bankRoutingNumber, :bank_routing_number
        map :cnid, :cnid
        map :cardStatus, :card_status
        map :pinTriesExceeded, :pin_tries_exceeded
        map :badPinTries, :bad_pin_tries
        map :expirationDate, :expiration_date
        map :cardEffectiveEnd, :card_effective_end
        map :client, :client
        map :phoneCardNumber, :phone_card_number
        map :distributorCode, :distributor_code
        map :companyName, :company_name
        map :cardStyle, :card_style
        map :deliveryType, :delivery_type
        map :initialLoadProcessed, :initial_load_processed
        map :loadAmount, :load_amount
        map :elevatedStatus, :elevated_status
        map :cardNumber, :card_number
        map :walletId, :walletId

        def initialize(response, attributes = {})
          super(response, attributes)
          @balance = Balance.new(response, attributes[:balance])
        end
      end
    end
  end
end
