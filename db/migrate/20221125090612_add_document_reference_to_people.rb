# frozen_string_literal: true

class AddDocumentReferenceToPeople < ActiveRecord::Migration[6.1]
  def change
    add_reference :people, :documents
  end
end
