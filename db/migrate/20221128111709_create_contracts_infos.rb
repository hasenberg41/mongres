# frozen_string_literal: true

class CreateContractsInfos < ActiveRecord::Migration[6.1]
  def change
    create_view :contracts_infos, materialized: true
  end
end
