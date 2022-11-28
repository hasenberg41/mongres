# frozen_string_literal: true

namespace :refreshers do
  desc 'Refresh materialized view for contracts'
  task contracts_info: :environment do
    ContractsInfo.refresh
  end
end
