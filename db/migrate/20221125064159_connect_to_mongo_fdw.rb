# frozen_string_literal: true

class ConnectToMongoFdw < ActiveRecord::Migration[6.1]
  def up
    execute <<~SQL
      CREATE EXTENSION IF NOT EXISTS mongo_fdw;
      CREATE SERVER IF NOT EXISTS #{ENV.fetch('MONGODB_SERVER_NAME', 'mongo_server')}
        FOREIGN DATA WRAPPER mongo_fdw
        OPTIONS (address \'#{ENV['MONGODB_HOST']}\', port \'#{ENV['MONGODB_PORT']}\');

      CREATE USER MAPPING FOR #{ENV.fetch('POSTGRES_USERNAME', 'postgres')}
        SERVER #{ENV.fetch('MONGODB_SERVER_NAME', 'mongo_server')};
    SQL
  end

  def down
    execute <<~SQL
      DROP SERVER IF EXISTS #{ENV.fetch('MONGODB_SERVER_NAME', 'mongo_server')} CASCADE;
    SQL
  end
end
