# frozen_string_literal: true

module PFS
  module API
    class ValidationsService < Service
      def bic(bic:)
        validation = client.get("/BankPayment/ValidateBic?Bic=#{bic}")
        sct_inst_support = client.get("/BankPayment/ValidateInstantBic?Bic=#{bic}")
        attributes = {
          bic: bic,
          valid: validation.body.dig(:data, :isValid),
          sct_inst_supported: sct_inst_support.body.dig(:data, :isValid),
        }
        Resources::Validations::Bic.new(validation, attributes)
      end

      def instanct(bic:); end
    end
  end
end
