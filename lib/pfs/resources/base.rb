# frozen_string_literal: true

module PFS
  module Resources
    class Base
      attr_reader :response

      def initialize(response, attributes = {})
        @response = response
        attributes.each do |key, value|
          m = "#{key}=".to_sym
          send(m, value) if respond_to?(m)
        end
      end

      def self.map(original_attribute, mapped_attributes)
        class_eval { attr_writer original_attribute.to_sym }
        mapped_attributes = [mapped_attributes].flatten
        mapped_attributes.each do |mapped_attribute|
          define_method(mapped_attribute) { instance_variable_get("@#{original_attribute}")}
        end
      end
    end
  end
end

require_relative "collection"
require_relative "accounts/issued_account"
require_relative "accounts/account"
require_relative "accounts/account_info"
require_relative "accounts/account_holder"
require_relative "accounts/balance"
require_relative "accounts/balance_credit"
require_relative "accounts/status"
require_relative "authentication/token"
require_relative "transfers/transfer"
require_relative "transfers/internal_transfer"
require_relative "transfers/internal_transfer_from"
require_relative "transfers/internal_transfer_to"
require_relative "transactions/transaction"
require_relative "transactions/transactions"
require_relative "statements/statement"
require_relative "statements/statements"
