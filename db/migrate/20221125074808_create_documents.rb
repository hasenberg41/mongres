# frozen_string_literal: true

class CreateDocuments < ActiveRecord::Migration[6.1]
  def up
    execute <<~SQL
      CREATE FOREIGN TABLE documents
      (
        _id name,
        id serial,
        name text,
        description text,
        link_to_data text
      )
      SERVER #{ENV.fetch('MONGODB_SERVER_NAME', 'mongo_server')}
      OPTIONS (database 'mongres', collection 'documents');
    SQL
  end

  def down
    execute <<~SQL
      DROP TABLE documents;
    SQL
  end
end
