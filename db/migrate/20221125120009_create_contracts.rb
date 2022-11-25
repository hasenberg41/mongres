class CreateContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :contracts do |t|
      t.string :title
      t.belongs_to :people
      t.belongs_to :documents
      t.timestamps
    end
  end
end
