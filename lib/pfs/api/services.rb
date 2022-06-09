# frozen_string_literal: true

require_relative "service"
require_relative "accounts_service"
require_relative "authentication_service"
require_relative "transactions_service"
require_relative "transfers_service"
require_relative "statements_service"

module PFS
  module API
    module Services
      def authentication
        @services[:authentication] ||= API::AuthenticationService.new(self)
      end

      def accounts
        @services[:accounts] ||= API::AccountsService.new(self)
      end

      def transfers
        @services[:transfers] ||= API::TransfersService.new(self)
      end

      def transactions
        @services[:transactions] ||= API::TransactionsService.new(self)
      end

      def statements
        @services[:statements] ||= API::StatementsService.new(self)
      end
    end
  end
end
