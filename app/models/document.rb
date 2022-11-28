# frozen_string_literal: true

class Document < ApplicationRecord
  self.primary_key = 'id'

  has_many :contracts
  has_many :people, through: :contracts

  validates :name, presence: true
  validates :description, presence: true
  validates :link_to_data, presence: true

  def self.create!(name:, description:, link_to_data:)
    connection.execute(sanitize_sql_array([
      'INSERT INTO documents(id, name, description, link_to_data) VALUES(?, ?, ?, ?)',
      new_id, name, description, link_to_data
    ]))

    find_by(name: name, description: description, link_to_data: link_to_data)
  end

  def save
    Document.connection.execute(Document.sanitize_sql_array([
      'INSERT INTO documents(id, name, description, link_to_data) VALUES(?, ?, ?, ?)',
      Document.new_id, name, description, link_to_data
    ]))
  end

  def self.new_id
    last_doc = Document.last

    if last_doc
      last_doc.id + 1
    else
      1
    end
  end
end
