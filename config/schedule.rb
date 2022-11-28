# frozen_string_literal: true

every 10.minutes do
  rake 'refreshers:contracts_info'
end
